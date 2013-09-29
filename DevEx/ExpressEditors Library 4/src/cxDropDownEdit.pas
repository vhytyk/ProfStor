
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

unit cxDropDownEdit;

{$I cxEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Qt, Types, QTypes, StdCtrls,
{$ENDIF}
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
{$IFNDEF DELPHI5}
  StdCtrls,
{$ENDIF}
  Classes, Controls, Graphics, Forms, SysUtils, cxClasses, cxContainer, cxControls,
  cxEdit, cxGraphics, cxLookAndFeelPainters, cxLookAndFeels, cxMaskEdit,
  cxTextEdit, cxVariants;

const
{$IFDEF VCL}
  CM_DROPDOWN = WM_APP + 103;
  CM_POPUPCONTROLKEY = WM_APP + 107;
{$ELSE}
  QEventType_CMDropDown = Integer(QEventType_ClxUser) + 3;
  QEventType_CMPopupControlKey = Integer(QEventType_ClxUser) + 7;
{$ENDIF}

type
  TcxEditDropDownListStyle = (lsEditFixedList, lsEditList, lsFixedList);
  TcxEditCorner = (ecoTopLeft, ecoTopRight, ecoBottomLeft, ecoBottomRight);
  TcxEditMouseSizingDirection = (mmdWE, mmdNS, mmdNWSE, mmdNESW, mmdNone);

  { TcxCustomEditPopupWindowViewInfo }

  TcxCustomEditPopupWindowViewInfo = class(TcxContainerViewInfo)
  protected
    procedure InternalPaint(ACanvas: TcxCanvas); override;
  public
    BorderStyle: TcxEditPopupBorderStyle;
    ClientEdge: Boolean;
    CloseButton: Boolean;
    CloseButtonRect: TRect;
    CloseButtonStyle: TcxLookAndFeelKind;
{$IFDEF VCL}
    CloseButtonNativeState: Integer;
{$ENDIF}
    CloseButtonState: TcxButtonState;
    MinSysPanelHeight: Integer;
    NativeStyle: Boolean;
    Shadow: Boolean;
    Sizeable: Boolean;
    SizeGripCorner: TcxEditCorner;
    SizeGripRect: TRect;
    SizeGripSizingRect: TRect;
    SizingRegionBounds: TRect;
    SizingOffset: Integer;
    SysPanelHeight: Integer;
    SysPanelStyle: Boolean;
    procedure Calculate; virtual;
    procedure DrawBorder(ACanvas: TcxCanvas; var R: TRect); virtual;
    function GetBorderExtent: TRect; virtual;
    function GetClientExtent: TRect; virtual;
    function GetSysPanelHeight: Integer; virtual;
    function IsSizingPlace(X, Y: Integer): Boolean; virtual;
  end;

  { TcxCustomEditPopupWindow }

  TcxCustomDropDownEdit = class;

  TcxCustomEditPopupWindow = class(TcxCustomPopupWindow)
  private
    FPopupAutoSize: Boolean;
    FBorderStyle: TcxEditPopupBorderStyle;
    FClientEdge: Boolean;
    FCloseButton: Boolean;
    FMinHeight: Integer;
    FMinWidth: Integer;
    FNativeStyle: Boolean;
    FPopupHeight: Integer;
    FPopupWidth: Integer;
    FShadow: Boolean;
    FShowContentWhileResize: Boolean;
    FSizeable: Boolean;
    FSysPanelStyle: Boolean;
    function GetEdit: TcxCustomDropDownEdit;
    function GetMinSysPanelHeight: Integer;
    function GetViewInfo: TcxCustomEditPopupWindowViewInfo;
    procedure SetPopupAutoSize(Value: Boolean);
    procedure SetBorderStyle(Value: TcxEditPopupBorderStyle);
    procedure SetClientEdge(Value: Boolean);
    procedure SetCloseButton(Value: Boolean);
    procedure SetMinSysPanelHeight(Value: Integer);
    procedure SetNativeStyle(Value: Boolean);
    procedure SetShadow(Value: Boolean);
    procedure SetSizeable(Value: Boolean);
    procedure SetSysPanelStyle(Value: Boolean);
{$IFDEF VCL}
    procedure CMPopupControlKey(var Message: TMessage); message CM_POPUPCONTROLKEY;
{$ENDIF}
  protected
    procedure AdjustClientRect(var Rect: TRect); override;
    function CalculatePosition: TPoint; override;
    procedure CalculateSize; override;
    procedure DoClosed; override;
    procedure DoClosing; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Resize; override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
  {$IFDEF WIN32}
    function WidgetFlags: Integer; override;
  {$ENDIF}
{$ENDIF}
    procedure CalculateViewInfo; virtual;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; {$IFDEF VCL}override{$ELSE}virtual{$ENDIF};
    procedure DoPopupControlKey(Key: Char); virtual;
    procedure DrawSizeFrame(const R: TRect);
    function GetMinSize: TSize; virtual;
    procedure InternalInvalidateRect(const ARect: TRect);
    procedure RefreshPopupWindow;
    property ViewInfo: TcxCustomEditPopupWindowViewInfo read GetViewInfo;
  public
    constructor Create(AOwnerControl: TWinControl); override;
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
{$IFNDEF VCL}
    procedure Popup(AFocusedControl: TWinControl); override;
{$ENDIF}
    property BorderStyle: TcxEditPopupBorderStyle read FBorderStyle write SetBorderStyle;
    property ClientEdge: Boolean read FClientEdge write SetClientEdge;
    property CloseButton: Boolean read FCloseButton write SetCloseButton;
    property Edit: TcxCustomDropDownEdit read GetEdit;
    property MinHeight: Integer read FMinHeight write FMinHeight;
    property MinSize: TSize read GetMinSize;
    property MinSysPanelHeight: Integer read GetMinSysPanelHeight write SetMinSysPanelHeight;
    property MinWidth: Integer read FMinWidth write FMinWidth;
    property NativeStyle: Boolean read FNativeStyle write SetNativeStyle;
    property PopupAutoSize: Boolean read FPopupAutoSize write SetPopupAutoSize;
    property PopupHeight: Integer read FPopupHeight write FPopupHeight;
    property PopupWidth: Integer read FPopupWidth write FPopupWidth;
    property Shadow: Boolean read FShadow write SetShadow;
    property ShowContentWhileResize: Boolean read FShowContentWhileResize
      write FShowContentWhileResize default False;
    property Sizeable: Boolean read FSizeable write SetSizeable;
    property SysPanelStyle: Boolean read FSysPanelStyle write SetSysPanelStyle;
    property OnClosed;
  end;

  TcxCustomEditPopupWindowClass = class of TcxCustomEditPopupWindow;

  { TcxCustomDropDownEditProperties }

  TcxPopupEditPopupEvent = procedure (Sender: TObject; const AEditText: TCaption) of object;

  TcxCustomDropDownEditProperties = class(TcxCustomMaskEditProperties)
  private
    FGlyphButtonIndex: Integer;
    FImmediateDropDown: Boolean;
    FImmediatePopup: Boolean;
    FInternalChanging: Boolean;
    FPopupAlignment: TAlignment;
    FPopupAutoSize: Boolean;
    FPopupClientEdge: Boolean;
    FPopupHeight: Integer;
    FPopupMinHeight: Integer;
    FPopupMinWidth: Integer;
    FPopupSizeable: Boolean;
    FPopupSysPanelStyle: Boolean;
    FPopupWidth: Integer;
    FOnCloseQuery: TCloseQueryEvent;
    FOnCloseUp: TNotifyEvent;
    FOnInitPopup: TNotifyEvent;
    FOnPopup: TNotifyEvent;
    function GetButtonGlyph: TBitmap;
    procedure SetButtonGlyph(Value: TBitmap);
    procedure SetGlyphButtonIndex(Value: Integer);
    procedure SetOnPopup(Value: TNotifyEvent);
    procedure SetPopupAlignment(Value: TAlignment);
    procedure SetPopupClientEdge(Value: Boolean);
    procedure SetPopupHeight(Value: Integer);
    procedure SetPopupMinHeight(Value: Integer);
    procedure SetPopupMinWidth(Value: Integer);
    procedure SetPopupSizeable(Value: Boolean);
    procedure SetPopupSysPanelStyle(Value: Boolean);
    procedure SetPopupWidth(Value: Integer);
  protected
    procedure Changed; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function IsLookupDataVisual: Boolean; override;
    function DropDownButtonVisibleIndex: Integer; virtual;
    function DropDownOnClick: Boolean; virtual;
    function GetAlwaysPostEditValue: Boolean; virtual;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; virtual;
    function PopupWindowCapturesFocus: Boolean; virtual;
    property AlwaysPostEditValue: Boolean read GetAlwaysPostEditValue;
    property ButtonGlyph: TBitmap read GetButtonGlyph write SetButtonGlyph;
    property GlyphButtonIndex: Integer read FGlyphButtonIndex write SetGlyphButtonIndex;
    property ImmediateDropDown: Boolean read FImmediateDropDown write FImmediateDropDown default True;
    property ImmediatePopup: Boolean read FImmediatePopup write FImmediatePopup default False;
    property PopupAutoSize: Boolean read FPopupAutoSize write FPopupAutoSize default True;
    property PopupAlignment: TAlignment read FPopupAlignment write SetPopupAlignment default taLeftJustify;
    property PopupClientEdge: Boolean read FPopupClientEdge write SetPopupClientEdge default False;
    property PopupHeight: Integer read FPopupHeight write SetPopupHeight default 200;
    property PopupMinHeight: Integer read FPopupMinHeight write SetPopupMinHeight default 100;
    property PopupMinWidth: Integer read FPopupMinWidth write SetPopupMinWidth default 100;
    property PopupSizeable: Boolean read FPopupSizeable write SetPopupSizeable default False;
    property PopupSysPanelStyle: Boolean read FPopupSysPanelStyle write SetPopupSysPanelStyle default False;
    property PopupWidth: Integer read FPopupWidth write SetPopupWidth default 250;
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    property OnInitPopup: TNotifyEvent read FOnInitPopup write FOnInitPopup;
    property OnPopup: TNotifyEvent read FOnPopup write SetOnPopup;
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
  end;

  TcxCustomDropDownEditPropertiesClass = class of TcxCustomDropDownEditProperties;

  { TcxCustomDropDownEditViewData }

  TcxCustomDropDownEditViewData = class(TcxCustomTextEditViewData)
  private
    function GetProperties: TcxCustomDropDownEditProperties;
  protected
    function CanPressButton(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer): Boolean; override;
  public
    HasPopupWindow: Boolean;
    IsHotAndPopup: Boolean;
    procedure Calculate(ACanvas: TcxCanvas; const ABounds: TRect; const P: TPoint;
      Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
      AIsMouseEvent: Boolean); override;
    property Properties: TcxCustomDropDownEditProperties read GetProperties;
  end;

  { TcxCustomDropDownEditData }

  TcxCustomDropDownEditData = class(TcxCustomEditData)
  protected
    Initialized: Boolean;
    Width, Height: Integer;
  end;

  TcxCustomDropDownEditDataClass = class of TcxCustomDropDownEditData;

  { TcxEditPopupControlLookAndFeel }

  TcxEditPopupControlLookAndFeel = class(TcxLookAndFeel)
  private
    function GetEdit: TcxCustomDropDownEdit;
  protected
    procedure EditStyleChanged;
    function InternalGetKind: TcxLookAndFeelKind; override;
    function InternalGetNativeStyle: Boolean; override;
    property Edit: TcxCustomDropDownEdit read GetEdit;
  end;

  { TcxCustomDropDownInnerEdit }

  TcxCustomDropDownInnerEdit = class(TcxCustomInnerTextEdit)
  private
    function GetContainer: TcxCustomDropDownEdit;
{$IFDEF VCL}
    procedure CMHintShow(var Message: TMessage); message CM_HINTSHOW;
{$ENDIF}
  protected
{$IFDEF WIN32}
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
{$ENDIF}
    property Container: TcxCustomDropDownEdit read GetContainer;
  // TODO CLX
  end;

  { TcxCustomDropDownEdit }

  TcxCustomDropDownEdit = class(TcxCustomMaskEdit)
  private
    FIsActivatingByMouse: Boolean;
    FIsHotAndPopup: Boolean;
    FPopupControlLookAndFeel: TcxEditPopupControlLookAndFeel;
    FPopupMouseMoveLocked: Boolean;
    FPopupSizeChanged: Boolean;
    FSendChildrenStyle: Boolean;
    function GetDroppedDown: Boolean;
    function GetProperties: TcxCustomDropDownEditProperties;
    procedure SetDroppedDown(Value: Boolean);
    procedure SetProperties(Value: TcxCustomDropDownEditProperties);
{$IFDEF VCL}
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure CMDropDown(var Message: TMessage); message CM_DROPDOWN;
    procedure CMHintShow(var Message: TMessage); message CM_HINTSHOW;
{$ENDIF}
  protected
    FPopupWindow: TcxCustomEditPopupWindow;
    procedure ContainerStyleChanged(Sender: TObject); override;
    function CreateViewData: TcxCustomEditViewData; override;
    procedure DoButtonDown(AButtonVisibleIndex: Integer); override;
    procedure DoExit; override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DoEditKeyPress(var Key: Char); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    function GetEditDataClass: TcxCustomEditDataClass; override;
    function GetInnerEditClass: TControlClass; override;
    function GetScrollLookupDataList(AScrollCause: TcxEditScrollCause): Boolean; override;
    procedure InitializeEditData; override;
    function IsEditorKey(Key: Word; Shift: TShiftState): Boolean; override;
    procedure PropertiesChanged(Sender: TObject); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    function SendActivationKey(Key: Char): Boolean; override;
{$IFDEF VCL}
    procedure CreateHandle; override;
    procedure ThemeChanged; override;
{$ELSE}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
    procedure InitWidget; override;
{$ENDIF}
    function CanDropDown: Boolean; virtual;
    procedure CloseUp(AAccept: Boolean); virtual;
    procedure CreatePopupWindow; virtual;
    procedure DoCloseQuery(var CanClose: Boolean);
    procedure DoCloseUp;
    procedure DoInitPopup; virtual;
    procedure DoPopup; virtual;
    procedure DropDown; virtual;
    procedure EditButtonClick; virtual;
    function GetPopupFocusedControl: TWinControl; virtual;
    function GetPopupWindowClientPreferredSize: TSize; virtual; abstract;
    function GetPopupWindowOwnerControlBounds: TRect;
    procedure InitializeLookupData; virtual;
    procedure InitializePopupWindow; virtual;
    procedure PopupWindowClosed(Sender: TObject); dynamic;
    procedure PopupWindowCloseQuery(Sender: TObject; var CanClose: Boolean); dynamic;
    procedure PopupWindowClosing(Sender: TObject); dynamic;
    procedure PopupWindowShowing(Sender: TObject); dynamic;
    procedure PopupWindowShowed(Sender: TObject); dynamic;
    procedure PositionPopupWindowChilds(const AClientRect: TRect); virtual;
    procedure SetIsHotAndPopup;
    procedure SetupPopupWindow; virtual;
    procedure UpdatePopupWindow;
    property IsHotAndPopup: Boolean read FIsHotAndPopup;
    property PopupControlsLookAndFeel: TcxEditPopupControlLookAndFeel read FPopupControlLookAndFeel;
    property PopupMouseMoveLocked: Boolean read FPopupMouseMoveLocked write FPopupMouseMoveLocked;
    property PopupSizeChanged: Boolean read FPopupSizeChanged;
    property PopupWindow: TcxCustomEditPopupWindow read FPopupWindow;
    property Properties: TcxCustomDropDownEditProperties read GetProperties write SetProperties;
    property SendChildrenStyle: Boolean read FSendChildrenStyle write FSendChildrenStyle;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Activate(var AEditData: TcxCustomEditData); override;
    procedure ActivateByKey(Key: Char; var AEditData: TcxCustomEditData); override;
    procedure ActivateByMouse(Shift: TShiftState; X, Y: Integer;
      var AEditData: TcxCustomEditData); override;
    procedure BeforeDestruction; override;
    function Deactivate: Boolean; override;
    function Focused: Boolean; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    class function GetNotPublishedStyleValues: TcxEditStyleValues; override;
    function HasPopupWindow: Boolean; override;
    property DroppedDown: Boolean read GetDroppedDown write SetDroppedDown;
  end;

  { TcxComboBoxPopupWindow }

  TcxComboBoxPopupWindow = class(TcxCustomEditPopupWindow)
  protected
    procedure CalculateSize; override;
  end;

  { TcxComboBoxListBox }

  TcxCustomComboBox = class;

  TcxComboBoxListBox = class(TcxCustomEditListBox)
  private
    FIsFirstWindowRecreation: Boolean;
    FPrevIsOnMeasureItemAssigned: Boolean;
    FPrevItemHeight: Integer;
    function GetEdit: TcxCustomComboBox;
  protected
    FEdit: TcxCustomComboBox;
    function DoDrawItem(AIndex: Integer; const ARect: TRect;
      AState: TOwnerDrawState): Boolean; override;
    function GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer; override;
    function GetItem(Index: Integer): TCaption; override;
    function GetItemHeight(AIndex: Integer = -1): Integer; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure RecreateWindow; override;
    procedure SetItemIndex(const Value: Integer); override;
{$IFDEF VCL}
    procedure MeasureItem(Index: Integer; var Height: Integer); override;
    procedure Resize; override;
{$ELSE}
    procedure MeasureItem(Control: TWinControl;
      {$IFDEF LINUX}item: QClxListBoxItemH{$ENDIF}
      {$IFDEF WIN32}{$IFNDEF DELPHI7}Index: Integer{$ELSE}item: QClxListBoxItemH{$ENDIF}{$ENDIF};
      var Height{$IFNDEF VCL}, Width{$ENDIF}: Integer); override;
{$ENDIF}
    property Edit: TcxCustomComboBox read GetEdit;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  { TcxComboBoxLookupData }

  TcxComboBoxLookupData = class(TcxCustomTextEditLookupData)
  protected
    function GetListBoxClass: TcxCustomEditListBoxClass; override;
    procedure ListChanged; override;
  public
    function CanResizeVisualArea(var NewSize: TSize): Boolean; override;
    function GetVisualAreaPreferredSize(AMaxHeight: Integer; AWidth: Integer = 0): TSize; override;
    procedure Initialize(AVisualControlsParent: TWinControl); override;
  end;

  { TcxCustomComboBoxViewData }

  TcxCustomComboBoxViewData = class(TcxCustomDropDownEditViewData)
    function IsComboBoxStyle: Boolean; override;
  end;

  { TcxCustomComboBoxProperties }

  TcxEditDrawItemEvent = procedure(AControl: TcxCustomComboBox; ACanvas: TcxCanvas;
    AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState) of object;
  TMeasureItemEvent = procedure(AControl: TcxCustomComboBox; AIndex: Integer;
    ACanvas: TcxCanvas; var AHeight: Integer) of object;

  TcxCustomComboBoxProperties = class(TcxCustomDropDownEditProperties)
  private
    FDropDownListStyle: TcxEditDropDownListStyle;
    FDropDownRows: Integer;
    FItemHeight: Integer;
    FRevertable: Boolean;
    FOnDrawItem: TcxEditDrawItemEvent;
    FOnMeasureItem: TMeasureItemEvent;
    function GetDropDownAutoWidth: Boolean;
    function GetDropDownSizeable: Boolean;
    function GetDropDownWidth: Integer;
    function GetItems: TStrings;
    function GetSorted: Boolean;
    procedure SetDropDownAutoWidth(Value: Boolean);
    procedure SetDropDownListStyle(Value: TcxEditDropDownListStyle);
    procedure SetDropDownRows(Value: Integer);
    procedure SetDropDownSizeable(Value: Boolean);
    procedure SetDropDownWidth(Value: Integer);
    procedure SetItemHeight(Value: Integer);
    procedure SetItems(Value: TStrings);
    procedure SetSorted(Value: Boolean);
  protected
    function DropDownOnClick: Boolean; override;
    function GetDropDownPageRowCount: Integer; override;
    function GetEditingStyle: TcxEditEditingStyle; override;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; override;
    class function GetViewDataClass: TcxCustomEditViewDataClass; override;
    function UseLookupData: Boolean; override;
    property DropDownAutoWidth: Boolean read GetDropDownAutoWidth
      write SetDropDownAutoWidth default True;
    property DropDownListStyle: TcxEditDropDownListStyle read FDropDownListStyle
      write SetDropDownListStyle default lsEditList;
    property DropDownRows: Integer read FDropDownRows write SetDropDownRows
      default cxEditDefaultDropDownPageRowCount;
    property DropDownSizeable: Boolean read GetDropDownSizeable
      write SetDropDownSizeable default False;
    property DropDownWidth: Integer read GetDropDownWidth write SetDropDownWidth
      default 0;
    property ItemHeight: Integer read FItemHeight write SetItemHeight default 0;
    property Items: TStrings read GetItems write SetItems;
    property Revertable: Boolean read FRevertable write FRevertable default False;
    property Sorted: Boolean read GetSorted write SetSorted default False;
    property OnDrawItem: TcxEditDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnMeasureItem: TMeasureItemEvent read FOnMeasureItem write FOnMeasureItem; 
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
  end;

  { TcxComboBoxProperties }

  TcxComboBoxProperties = class(TcxCustomComboBoxProperties)
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property ButtonGlyph;
    property CaseInsensitive;
    property CharCase;
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
    property Items;
    property MaskKind;
    property EditMask;
    property MaxLength;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property PopupAlignment;
    property ReadOnly;
    property Revertable;
    property Sorted;
    property UseLeftAlignmentOnEditing;
    property ValidateOnEnter;
    property OnChange;
    property OnCloseUp;
    property OnDrawItem;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnMeasureItem;
    property OnNewLookupDisplayText;
    property OnPopup;
    property OnValidate;
  end;

  { TcxCustomComboBoxInnerEdit }

  TcxCustomComboBoxInnerEdit = class(TcxCustomDropDownInnerEdit)
  private
{$IFDEF VCL}
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
{$ENDIF}
  protected
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
{$ENDIF}
  end;

  { TcxCustomComboBox }

  TcxCustomComboBox = class(TcxCustomDropDownEdit)
  private
    function GetItemIndex: Integer;
    function GetLookupData: TcxComboBoxLookupData;
    function GetProperties: TcxComboBoxProperties;
    procedure SetItemIndex(Value: Integer);
    procedure SetProperties(Value: TcxComboBoxProperties);
{$IFDEF VCL}
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
{$ENDIF}
  protected
    function CanDropDown: Boolean; override;
    procedure ChangeHandler(Sender: TObject); override;
    procedure DblClick; override;
    function GetInnerEditClass: TControlClass; override;
    function GetPopupWindowClientPreferredSize: TSize; override;
    procedure InitializePopupWindow; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure PopupWindowShowed(Sender: TObject); override;
{$IFNDEF VCL}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
{$ENDIF}
    procedure ResetPopupHeight;
    procedure SynchronizeItemIndex;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property LookupData: TcxComboBoxLookupData read GetLookupData;
    property Properties: TcxComboBoxProperties read GetProperties write SetProperties;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Activate(var AEditData: TcxCustomEditData); override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  end;

  { TcxComboBox }

  TcxComboBox = class(TcxCustomComboBox)
  public
    property ItemIndex;
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

  { TcxPopupEditPopupWindowViewInfo }

  TcxPopupEditPopupWindowViewInfo = class(TcxCustomEditPopupWindowViewInfo)
  public
    procedure DrawBorder(ACanvas: TcxCanvas; var R: TRect); override;
  end;

  { TcxPopupEditPopupWindow }

  TcxPopupEditPopupWindow = class(TcxCustomEditPopupWindow)
  public
    class function GetViewInfoClass: TcxContainerViewInfoClass; override;
  end;

  { TcxCustomPopupEditProperties }

  TcxCustomPopupEditProperties = class(TcxCustomDropDownEditProperties)
  private
    FPopupControl: TControl;
    procedure SetPopupControl(Value: TControl);
  protected
    procedure FreeNotification(Sender: TComponent); override;
    class function GetPopupWindowClass: TcxCustomEditPopupWindowClass; override;
    function IsLookupDataVisual: Boolean; override;
    function PopupWindowCapturesFocus: Boolean; override;
    property PopupControl: TControl read FPopupControl write SetPopupControl;
    property PopupSizeable default True;
  public
    constructor Create(AOwner: TPersistent); override;
    procedure Assign(Source: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;
    class function GetLookupDataClass: TcxInterfacedPersistentClass; override;
  end;

  { TcxPopupEditProperties }

  TcxPopupEditProperties = class(TcxCustomPopupEditProperties)
  public
    constructor Create(AOwner: TPersistent); override;
  published
    property Alignment;
    property AutoSelect;
    property BeepOnError;
    property ButtonGlyph;
    property CaseInsensitive;
    property CharCase;
    property EchoMode;
    property HideSelection;
    property IgnoreMaskBlank;
    property ImmediateDropDown;
    property ImmediatePopup default True;
    property LookupItems;
    property LookupItemsSorted;
    property MaxLength;
    property MaskKind;
    property EditMask;
{$IFDEF VCL}
    property OEMConvert;
{$ENDIF}
    property PopupAlignment;
    property PopupAutoSize;
    property PopupClientEdge;
    property PopupControl;
    property PopupHeight;
    property PopupMinHeight;
    property PopupMinWidth;
    property PopupSizeable;
    property PopupSysPanelStyle;
    property PopupWidth;
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property ValidateOnEnter;
    property OnChange;
    property OnCloseQuery;
    property OnCloseUp;
    property OnEditValueChanged;
    property OnInitPopup;
    property OnPopup;
    property OnValidate;
  end;

  { TcxCustomPopupEdit }

  TcxPrevPopupControlData = record
    Align: TAlign;
    Bounds: TRect;
    Parent: TWinControl;
    Visible: Boolean;
    BorderStyle: TFormBorderStyle;
  end;

  TcxCustomPopupEdit = class(TcxCustomDropDownEdit)
  private
    FPrevPopupControlData: TcxPrevPopupControlData;
    function GetProperties: TcxPopupEditProperties;
    procedure SetProperties(Value: TcxPopupEditProperties);
  protected
    function CanDropDown: Boolean; override;
    procedure DoInitPopup; override;
    function GetPopupFocusedControl: TWinControl; override;
    function GetPopupWindowClientPreferredSize: TSize; override;
    procedure PopupWindowClosed(Sender: TObject); override;
    procedure PositionPopupWindowChilds(const AClientRect: TRect); override;
    procedure SetupPopupWindow; override;
    procedure RestorePopupControlData; virtual;
    procedure SavePopupControlData; virtual;
    property Properties: TcxPopupEditProperties read GetProperties write SetProperties;
  public
    destructor Destroy; override;
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  end;

  { TcxPopupEdit }

  TcxPopupEdit = class(TcxCustomPopupEdit)
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

implementation

uses
{$IFDEF VCL}
  dxUxTheme,
{$ENDIF}
  cxEditConsts, cxEditPaintUtils, cxEditUtils, cxScrollBar;

const
{$IFDEF Linux}
  VK_F4 = Key_F4;
{$ENDIF}

  cxEditMouseSizingCursorMap: array[-1 .. 1, -1 .. 1] of TCursor = (
    (crSizeNWSE, crSizeWE, crSizeNESW),
    (crSizeNS, crDefault, crSizeNS),
    (crSizeNESW, crSizeWE, crSizeNWSE)
  );

type
  TControlAccess = class(TControl);
  TcxCustomEditListBoxAccess = class(TcxCustomEditListBox);
  TcxCustomEditStyleAccess = class(TcxCustomEditStyle);
  TCustomFormAccess = class(TCustomForm);
  TcxCustomTextEditAccess = class(TcxCustomTextEdit);
  TWinControlAccess = class(TWinControl);

var
  FCapturePointOffset: TSize;
  FHorzFlag, FVertFlag: Integer;
  FSizeFrameBounds: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
  FPaintedSizeFrameBounds: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
  FSizingCapture: Boolean = False;
  FSizingMouseMovement: Boolean = False;

procedure CheckBounds(const AOuterRect: TRect; var AInnerRect: TRect);
begin
  if AInnerRect.Left < AOuterRect.Left then
    AInnerRect.Left := AOuterRect.Left;
  if AInnerRect.Top < AOuterRect.Top then
    AInnerRect.Top := AOuterRect.Top;
  if AInnerRect.Right > AOuterRect.Right then
    AInnerRect.Right := AOuterRect.Right;
  if AInnerRect.Bottom > AOuterRect.Bottom then
    AInnerRect.Bottom := AOuterRect.Bottom;
end;

{ TcxCustomEditPopupWindowViewInfo }

procedure TcxCustomEditPopupWindowViewInfo.Calculate;
begin
  CalculateEditPopupWindowViewInfo(Self);
end;

procedure TcxCustomEditPopupWindowViewInfo.DrawBorder(ACanvas: TcxCanvas; var R: TRect);
begin
  DrawEditPopupWindowBorder(ACanvas, Self, R);
end;

function TcxCustomEditPopupWindowViewInfo.GetBorderExtent: TRect;
begin
  Result := GetEditPopupWindowFrameExtent(Self);
end;

function TcxCustomEditPopupWindowViewInfo.GetClientExtent: TRect;
begin
  Result := GetBorderExtent;
end;

function TcxCustomEditPopupWindowViewInfo.GetSysPanelHeight: Integer;
begin
  Result := GetEditPopupWindowSysPanelDefaultHeight(Self);
  if (MinSysPanelHeight > 0) and (Result < MinSysPanelHeight) then
    Result := MinSysPanelHeight;
end;

function TcxCustomEditPopupWindowViewInfo.IsSizingPlace(X, Y: Integer): Boolean;
const
  AHorzFlagMap: array[TcxEditCorner] of Integer = (-1, 1, -1, 1);
  AVertFlagMap: array[TcxEditCorner] of Integer = (-1, -1, 1, 1);
var
  P: TPoint;
  ALeftCorner, ARightCorner, ATopCorner, ABottomCorner: Boolean;
begin
  Result := False;
  if not Sizeable then
    Exit;
  P := Point(X, Y);
  if not PtInRect(Bounds, P) then
    Exit;
  if PtInRect(SizingRegionBounds, P) and not PtInRect(SizeGripSizingRect, P) then
    Exit;
  Result := True;

  if PtInRect(SizeGripSizingRect, P) then
  begin
    FHorzFlag := AHorzFlagMap[SizeGripCorner];
    FVertFlag := AVertFlagMap[SizeGripCorner];
    Exit;
  end;

  ALeftCorner := SizeGripCorner in [ecoTopLeft, ecoBottomLeft];
  ARightCorner := SizeGripCorner in [ecoTopRight, ecoBottomRight];
  ATopCorner := SizeGripCorner in [ecoTopLeft, ecoTopRight];
  ABottomCorner := SizeGripCorner in [ecoBottomLeft, ecoBottomRight];

  FHorzFlag := 0;
  if (X < SizingOffset) and ALeftCorner then
    FHorzFlag := -1;
  if (X >= Bounds.Right - SizingOffset) and ARightCorner then
    FHorzFlag := 1;

  FVertFlag := 0;
  if (Y < SizingOffset) and ATopCorner then
    FVertFlag := -1;
  if (Y >= Bounds.Bottom - SizingOffset) and ABottomCorner then
    FVertFlag := 1;

  if SizeGripCorner in [ecoTopLeft, ecoTopRight] then
  begin
    if FVertFlag = 1 then
    begin
      if (X >= SizingRegionBounds.Left) and (X < SizingRegionBounds.Right) then
        FHorzFlag := 0;
      FVertFlag := 0;
    end;
  end else
  begin
    if FVertFlag = -1 then
    begin
      if (X >= SizingRegionBounds.Left) and (X < SizingRegionBounds.Right) then
        FHorzFlag := 0;
      FVertFlag := 0;
    end;
  end;

  if SysPanelStyle then
    if SizeGripCorner in [ecoTopLeft, ecoBottomLeft] then
    begin
      if FHorzFlag = 1 then
      begin
        if (Y >= SizingRegionBounds.Top) and (Y < SizingRegionBounds.Bottom) then
          FVertFlag := 0;
        FHorzFlag := 0;
      end;
    end else
    begin
      if FHorzFlag = -1 then
      begin
        if (Y >= SizingRegionBounds.Top) and (Y < SizingRegionBounds.Bottom) then
          FVertFlag := 0;
        FHorzFlag := 0;
      end;
    end;
end;

procedure TcxCustomEditPopupWindowViewInfo.InternalPaint(ACanvas: TcxCanvas);
begin
  DrawEditPopupWindowFrame(ACanvas, Self);
end;

{ TcxCustomEditPopupWindow }

constructor TcxCustomEditPopupWindow.Create(AOwnerControl: TWinControl);
begin
  inherited Create(AOwnerControl);
  ViewInfo.CloseButtonState := cxbsNormal;
end;

class function TcxCustomEditPopupWindow.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxCustomEditPopupWindowViewInfo;
end;

{$IFNDEF VCL}
procedure TcxCustomEditPopupWindow.Popup(AFocusedControl: TWinControl);
var
  APrevEditAutoSelect: Boolean;
begin
  APrevEditAutoSelect := Edit.Properties.AutoSelect;
  Edit.InnerTextEdit.AutoSelect := False;
  try
    inherited Popup(AFocusedControl);
  finally
    Edit.InnerTextEdit.AutoSelect := APrevEditAutoSelect;
  end;
end;
{$ENDIF}

procedure TcxCustomEditPopupWindow.AdjustClientRect(var Rect: TRect);
var
  AClientExtent: TRect;
begin
  AClientExtent := ViewInfo.GetClientExtent;
  ExtendRect(Rect, AClientExtent);
end;

function TcxCustomEditPopupWindow.CalculatePosition: TPoint;
const
  ASizeGripCornerMap: array[Boolean, Boolean] of TcxEditCorner = (
    (ecoTopLeft, ecoBottomLeft),
    (ecoTopRight, ecoBottomRight)
  );
var
  ARightFlag, ABottomFlag: Boolean;
  AOwnerRect: TRect;
  ADesktopWorkArea: TRect;
begin
  OwnerBounds := Edit.GetPopupWindowOwnerControlBounds;
  Result := inherited CalculatePosition;

  AOwnerRect.TopLeft := OwnerParent.ClientToScreen(OwnerBounds.TopLeft);
  AOwnerRect.BottomRight := OwnerParent.ClientToScreen(OwnerBounds.BottomRight);
  ADesktopWorkArea := GetDesktopWorkArea(Point(Result.X, Result.Y));

  ABottomFlag := Result.Y > AOwnerRect.TopLeft.Y;
  ARightFlag := (AlignHorz = pahLeft) and (Result.X = AOwnerRect.Left) or
    (AOwnerRect.Left <= ADesktopWorkArea.Left) or

    (AlignHorz = pahRight) and (Result.X + Width <> AOwnerRect.Right) or

    (AlignHorz = pahCenter) and (AOwnerRect.Left - ADesktopWorkArea.Left <=
    ADesktopWorkArea.Right - AOwnerRect.Right);
  ViewInfo.SizeGripCorner := ASizeGripCornerMap[ARightFlag, ABottomFlag];

  if Shadow and not ABottomFlag then
    Inc(Result.Y, cxEditShadowWidth);
end;

procedure TcxCustomEditPopupWindow.CalculateSize;
var
  AClientExtent: TRect;
  AMinSize: TSize;
  APreferredWidth, APreferredHeight: Integer;
  APopupWindowVisualAreaSize: TSize;
begin
  ViewInfo.SizeGripCorner := ecoBottomRight;
  OwnerBounds := Edit.GetPopupWindowOwnerControlBounds;
  AClientExtent := ViewInfo.GetClientExtent;
  AMinSize := MinSize;
  APopupWindowVisualAreaSize := Edit.GetPopupWindowClientPreferredSize;
  with OwnerBounds do
  begin
    if PopupAutoSize then
      APreferredWidth := AClientExtent.Left + AClientExtent.Right + APopupWindowVisualAreaSize.cx
    else
      if PopupWidth = 0 then
        APreferredWidth := Right - Left
      else
        APreferredWidth := PopupWidth;
    if Sizeable and (MinWidth > 0) and (APreferredWidth < MinWidth) then
      APreferredWidth := MinWidth;
    if APreferredWidth < AMinSize.cx then
      APreferredWidth := AMinSize.cx;

    APreferredHeight := AMinSize.cy;
    if PopupAutoSize then
      APreferredHeight := AClientExtent.Top + AClientExtent.Bottom + APopupWindowVisualAreaSize.cy
    else
      if PopupHeight > 0 then
        APreferredHeight := PopupHeight
      else
        if APreferredHeight < MinHeight then
          APreferredHeight := MinHeight;
    if Sizeable and (MinHeight > 0) and (APreferredHeight < MinHeight) then
      APreferredHeight := MinHeight;
    if APreferredHeight < AMinSize.cy then
      APreferredHeight := AMinSize.cy;

    Width := APreferredWidth;
    Height := APreferredHeight;
  end;
end;

procedure TcxCustomEditPopupWindow.DoClosed;
begin
  FSizingCapture := False;
  FSizingMouseMovement := False;
  inherited DoClosed;
end;

procedure TcxCustomEditPopupWindow.DoClosing;
begin
  inherited DoClosing;
  DrawSizeFrame(cxEmptyRect);
end;

procedure TcxCustomEditPopupWindow.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  P := Point(X, Y);
  if Button = mbLeft then
    if PtInRect(ViewInfo.CloseButtonRect, P) and (ViewInfo.CloseButtonState <> cxbsPressed) then
    begin
      ViewInfo.CloseButtonState := cxbsPressed;
      InternalInvalidateRect(ViewInfo.CloseButtonRect);
    end
    else
      if (GetCaptureControl <> nil) and ViewInfo.IsSizingPlace(X, Y) then
      begin
        if FHorzFlag = -1 then
          FCapturePointOffset.cx := X
        else
          FCapturePointOffset.cx := Width - X;
        if FVertFlag = -1 then
          FCapturePointOffset.cy := Y
        else
          FCapturePointOffset.cy := Height - Y;
        FSizingCapture := True;
        Cursor := cxEditMouseSizingCursorMap[FHorzFlag, FVertFlag];
        if not ShowContentWhileResize then
          DrawSizeFrame(BoundsRect);
      end;
end;

procedure TcxCustomEditPopupWindow.MouseLeave(AControl: TControl);
begin
{$IFNDEF VCL}
  inherited MouseLeave(AControl);
{$ENDIF}
  if ViewInfo.CloseButtonState <> cxbsNormal then
  begin
    ViewInfo.CloseButtonState := cxbsNormal;
    InternalInvalidateRect(ViewInfo.CloseButtonRect);
  end;
  Cursor := crDefault;
end;

procedure TcxCustomEditPopupWindow.MouseMove(Shift: TShiftState; X, Y: Integer);

  procedure CheckWorkArea(var R: TRect);
  var
    ADesktopWorkArea: TRect;
  begin
    ADesktopWorkArea := GetDesktopWorkArea(ClientToScreen(Point(X, Y)));
    CheckBounds(ADesktopWorkArea, R);
  end;

var
  ABoundsRect: TRect;
  DX, DY: Integer;
  ANewWidth, ANewHeight: Integer;
  ACapturePoint: TPoint;
  AOwnerRect: TRect;
begin
  if FSizingCapture then
  begin
    ABoundsRect := BoundsRect;
    if FHorzFlag = -1 then
      ACapturePoint.X := FCapturePointOffset.cx
    else
      ACapturePoint.X := Width - FCapturePointOffset.cx;
    if FVertFlag = -1 then
      ACapturePoint.Y := FCapturePointOffset.cy
    else
      ACapturePoint.Y := Height - FCapturePointOffset.cy;

    DX := X - ACapturePoint.X;
    DY := Y - ACapturePoint.Y;

    if not IsRectEmpty(ViewInfo.SizeGripSizingRect) then
    begin
      if (FHorzFlag = 1) and (DX > 0) and (X <= Width) and not
          (PtInRect(ViewInfo.SizeGripSizingRect, ACapturePoint) and
          (X >= ViewInfo.SizeGripSizingRect.Left) and (X < ViewInfo.SizeGripSizingRect.Right)) then
        DX := 0;
      if (FVertFlag = 1) and (Y <= Height) and (DY > 0) and not
          (PtInRect(ViewInfo.SizeGripSizingRect, ACapturePoint) and
          (Y >= ViewInfo.SizeGripSizingRect.Top) and (Y < ViewInfo.SizeGripSizingRect.Bottom)) then
        DY := 0;
    end;

    if ((ViewInfo.SizeGripCorner in [ecoTopLeft, ecoBottomLeft]) and (FHorzFlag = 1)) or
        ((ViewInfo.SizeGripCorner in [ecoTopRight, ecoBottomRight]) and (FHorzFlag = -1)) then
      DX := 0;
    if ((ViewInfo.SizeGripCorner in [ecoTopLeft, ecoTopRight]) and (FVertFlag = 1)) or
        ((ViewInfo.SizeGripCorner in [ecoBottomLeft, ecoBottomRight]) and (FVertFlag = -1)) then
      DY := 0;

    if FHorzFlag = 0 then
      DX := 0;
    if FVertFlag = 0 then
      DY := 0;

    if FHorzFlag = -1 then
      Inc(ABoundsRect.Left, DX)
    else
      Inc(ABoundsRect.Right, DX);
    if FVertFlag = -1 then
      Inc(ABoundsRect.Top, DY)
    else
      Inc(ABoundsRect.Bottom, DY);

    ANewWidth := ABoundsRect.Right - ABoundsRect.Left;
    ANewHeight := ABoundsRect.Bottom - ABoundsRect.Top;
    if CanResize(ANewWidth, ANewHeight) then
      if (ANewWidth <> Width) or (ANewHeight <> Height) then
      begin
        if ViewInfo.SizeGripCorner in [ecoTopLeft, ecoBottomLeft] then
          ABoundsRect.Left := BoundsRect.Right - ANewWidth
        else
          ABoundsRect.Right := BoundsRect.Left + ANewWidth;
        if ViewInfo.SizeGripCorner in [ecoTopLeft, ecoTopRight] then
          ABoundsRect.Top := BoundsRect.Bottom - ANewHeight
        else
          ABoundsRect.Bottom := BoundsRect.Top + ANewHeight;

        AOwnerRect.TopLeft := OwnerParent.ClientToScreen(OwnerBounds.TopLeft);
        AOwnerRect.BottomRight := OwnerParent.ClientToScreen(OwnerBounds.BottomRight);
        if ABoundsRect.Left > AOwnerRect.Right - 1 then
          ABoundsRect.Left := AOwnerRect.Right - 1{Left};
        if ABoundsRect.Right - 1 < AOwnerRect.Left then
          ABoundsRect.Right := AOwnerRect.Left +1{Left + Width};

        CheckWorkArea(ABoundsRect);
        if not EqualRect(BoundsRect, ABoundsRect) then
        begin
          Edit.FPopupSizeChanged := True;
          if ShowContentWhileResize then
          begin
            BoundsRect := ABoundsRect;
            RefreshPopupWindow;
          end
          else
            DrawSizeFrame(ABoundsRect);
        end;
      end;
  end else
  begin
    if (ViewInfo.CloseButtonState <> cxbsNormal) and
      not PtInRect(ViewInfo.CloseButtonRect, Point(X, Y)) then
    begin
      ViewInfo.CloseButtonState := cxbsNormal;
      InternalInvalidateRect(ViewInfo.CloseButtonRect);
    end;
    if (ViewInfo.CloseButtonState = cxbsNormal) and (Shift = []) and
      PtInRect(ViewInfo.CloseButtonRect, Point(X, Y)) then
    begin
      ViewInfo.CloseButtonState := cxbsHot;
      InternalInvalidateRect(ViewInfo.CloseButtonRect);
    end;
    if ViewInfo.IsSizingPlace(X, Y) then
    begin
      FSizingMouseMovement := True;
      Cursor := cxEditMouseSizingCursorMap[FHorzFlag, FVertFlag];
    end else
    begin
      if FSizingMouseMovement then
        Cursor := crDefault;
      FSizingMouseMovement := False;
    end;
  end;
end;

procedure TcxCustomEditPopupWindow.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and FSizingCapture then
  begin
    SetCaptureControl(nil);
    FSizingCapture := False;
    DrawSizeFrame(cxEmptyRect);
    if not ShowContentWhileResize then
    begin
      BoundsRect := FSizeFrameBounds;
      RefreshPopupWindow;
    end;
    if ViewInfo.IsSizingPlace(X, Y) then
      Cursor := cxEditMouseSizingCursorMap[FHorzFlag, FVertFlag]
    else
      Cursor := crDefault;
  end
  else
    if (ViewInfo.CloseButtonState = cxbsPressed) then
      if CloseQuery then
      begin
        Edit.CloseUp(False);
        if Visible then
        begin
          ViewInfo.CloseButtonState := cxbsHot;
          InternalInvalidateRect(ViewInfo.CloseButtonRect);
        end;
      end else
      begin
        ViewInfo.CloseButtonState := cxbsHot;
        InternalInvalidateRect(ViewInfo.CloseButtonRect);
      end;
end;

procedure TcxCustomEditPopupWindow.Resize;
begin
  inherited Resize;
  if HandleAllocated then
    SetEditPopupWindowShadowRegion(Self);
end;

{$IFNDEF VCL}
function TcxCustomEditPopupWindow.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if IsVisible and (QEvent_type(Event) = QEventType(QEventType_CMPopupControlKey)) then
  begin
    Result := True;
    DoPopupControlKey(Char(QCustomEvent_data(QCustomEventH(Event))));
  end
  else
    Result := inherited EventFilter(Sender, Event);
end;
  {$IFDEF WIN32}
function TcxCustomEditPopupWindow.WidgetFlags: Integer;
begin
  Result := inherited WidgetFlags;
  if CaptureFocus then
    Result := Result and not Integer(WidgetFlags_WType_Popup);
end;
  {$ENDIF}
{$ENDIF}

procedure TcxCustomEditPopupWindow.CalculateViewInfo;
const
  ACloseButtonStyleMap: array [TcxEditPopupBorderStyle] of TcxLookAndFeelKind =
    (lfStandard, lfUltraFlat, lfStandard, lfFlat);
begin
  ViewInfo.Bounds := GetControlRect(Self);
  ViewInfo.Calculate;
  ViewInfo.CloseButtonStyle := ACloseButtonStyleMap[ViewInfo.BorderStyle];
end;

function TcxCustomEditPopupWindow.CanResize(var NewWidth, NewHeight: Integer): Boolean;
var
  AClientExtent: TRect;
  AMinSize: TSize;
  AMinWidth, AMinHeight: Integer;
  ANewVisualAreaSize: TSize;
begin
  Result := True;
  if not Sizeable or (NewWidth = Width) and (NewHeight = Height) then
    Exit;
  AMinSize := MinSize;
  AMinWidth := AMinSize.cx;
  if (MinWidth > 0) and (AMinWidth < MinWidth) then
    AMinWidth := MinWidth;
  AMinHeight := AMinSize.cy;
  if (MinHeight > 0) and (AMinHeight < MinHeight) then
    AMinHeight := MinHeight;

  if NewWidth < AMinWidth then
    NewWidth := AMinWidth;
  if NewHeight < AMinHeight then
    NewHeight := AMinHeight;

  if (NewHeight <> Height) or (NewWidth <> Width) then
    with Edit do
      if Properties.UseLookupData and Properties.IsLookupDataVisual then
      begin
        AClientExtent := Self.ViewInfo.GetClientExtent;
        ANewVisualAreaSize := Size(NewWidth - (AClientExtent.Left + AClientExtent.Right),
          NewHeight - (AClientExtent.Top + AClientExtent.Bottom));
        if not ILookupData.CanResizeVisualArea(ANewVisualAreaSize) then
        begin
          NewWidth := Self.Width;
          NewHeight := Self.Height
        end else
        begin
          NewWidth := ANewVisualAreaSize.cx + (AClientExtent.Left + AClientExtent.Right);
          if NewWidth < AMinSize.cx then
            NewWidth := AMinSize.cx;
          NewHeight := ANewVisualAreaSize.cy + (AClientExtent.Top + AClientExtent.Bottom);
          if NewHeight < AMinSize.cy then
            NewHeight := AMinSize.cy;
        end;
      end;
end;

procedure TcxCustomEditPopupWindow.DoPopupControlKey(Key: Char);
{$IFNDEF VCL}
var
  AWidget: QWidgetH;
{$ENDIF}
begin
{$IFDEF VCL}
  SendMessage(GetFocus, WM_CHAR, Integer(Key), 0);
{$ELSE}
  AWidget := QWidget_keyboardGrabber;
  if AWidget <> nil then
    SendKey(QOpenWidgetH(AWidget), Key);
{$ENDIF}
end;

procedure TcxCustomEditPopupWindow.DrawSizeFrame(const R: TRect);
{$IFNDEF VCL}
  {$IFDEF WIN32}
var
  ADC: HDC;
  {$ENDIF}
{$ENDIF}
var
  ABorderWidth: Integer;

  procedure InternalDrawSizeFrame(AFrameRect: TRect);
  var
    I: Integer;
  begin
    if ViewInfo.Shadow then
    begin
      Dec(AFrameRect.Right, cxEditShadowWidth);
      Dec(AFrameRect.Bottom, cxEditShadowWidth);
    end;

{$IFNDEF VCL}
  {$IFDEF WIN32}
    ADC := GetDC(0);
    try
      for I := 1 to ABorderWidth do
      begin
        Windows.DrawFocusRect(ADC, AFrameRect);
        InflateRect(AFrameRect, -1, -1);
      end;
    finally
      ReleaseDC(0, ADC);
    end;
    Exit;
  {$ENDIF}
{$ENDIF}

    with ScreenCanvas do
      for I := 1 to ABorderWidth do
      begin
{$IFDEF VCL}
        Windows.DrawFocusRect(Handle, AFrameRect);
{$ELSE}
        Canvas.DrawFocusRect(AFrameRect); // TODO
{$ENDIF}
        InflateRect(AFrameRect, -1, -1);
      end;
  end;

begin
  ABorderWidth := GetEditPopupWindowBorderWidth(ViewInfo, False);
  if ABorderWidth < 2 then
    ABorderWidth := 2;
  if not IsRectEmpty(FPaintedSizeFrameBounds) then
    InternalDrawSizeFrame(FPaintedSizeFrameBounds);
  if FSizingCapture and not IsRectEmpty(R) then
    InternalDrawSizeFrame(R);
  FPaintedSizeFrameBounds := R;
  if not IsRectEmpty(R) then
    FSizeFrameBounds := R;
end;

function TcxCustomEditPopupWindow.GetMinSize: TSize;
begin
  with ViewInfo.GetClientExtent do
    Result := Size(Left + Right, Top + Bottom);
  if Sizeable and SysPanelStyle then
  begin
    with ViewInfo.CloseButtonRect do
      Inc(Result.cx, Right - Left);
    with ViewInfo.SizeGripSizingRect do
      Inc(Result.cx, Right - Left);
    Inc(Result.cx, 10);
  end;
end;

procedure TcxCustomEditPopupWindow.InternalInvalidateRect(const ARect: TRect);
begin
{$IFDEF VCL}
  InvalidateRect(Handle, @ARect, True);
{$ELSE}
  InvalidateRect(ARect, True);
{$ENDIF}
end;

procedure TcxCustomEditPopupWindow.RefreshPopupWindow;
begin
  OwnerBounds := Edit.GetPopupWindowOwnerControlBounds;
  CalculateViewInfo;
  Edit.PositionPopupWindowChilds(ViewInfo.ClientRect);
  InternalInvalidateRect(ViewInfo.Bounds);
  Refresh;
end;

function TcxCustomEditPopupWindow.GetEdit: TcxCustomDropDownEdit;
begin
  Result := TcxCustomDropDownEdit(OwnerControl);
end;

function TcxCustomEditPopupWindow.GetMinSysPanelHeight: Integer;
begin
  Result := ViewInfo.MinSysPanelHeight;
end;

function TcxCustomEditPopupWindow.GetViewInfo: TcxCustomEditPopupWindowViewInfo;
begin
  Result := TcxCustomEditPopupWindowViewInfo(FViewInfo);
end;

procedure TcxCustomEditPopupWindow.SetPopupAutoSize(Value: Boolean);
begin
  if Value <> FPopupAutoSize then
    FPopupAutoSize := Value;
end;

procedure TcxCustomEditPopupWindow.SetBorderStyle(Value: TcxEditPopupBorderStyle);
begin
  FBorderStyle := Value;
  ViewInfo.BorderStyle := Value;
end;

procedure TcxCustomEditPopupWindow.SetClientEdge(Value: Boolean);
begin
  FClientEdge := Value;
  ViewInfo.ClientEdge := Value;
end;

procedure TcxCustomEditPopupWindow.SetCloseButton(Value: Boolean);
begin
  FCloseButton := Value;
  ViewInfo.CloseButton := Value;
end;

procedure TcxCustomEditPopupWindow.SetMinSysPanelHeight(Value: Integer);
begin
  ViewInfo.MinSysPanelHeight := Value;
end;

procedure TcxCustomEditPopupWindow.SetNativeStyle(Value: Boolean);
begin
  FNativeStyle := Value;
  ViewInfo.NativeStyle := Value;
end;

procedure TcxCustomEditPopupWindow.SetShadow(Value: Boolean);
begin
  FShadow := Value;
  ViewInfo.Shadow := Value;
end;

procedure TcxCustomEditPopupWindow.SetSizeable(Value: Boolean);
begin
  FSizeable := Value;
  ViewInfo.Sizeable := Value;
end;

procedure TcxCustomEditPopupWindow.SetSysPanelStyle(Value: Boolean);
begin
  FSysPanelStyle := Value;
  ViewInfo.SysPanelStyle := Value;
end;

{$IFDEF VCL}
procedure TcxCustomEditPopupWindow.CMPopupControlKey(var Message: TMessage);
begin
  if IsVisible then
    DoPopupControlKey(Char(Message.WParam));
end;
{$ENDIF}

{ TcxCustomDropDownEditViewData }

procedure TcxCustomDropDownEditViewData.Calculate(ACanvas: TcxCanvas; const ABounds: TRect;
  const P: TPoint; Button: TcxMouseButton; Shift: TShiftState; AViewInfo: TcxCustomEditViewInfo;
  AIsMouseEvent: Boolean);
begin
  inherited Calculate(ACanvas, ABounds, P, Button, Shift, AViewInfo, AIsMouseEvent);
  with TcxCustomTextEditViewInfo(AViewInfo) do
  begin
    DrawSelectionBar := not IsInplace and ((Edit = nil) or
      not((Properties.EditingStyle = esFixedList) and Properties.FixedListSelection and
      TcxCustomTextEditAccess(Edit).FindSelection));
    if DrawSelectionBar then
      DrawSelectionBar := (Properties.EditingStyle = esFixedList) and Focused and
        not Transparent and not HasPopupWindow;
  end;
end;

function TcxCustomDropDownEditViewData.CanPressButton(AViewInfo: TcxCustomEditViewInfo; AButtonVisibleIndex: Integer): Boolean;
begin
  Result := not(IsHotAndPopup and (AButtonVisibleIndex = Properties.DropDownButtonVisibleIndex));
end;

function TcxCustomDropDownEditViewData.GetProperties: TcxCustomDropDownEditProperties;
begin
  Result := TcxCustomDropDownEditProperties(FProperties);
end;

{ TcxCustomDropDownEditProperties }

constructor TcxCustomDropDownEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FImmediateDropDown := True;
  Buttons.Add;
  Buttons[0].Kind := bkDown;
  FGlyphButtonIndex := DropDownButtonVisibleIndex;
  FPopupAlignment := taLeftJustify;
  FPopupAutoSize := True;
end;

procedure TcxCustomDropDownEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomDropDownEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomDropDownEditProperties do
      begin
        Self.ButtonGlyph := ButtonGlyph;
        Self.ImmediateDropDown := ImmediateDropDown;
        Self.ImmediatePopup := ImmediatePopup;
        Self.PopupAlignment := PopupAlignment;
        Self.PopupAutoSize := PopupAutoSize;
        Self.PopupClientEdge := PopupClientEdge;
        Self.PopupHeight := PopupHeight;
        Self.PopupMinHeight := PopupMinHeight;
        Self.PopupMinWidth := PopupMinWidth;
        Self.PopupSizeable := PopupSizeable;
        Self.PopupSysPanelStyle := PopupSysPanelStyle;
        Self.PopupWidth := PopupWidth;

        Self.OnCloseQuery := OnCloseQuery;
        Self.OnCloseUp := OnCloseUp;
        Self.OnInitPopup := OnInitPopup;
        Self.OnPopup := OnPopup;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomDropDownEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxCustomDropDownEdit;
end;

procedure TcxCustomDropDownEditProperties.Changed;
begin
  if FInternalChanging then
    Exit;
  FInternalChanging := True;
  if DropDownButtonVisibleIndex < Buttons.VisibleCount then
    with Buttons[DropDownButtonVisibleIndex] do
    begin
      if VerifyBitmap(Glyph) then
        Kind := bkGlyph
      else
        if Kind = bkGlyph then
          Kind := bkDown;
    end;
  FInternalChanging := False;
  inherited Changed;
end;

class function TcxCustomDropDownEditProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomDropDownEditViewData;
end;

function TcxCustomDropDownEditProperties.IsLookupDataVisual: Boolean;
begin
  Result := True;
end;

function TcxCustomDropDownEditProperties.DropDownButtonVisibleIndex: Integer;
begin
  Result := 0;
end;

function TcxCustomDropDownEditProperties.DropDownOnClick: Boolean;
begin
  Result := False;
end;

function TcxCustomDropDownEditProperties.GetAlwaysPostEditValue: Boolean;
begin
  Result := False;
end;

class function TcxCustomDropDownEditProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxCustomEditPopupWindow;
end;

function TcxCustomDropDownEditProperties.PopupWindowCapturesFocus: Boolean;
begin
  Result := False;
end;

function TcxCustomDropDownEditProperties.GetButtonGlyph: TBitmap;
begin
  if GlyphButtonIndex < Buttons.Count then
    Result := Buttons[GlyphButtonIndex].Glyph
  else
    Result := nil;
end;

procedure TcxCustomDropDownEditProperties.SetButtonGlyph(Value: TBitmap);
begin
  if GlyphButtonIndex < Buttons.Count then
    with Buttons[GlyphButtonIndex] do
    begin
      Glyph := Value;
      if VerifyBitmap(Glyph) then
        Kind := bkGlyph
      else
        if Kind = bkGlyph then
          Kind := bkDown;
    end;
end;

procedure TcxCustomDropDownEditProperties.SetGlyphButtonIndex(Value: Integer);
begin
  if Value <> FGlyphButtonIndex then
  begin
    Buttons[Value].Glyph := Buttons[FGlyphButtonIndex].Glyph;
    Buttons[Value].Kind := bkGlyph;
    Buttons[FGlyphButtonIndex].Glyph := nil;
    FGlyphButtonIndex := Value;
  end;
end;

procedure TcxCustomDropDownEditProperties.SetOnPopup(Value: TNotifyEvent);
begin
  FOnPopup := Value;
end;

procedure TcxCustomDropDownEditProperties.SetPopupAlignment(Value: TAlignment);
begin
  if Value = FPopupAlignment then
    Exit;
  FPopupAlignment := Value;
  Changed;
end;

procedure TcxCustomDropDownEditProperties.SetPopupClientEdge(Value: Boolean);
begin
  if Value = FPopupClientEdge then
    Exit;
  FPopupClientEdge := Value;
  Changed;
end;

procedure TcxCustomDropDownEditProperties.SetPopupHeight(Value: Integer);
begin
  if Value < FPopupMinHeight then
    Value := FPopupMinHeight;
  if FPopupHeight <> Value then
    FPopupHeight := Value;
end;

procedure TcxCustomDropDownEditProperties.SetPopupMinHeight(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  FPopupMinHeight := Value;
  SetPopupHeight(FPopupHeight);
end;

procedure TcxCustomDropDownEditProperties.SetPopupMinWidth(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  FPopupMinWidth := Value;
  SetPopupWidth(FPopupWidth);
end;

procedure TcxCustomDropDownEditProperties.SetPopupSizeable(Value: Boolean);
begin
  if Value = FPopupSizeable then
    Exit;
  FPopupSizeable := Value;
  Changed;
end;

procedure TcxCustomDropDownEditProperties.SetPopupSysPanelStyle(Value: Boolean);
begin
  if Value = FPopupSysPanelStyle then
    Exit;
  FPopupSysPanelStyle := Value;
  Changed;
end;

procedure TcxCustomDropDownEditProperties.SetPopupWidth(Value: Integer);
begin
  if Value < 0 then
    Value := 0
  else
    if (Value > 0) and (Value < FPopupMinWidth) then
    Value := FPopupMinWidth;
  if FPopupWidth <> Value then
    FPopupWidth := Value;
end;

{ TcxEditPopupControlLookAndFeel }

procedure TcxEditPopupControlLookAndFeel.EditStyleChanged;
var
  AChangedValues: TcxLookAndFeelValues;
begin
  AChangedValues := [];
  if Kind <> InternalGetKind then
    Include(AChangedValues, lfvKind);
  if NativeStyle <> InternalGetNativeStyle then
    Include(AChangedValues, lfvKind);
  if AChangedValues <> [] then
    MasterLookAndFeelChanged(Self, AChangedValues);
end;

function TcxEditPopupControlLookAndFeel.InternalGetKind: TcxLookAndFeelKind;
const
  APopupControlLookAndFeelKindMap: array [TcxEditButtonStyle] of TcxLookAndFeelKind =
    (lfStandard, lfStandard, lfFlat, lfFlat, lfFlat, lfUltraFlat);
begin
  with Edit do
  begin
    if IsInplace then
      Result := Style.LookAndFeel.Kind
    else
      if Length(ViewInfo.ButtonsInfo) > 0 then
        Result := APopupControlLookAndFeelKindMap[ViewInfo.ButtonsInfo[0].Data.Style]
      else
        Result := lfStandard;
  end;
end;

function TcxEditPopupControlLookAndFeel.InternalGetNativeStyle: Boolean;
begin
  Result := Edit.ViewInfo.NativeStyle;
end;

function TcxEditPopupControlLookAndFeel.GetEdit: TcxCustomDropDownEdit;
begin
  Result := TcxCustomDropDownEdit(GetOwner);
end;

{ TcxCustomDropDownInnerEdit }

{$IFDEF WIN32}
procedure TcxCustomDropDownInnerEdit.KeyUp(var Key: Word; Shift: TShiftState);
var
  M: TMsg;
begin
  inherited KeyUp(Key, Shift);
  if (Key = VK_MENU) and (Shift = []) then
    while PeekMessage(M, NativeHandle(Handle), WM_CHAR, WM_CHAR, PM_REMOVE) do
      ;
end;
{$ENDIF}

function TcxCustomDropDownInnerEdit.GetContainer: TcxCustomDropDownEdit;
begin
  Result := TcxCustomDropDownEdit(Owner);
end;

{$IFDEF VCL}
procedure TcxCustomDropDownInnerEdit.CMHintShow(var Message: TMessage);
begin
  Message.Result := Integer(Container.DroppedDown);
end;
{$ENDIF}

{ TcxCustomDropDownEdit }

constructor TcxCustomDropDownEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsCreating := True;
{$IFDEF VCL}
  if not IsDesigning then
    CreatePopupWindow;
{$ENDIF}
  FSendChildrenStyle := True;
  FIsCreating := False;
  FPopupControlLookAndFeel := TcxEditPopupControlLookAndFeel.Create(Self);
end;

destructor TcxCustomDropDownEdit.Destroy;
begin
  FreeAndNil(FPopupControlLookAndFeel);
  if FPopupWindow <> nil then
    FreeAndNil(FPopupWindow);
  inherited Destroy;
end;

procedure TcxCustomDropDownEdit.Activate(var AEditData: TcxCustomEditData);
begin
  inherited Activate(AEditData);
  FPopupSizeChanged := TcxCustomDropDownEditData(AEditData).Initialized and
    Properties.PopupSizeable;
  if Properties.ImmediatePopup then
    DroppedDown := True;
end;

procedure TcxCustomDropDownEdit.ActivateByKey(Key: Char; var AEditData: TcxCustomEditData);
begin
  inherited ActivateByKey(Key, AEditData);
  if (Key >= #32) and (Key <= #255) and Properties.ImmediateDropDown and
      not Properties.ImmediatePopup and not SendActivationKey(Key) then
    DroppedDown := True;
  if not SendActivationKey(Key) and CanDropDown and (GetPopupFocusedControl <> nil) then
{$IFDEF VCL}
    PostMessage(PopupWindow.Handle, CM_POPUPCONTROLKEY, Integer(Key), 0);
{$ELSE}
  QApplication_postEvent(PopupWindow.Handle, QCustomEvent_create(QEventType(QEventType_CMPopupControlKey),
    Pointer(Key)));
{$ENDIF}
end;

procedure TcxCustomDropDownEdit.ActivateByMouse(Shift: TShiftState; X, Y: Integer;
  var AEditData: TcxCustomEditData);
begin
  FIsActivatingByMouse := True;
  try
    inherited ActivateByMouse(Shift, X, Y, AEditData);
  finally
    FIsActivatingByMouse := False;
  end;
end;

procedure TcxCustomDropDownEdit.BeforeDestruction;
begin
  if ILookupData <> nil then
    ILookupData.Deinitialize;
  inherited BeforeDestruction;
end;

function TcxCustomDropDownEdit.Deactivate: Boolean;
{$IFDEF VCL}
var
  M: TMsg;
{$ENDIF}
begin
  if HasPopupWindow then
    CloseUp(False);
  if EditData <> nil then
    TcxCustomDropDownEditData(EditData).Initialized := FPopupSizeChanged;
  Result := inherited Deactivate;
  if (PopupWindow <> nil) and PopupWindow.HandleAllocated then
{$IFDEF VCL}
    while PeekMessage(M, PopupWindow.Handle, CM_SHOWPOPUPWINDOW, CM_SHOWPOPUPWINDOW, PM_REMOVE) do
      ;
{$ELSE}
// TODO
    QApplication_removePostedEvents(PopupWindow.Handle);
{$ENDIF}
end;

function TcxCustomDropDownEdit.Focused: Boolean;
begin
  Result := inherited Focused or HasPopupWindow;
end;

class function TcxCustomDropDownEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxCustomDropDownEditProperties;
end;

class function TcxCustomDropDownEdit.GetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := [];
end;

procedure TcxCustomDropDownEdit.ContainerStyleChanged(Sender: TObject);
begin
  if not HandleAllocated then
    Exit;
  if FPopupControlLookAndFeel <> nil then
    FPopupControlLookAndFeel.EditStyleChanged;
  inherited ContainerStyleChanged(Sender);
end;

function TcxCustomDropDownEdit.CreateViewData: TcxCustomEditViewData;
begin
  Result := inherited CreateViewData;
  with Result as TcxCustomDropDownEditViewData do
  begin
    HasPopupWindow := Self.HasPopupWindow;
{$IFDEF WIN32}
    IsHotAndPopup := FIsHotAndPopup;
{$ELSE}
    if PopupWindow <> nil then
      IsHotAndPopup := PopupWindow.JustClosed
    else
      IsHotAndPopup := False;
{$ENDIF}
  end;
end;

procedure TcxCustomDropDownEdit.DoButtonDown(AButtonVisibleIndex: Integer);
begin
  inherited DoButtonDown(AButtonVisibleIndex);
  if AButtonVisibleIndex = Properties.DropDownButtonVisibleIndex then
    DroppedDown := True;
end;

procedure TcxCustomDropDownEdit.DoExit;
begin
  CloseUp(False);
  inherited DoExit;
end;

procedure TcxCustomDropDownEdit.DoEditKeyDown(var Key: Word; Shift: TShiftState);
var
  AKey: Word;
begin
  AKey := TranslateKey(Key);
  if (((AKey = VK_UP) or (AKey = VK_DOWN)) and (ssAlt in Shift)) or
      ((AKey = VK_F4) and not (ssAlt in Shift)) then
    if HasPopupWindow then
    begin
      CloseUp(True);
      Key := 0;
    end else
    begin
      DropDown;
      Key := 0;
    end
  else
    if ((AKey = VK_RETURN) or (AKey = VK_ESCAPE)) and not(ssAlt in Shift) and HasPopupWindow then
    begin
      FIsPopupWindowJustClosed := True;
      KeyboardAction := True;
      CloseUp((AKey = VK_RETURN) and DoEditing);
      KeyboardAction := False;
      if not HasPopupWindow then
      begin
        if not(Properties.UseLookupData and not ILookupData.Find(DisplayValue)) then // TODO
          Key := 0;
        if AKey = VK_ESCAPE then
          SetCaptureControl(nil);
      end;
    end;
  if Key <> 0 then
    inherited DoEditKeyDown(Key, Shift);
end;

procedure TcxCustomDropDownEdit.DoEditKeyPress(var Key: Char);
begin
  if (Key >= #32) and (Key <= #255) and Properties.ImmediateDropDown and
      not HasPopupWindow then
  begin
{$IFDEF VCL}
    SendMessage(Handle, CM_DROPDOWN, 0, 0);
{$ELSE}
    QApplication_sendEvent(Handle, QCustomEvent_create(QEventType_CMDropDown));
{$ENDIF}

    if Properties.PopupWindowCapturesFocus and (TranslateKey(Word(Key)) <> VK_RETURN) and
        CanDropDown and (GetPopupFocusedControl <> nil) then
    begin
{$IFDEF VCL}
      PostMessage(PopupWindow.Handle, CM_POPUPCONTROLKEY, Integer(Key), 0);
{$ELSE}
      QApplication_postEvent(PopupWindow.Handle, QCustomEvent_create(QEventType(QEventType_CMPopupControlKey),
        Pointer(Key)));
{$ENDIF}
      Key := #0;
    end;
  end;
  if Key <> #0 then
    inherited DoEditKeyPress(Key);
end;

function TcxCustomDropDownEdit.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos);
  if Result then
    Exit;
  if GetScrollLookupDataList(escMouseWheel) and HasPopupWindow and
      Properties.UseLookupData and not ILookupData.IsEmpty then
    with ILookupData do
    begin
      Result := True;
{$IFDEF DELPHI6}
      if GetActiveControl is TControl then
        TControlAccess(ActiveControl).DoMouseWheel(Shift, WheelDelta, MousePos)
{$ELSE}
      if GetActiveControl is TWinControl then
        TWinControlAccess(ActiveControl).DoMouseWheel(Shift, WheelDelta, MousePos)
{$ENDIF}
    end;
end;

function TcxCustomDropDownEdit.GetEditDataClass: TcxCustomEditDataClass;
begin
  Result := TcxCustomDropDownEditData;
end;

function TcxCustomDropDownEdit.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomDropDownInnerEdit;
end;

function TcxCustomDropDownEdit.GetScrollLookupDataList(AScrollCause: TcxEditScrollCause): Boolean;
begin
  Result := not PropertiesChangeLocked and (not IsInplace or
    (AScrollCause = escMouseWheel) or HasPopupWindow);
end;

procedure TcxCustomDropDownEdit.InitializeEditData;
begin
  with TcxCustomDropDownEditData(EditData) do
  begin
    Initialized := False;
    Width := Properties.PopupWidth;
    Height := Properties.PopupHeight;
  end;
end;

function TcxCustomDropDownEdit.IsEditorKey(Key: Word; Shift: TShiftState): Boolean;
begin
  Result := inherited IsEditorKey(Key, Shift) or IsInplace and HasPopupWindow and
    not((Shift * [ssAlt, ssCtrl] = []) and (Key >= 32) and (Key <= 255));
end;

procedure TcxCustomDropDownEdit.PropertiesChanged(Sender: TObject);
begin
  if not Properties.PopupSizeable then
    FPopupSizeChanged := False;
  if HasPopupWindow then
    SetupPopupWindow;
  inherited PropertiesChanged(Sender);
end;

function TcxCustomDropDownEdit.HasPopupWindow: Boolean;
begin
  if PopupWindow = nil then
    Result := False
  else
    Result := PopupWindow.IsVisible;
end;

procedure TcxCustomDropDownEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if not FIsActivatingByMouse and Properties.DropDownOnClick and (Button = mbLeft) and
      PtInRect(ViewInfo.ClientRect, Point(X, Y)) and not HasPopupWindow and
      not FIsHotAndPopup and IsFocused then
    DropDown;
{$IFDEF LINUX}
  if PopupWindow <> nil then
    PopupWindow.JustClosed := False;
{$ENDIF}
end;

function TcxCustomDropDownEdit.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
  if HasPopupWindow then
    with ViewInfo do
      if IsButtonReallyPressed and (PressedButton = -1) then
        CloseUp(False);
  if AIsMouseEvent and not((Button = cxmbLeft) and (cxButtonToShift(Button) * Shift <> [])) then
    SetIsHotAndPopup;
  if FPopupControlLookAndFeel <> nil then
    FPopupControlLookAndFeel.EditStyleChanged;
end;

function TcxCustomDropDownEdit.SendActivationKey(Key: Char): Boolean;
begin
  Result := not(Properties.ImmediateDropDown and Properties.PopupWindowCapturesFocus and
    (TranslateKey(Word(Key)) <> VK_RETURN));
end;

{$IFDEF VCL}
procedure TcxCustomDropDownEdit.CreateHandle;
begin
  inherited CreateHandle;
  InitializeLookupData;
end;

procedure TcxCustomDropDownEdit.ThemeChanged;
begin
  inherited ThemeChanged;
  FPopupControlLookAndFeel.EditStyleChanged;
end;
{$ELSE}
function TcxCustomDropDownEdit.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if QEvent_type(Event) = QEventType(QEventType_CMDropDown) then
  begin
    Result := True;
    DropDown;
  end
  else
    Result := inherited EventFilter(Sender, Event);
end;

procedure TcxCustomDropDownEdit.InitWidget;
begin
  inherited InitWidget;
  if not IsDesigning then
    CreatePopupWindow;
  InitializeLookupData;
end;
{$ENDIF}

function TcxCustomDropDownEdit.CanDropDown: Boolean;
begin
  Result := False;
end;

procedure TcxCustomDropDownEdit.CloseUp(AAccept: Boolean);
var
  APrevLookupKey: TcxEditValue;
begin
  if not HasPopupWindow then
    Exit;
  LockChangeEvents(True);
  try
    with Properties do
      if AAccept then
      begin
        if UseLookupData then
        begin
          APrevLookupKey := ILookupData.CurrentKey;
          LockClick(True);
          try
            ILookupData.SelectItem;
          finally
            LockClick(False);
            if ModifiedAfterEnter and not VarEqualsExact(APrevLookupKey, ILookupData.CurrentKey) then
              DoClick;
          end;
        end;
        if not Properties.AlwaysPostEditValue and Properties.ImmediatePost and
            AutoPostEditValue and ValidateEdit(True) then
          PostEditValue;
      end;
  finally
    LockChangeEvents(False);
  end;
  PopupWindow.CloseUp(False);
end;

procedure TcxCustomDropDownEdit.CreatePopupWindow;
begin
  with Properties do
    FPopupWindow := GetPopupWindowClass.Create(Self);
  FPopupWindow.CaptureFocus := Properties.PopupWindowCapturesFocus;
  FPopupWindow.IsTopMost := not IsInplace;
{$IFDEF VCL}
  FPopupWindow.BiDiMode := BiDiMode;
{$ENDIF}
  FPopupWindow.OnCloseQuery := PopupWindowCloseQuery;
  FPopupWindow.OnClosed := PopupWindowClosed;
  FPopupWindow.OnClosing := PopupWindowClosing;
  FPopupWindow.OnShowed := PopupWindowShowed;
  FPopupWindow.OnShowing := PopupWindowShowing;
end;

procedure TcxCustomDropDownEdit.DoCloseQuery(var CanClose: Boolean);
begin
  with Properties do
    if Assigned(FOnCloseQuery) then
      FOnCloseQuery(Self, CanClose);
end;

procedure TcxCustomDropDownEdit.DoCloseUp;
begin
  with Properties do
    if Assigned(FOnCloseUp) then
      FOnCloseUp(Self);
end;

procedure TcxCustomDropDownEdit.DoInitPopup;
begin
  with Properties do
    if Assigned(FOnInitPopup) then
      FOnInitPopup(Self);
end;

procedure TcxCustomDropDownEdit.DoPopup;
begin
  with Properties do
    if Assigned(FOnPopup) then
      FOnPopup(Self);
end;

procedure TcxCustomDropDownEdit.SetupPopupWindow;
var
  P: TPoint;
{$IFDEF VCL}
  {$IFDEF DELPHI6}
  AParentForm: TCustomForm;
  {$ENDIF}
{$ENDIF}
begin
  PopupWindow.CaptureFocus := Properties.PopupWindowCapturesFocus;
  InitializeLookupData;
  InitializePopupWindow;
  PopupWindow.CalculateSize;
  P := PopupWindow.CalculatePosition;
  with PopupWindow do
    SetBounds(P.X, P.Y, Width, Height);
  PopupWindow.RefreshPopupWindow;
  PositionPopupWindowChilds(PopupWindow.ViewInfo.ClientRect);
  SetEditPopupWindowShadowRegion(PopupWindow);

{$IFDEF VCL}
  {$IFDEF DELPHI6}
  if IsWindowsXPOrLater then // W2K bug
  begin
    AParentForm := GetParentForm(Self);
    if AParentForm <> nil then
      with TCustomFormAccess(AParentForm) do
      begin
        PopupWindow.AlphaBlend := AlphaBlend;
        PopupWindow.AlphaBlendValue := AlphaBlendValue;
        PopupWindow.TransparentColor := TransparentColor;
        PopupWindow.TransparentColorValue := TransparentColorValue;
      end;
  end;
  {$ENDIF}
{$ENDIF}
end;

procedure TcxCustomDropDownEdit.UpdatePopupWindow;
begin
  if HasPopupWindow then
    SetupPopupWindow;
end;

procedure TcxCustomDropDownEdit.DropDown;
begin
  DoInitPopup;
  if not CanDropDown then
    Exit;
  with PopupWindow do
  begin
    if Properties.UseLookupData then
      ILookupData.DropDown;
    SetupPopupWindow;
    HandleNeeded;
{$IFDEF VCL}
    PostMessage(Handle, CM_SHOWPOPUPWINDOW, Integer(Self.GetPopupFocusedControl), 0);
{$ELSE}
    QApplication_postEvent(Handle, QCustomEvent_create(QEventType_CMShowPopupWindow,
      Self.GetPopupFocusedControl));
{$ENDIF}
  end;
end;

procedure TcxCustomDropDownEdit.EditButtonClick;
begin
end;

function TcxCustomDropDownEdit.GetPopupFocusedControl: TWinControl;
var
  AActiveControl: TControl;
begin
  Result := InnerTextEdit.Control;
  with Properties do
    if (ILookupData <> nil) and IsLookupDataVisual and PopupWindowCapturesFocus then
    begin
      AActiveControl := ILookupData.ActiveControl;
      if (AActiveControl <> nil) and (AActiveControl is TWinControl) then
        Result := TWinControl(AActiveControl);
    end;
end;

function TcxCustomDropDownEdit.GetPopupWindowOwnerControlBounds: TRect;
begin
  Result := GetEditPopupWindowOwnerControlBounds(ViewInfo);
  OffsetRect(Result, Left, Top);
end;

procedure TcxCustomDropDownEdit.InitializeLookupData;
begin
  with Properties do
    if (ILookupData <> nil) and not IsDesigning and IsLookupDataVisual then
      ILookupData.Initialize(PopupWindow);
end;

procedure TcxCustomDropDownEdit.InitializePopupWindow;
const
  AAlignHorzMap: array[TAlignment] of TcxPopupAlignHorz =
    (pahLeft, pahRight, pahCenter);
begin
  PopupWindow.OwnerParent := Parent;
  with Properties do
  begin
    PopupWindow.AlignHorz := AAlignHorzMap[PopupAlignment];
    PopupWindow.ClientEdge := PopupClientEdge;
    PopupWindow.MinHeight := PopupMinHeight;
    PopupWindow.MinWidth := PopupMinWidth;
    PopupWindow.PopupAutoSize := PopupAutoSize;
    PopupWindow.Sizeable := PopupSizeable;
    PopupWindow.SysPanelStyle := PopupSysPanelStyle;
  end;

  if IsInplace and Properties.PopupSizeable then
    with TcxCustomDropDownEditData(EditData) do
    begin
      PopupWindow.PopupWidth := Width;
      PopupWindow.PopupHeight := Height;
    end
  else
  begin
    PopupWindow.PopupWidth := Properties.PopupWidth;
    PopupWindow.PopupHeight := Properties.PopupHeight;
  end;

  PopupWindow.CloseButton := TcxCustomEditStyleAccess(Style).PopupCloseButton;
  with ViewInfo do
  begin
    PopupWindow.BorderStyle := PopupBorderStyle;
    PopupWindow.NativeStyle := NativeStyle;
    PopupWindow.Shadow := Shadow;
  end;
end;

procedure TcxCustomDropDownEdit.PopupWindowClosed(Sender: TObject);
begin
  if Properties.PopupSizeable and FPopupSizeChanged then
    if IsInplace then
    begin
      if EditData <> nil then
        with TcxCustomDropDownEditData(EditData) do
        begin
          Initialized := True;
          Width := PopupWindow.Width;
          Height := PopupWindow.Height;
        end
    end else
    begin
      with Properties do
      begin
        PopupWidth := PopupWindow.Width;
        PopupHeight := PopupWindow.Height;
      end;
    end;

  with Properties do
    if UseLookupData then
      ILookupData.CloseUp;
  if Properties.EditingStyle = esFixedList then
    ShortRefreshContainer(False);
  DoCloseUp;
  LockChangeEvents(True);
  try
    if Properties.AlwaysPostEditValue and Properties.ImmediatePost and
        AutoPostEditValue and ValidateEdit(True) then
      PostEditValue;
  finally
    LockChangeEvents(False);
  end;
end;

procedure TcxCustomDropDownEdit.PopupWindowCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  DoCloseQuery(CanClose);
end;

procedure TcxCustomDropDownEdit.PopupWindowClosing(Sender: TObject);
begin
end;

procedure TcxCustomDropDownEdit.PopupWindowShowing(Sender: TObject);
begin
end;

procedure TcxCustomDropDownEdit.PopupWindowShowed(Sender: TObject);
begin
  ShortRefreshContainer(False);
  PopupWindow.CalculateViewInfo;
  PositionPopupWindowChilds(PopupWindow.ViewInfo.ClientRect);
  DoPopup;
  UpdateDrawValue;
  with Properties do
    if UseLookupData and FindSelection and ImmediateDropDown and
        PopupWindowCapturesFocus then
      ILookupData.DroppedDown(Copy(DisplayValue, 1, SelStart));
end;

procedure TcxCustomDropDownEdit.PositionPopupWindowChilds(const AClientRect: TRect);
begin
  ILookupData.PositionVisualArea(AClientRect);
end;

procedure TcxCustomDropDownEdit.SetIsHotAndPopup;
begin
  FIsHotAndPopup := HasPopupWindow and (esHotTrack in ViewInfo.EditState);
end;

function TcxCustomDropDownEdit.GetDroppedDown: Boolean;
begin
  Result := HasPopupWindow;
end;

function TcxCustomDropDownEdit.GetProperties: TcxCustomDropDownEditProperties;
begin
  Result := TcxCustomDropDownEditProperties(InternalGetProperties);
end;

procedure TcxCustomDropDownEdit.SetDroppedDown(Value: Boolean);
begin
  if DroppedDown <> Value then
    if Value then
      DropDown
    else
      CloseUp(False);
end;

procedure TcxCustomDropDownEdit.SetProperties(Value: TcxCustomDropDownEditProperties);
begin
  FProperties.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxCustomDropDownEdit.CMBiDiModeChanged(var Message: TMessage);
begin
  if PopupWindow <> nil then
    PopupWindow.BiDiMode := BiDiMode;
end;

procedure TcxCustomDropDownEdit.CMDropDown(var Message: TMessage);
begin
  DropDown;
end;

procedure TcxCustomDropDownEdit.CMHintShow(var Message: TMessage);
begin
  Message.Result := Integer(DroppedDown);
end;
{$ENDIF}

{ TcxComboBoxPopupWindow }

procedure TcxComboBoxPopupWindow.CalculateSize;
var
  AClientExtent: TRect;
  AMinSize: TSize;
  APreferredWidth, APreferredHeight: Integer;
  APopupWindowVisualAreaSize: TSize;
  ASizeChanged: Boolean;
begin
  ViewInfo.SizeGripCorner := ecoBottomRight;
  OwnerBounds := Edit.GetPopupWindowOwnerControlBounds;
  AClientExtent := ViewInfo.GetClientExtent;
  AMinSize := MinSize;
  APopupWindowVisualAreaSize := Edit.GetPopupWindowClientPreferredSize;
  ASizeChanged := Edit.FPopupSizeChanged;
  with OwnerBounds do
  begin
    if Sizeable and Edit.PopupSizeChanged then
      APreferredWidth := ViewInfo.ClientRect.Right - ViewInfo.ClientRect.Left +
        AClientExtent.Left + AClientExtent.Right
    else
      if not Sizeable or (PopupWidth = 0) or not ASizeChanged then
        if PopupAutoSize then
        begin
          APreferredWidth := APopupWindowVisualAreaSize.cx + AClientExtent.Left + AClientExtent.Right;
          if APreferredWidth < OwnerBounds.Right - OwnerBounds.Left then
            APreferredWidth := OwnerBounds.Right - OwnerBounds.Left;
        end
        else
          if PopupWidth > 0 then
            APreferredWidth := PopupWidth
          else
            APreferredWidth := OwnerBounds.Right - OwnerBounds.Left
      else
        APreferredWidth := PopupWidth;
    if Sizeable and (MinWidth > 0) and (APreferredWidth < MinWidth) then
      APreferredWidth := MinWidth;
    if APreferredWidth < AMinSize.cx then
      APreferredWidth := AMinSize.cx;

    if Sizeable and Edit.PopupSizeChanged then
      APreferredHeight := ViewInfo.ClientRect.Bottom - ViewInfo.ClientRect.Top + AClientExtent.Top + AClientExtent.Bottom
    else
      if not Sizeable or (PopupHeight = 0) then
        if PopupAutoSize or (PopupHeight = 0) then
          APreferredHeight := APopupWindowVisualAreaSize.cy + AClientExtent.Top + AClientExtent.Bottom
        else
          APreferredHeight := PopupHeight
      else
        APreferredHeight := PopupHeight;
    if Sizeable and (MinHeight > 0) and (APreferredHeight < MinHeight) then
      APreferredHeight := MinHeight;
    if APreferredHeight < AMinSize.cy then
      APreferredHeight := AMinSize.cy;

    Width := APreferredWidth;
    Height := APreferredHeight;
  end;
end;

{ TcxComboBoxListBox }

constructor TcxComboBoxListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsFirstWindowRecreation := True;
end;

function TcxComboBoxListBox.DoDrawItem(AIndex: Integer; const ARect: TRect;
  AState: TOwnerDrawState): Boolean;
{$IFNDEF VCL}
var
  R: TRect;
{$ENDIF}
begin
  with Edit.Properties do
  begin
    Result := Assigned(OnDrawItem);
    if Result then
{$IFDEF VCL}
      OnDrawItem(Edit, Canvas, AIndex, ARect, AState);
{$ELSE}
    begin
      if odSelected in AState then
      begin
        R := ARect;
        R.Right := Width;
        Canvas.Brush.Color := clHighlight;
        Canvas.FillRect(R);
  {$IFDEF LINUX}
        Canvas.DrawFocusRect(R);
  {$ENDIF}
      end;
      OnDrawItem(Edit, Canvas, AIndex, R, AState);
    end;
{$ENDIF}
  end;
end;

function TcxComboBoxListBox.GetHeight(ARowCount: Integer; AMaxHeight: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to ARowCount - 1 do
    Inc(Result, GetItemHeight(I));
end;

function TcxComboBoxListBox.GetItem(Index: Integer): TCaption;
begin
  Result := Edit.LookupData.GetItem(Index);
end;

function TcxComboBoxListBox.GetItemHeight(AIndex: Integer = -1): Integer;
begin
  with Edit.Properties do
  begin
    if ItemHeight > 0 then
      Result := ItemHeight
    else
      Result := inherited GetItemHeight;
    if (AIndex >= 0) and Assigned(FOnMeasureItem) then
      FOnMeasureItem(TcxCustomComboBox(Edit), AIndex, Canvas, Result);
  end;
end;

procedure TcxComboBoxListBox.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if Edit.PopupMouseMoveLocked then
    Edit.PopupMouseMoveLocked := False
  else
    inherited MouseMove(Shift, X, Y);
end;

procedure TcxComboBoxListBox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  AItemIndex: Integer;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button <> mbLeft then
    Exit;
  AItemIndex := ItemAtPos(Point(X, Y), True);
  if AItemIndex <> -1 then
  begin
    SetCaptureControl(nil);
    ItemIndex := AItemIndex;
    Edit.CloseUp(True);
  end;
end;

procedure TcxComboBoxListBox.RecreateWindow;
var
  AIsRecreationNeeded: Boolean;
  AIsOnMeasureItemAssigned: Boolean;
  AItemHeight: Integer;
begin
  AIsOnMeasureItemAssigned := Assigned(TcxCustomComboBoxProperties(Edit.Properties).OnMeasureItem);
  AItemHeight := 0;
  if not AIsOnMeasureItemAssigned then
    AItemHeight := GetItemHeight;
  if FIsFirstWindowRecreation then
    AIsRecreationNeeded := AIsOnMeasureItemAssigned
  else
    AIsRecreationNeeded := (AIsOnMeasureItemAssigned <> FPrevIsOnMeasureItemAssigned) or
      AIsOnMeasureItemAssigned or (AItemHeight <> FPrevItemHeight);
  if AIsRecreationNeeded then
    InternalRecreateWindow;
  FIsFirstWindowRecreation := False;
  FPrevIsOnMeasureItemAssigned := AIsOnMeasureItemAssigned;
  if not AIsOnMeasureItemAssigned then
    FPrevItemHeight := AItemHeight;
end;

procedure TcxComboBoxListBox.SetItemIndex(const Value: Integer);
begin
  Edit.PopupMouseMoveLocked := True;
  inherited SetItemIndex(Value);
end;

{$IFDEF VCL}
procedure TcxComboBoxListBox.MeasureItem(Index: Integer; var Height: Integer);
begin
  Height := GetItemHeight(Index);
end;
{$ELSE}
procedure TcxComboBoxListBox.MeasureItem(Control: TWinControl;
  {$IFDEF LINUX}item: QClxListBoxItemH{$ENDIF}
  {$IFDEF WIN32}{$IFNDEF DELPHI7}Index: Integer{$ELSE}item: QClxListBoxItemH{$ENDIF}{$ENDIF};
  var Height{$IFNDEF VCL}, Width{$ENDIF}: Integer);
begin
  {$IFDEF LINUX}
  Height := GetItemHeight(QListBox_index(Handle, item));
  {$ENDIF}
  {$IFDEF WIN32}
    {$IFNDEF DELPHI7}
  Height := GetItemHeight(Index);
    {$ELSE}
  Height := GetItemHeight(QListBox_index(Handle, item));
    {$ENDIF}
  {$ENDIF};
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxComboBoxListBox.Resize;
var
  ARgn: HRGN;
begin
  if not Edit.HasPopupWindow then
    Exit;
  if HScrollBar.Visible and VScrollBar.Visible then
  begin
    ARgn := CreateRectRgnIndirect(GetSizeGripRect);
    SendMessage(Handle, WM_NCPAINT, ARgn, 0);
    DeleteObject(ARgn);
  end;
end;
{$ENDIF}

function TcxComboBoxListBox.GetEdit: TcxCustomComboBox;
begin
  Result := TcxCustomComboBox(TcxCustomEditPopupWindow(Owner).OwnerControl);
end;

{ TcxComboBoxLookupData }

function TcxComboBoxLookupData.CanResizeVisualArea(var NewSize: TSize): Boolean;
var
  I: Integer;
  AItemCount: Integer;
  AItemHeight: Integer;
  AListClientSize, AListSize: TSize;
  AMinWidth: Integer;
  AScrollBarSize: TSize;
  AVScrollBar: Boolean;
begin
  Result := True;
  if (NewSize.cx = List.Width) and (NewSize.cy = List.Height) then
    Exit;
  AItemCount := GetItemCount;
  AListClientSize.cy := 0;
  AScrollBarSize := GetScrollBarSize;
  AVScrollBar := False;
  for I := 0 to AItemCount - 1 do
  begin
    AItemHeight := TcxCustomEditListBoxAccess(List).GetItemHeight(I);
    Inc(AListClientSize.cy, AItemHeight);
    AListSize.cy := AListClientSize.cy;
    AListClientSize.cx := NewSize.cx;
    AVScrollBar := I + 1 < AItemCount;
    if AVScrollBar then
      Dec(AListClientSize.cx, AScrollBarSize.cx);
    if AListClientSize.cx < List.ScrollWidth then
      Inc(AListSize.cy, AScrollBarSize.cy);
    if AListSize.cy = NewSize.cy then
      Break;
    if AListSize.cy > NewSize.cy then
      if NewSize.cy >= List.Height then
      begin
        Dec(AListClientSize.cy, AItemHeight);
        AListSize.cy := AListClientSize.cy;
        AListClientSize.cx := NewSize.cx;
        AVScrollBar := I < AItemCount;
        if AVScrollBar then
          Dec(AListClientSize.cx, AScrollBarSize.cx);
        if AListClientSize.cx < List.ScrollWidth then
          Inc(AListSize.cy, AScrollBarSize.cy);
        Break;
      end
      else
        if NewSize.cy < List.Height then
          Break;
  end;
  NewSize.cy := AListSize.cy;
  AMinWidth := 0;
  if AVScrollBar then
    Inc(AMinWidth, AScrollBarSize.cx);
  if AListSize.cy > AListClientSize.cy then
    Inc(AMinWidth, AScrollBarSize.cx);
  if NewSize.cx < AMinWidth then
    NewSize.cx := AMinWidth;
end;

function TcxComboBoxLookupData.GetVisualAreaPreferredSize(AMaxHeight: Integer;
  AWidth: Integer = 0): TSize;
var
  AItemWidth: Integer;
  AListRowCount, I: Integer;
begin
  AListRowCount := GetItemCount;
  with TcxCustomComboBoxProperties(Properties) do
    if AListRowCount > DropDownRows then
      AListRowCount := DropDownRows;
  Result.cy := TcxComboBoxListBox(List).GetHeight(AListRowCount, AMaxHeight);
  Result.cx := 0;
  List.Canvas.Font := List.Font;
  for I := 0 to GetItemCount - 1 do
  begin
    AItemWidth := List.Canvas.TextWidth(GetItem(I));
    if AItemWidth > Result.cx then
      Result.cx := AItemWidth;
  end;
{$IFDEF WIN32}
  Inc(Result.cx, 4);
{$ELSE}
  Inc(Result.cx, 6);
{$ENDIF}
{$IFDEF VCL}
  List.ScrollWidth := 0;
  List.ScrollWidth := Result.cx;
{$ENDIF}
  with TcxCustomComboBoxProperties(Properties) do
    if GetItemCount > DropDownRows then
      Inc(Result.cx, GetScrollBarSize.cx);
  if (AWidth > 0) and (Result.cx > AWidth) then
    Inc(Result.cy, GetScrollBarSize.cy);
end;

procedure TcxComboBoxLookupData.Initialize(AVisualControlsParent: TWinControl);
begin
  inherited Initialize(AVisualControlsParent);
  with TcxCustomEditListBoxAccess(List) do
    LookAndFeel.MasterLookAndFeel := TcxCustomDropDownEdit(Edit).PopupControlsLookAndFeel;
end;

function TcxComboBoxLookupData.GetListBoxClass: TcxCustomEditListBoxClass;
begin
  Result := TcxComboBoxListBox;
end;

procedure TcxComboBoxLookupData.ListChanged;
begin
  if GetItemCount = 0 then
    InternalSetCurrentKey(-1);
  inherited ListChanged;
end;

{ TcxCustomComboBoxViewData }

function TcxCustomComboBoxViewData.IsComboBoxStyle: Boolean;
begin
  Result := True;
end;

{ TcxCustomComboBoxProperties }

constructor TcxCustomComboBoxProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FDropDownListStyle := lsEditList;
  FDropDownRows := cxEditDefaultDropDownPageRowCount;
end;

procedure TcxCustomComboBoxProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomComboBoxProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomComboBoxProperties do
      begin
        Self.DropDownListStyle := DropDownListStyle;
        Self.DropDownRows := DropDownRows;
        Self.ItemHeight := ItemHeight;
        Self.Revertable := Revertable;

        Self.OnDrawItem := OnDrawItem;
        Self.OnMeasureItem := OnMeasureItem;
      end;
    finally
      EndUpdate;
    end
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomComboBoxProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxComboBox;
end;

class function TcxCustomComboBoxProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := TcxComboBoxLookupData;
end;

function TcxCustomComboBoxProperties.DropDownOnClick: Boolean;
begin
  Result := DropDownListStyle = lsFixedList;
end;

function TcxCustomComboBoxProperties.GetDropDownPageRowCount: Integer;
begin
  Result := DropDownRows;
end;

function TcxCustomComboBoxProperties.GetEditingStyle: TcxEditEditingStyle;
const
  AEditingStyleMap: array[TcxEditDropDownListStyle] of TcxEditEditingStyle =
    (esEditList, esEdit, esFixedList);
begin
  Result := AEditingStyleMap[DropDownListStyle];
end;

class function TcxCustomComboBoxProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxComboBoxPopupWindow;
end;

class function TcxCustomComboBoxProperties.GetViewDataClass: TcxCustomEditViewDataClass;
begin
  Result := TcxCustomComboBoxViewData;
end;

function TcxCustomComboBoxProperties.UseLookupData: Boolean;
begin
  Result := True;
end;

function TcxCustomComboBoxProperties.GetDropDownAutoWidth: Boolean;
begin
  Result := PopupAutoSize;
end;

function TcxCustomComboBoxProperties.GetDropDownSizeable: Boolean;
begin
  Result := PopupSizeable;
end;

function TcxCustomComboBoxProperties.GetDropDownWidth: Integer;
begin
  Result := PopupWidth;
end;

function TcxCustomComboBoxProperties.GetItems: TStrings;
begin
  Result := LookupItems;
end;

function TcxCustomComboBoxProperties.GetSorted: Boolean;
begin
  Result := LookupItemsSorted;
end;

procedure TcxCustomComboBoxProperties.SetDropDownAutoWidth(Value: Boolean);
begin
  PopupAutoSize := Value;
end;

procedure TcxCustomComboBoxProperties.SetDropDownListStyle(Value: TcxEditDropDownListStyle);
begin
  if Value = FDropDownListStyle then
    Exit;
  FDropDownListStyle := Value;
  Changed;
end;

procedure TcxCustomComboBoxProperties.SetDropDownRows(Value: Integer);
begin
  if (Value >= 1) and (Value <> FDropDownRows) then
  begin
    FDropDownRows := Value;
    Changed;
  end;
end;

procedure TcxCustomComboBoxProperties.SetDropDownSizeable(Value: Boolean);
begin
  PopupSizeable := Value;
end;

procedure TcxCustomComboBoxProperties.SetDropDownWidth(Value: Integer);
begin
  PopupWidth := Value;
end;

procedure TcxCustomComboBoxProperties.SetItemHeight(Value: Integer);
begin
  if Value <> FItemHeight then
  begin
    FItemHeight := Value;
    Changed;
  end;
end;

procedure TcxCustomComboBoxProperties.SetItems(Value: TStrings);
begin
  LookupItems := Value;
end;

procedure TcxCustomComboBoxProperties.SetSorted(Value: Boolean);
begin
  LookupItemsSorted := Value;
end;

{ TcxCustomComboBoxInnerEdit }

{$IFNDEF VCL}
function TcxCustomComboBoxInnerEdit.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if QEvent_type(Event) = QEventType_MouseButtonRelease then
  begin
    if ButtonStateToMouseButton(QMouseEvent_button(QMouseEventH(Event))) = mbLeft then
      ControlState := ControlState - [csClicked];
  end;
  Result := inherited EventFilter(Sender, Event);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomComboBoxInnerEdit.WMLButtonUp(var Message: TWMLButtonUp);
begin
  ControlState := ControlState - [csClicked];
  inherited;
end;
{$ENDIF}

{ TcxCustomComboBox }

constructor TcxCustomComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csClickEvents];
end;

procedure TcxCustomComboBox.Activate(var AEditData: TcxCustomEditData);
begin
  inherited Activate(AEditData);
  SynchronizeItemIndex;
end;

class function TcxCustomComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxComboBoxProperties;
end;

function TcxCustomComboBox.CanDropDown: Boolean;
begin
  with Properties do
    Result := not((ILookupData <> nil) and (ILookupData.IsEmpty)); // TODO ???
end;

procedure TcxCustomComboBox.ChangeHandler(Sender: TObject);
var
  APrevLookupKey: TcxEditValue;
begin
  APrevLookupKey := ILookupData.CurrentKey;
  LockClick(True);
  try
    inherited ChangeHandler(Sender);
    if not FLookupDataTextChangedLocked and (HasPopupWindow or
        (Properties.EditingStyle in [esEditList, esFixedList])) then
      ILookupData.TextChanged;
  finally
    LockClick(False);
    if (*ModifiedAfterEnter and *)not VarEqualsExact(APrevLookupKey, ILookupData.CurrentKey) then
      DoClick;
  end;
end;

procedure TcxCustomComboBox.DblClick;
var
  APrevCurrentKey: TcxEditValue;
begin
  inherited DblClick;
  LockChangeEvents(True);
  try
    if not HasPopupWindow and Properties.Revertable then
      with ILookupData do
      begin
        APrevCurrentKey := CurrentKey;
        Go(egdNext, True);
        if not VarEqualsExact(APrevCurrentKey, ILookupData.CurrentKey) and
          AutoPostEditValue and Properties.ImmediatePost and ValidateEdit(True) then
        begin
          LookupItemsScrolling := True;
          try
            PostEditValue;
          finally
            LookupItemsScrolling := False;
          end;
        end;
      end;
  finally
    LockChangeEvents(False);
  end;
end;

function TcxCustomComboBox.GetInnerEditClass: TControlClass;
begin
  Result := TcxCustomComboBoxInnerEdit;
end;

function TcxCustomComboBox.GetPopupWindowClientPreferredSize: TSize;
var
  AClientExtent: TRect;
  AEditBounds: TRect;
  RTop, RBottom: TRect;
  HTop, HBottom: Integer;
  AMaxHeight, AWidth: Integer;
begin
  AClientExtent := PopupWindow.ViewInfo.GetClientExtent;

  AEditBounds := GetPopupWindowOwnerControlBounds;
  AEditBounds.TopLeft := Parent.ClientToScreen(AEditBounds.TopLeft);
  AEditBounds.BottomRight := Parent.ClientToScreen(AEditBounds.BottomRight);

  RTop := GetDesktopWorkArea(AEditBounds.TopLeft);
  HTop := AEditBounds.Top - RTop.Top - AClientExtent.Top - AClientExtent.Bottom;
  if PopupWindow.ViewInfo.Shadow then
    Inc(HTop, cxEditShadowWidth);

  RBottom := GetDesktopWorkArea(Point(AEditBounds.Bottom, AEditBounds.Left));
  HBottom := RBottom.Bottom - AEditBounds.Bottom - AClientExtent.Top - AClientExtent.Bottom;

  AMaxHeight := HTop;
  if HBottom > HTop then
    AMaxHeight := HBottom;

  with Properties do
    if not PopupSizeable and not PopupAutoSize then
      if PopupWidth > 0 then
        AWidth := PopupWidth - (AClientExtent.Left + AClientExtent.Right)
      else
        AWidth := AEditBounds.Right - AEditBounds.Left - (AClientExtent.Left + AClientExtent.Right)
    else
      AWidth := 0;
  Result := ILookupData.GetVisualAreaPreferredSize(AMaxHeight, AWidth);
end;

procedure TcxCustomComboBox.InitializePopupWindow;
begin
  inherited InitializePopupWindow;
  PopupWindow.SysPanelStyle := Properties.PopupSizeable;
end;

procedure TcxCustomComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  AActiveControl: TControl;
  AMousePos: {$IFDEF VCL}TSmallPoint{$ELSE}TPoint{$ENDIF};
  P: TPoint;
{$IFNDEF VCL}
  AMouseEvent: QMouseEventH;
{$ENDIF}
begin
  inherited MouseMove(Shift, X, Y);
  AActiveControl := ILookupData.ActiveControl;
  if (GetCaptureControl = Self) and (AActiveControl is TWinControl) then
    with AActiveControl as TWinControl do
    begin
      P := InternalGetCursorPos;
      if HasPopupWindow and PtInRect(PopupWindow.ViewInfo.ClientRect,
        PopupWindow.ScreenToClient(P)) and ILookupData.IsMouseOverList(P) then
      begin
{$IFDEF VCL}
        AMousePos := PointToSmallPoint(ScreenToClient(P));
        SendMessage(Handle, WM_LBUTTONDOWN, 0, Integer(AMousePos))
{$ELSE}
        AMousePos := ScreenToClient(P);
        AMouseEvent := QMouseEvent_create(QEventType_MouseButtonPress, @AMousePos,
          Integer(ButtonState_LeftButton), Integer(ButtonState_LeftButton));
  {$IFDEF WIN32}
        QApplication_postEvent(Handle, AMouseEvent); // TODO
  {$ELSE}
        SetCaptureControl(AActiveControl);
        QWidget_grabMouse(Handle);
        QOpenWidget_mousePressEvent(QOpenWidgetH(Handle), AMouseEvent);
  {$ENDIF}
{$ENDIF}
      end;
    end;
end;

procedure TcxCustomComboBox.PopupWindowShowed(Sender: TObject);
var
  P: TPoint;
begin
  inherited PopupWindowShowed(Sender);
  with ILookupData do
    if ActiveControl is TWinControl then
    begin
      P := InternalGetCursorPos;
      if IsMouseOverList(P) then
        FPopupMouseMoveLocked := True;
    end;
end;

{$IFNDEF VCL}
function TcxCustomComboBox.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  if QEvent_type(Event) = QEventType_MouseButtonRelease then
  begin
    if ButtonStateToMouseButton(QMouseEvent_button(QMouseEventH(Event))) = mbLeft then
      ControlState := ControlState - [csClicked];
  end;
  Result := inherited EventFilter(Sender, Event);
end;
{$ENDIF}

procedure TcxCustomComboBox.ResetPopupHeight;
begin
  if Properties.PopupSizeable and IsInplace then
  begin
    if EditData <> nil then
      TcxCustomDropDownEditData(EditData).Height := 0
  end
  else
    Properties.PopupHeight := 0;
end;

procedure TcxCustomComboBox.SynchronizeItemIndex;
begin
  if Properties.UseLookupData then
    ILookupData.TextChanged;
end;

function TcxCustomComboBox.GetProperties: TcxComboBoxProperties;
begin
  Result := TcxComboBoxProperties(InternalGetProperties);
end;

type
  TcxCustomTextEditLookupDataAccess = class(TcxCustomTextEditLookupData);

function TcxCustomComboBox.GetItemIndex: Integer;
begin
  Result := LookupData.CurrentKey;
end;

function TcxCustomComboBox.GetLookupData: TcxComboBoxLookupData;
begin
  Result := TcxComboBoxLookupData(FLookupData);
end;

procedure TcxCustomComboBox.SetItemIndex(Value: Integer);
var
  APrevItemIndex: Integer;
begin
  APrevItemIndex := ItemIndex;
  LockClick(True);
  try
    LookupData.CurrentKey := Value;
  finally
    LockClick(False);
  end;
  if ItemIndex <> APrevItemIndex then
  begin
    EditModified := False;
    Click;
  end;
end;

procedure TcxCustomComboBox.SetProperties(Value: TcxComboBoxProperties);
begin
  FProperties.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxCustomComboBox.WMLButtonUp(var Message: TWMLButtonUp);
begin
  ControlState := ControlState - [csClicked];
  inherited;
end;
{$ENDIF}

{ TcxPopupEditPopupWindowViewInfo }

procedure TcxPopupEditPopupWindowViewInfo.DrawBorder(ACanvas: TcxCanvas; var R: TRect);
begin
  DrawPopupEditPopupWindowBorder(ACanvas, Self, R);
end;

{ TcxPopupEditPopupWindow }

class function TcxPopupEditPopupWindow.GetViewInfoClass: TcxContainerViewInfoClass;
begin
  Result := TcxPopupEditPopupWindowViewInfo;
end;

{ TcxCustomPopupEditProperties }

constructor TcxCustomPopupEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  FPopupAutoSize := True;
  FPopupHeight := 200;
  FPopupMinHeight := 100;
  FPopupMinWidth := 100;
  FPopupSizeable := True;
  FPopupWidth := 250;
end;

procedure TcxCustomPopupEditProperties.Assign(Source: TPersistent);
begin
  if Source is TcxCustomPopupEditProperties then
  begin
    BeginUpdate;
    try
      inherited Assign(Source);
      with Source as TcxCustomPopupEditProperties do
        Self.PopupControl := PopupControl;
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

class function TcxCustomPopupEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := TcxPopupEdit;
end;

class function TcxCustomPopupEditProperties.GetLookupDataClass: TcxInterfacedPersistentClass;
begin
  Result := inherited GetLookupDataClass; // TODO
end;

procedure TcxCustomPopupEditProperties.FreeNotification(Sender: TComponent);
begin
  inherited FreeNotification(Sender);
  if Sender = FPopupControl then
    FPopupControl := nil;
end;

class function TcxCustomPopupEditProperties.GetPopupWindowClass: TcxCustomEditPopupWindowClass;
begin
  Result := TcxPopupEditPopupWindow;
end;

function TcxCustomPopupEditProperties.IsLookupDataVisual: Boolean;
begin
  Result := False;
end;

function TcxCustomPopupEditProperties.PopupWindowCapturesFocus: Boolean;
begin
  Result := True;
end;

procedure TcxCustomPopupEditProperties.SetPopupControl(Value: TControl);
begin
  if Value = FPopupControl then
    Exit;
  if FPopupControl <> nil then
    FreeNotificator.RemoveSender(Value);
  FPopupControl := Value;
  if FPopupControl <> nil then
    FreeNotificator.AddSender(Value);
end;

{ TcxPopupEditProperties }

constructor TcxPopupEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  ImmediateDropDown := True;
  ImmediatePopup := True;
end;

{ TcxCustomPopupEdit }

destructor TcxCustomPopupEdit.Destroy;
begin
  if (FPopupWindow <> nil) and FPopupWindow.IsVisible then
    RestorePopupControlData;
  inherited Destroy;
end;

class function TcxCustomPopupEdit.GetPropertiesClass: TcxCustomEditPropertiesClass; 
begin
  Result := TcxPopupEditProperties;
end;

function TcxCustomPopupEdit.CanDropDown: Boolean;
begin
  with Properties do
    Result := PopupControl <> nil;
end;

procedure TcxCustomPopupEdit.DoInitPopup;

  function ControlHasAsParent(AControl: TControl): Boolean;
  var
    AParent: TControl;
  begin
    Result := AControl = PopupWindow;
    AParent := PopupWindow.OwnerControl;
    while AParent <> nil do
    begin
      if AParent = AControl then
      begin
        Result := True;
        Break;
      end;
      AParent := AParent.Parent;
    end;
  end;

begin
  if ControlHasAsParent(Properties.FPopupControl) then
    raise Exception.Create(cxGetResourceString(@cxSEditPopupCircularReferencingError));
  inherited DoInitPopup;
end;

function TcxCustomPopupEdit.GetPopupFocusedControl: TWinControl;
begin
  with Properties do
    if PopupControl is TWinControl then
      Result := TWinControl(PopupControl)
    else
      Result := nil;
end;

function TcxCustomPopupEdit.GetPopupWindowClientPreferredSize: TSize;
begin
  with Properties.PopupControl do
    Result := Size(Width, Height);
end;

procedure TcxCustomPopupEdit.PopupWindowClosed(Sender: TObject);
begin
  RestorePopupControlData;
  inherited PopupWindowClosed(Sender);
end;

procedure TcxCustomPopupEdit.PositionPopupWindowChilds(const AClientRect: TRect);
begin
  with AClientRect do
  begin
    Properties.PopupControl.Left := Left;
    Properties.PopupControl.Top := Top;
    Properties.PopupControl.Width := Right - Left;
    Properties.PopupControl.Height := Bottom - Top;
  end;
end;

procedure TcxCustomPopupEdit.SetupPopupWindow;
begin
  with Properties.PopupControl do
  begin
    SavePopupControlData;
    Parent := PopupWindow;
    Visible := True;
    inherited SetupPopupWindow;
    Align := alClient; // TODO
  end;
end;

procedure TcxCustomPopupEdit.RestorePopupControlData;
begin
  with Properties.PopupControl do
  begin
{$IFNDEF VCL}
    if QWidget_keyboardGrabber <> nil then
      QWidget_releaseKeyboard(QWidget_keyboardGrabber); // TODO
{$ENDIF}
    Visible := False;
    Parent := FPrevPopupControlData.Parent;
    Align := FPrevPopupControlData.Align;
    BoundsRect := FPrevPopupControlData.Bounds;
    Visible := FPrevPopupControlData.Visible;
  end;
end;

type
  TcxCustomFormAccess = class(TCustomForm);

procedure TcxCustomPopupEdit.SavePopupControlData;
var
  APopupControl: TControl;
begin
  APopupControl := Properties.PopupControl;
  with APopupControl do
  begin
    FPrevPopupControlData.Align := Align;
    if APopupControl is TCustomForm then
    begin
      FPrevPopupControlData.BorderStyle := TcxCustomFormAccess(APopupControl).BorderStyle;
      TcxCustomFormAccess(APopupControl).BorderStyle := {$IFDEF VCL}bsNone{$ELSE}fbsNone{$ENDIF};
    end;
    FPrevPopupControlData.Bounds := BoundsRect;
    FPrevPopupControlData.Parent := Parent;
    FPrevPopupControlData.Visible := Visible;
  end;
end;

function TcxCustomPopupEdit.GetProperties: TcxPopupEditProperties;
begin
  Result := TcxPopupEditProperties(InternalGetProperties);
end;

procedure TcxCustomPopupEdit.SetProperties(Value: TcxPopupEditProperties);
begin
  FProperties.Assign(Value);
end;

initialization
  GetRegisteredEditProperties.Register(TcxComboBoxProperties, scxSEditRepositoryComboBoxItem);
  GetRegisteredEditProperties.Register(TcxPopupEditProperties, scxSEditRepositoryPopupItem);

end.
