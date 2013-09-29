
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressCommonLibrary                                         }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSCOMMONLIBRARY AND ALL          }
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

unit cxListView;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Qt, Types,
{$ENDIF}
  Classes, Controls, Forms, Menus, StdCtrls, SysUtils, ComCtrls, CommCtrl,
  ImgList, cxClasses, cxControls, cxContainer, cxExtEditConsts, cxGraphics,
  cxLookAndFeels, cxScrollBar;

type
  TcxCustomListView = class;

  { TcxIconOptions }
  TcxIconOptions = class(TPersistent)
  private
    FArrangement: TIconArrangement;
    FAutoArrange: Boolean;
    FWrapText: Boolean;
    FArrangementChange: TNotifyEvent;
    FAutoArrangeChange: TNotifyEvent;
    FWrapTextChange: TNotifyEvent;
    procedure SetArrangement(Value: TIconArrangement);
    procedure SetAutoArrange(Value: Boolean);
    procedure SetWrapText(Value: Boolean);
  public
    constructor Create(AOwner: TPersistent);
  published
    property Arrangement: TIconArrangement read FArrangement write SetArrangement default iaTop;
    property AutoArrange: Boolean read FAutoArrange write SetAutoArrange default False;
    property WrapText: Boolean read FWrapText write SetWrapText default True;
  end;

  { TcxCustomInnerListView }
  TcxCustomInnerListView = class(TListView)
  private
    FOldItem: TListItem;
    FOldHint: string;
    FCanvas: TcxCanvas;
    FHScrollBar: TcxScrollBar;
    FLookAndFeel: TcxLookAndFeel;
    FVScrollBar: TcxScrollBar;
{$IFDEF VCL}
    FScrollBarsCalculating: Boolean;
    FScrollBarsLockCount: Integer;
{$ENDIF}
    procedure CreateScrollBars;
    procedure HScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
    procedure VScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
{$IFNDEF DELPHI6}
    function GetScrollWidth: Integer;
    procedure SetScrollWidth(const Value: Integer);
{$ENDIF}
{$IFDEF VCL}
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMHintShow(var Message: TMessage); message CM_HINTSHOW;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
{$ENDIF}
    function GetContainer: TcxCustomListView;
{$IFDEF VCL}
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
{$ENDIF}
  protected
    FContainer: TcxCustomListView;
    procedure Click; override;
    procedure DblClick; override;
    procedure Loaded; override;
    function CanEdit(Item: TListItem): Boolean; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean; override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    function GetPopupMenu: TPopupMenu; override;
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
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
{$IFDEF VCL}
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
    procedure DoCancelEdit; virtual;
    function GetSizeGripRect: TRect;
    procedure LockScrollBarsUpdate(ALock: Boolean);
    procedure SetScrollBarsParameters;
{$ELSE}
    function EventFilter(Sender: QObjectH; Event: QEventH): Boolean; override;
{$ENDIF}
    property Container: TcxCustomListView read GetContainer;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DragDrop(Source: TObject; X, Y: Integer); override;
    property Canvas: TcxCanvas read FCanvas;
    property HScrollBar: TcxScrollBar read FHScrollBar;
    property VScrollBar: TcxScrollBar read FVScrollBar;
{$IFNDEF DELPHI6}
    property ScrollWidth: Integer read GetScrollWidth write SetScrollWidth default 0;
{$ENDIF}
{$IFDEF DELPHI5}
    function CanFocus: Boolean; override;
{$ENDIF}
{$IFDEF DELPHI6}
    procedure DeleteSelected; override;
{$ENDIF}
  end;

  TcxCustomInnerListViewClass = class of TcxCustomInnerListView;
  { TcxCustomListView }
  TcxCustomListView = class(TcxContainer)
  private
    FListView: TcxCustomInnerListView;
    FIconOptions: TcxIconOptions;
    FOnCancelEdit: TNotifyEvent;
    FOwnerDraw: Boolean;
    function GetReadOnly: Boolean;
    function GetListItems: TListItems;
    function GetListColumns: TListColumns;
    function GetListViewCanvas: TcxCanvas;
    function GetColumnClick: Boolean;
    function GetHideSelection: Boolean;
    function GetIconOptions: TcxIconOptions;
    function GetAllocBy: Integer;
{$IFDEF DELPHI5}
    function GetHoverTime: Integer;
{$ENDIF}
    function GetLargeImages: TCustomImageList;
    function GetMultiSelect: Boolean;
    function GetOwnerData: Boolean;
    function GetOwnerDraw: Boolean;
{$IFDEF DELPHI5}
    function GetOnAdvancedCustomDraw: TLVAdvancedCustomDrawEvent;
    function GetOnAdvancedCustomDrawItem: TLVAdvancedCustomDrawItemEvent;
    function GetOnAdvancedCustomDrawSubItem: TLVAdvancedCustomDrawSubItemEvent;
{$ENDIF}
    function GetOnChange: TLVChangeEvent;
    function GetOnChanging: TLVChangingEvent;
    function GetOnColumnClick: TLVColumnClickEvent;
{$IFDEF DELPHI5}
    function GetOnColumnDragged: TNotifyEvent;
    function GetOnColumnRightClick: TLVColumnRClickEvent;
{$ENDIF}
    function GetOnCompare: TLVCompareEvent;
    function GetOnCustomDraw: TLVCustomDrawEvent;
    function GetOnCustomDrawItem: TLVCustomDrawItemEvent;
    function GetOnCustomDrawSubItem: TLVCustomDrawSubItemEvent;
    function GetOnData: TLVOwnerDataEvent;
    function GetOnDataFind: TLVOwnerDataFindEvent;
    function GetOnDataHint: TLVOwnerDataHintEvent;
    function GetOnDataStateChange: TLVOwnerDataStateChangeEvent;
    function GetOnDeletion: TLVDeletedEvent;
    function GetOnDrawItem: TLVDrawItemEvent;
    function GetOnEdited: TLVEditedEvent;
    function GetOnEditing: TLVEditingEvent;
{$IFDEF DELPHI5}
    function GetOnInfoTip: TLVInfoTipEvent;
{$ENDIF}
    function GetOnInsert: TLVDeletedEvent;
    function GetOnGetImageIndex: TLVNotifyEvent;
{$IFDEF DELPHI5}
    function GetOnGetSubItemImage: TLVSubItemImageEvent;
    function GetShowWorkAreas: Boolean;
{$ENDIF}
    function GetOnSelectItem: TLVSelectItemEvent;
    function GetShowColumnHeaders: Boolean;
    function GetSmallImages: TCustomImageList;
    function GetSortType: TSortType;
    function GetStateImages: TCustomImageList;
    function GetViewStyle: TViewStyle;
{$IFDEF DELPHI6}
    function GetOnCreateItemClass: TLVCreateItemClassEvent;
{$ENDIF}
    procedure SetReadOnly(Value: Boolean);
    procedure SetListItems(Value: TListItems);
    procedure SetListColumns(Value: TListColumns);
    procedure SetColumnClick(Value: Boolean);
    procedure SetHideSelection(Value: Boolean);
    procedure SetIconOptions(Value: TcxIconOptions);
    procedure SetAllocBy(Value: Integer);
{$IFDEF DELPHI5}
    procedure SetHoverTime(Value: Integer);
{$ENDIF}
    procedure SetLargeImages(Value: TCustomImageList);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetOwnerData(Value: Boolean);
    procedure SetOwnerDraw(Value: Boolean);
{$IFDEF DELPHI5}
    procedure SetOnAdvancedCustomDraw(Value: TLVAdvancedCustomDrawEvent);
    procedure SetOnAdvancedCustomDrawItem(Value: TLVAdvancedCustomDrawItemEvent);
    procedure SetOnAdvancedCustomDrawSubItem(Value: TLVAdvancedCustomDrawSubItemEvent);
{$ENDIF}    
    procedure SetOnChange(Value: TLVChangeEvent);
    procedure SetOnChanging(Value: TLVChangingEvent);
    procedure SetOnColumnClick(Value: TLVColumnClickEvent);
{$IFDEF DELPHI5}
    procedure SetOnColumnDragged(Value: TNotifyEvent);
    procedure SetOnColumnRightClick(Value: TLVColumnRClickEvent);
{$ENDIF}    
    procedure SetOnCompare(Value: TLVCompareEvent);
    procedure SetOnCustomDraw(Value: TLVCustomDrawEvent);
    procedure SetOnCustomDrawItem(Value: TLVCustomDrawItemEvent);
    procedure SetOnCustomDrawSubItem(Value: TLVCustomDrawSubItemEvent);
    procedure SetOnData(Value: TLVOwnerDataEvent);
    procedure SetOnDataFind(Value: TLVOwnerDataFindEvent);
    procedure SetOnDataHint(Value: TLVOwnerDataHintEvent);
    procedure SetOnDataStateChange(Value: TLVOwnerDataStateChangeEvent);
    procedure SetOnDeletion(Value: TLVDeletedEvent);
    procedure SetOnDrawItem(Value: TLVDrawItemEvent);
    procedure SetOnEdited(Value: TLVEditedEvent);
    procedure SetOnEditing(Value: TLVEditingEvent);
{$IFDEF DELPHI5}
    procedure SetOnInfoTip(Value: TLVInfoTipEvent);
{$ENDIF}
    procedure SetOnInsert(Value: TLVDeletedEvent);
    procedure SetOnGetImageIndex(Value: TLVNotifyEvent);
{$IFDEF DELPHI5}
    procedure SetOnGetSubItemImage(Value: TLVSubItemImageEvent);
    procedure SetShowWorkAreas(Value: Boolean);
{$ENDIF}    
    procedure SetOnSelectItem(Value: TLVSelectItemEvent);
    procedure SetShowColumnHeaders(Value: Boolean);
    procedure SetSmallImages(Value: TCustomImageList);
    procedure SetSortType(Value: TSortType);
    procedure SetStateImages(Value: TCustomImageList);
{$IFDEF DELPHI6}
    procedure SetOnCreateItemClass(Value: TLVCreateItemClassEvent);
{$ENDIF}
    function GetCheckBoxes: Boolean;
    function GetColumnFromIndex(Index: Integer): TListColumn;
    function GetDropTarget: TListItem;
    function GetFullDrag: Boolean;
    function GetGridLines: Boolean;
    function GetHotTrack: Boolean;
    function GetHotTrackStyles: TListHotTrackStyles;
    function GetItemFocused: TListItem;
    function GetRowSelect: Boolean;
    function GetSelected: TListItem;
    function GetTopItem: TListItem;
    function GetViewOrigin: TPoint;
    function GetVisibleRowCount: Integer;
    function GetBoundingRect: TRect;
{$IFDEF DELPHI5}
    function GetWorkAreas: TWorkAreas;
{$ENDIF}    
    procedure SetCheckboxes(Value: Boolean);
    procedure SetDropTarget(Value: TListItem);
    procedure SetFullDrag(Value: Boolean);
    procedure SetGridLines(Value: Boolean);
    procedure SetHotTrack(Value: Boolean);
    procedure SetHotTrackStyles(Value: TListHotTrackStyles);
    procedure SetItemFocused(Value: TListItem);
    procedure SetRowSelect(Value: Boolean);
    procedure SetSelected(Value: TListItem);
    procedure ArrangementChangeHandler(Sender: TObject);
    procedure AutoArrangeChangeHandler(Sender: TObject);
    procedure WrapTextChangeHandler(Sender: TObject);
    procedure UpdateIconOptions;
  protected
    procedure AdjustInnerControl; override;
    procedure DoExit; override;
    procedure FontChanged; override;
    procedure ContainerStyleChanged(Sender: TObject); override;
    class function GetStyleClass: TcxContainerStyleClass; override;
    function IsInternalControl(AControl: TControl): Boolean; override;
    function RefreshContainer(const P: TPoint; Button: TcxMouseButton; Shift: TShiftState;
      AIsMouseEvent: Boolean): Boolean; override;
    function CanResize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure SetSize; override;
{$IFDEF VCL}
    procedure WndProc(var Message: TMessage); override;
{$ENDIF}

    function GetInnerListView: TcxCustomInnerListView; virtual;
    procedure SetInnerListView(const Value: TcxCustomInnerListView); virtual;
    class function GetListViewClass: TcxCustomInnerListViewClass; virtual;
    procedure InternalInitListView; virtual;

    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    function CanChange(Item: TListItem; Change: Integer): Boolean; dynamic;
    function CanEdit(Item: TListItem): Boolean; dynamic;
    procedure Change(Item: TListItem; Change: Integer); dynamic;
    procedure ChangeScale(M, D: Integer); override;
    procedure ColClick(Column: TListColumn); dynamic;
{$IFDEF DELPHI5}
    procedure ColRightClick(Column: TListColumn; Point: TPoint); dynamic;
{$ENDIF}
    function ColumnsShowing: Boolean;
    function CreateListItem: TListItem; virtual;
{$IFDEF DELPHI6}
    function CreateListItems: TListItems; virtual;
{$ENDIF}
    function CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean; virtual;
    function CustomDrawItem(Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage): Boolean; virtual;
    function CustomDrawSubItem(Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage): Boolean; virtual;
    procedure Delete(Item: TListItem); dynamic;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;
{$IFDEF DELPHI5}
    procedure DoInfoTip(Item: TListItem; var InfoTip: string); virtual;
{$ENDIF}
    procedure DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState); virtual;
    procedure Edit(const Item: TLVItem); dynamic;
    function OwnerDataFetch(Item: TListItem; Request: TItemRequest): Boolean; virtual;
    function OwnerDataFind(Find: TItemFind; const FindString: string;
      const FindPosition: TPoint; FindData: Pointer; StartIndex: Integer;
      Direction: TSearchDirection; Wrap: Boolean): Integer; virtual;
    function OwnerDataHint(StartIndex, EndIndex: Integer): Boolean; virtual;
    function OwnerDataStateChange(StartIndex, EndIndex: Integer; OldState,
      NewState: TItemStates): Boolean; virtual;
    function GetActionLinkClass: TControlActionLinkClass; override;
    function GetCount: Integer; virtual;
    function GetDragImages: TDragImageList; override;
{$IFDEF DELPHI6}
    function GetItemIndex: Integer; reintroduce; overload;
    function GetListViewItemIndex: Integer;
    function GetSelCount: Integer; virtual;
    procedure SetItemIndex(const Value: Integer); virtual;
{$ENDIF}
    function GetItemIndex(Value: TListItem): Integer; reintroduce; overload;
    procedure InsertItem(Item: TListItem); dynamic;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; virtual;
    procedure SetViewStyle(Value: TViewStyle); virtual;
    procedure UpdateColumn(AnIndex: Integer);
    procedure UpdateColumns;

    property Columns: TListColumns read GetListColumns write SetListColumns;
    property ColumnClick: Boolean read GetColumnClick write SetColumnClick default True;
    property HideSelection: Boolean read GetHideSelection write SetHideSelection default True;
    property IconOptions: TcxIconOptions read GetIconOptions write SetIconOptions;
    property Items: TListItems read GetListItems write SetListItems;
    property AllocBy: Integer read GetAllocBy write SetAllocBy default 0;
{$IFDEF DELPHI5}
    property HoverTime: Integer read GetHoverTime write SetHoverTime default -1;
{$ENDIF}
    property ListViewCanvas: TcxCanvas read GetListViewCanvas;
    property LargeImages: TCustomImageList read GetLargeImages write SetLargeImages;
    property MultiSelect: Boolean read GetMultiSelect write SetMultiSelect default False;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property OwnerData: Boolean read GetOwnerData write SetOwnerData default False;
    property OwnerDraw: Boolean read GetOwnerDraw write SetOwnerDraw default False;
    property RowSelect: Boolean read GetRowSelect write SetRowSelect default False;
    property ShowColumnHeaders: Boolean read GetShowColumnHeaders
      write SetShowColumnHeaders default True;
{$IFDEF DELPHI5}
    property ShowWorkAreas: Boolean read GetShowWorkAreas write SetShowWorkAreas default False;
{$ENDIF}
    property SmallImages: TCustomImageList read GetSmallImages write SetSmallImages;
    property SortType: TSortType read GetSortType write SetSortType default stNone;
    property StateImages: TCustomImageList read GetStateImages write SetStateImages;
    property ViewStyle: TViewStyle read GetViewStyle write SetViewStyle default vsIcon;
{$IFDEF DELPHI5}
    property OnAdvancedCustomDraw: TLVAdvancedCustomDrawEvent read GetOnAdvancedCustomDraw
      write SetOnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem: TLVAdvancedCustomDrawItemEvent
      read GetOnAdvancedCustomDrawItem write SetOnAdvancedCustomDrawItem;
    property OnAdvancedCustomDrawSubItem: TLVAdvancedCustomDrawSubItemEvent
      read GetOnAdvancedCustomDrawSubItem write SetOnAdvancedCustomDrawSubItem;
{$ENDIF}
    property OnCancelEdit: TNotifyEvent read FOnCancelEdit write FOnCancelEdit;
    property OnChange: TLVChangeEvent read GetOnChange write SetOnChange;
    property OnChanging: TLVChangingEvent read GetOnChanging write SetOnChanging;
    property OnColumnClick: TLVColumnClickEvent read GetOnColumnClick write SetOnColumnClick;
{$IFDEF DELPHI5}
    property OnColumnDragged: TNotifyEvent read GetOnColumnDragged write SetOnColumnDragged;
    property OnColumnRightClick: TLVColumnRClickEvent read GetOnColumnRightClick
      write SetOnColumnRightClick;
{$ENDIF}
    property OnCompare: TLVCompareEvent read GetOnCompare write SetOnCompare;
    property OnCustomDraw: TLVCustomDrawEvent read GetOnCustomDraw write SetOnCustomDraw;
    property OnCustomDrawItem: TLVCustomDrawItemEvent read GetOnCustomDrawItem
      write SetOnCustomDrawItem;
    property OnCustomDrawSubItem: TLVCustomDrawSubItemEvent read GetOnCustomDrawSubItem
      write SetOnCustomDrawSubItem;
    property OnData: TLVOwnerDataEvent read GetOnData write SetOnData;
    property OnDataFind: TLVOwnerDataFindEvent read GetOnDataFind write SetOnDataFind;
    property OnDataHint: TLVOwnerDataHintEvent read GetOnDataHint write SetOnDataHint;
    property OnDataStateChange: TLVOwnerDataStateChangeEvent read GetOnDataStateChange
      write SetOnDataStateChange;
    property OnDeletion: TLVDeletedEvent read GetOnDeletion write SetOnDeletion;
    property OnDrawItem: TLVDrawItemEvent read GetOnDrawItem write SetOnDrawItem;
    property OnEdited: TLVEditedEvent read GetOnEdited write SetOnEdited;
    property OnEditing: TLVEditingEvent read GetOnEditing write SetOnEditing;
{$IFDEF DELPHI5}
    property OnInfoTip: TLVInfoTipEvent read GetOnInfoTip write SetOnInfoTip;
{$ENDIF}
    property OnInsert: TLVDeletedEvent read GetOnInsert write SetOnInsert;
    property OnGetImageIndex: TLVNotifyEvent read GetOnGetImageIndex write SetOnGetImageIndex;
{$IFDEF DELPHI5}
    property OnGetSubItemImage: TLVSubItemImageEvent read GetOnGetSubItemImage
      write SetOnGetSubItemImage;
{$ENDIF}
    property OnSelectItem: TLVSelectItemEvent read GetOnSelectItem write SetOnSelectItem;
{$IFDEF DELPHI6}
    property OnCreateItemClass: TLVCreateItemClassEvent read GetOnCreateItemClass
      write SetOnCreateItemClass;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    property InnerListView: TcxCustomInnerListView read GetInnerListView write SetInnerListView;
{$IFNDEF VCL}
    procedure MakeCurrentVisible;
    procedure Sort;
    function VisibleItemCount: Integer;
{$ENDIF}
    function AlphaSort: Boolean;
    procedure Arrange(Code: TListArrangement);
    procedure Clear;
{$IFDEF DELPHI6}
    procedure ClearSelection;
    procedure AddItem(Item: string; AObject: TObject);
    procedure CopySelection(Destination: TCustomListControl);
    procedure DeleteSelected;
    procedure SelectAll;
{$ENDIF}
    function FindCaption(StartIndex: Integer; Value: string;
      Partial, Inclusive, Wrap: Boolean): TListItem;
    function FindData(StartIndex: Integer; Value: Pointer;
      Inclusive, Wrap: Boolean): TListItem;
    function GetHitTestInfoAt(X, Y: Integer): THitTests;
    function GetItemAt(X, Y: Integer): TListItem;
    function GetNearestItem(Point: TPoint;
      Direction: TSearchDirection): TListItem;
    function GetNextItem(StartItem: TListItem;
      Direction: TSearchDirection; States: TItemStates): TListItem;
    function GetSearchString: string;
    function IsEditing: Boolean;
    function CustomSort(SortProc: TLVCompare; lParam: Longint): Boolean;
    function StringWidth(S: string): Integer;
    procedure UpdateItems(FirstIndex, LastIndex: Integer);

    property Checkboxes: Boolean read GetCheckBoxes write SetCheckboxes default False;
    property Column[Index: Integer]: TListColumn read GetColumnFromIndex;
    property DropTarget: TListItem read GetDropTarget write SetDropTarget;
    property FullDrag: Boolean read GetFullDrag write SetFullDrag default False;
    property GridLines: Boolean read GetGridLines write SetGridLines default False;
    property HotTrack: Boolean read GetHotTrack write SetHotTrack default False;
    property HotTrackStyles: TListHotTrackStyles read GetHotTrackStyles write SetHotTrackStyles default [];
    property ItemFocused: TListItem read GetItemFocused write SetItemFocused;
{$IFDEF DELPHI6}
    property ItemIndex: Integer read GetListViewItemIndex write SetItemIndex;
    property SelCount: Integer read GetSelCount;
{$ENDIF}
    property Selected: TListItem read GetSelected write SetSelected;
    property TopItem: TListItem read GetTopItem;
    property ViewOrigin: TPoint read GetViewOrigin;
    property VisibleRowCount: Integer read GetVisibleRowCount;
    property BoundingRect: TRect read GetBoundingRect;
{$IFDEF DELPHI5}
    property WorkAreas: TWorkAreas read GetWorkAreas;
{$ENDIF}    
  end;

  TcxListView = class(TcxCustomListView)
  public
    property ListViewCanvas;
  published
    property Checkboxes;
    property Columns;
    property ColumnClick default True;
    property HideSelection default True;
    property IconOptions;
    property Items;
{$IFDEF DELPHI6}
    property ItemIndex;
{$ENDIF}
    property AllocBy default 0;
{$IFDEF DELPHI5}
    property HotTrack default False;
    property HoverTime default -1;
{$ENDIF}
    property LargeImages;
    property MultiSelect default False;
    property OwnerData default False;
    property OwnerDraw default False;
    property RowSelect default False;
    property ReadOnly default False;
    property ShowColumnHeaders default True;
    property SmallImages;
    property SortType default stNone;
    property StateImages;
    property ViewStyle default vsIcon;
{$IFDEF DELPHI5}
    property ShowWorkAreas default False;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnAdvancedCustomDrawSubItem;
{$ENDIF}
    property OnCancelEdit;    
    property OnChange;
    property OnChanging;
    property OnColumnClick;
{$IFDEF DELPHI5}
    property OnColumnDragged;
    property OnColumnRightClick;
{$ENDIF}    
    property OnCompare;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnCustomDrawSubItem;
    property OnData;
    property OnDataFind;
    property OnDataHint;
    property OnDataStateChange;
    property OnDeletion;
    property OnDrawItem;
    property OnEdited;
    property OnEditing;
{$IFDEF DELPHI5}
    property OnInfoTip;
{$ENDIF}    
    property OnInsert;
    property OnGetImageIndex;
{$IFDEF DELPHI5}
    property OnGetSubItemImage;
{$ENDIF}    
    property OnSelectItem;
{$IFDEF DELPHI6}
    property OnCreateItemClass;
{$ENDIF}
    property Align;
    property Anchors;
    property Constraints;
    property DragMode;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFDEF VCL}
    property BiDiMode;
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
    property ParentBiDiMode;
{$ENDIF}
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Graphics, Math;

type
  TcxContainerAccess = class(TcxContainer);

{ TcxIconOptions }
constructor TcxIconOptions.Create(AOwner: TPersistent);
begin
  inherited Create;
  Arrangement := iaTop;
  AutoArrange := False;
  WrapText := True;
end;

procedure TcxIconOptions.SetArrangement(Value: TIconArrangement);
begin
  if Value <> Arrangement then
  begin;
    FArrangement := Value;
    if Assigned(FArrangementChange) then FArrangementChange(Self);
  end;
end;

procedure TcxIconOptions.SetAutoArrange(Value: Boolean);
begin
  if Value <> AutoArrange then
  begin
    FAutoArrange := Value;
    if Assigned(FAutoArrangeChange) then FAutoArrangeChange(Self);
  end;
end;

procedure TcxIconOptions.SetWrapText(Value: Boolean);
begin
  if Value <> WrapText then
  begin
    FWrapText := Value;
    if Assigned(FWrapTextChange) then FWrapTextChange(Self);
  end;
end;
{ TcxIconOptions }

{ TcxCustomInnerListView }
constructor TcxCustomInnerListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCanvas := TcxCanvas.Create(inherited Canvas);
  CreateScrollBars;
  FLookAndFeel := TcxLookAndFeel.Create(Self);
  FHScrollBar.LookAndFeel.MasterLookAndFeel := FLookAndFeel;
  FVScrollBar.LookAndFeel.MasterLookAndFeel := FLookAndFeel;
  BorderStyle := bsNone;
  ControlStyle := ControlStyle + [csDoubleClicks{$IFNDEF VCL}, csCaptureMouse{$ENDIF}];
{$IFNDEF VCL}
  InputKeys := [ikArrows, ikChars, ikTabs];
{$ENDIF}
  IconOptions.Arrangement := iaTop;
  IconOptions.AutoArrange := False;
  IconOptions.WrapText := True;
  ParentColor := False;
  ParentFont := True;
  ShowColumnHeaders := True;
end;

destructor TcxCustomInnerListView.Destroy;
begin
  if (FHScrollBar <> nil) and (FHScrollBar.Parent = nil) then
    FreeAndNil(FHScrollBar);
  if (FVScrollBar <> nil) and (FVScrollBar.Parent = nil) then
    FreeAndNil(FVScrollBar);
  FreeAndNil(FLookAndFeel);
  FreeAndNil(FCanvas);
  inherited Destroy;
end;

procedure TcxCustomInnerListView.Loaded;
begin
  inherited;
  Container.UpdateIconOptions;
  FoldHint := Hint;
end;

procedure TcxCustomInnerListView.DragDrop(Source: TObject; X, Y: Integer);
begin
  if Container <> nil then
    Container.DragDrop(Source, Left + X, Top + Y);
end;

procedure TcxCustomInnerListView.Click;
begin
  inherited Click;
  if Container <> nil then TcxContainerAccess(Container).Click;
end;

procedure TcxCustomInnerListView.DblClick;
begin
  inherited DblClick;
  if Container <> nil then TcxContainerAccess(Container).DblClick;
end;

function TcxCustomInnerListView.CanEdit(Item: TListItem): Boolean;
begin
  if Container <> nil then
  begin
    Result := (not Container.ReadOnly) {and (not OwnerData)}; {<- Prevent bug, when Caption not saved after CreateWnd in "OwnerData" mode}
    if Result then
      Result := inherited CanEdit(Item);
  end
  else
    Result := inherited CanEdit(Item);
end;

function TcxCustomInnerListView.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  {$IFNDEF VCL}const{$ENDIF} MousePos: TPoint): Boolean;
begin
  Result := (Container <> nil) and TcxContainerAccess(Container).DoMouseWheel(Shift,
    WheelDelta, MousePos);
  if not Result then
    inherited DoMouseWheel(Shift, WheelDelta, MousePos);
end;

procedure TcxCustomInnerListView.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Container <> nil then
    TcxContainerAccess(Container).DragOver(Source, Left + X, Top + Y, State, Accept);
end;

function TcxCustomInnerListView.GetPopupMenu: TPopupMenu;
begin
  if Container = nil then
    Result := inherited GetPopupMenu
  else
    Result := TcxContainerAccess(Container).GetPopupMenu;
end;

procedure TcxCustomInnerListView.DoCancelEdit;
begin
  if IsEditing and Assigned(Container) and not Container.IsDestroying and
    Assigned(Container.OnCancelEdit) then
    Container.OnCancelEdit(Container);
end;

procedure TcxCustomInnerListView.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Container <> nil then
    TcxContainerAccess(Container).KeyDown(Key, Shift);
  if Key <> 0 then
    inherited KeyDown(Key, Shift);
end;

procedure TcxCustomInnerListView.KeyPress(var Key: Char);
begin
  if (Key = Char(VK_TAB)){$IFNDEF VCL} or (Key = Char(Key_Backtab)){$ENDIF} then
    Key := #0;
  if Container <> nil then
    TcxContainerAccess(Container).KeyPress(Key);
  if Word(Key) = VK_RETURN then
    Key := #0;
  if Key <> #0 then
    inherited KeyPress(Key);
end;

procedure TcxCustomInnerListView.KeyUp(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB){$IFNDEF VCL} or (Key = Key_Backtab){$ENDIF} then
    Key := 0;
  if Container <> nil then
    TcxContainerAccess(Container).KeyUp(Key, Shift);
  if Key <> 0 then
    inherited KeyUp(Key, Shift);
end;

procedure TcxCustomInnerListView.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Container <> nil then
    with TcxContainerAccess(Container) do
    begin
      InnerControlMouseDown := True;
      try
        MouseDown(Button, Shift, X + Self.Left, Y + Self.Top);
      finally
        InnerControlMouseDown := False;
      end;
    end;
end;

procedure TcxCustomInnerListView.MouseEnter(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
end;

procedure TcxCustomInnerListView.MouseLeave(AControl: TControl);
begin
  {$IFNDEF VCL}inherited;{$ENDIF}
  if Container <> nil then
    TcxContainerAccess(Container).ShortRefreshContainer(True);
end;

procedure TcxCustomInnerListView.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if (GetItemAt(X, Y) = nil) then
    Hint := FOldHint;
  if Container <> nil then
    TcxContainerAccess(Container).MouseMove(Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerListView.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if Container <> nil then
    TcxContainerAccess(Container).MouseUp(Button, Shift, X + Left, Y + Top);
end;

procedure TcxCustomInnerListView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = FHScrollBar then
      FHScrollBar := nil
    else if AComponent = FVScrollBar then
      FVScrollBar := nil;
end;

{$IFDEF VCL}
procedure TcxCustomInnerListView.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Container.IconOptions.AutoArrange then
    Params.Style := Params.Style or LVS_AUTOARRANGE
  else
    Params.Style := Params.Style and not LVS_AUTOARRANGE;
  if not Container.ShowColumnHeaders then
    Params.Style := Params.Style or LVS_NOCOLUMNHEADER;
end;

procedure TcxCustomInnerListView.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
  case Message.Msg of
    WM_HSCROLL,
    WM_MOUSEWHEEL,
    WM_VSCROLL,
    WM_WINDOWPOSCHANGED,
    CM_WININICHANGE,
    WM_KEYDOWN:
      SetScrollBarsParameters;
    LVM_REDRAWITEMS,
    LVM_SETITEMCOUNT:
    begin
      SetScrollBarsParameters;
    end;
  end;
end;

function TcxCustomInnerListView.GetSizeGripRect: TRect;
var
  R: TRect;
begin
  if FHScrollBar.Visible and FVScrollBar.Visible then
  begin
    Result.TopLeft := Parent.ClientToScreen(Point(FVScrollBar.Left, FHScrollBar.Top));
    GetWindowRect(Handle, R);
    Dec(Result.Left, R.Left);
    Dec(Result.Top, R.Top);
    Result.Right := Result.Left + FVScrollBar.Width;
    Result.Bottom := Result.Top + FHScrollBar.Height;
  end
  else
    FillChar(Result, SizeOf(Result), 0);
end;

procedure TcxCustomInnerListView.LockScrollBarsUpdate(ALock: Boolean);
begin
  SetScrollBarsParameters;
  Exit;
  if ALock then
    Inc(FScrollBarsLockCount)
  else
    if FScrollBarsLockCount > 0 then
    begin
      Dec(FScrollBarsLockCount);
      if FScrollBarsLockCount = 0 then
        SetScrollBarsParameters;
    end;
end;

procedure TcxCustomInnerListView.SetScrollBarsParameters;

  procedure AdjustScrollBarPosition(AScrollBar: TcxScrollBar);
  const
    AScrollBarObjects: array [TScrollBarKind] of Longword = (OBJID_HSCROLL, OBJID_VSCROLL);
  var
    AScrollBarInfo: TScrollBarInfo;
    AScrollBarState: WORD;
    AScrollBarVisible: Boolean;
    R: TRect;
  begin
    AScrollBarVisible := False;
    repeat
      if (Items.Count = 0) or (Parent = nil) then
        Break;
      AScrollBarInfo.cbSize := SizeOf(AScrollBarInfo);
      if not GetScrollBarInfoProc(Handle, Integer(AScrollBarObjects[AScrollBar.Kind]),
          AScrollBarInfo) then
        Break;
      AScrollBarState := AScrollBarInfo.rgstate[0];
      if AScrollBarState and (STATE_SYSTEM_INVISIBLE or STATE_SYSTEM_OFFSCREEN) <> 0 then
        Break;
      AScrollBarVisible := True;
      AScrollBar.Enabled := AScrollBarState and STATE_SYSTEM_UNAVAILABLE = 0;
      with AScrollBarInfo.rcScrollBar do
      begin
        R.TopLeft := Parent.ScreenToClient(TopLeft);
        R.Right := Right - Left;
        R.Bottom := Bottom - Top;
      end;
      with R do
        AScrollBar.SetBounds(Left, Top, Right, Bottom);
    until True;

    if AScrollBarVisible then
    begin
      Inc(FScrollBarsLockCount);
      try
        AScrollBar.Parent := Parent;
      finally
        Dec(FScrollBarsLockCount);
      end;
      AScrollBar.Ctl3D := False;
      AScrollBar.BringToFront;
    end
    else
      AScrollBar.Width := 0;
    AScrollBar.Visible := AScrollBarVisible;
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
    GetScrollInfo(Handle, ABarFlags[AScrollBar.Kind], AScrollInfo);
    with AScrollInfo do
    begin
      if Integer(nPage) > nMax then
        Integer(nPage) := nMax;
      AScrollBar.SetScrollParams(nMin, nMax, nPos, nPage, True);
    end;
  end;

  procedure InvalidateSizeGrip;
  var
    R: TRect;
    ARgn: HRGN;
  begin
    R.TopLeft := GetSizeGripRect.TopLeft;
    R.Right := Width;
    R.Bottom := Height;
    R := Rect(0, 0, Width, Height);
    if not IsRectEmpty(R) then
    begin
      ARgn := CreateRectRgnIndirect(R);
      try
        PostMessage(Handle, WM_NCPAINT, ARgn, 0);
      finally
        DeleteObject(ARgn);
      end;
    end;
  end;

begin
  if (csDestroying in ComponentState) or (FScrollBarsLockCount > 0) or not UsecxScrollBars then
    Exit;
  FScrollBarsCalculating := True;
  SetScrollBarParameters(FHScrollBar);
  SetScrollBarParameters(FVScrollBar);
  FScrollBarsCalculating := False;
end;

{$ELSE}
function TcxCustomInnerListView.EventFilter(Sender: QObjectH; Event: QEventH): Boolean;
begin
  Result := inherited EventFilter(Sender, Event);
  if (Container <> nil) and (QEvent_type(Event) in [QEventType_FocusIn, QEventType_FocusOut]) then
    TcxContainerAccess(Container).FocusChanged;
end;
{$ENDIF}

{$IFDEF DELPHI5}
function TcxCustomInnerListView.CanFocus: Boolean;
begin
  Result := Container.CanFocus;
end;
{$ENDIF}

{$IFDEF DELPHI6}
procedure TcxCustomInnerListView.DeleteSelected;
begin
  if Assigned(Container) and (not Container.ReadOnly) then
    inherited DeleteSelected;
end;
{$ENDIF}

procedure TcxCustomInnerListView.CreateScrollBars;

  procedure InitializeScrollBar(AScrollBar: TcxScrollBar);
  begin
    AScrollBar.SmallChange := 1;
    AScrollBar.Visible := False;
  end;

begin
  FHScrollBar := TcxScrollBar.Create(Self);
  FHScrollBar.FreeNotification(Self);
  FHScrollBar.Kind := sbHorizontal;
  FHScrollBar.OnScroll := HScrollHandler;
  InitializeScrollBar(FHScrollBar);

  FVScrollBar := TcxScrollBar.Create(Self);
  FVScrollBar.FreeNotification(Self);
  FVScrollBar.Kind := sbVertical;
  FVScrollBar.OnScroll := VScrollHandler;
  InitializeScrollBar(FVScrollBar);
end;

procedure TcxCustomInnerListView.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

procedure TcxCustomInnerListView.HScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
{$IFDEF VCL}
var
  P: TPoint;
{$ENDIF}
begin
{$IFDEF VCL}
  if not FHScrollBar.HandleAllocated then
    Exit;
  if ScrollCode = scTrack then
    case ViewStyle of
      vsList:
        SendMessage(Handle, LVM_SCROLL, ScrollPos - ListView_GetTopIndex(Handle), 0);
      vsSmallIcon:
        begin
          ListView_GetOrigin(Handle, P);
          SendMessage(Handle, LVM_SCROLL, ScrollPos - P.X, 0);
        end;
    end
  else
  begin
    CallWindowProc(DefWndProc, Handle, WM_HSCROLL, Word(ScrollCode) +
      Word(ScrollPos) shl 16, FHScrollBar.Handle);
    ScrollPos := GetScrollPos(Handle, SB_HORZ);
  end;
{$ENDIF}
end;

procedure TcxCustomInnerListView.VScrollHandler(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
{$IFDEF VCL}
var
  P: TPoint;
{$ENDIF}
begin
{$IFDEF VCL}
  if not FVScrollBar.HandleAllocated then
    Exit;
  if ScrollCode = scTrack then
    case ViewStyle of
      vsReport:
        SendMessage(Handle, LVM_SCROLL, 0, (ScrollPos - ListView_GetTopIndex(Handle)) *
          (Canvas.FontHeight(Font) + 1));
      vsIcon, vsSmallIcon:
        begin
          ListView_GetOrigin(Handle, P);
          SendMessage(Handle, LVM_SCROLL, 0, ScrollPos - P.Y);
        end;
    end
  else
  begin
    CallWindowProc(DefWndProc, Handle, WM_VSCROLL, Word(ScrollCode) +
      Word(ScrollPos) shl 16, FVScrollBar.Handle);
    ScrollPos := GetScrollPos(Handle, SB_VERT);
  end;
{$ENDIF}
end;

{$IFNDEF DELPHI6}
function TcxCustomInnerListView.GetScrollWidth: Integer;
begin
  Result := SendMessage(Handle, LB_GETHORIZONTALEXTENT, 0, 0);
end;

procedure TcxCustomInnerListView.SetScrollWidth(const Value: Integer);
begin
  if Value <> ScrollWidth then
    SendMessage(Handle, LB_SETHORIZONTALEXTENT, Value, 0);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomInnerListView.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if Container <> nil then
    with Message do
    begin
      Result := Result or DLGC_WANTCHARS;
      if GetKeyState(VK_CONTROL) >= 0 then
        Result := Result or DLGC_WANTTAB;
    end;
end;

procedure TcxCustomInnerListView.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying then
    TcxContainerAccess(Container).FocusChanged;
end;

procedure TcxCustomInnerListView.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  if not FScrollBarsCalculating then
    SetScrollBarsParameters;
end;

procedure TcxCustomInnerListView.WMNCPaint(var Message: TMessage);
var
  DC: HDC;
  ABrush: HBRUSH;
begin
  inherited;
  if UsecxScrollBars and FHScrollBar.Visible and FVScrollBar.Visible then
  begin
    DC := GetWindowDC(Handle);
    ABrush := 0;
    try
      ABrush := CreateSolidBrush(ColorToRGB(clBtnFace));
      FillRect(DC, GetSizeGripRect, ABrush);
    finally
      if ABrush <> 0 then
        DeleteObject(ABrush);
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TcxCustomInnerListView.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  if (Container <> nil) and not Container.IsDestroying and
    not(csDestroying in ComponentState) and
    (Message.FocusedWnd <> Container.Handle) then
    TcxContainerAccess(Container).FocusChanged;
end;

procedure TcxCustomInnerListView.WMWindowPosChanged(var Message: TWMWindowPosChanged);
var
  ARgn: HRGN;
begin
  inherited;
  if csDestroying in ComponentState then
    Exit;
  if FHScrollBar.Visible and FVScrollBar.Visible then
  begin
    ARgn := CreateRectRgnIndirect(GetSizeGripRect);
    SendMessage(Handle, WM_NCPAINT, ARgn, 0);
    DeleteObject(ARgn);
  end;
end;

procedure TcxCustomInnerListView.CMHintShow(var Message: TMessage);
var
  Item: TListItem;
  ItemRect: TRect;
  InfoTip: string;
begin
{$IFDEF DELPHI5}
  with TCMHintShow(Message) do
  begin
    Item := GetItemAt(HintInfo.CursorPos.X, HintInfo.CursorPos.Y);
    if FOldItem <> Item then
    begin
      if Assigned(OnInfoTip) then
      begin
        if Item <> nil then
        begin
          InfoTip := Item.Caption;
          DoInfoTip(Item, InfoTip);

          ItemRect := Item.DisplayRect(drBounds);
          ItemRect.TopLeft := ClientToScreen(ItemRect.TopLeft);
          ItemRect.BottomRight := ClientToScreen(ItemRect.BottomRight);

          with HintInfo^ do
          begin
            HintInfo.HintStr := InfoTip;
            HintInfo.CursorRect := ItemRect;
            HintPos.Y := CursorRect.Top + GetSystemMetrics(SM_CYCURSOR);
            HintPos.X := CursorRect.Left + GetSystemMetrics(SM_CXCURSOR);
            HintInfo.HintMaxWidth := ClientWidth;
            Hint := InfoTip;
          end
        end

      end else
      begin
         FOldHint := Hint;
         inherited;
      end;
    end;
    FOldItem := Item;
  end;
{$ELSE}
  inherited;
{$ENDIF}
end;

procedure TcxCustomInnerListView.CNNotify(var Message: TWMNotify);
begin
  if Message.NMHdr^.code = LVN_ENDLABELEDIT then
  begin
    with PLVDispInfo(Message.NMHdr)^ do
      if (item.IItem <> -1) then
       if (item.pszText <> nil) then
       begin
         if CanChange(Items[item.iItem], LVIF_TEXT) then
           Edit(item);
       end
       else
         DoCancelEdit;
  end
  else
    inherited;
end;

procedure TcxCustomInnerListView.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseEnter(Self)
  else
    MouseEnter(TControl(Message.lParam));
end;

procedure TcxCustomInnerListView.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Message.lParam = 0 then
    MouseLeave(Self)
  else
    MouseLeave(TControl(Message.lParam));
end;
{$ENDIF}

function TcxCustomInnerListView.GetContainer: TcxCustomListView;
begin
  Result := TcxCustomListView(FContainer);
end;

procedure TcxCustomInnerListView.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
end;
{ TcxCustomInnerListView }

{ TcxCustomListView }
constructor TcxCustomListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOwnerDraw := False;
  FIconOptions := TcxIconOptions.Create(Self);
  FIconOptions.FArrangementChange := ArrangementChangeHandler;
  FIconOptions.FAutoArrangeChange := AutoArrangeChangeHandler;
  FIconOptions.FWrapTextChange := WrapTextChangeHandler;
  InternalInitListView;
  InnerListView.AutoSize := False;
  InnerListView.Align := alClient;
  InnerListView.BorderStyle := bsNone;
  InnerListView.Parent := Self;
  InnerListView.FContainer := Self;
  InnerListView.TabStop := False;
  InnerListView.OwnerDraw := False;
  InnerControl := InnerListView;
  InnerListView.LookAndFeel.MasterLookAndFeel := Style.LookAndFeel;
  Width := 121;
  Height := 97;
end;

destructor TcxCustomListView.Destroy;
begin
  FreeAndNil(FListView);
  FreeAndNil(FIconOptions);
  inherited Destroy;
end;

procedure TcxCustomListView.Loaded;
begin
  inherited;
  UpdateIconOptions;
  InnerListView.OwnerDraw := FOwnerDraw;
end;

procedure TcxCustomListView.UpdateIconOptions;
begin
  if Assigned(InnerListView) then
  begin
    InnerListView.Items.BeginUpdate;
    try
      InnerListView.IconOptions.Arrangement := FIconOptions.Arrangement;
      InnerListView.IconOptions.AutoArrange := FIconOptions.AutoArrange;
      InnerListView.IconOptions.WrapText := FIconOptions.WrapText;
    finally
      InnerListView.Items.EndUpdate;
    end;
  end;
end;

function TcxCustomListView.GetInnerListView: TcxCustomInnerListView;
begin
  Result := FListView;
end;

procedure TcxCustomListView.SetInnerListView(const Value: TcxCustomInnerListView);
begin
  FListView := Value;
end;

class function TcxCustomListView.GetListViewClass: TcxCustomInnerListViewClass;
begin
  Result := TcxCustomInnerListView;
end;

procedure TcxCustomListView.InternalInitListView;
begin
  InnerListView := GetListViewClass.Create(Self);
end;

{$IFDEF DELPHI6}
procedure TcxCustomListView.AddItem(Item: string; AObject: TObject);
begin
  InnerListView.AddItem(Item, AObject);
end;

procedure TcxCustomListView.ClearSelection;
begin
  InnerListView.ClearSelection;
end;

procedure TcxCustomListView.DeleteSelected;
begin
  InnerListView.DeleteSelected;
end;
{$ENDIF}

procedure TcxCustomListView.Clear;
begin
{$IFDEF DELPHI6}
  InnerListView.Clear;
{$ELSE}
  InnerListView.Items.Clear;
{$ENDIF}
end;

{$IFNDEF VCL}
procedure TcxCustomListView.MakeCurrentVisible;
begin
  InnerListView.MakeCurrentVisible;
end;

procedure TcxCustomListView.Sort;
begin
  InnerListView.Sort;
end;

function TcxCustomListView.VisibleItemCount: Integer;
begin
  Result := InnerListView.VisibleItemCount;
end;
{$ENDIF}

procedure TcxCustomListView.AdjustInnerControl;
begin
  if InnerListView <> nil then
  begin
    InnerListView.Color := ViewInfo.BackgroundColor;
    InnerListView.Font := Font;
    if Enabled then
      InnerListView.Font.Color := Font.Color
    else
      InnerListView.Font.Color := {$IFDEF VCL}clBtnShadow{$ELSE}clDisabledButtonText{$ENDIF};
  end;
end;

procedure TcxCustomListView.DoExit;
begin
  if IsDestroying then
    Exit;
  try
  except
    SetFocus;
    raise;
  end;
  inherited DoExit;
end;

procedure TcxCustomListView.FontChanged;
begin
  inherited FontChanged;
  SetSize;
end;

procedure TcxCustomListView.ContainerStyleChanged(Sender: TObject); 
begin
  inherited;
end;

class function TcxCustomListView.GetStyleClass: TcxContainerStyleClass;
begin
  Result := TcxExtContainerStyle;
end;

function TcxCustomListView.IsInternalControl(AControl: TControl): Boolean;
begin
  if InnerListView = nil then
    Result := True
  else
    Result := (AControl = InnerListView.HScrollBar) or (AControl = InnerListView.VScrollBar);
  Result := Result or inherited IsInternalControl(AControl);
end;

function TcxCustomListView.RefreshContainer(const P: TPoint; Button: TcxMouseButton;
  Shift: TShiftState; AIsMouseEvent: Boolean): Boolean;
begin
  Result := inherited RefreshContainer(P, Button, Shift, AIsMouseEvent);
end;

function TcxCustomListView.CanResize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := inherited CanResize(NewWidth, NewHeight);
end;

procedure TcxCustomListView.SetSize;
begin
  inherited SetSize;
end;

{$IFDEF VCL}
procedure TcxCustomListView.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
  case Message.Msg of
    CM_PARENTCOLORCHANGED: FListView.Color := Style.Color;
  end;
end;
{$ENDIF}

procedure TcxCustomListView.SetReadOnly(Value: Boolean);
begin
  InnerListView.ReadOnly := Value;
end;

procedure TcxCustomListView.SetHideSelection(Value: Boolean);
begin
  InnerListView.HideSelection := Value;
end;

procedure TcxCustomListView.SetMultiSelect(Value: Boolean);
begin
  InnerListView.MultiSelect := Value;
end;

procedure TcxCustomListView.SetOwnerData(Value: Boolean);
begin
  InnerListView.OwnerData := Value;
end;

procedure TcxCustomListView.SetOwnerDraw(Value: Boolean);
begin
  FOwnerDraw := Value;
  InnerListView.OwnerDraw := Value;
end;

procedure TcxCustomListView.SetRowSelect(Value: Boolean);
begin
  InnerListView.RowSelect := Value;
end;

procedure TcxCustomListView.SetShowColumnHeaders(Value: Boolean);
begin
  InnerListView.ShowColumnHeaders := Value;
end;

procedure TcxCustomListView.SetColumnClick(Value: Boolean);
begin
  InnerListView.ColumnClick := Value;
end;

function TcxCustomListView.GetReadOnly: Boolean;
begin
  Result := InnerListView.ReadOnly;
end;

function TcxCustomListView.AlphaSort: Boolean;
begin
  Result := InnerListView.AlphaSort;
end;

procedure TcxCustomListView.Arrange(Code: TListArrangement);
begin
  InnerListView.Arrange(Code);
end;

{$IFDEF DELPHI6}
procedure TcxCustomListView.CopySelection(Destination: TCustomListControl);
begin
  InnerListView.CopySelection(Destination);
end;
{$ENDIF}

function TcxCustomListView.FindCaption(StartIndex: Integer; Value: string;
  Partial, Inclusive, Wrap: Boolean): TListItem;
begin
  Result := InnerListView.FindCaption(StartIndex, Value, Partial, Inclusive, Wrap);
end;

function TcxCustomListView.FindData(StartIndex: Integer; Value: Pointer;
  Inclusive, Wrap: Boolean): TListItem;
begin
  Result := InnerListView.FindData(StartIndex, Value, Inclusive, Wrap);
end;

function TcxCustomListView.GetHitTestInfoAt(X, Y: Integer): THitTests;
begin
  Result := InnerListView.GetHitTestInfoAt(X, Y);
end;

function TcxCustomListView.GetItemAt(X, Y: Integer): TListItem;
begin
  Result := InnerListView.GetItemAt(X, Y);
end;

function TcxCustomListView.GetNearestItem(Point: TPoint; Direction: TSearchDirection): TListItem;
begin
  Result := InnerListView.GetNearestItem(Point, Direction);
end;

function TcxCustomListView.GetNextItem(StartItem: TListItem;
  Direction: TSearchDirection; States: TItemStates): TListItem;
begin
  Result := InnerListView.GetNextItem(StartItem, Direction, States);
end;

function TcxCustomListView.GetSearchString: string;
begin
  Result := InnerListView.GetSearchString;
end;

function TcxCustomListView.IsEditing: Boolean;
begin
  Result := InnerListView.IsEditing;
end;

{$IFDEF DELPHI6}
procedure TcxCustomListView.SelectAll;
begin
  InnerListView.SelectAll;
end;
{$ENDIF}

function TcxCustomListView.CustomSort(SortProc: TLVCompare; lParam: Longint): Boolean;
begin
  Result := InnerListView.CustomSort(SortProc, lParam);
end;

function TcxCustomListView.StringWidth(S: string): Integer;
begin
  Result := InnerListView.StringWidth(S);
end;

procedure TcxCustomListView.UpdateItems(FirstIndex, LastIndex: Integer);
begin
  InnerListView.UpdateItems(FirstIndex, LastIndex);
end;

function TcxCustomListView.GetListItems: TListItems;
begin
  Result := InnerListView.Items;
end;

procedure TcxCustomListView.SetListItems(Value: TListItems);
begin
  InnerListView.Items := Value;
end;

procedure TcxCustomListView.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  inherited;
  InnerListView.ActionChange(Sender, CheckDefaults);
end;

function TcxCustomListView.CanChange(Item: TListItem; Change: Integer): Boolean;
begin
  Result := InnerListView.CanChange(Item, Change);
end;

function TcxCustomListView.CanEdit(Item: TListItem): Boolean;
begin
  Result := InnerListView.CanEdit(Item);
end;

procedure TcxCustomListView.Change(Item: TListItem; Change: Integer);
begin
  InnerListView.Change(Item, Change);
end;

procedure TcxCustomListView.ChangeScale(M, D: Integer);
begin
  inherited;
  InnerListView.ChangeScale(M, D);
end;

procedure TcxCustomListView.ColClick(Column: TListColumn);
begin
  InnerListView.ColClick(Column);
end;

{$IFDEF DELPHI5}
procedure TcxCustomListView.ColRightClick(Column: TListColumn; Point: TPoint);
begin
  InnerListView.ColRightClick(Column, Point);
end;
{$ENDIF}

function TcxCustomListView.ColumnsShowing: Boolean;
begin
  Result := InnerListView.ColumnsShowing;
end;

function TcxCustomListView.CreateListItem: TListItem;
begin
  Result := InnerListView.CreateListItem;
end;

{$IFDEF DELPHI6}
function TcxCustomListView.CreateListItems: TListItems;
begin
  Result := InnerListView.CreateListItems;
end;
{$ENDIF}

function TcxCustomListView.CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean;
begin
  Result := InnerListView.CustomDraw(ARect, Stage);
end;

function TcxCustomListView.CustomDrawItem(Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage): Boolean;
begin
  Result := InnerListView.CustomDrawItem(Item, State, Stage);
end;

function TcxCustomListView.CustomDrawSubItem(Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage): Boolean;
begin
  Result := InnerListView.CustomDrawSubItem(Item, SubItem, State, Stage);
end;

procedure TcxCustomListView.Delete(Item: TListItem);
begin
  InnerListView.Delete(Item);
end;

procedure TcxCustomListView.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  inherited;
  InnerListView.DoEndDrag(Target, X, Y);
end;

procedure TcxCustomListView.DoStartDrag(var DragObject: TDragObject);
begin
  inherited;
  InnerListView.DoStartDrag(DragObject);
end;

{$IFDEF DELPHI5}
procedure TcxCustomListView.DoInfoTip(Item: TListItem; var InfoTip: string);
begin
  InnerListView.DoInfoTip(Item, InfoTip);
end;
{$ENDIF}

procedure TcxCustomListView.DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState);
begin
  InnerListView.DrawItem(Item, Rect, State);
end;

procedure TcxCustomListView.Edit(const Item: TLVItem);
begin
  InnerListView.Edit(Item);
end;

function TcxCustomListView.OwnerDataFetch(Item: TListItem; Request: TItemRequest): Boolean;
begin
  Result := InnerListView.OwnerDataFetch(Item, Request);
end;

function TcxCustomListView.OwnerDataFind(Find: TItemFind; const FindString: string;
  const FindPosition: TPoint; FindData: Pointer; StartIndex: Integer;
  Direction: TSearchDirection; Wrap: Boolean): Integer;
begin
  Result := InnerListView.OwnerDataFind(Find, FindString, FindPosition,
    FindData, StartIndex, Direction, Wrap);
end;

function TcxCustomListView.OwnerDataHint(StartIndex, EndIndex: Integer): Boolean;
begin
  Result := InnerListView.OwnerDataHint(StartIndex, EndIndex);
end;

function TcxCustomListView.OwnerDataStateChange(StartIndex, EndIndex: Integer; OldState,
  NewState: TItemStates): Boolean;
begin
  Result := InnerListView.OwnerDataStateChange(StartIndex, EndIndex, OldState, NewState);
end;

function TcxCustomListView.GetActionLinkClass: TControlActionLinkClass;
begin
  inherited GetActionLinkClass;
  Result := InnerListView.GetActionLinkClass;
end;

function TcxCustomListView.GetCount: Integer;
begin
{$IFDEF DELPHI6}
  Result := InnerListView.GetCount;
{$ELSE}
  Result := InnerListView.Items.Count;
{$ENDIF}
end;

function TcxCustomListView.GetDragImages: TDragImageList;
begin
  inherited GetDragImages;
  Result := InnerListView.GetDragImages;
end;

function TcxCustomListView.GetItemIndex(Value: TListItem): Integer;
begin
  Result := InnerListView.GetItemIndex(Value);
end;

{$IFDEF DELPHI6}
function TcxCustomListView.GetItemIndex: Integer;
begin
  Result := InnerListView.GetItemIndex;
end;

function TcxCustomListView.GetListViewItemIndex: Integer;
begin
  Result := GetItemIndex;
end;

function TcxCustomListView.GetSelCount: Integer;
begin
  Result := InnerListView.GetSelCount;
end;
{$ENDIF}

procedure TcxCustomListView.InsertItem(Item: TListItem);
begin
  InnerListView.InsertItem(Item);
end;

function TcxCustomListView.IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean;
begin
  Result := InnerListView.IsCustomDrawn(Target, Stage);
end;

{$IFDEF DELPHI6}
procedure TcxCustomListView.SetItemIndex(const Value: Integer);
begin
  InnerListView.SetItemIndex(Value);
end;
{$ENDIF}

procedure TcxCustomListView.SetViewStyle(Value: TViewStyle);
begin
{$IFDEF DELPHI6}
  InnerListView.SetViewStyle(Value);
{$ELSE}
  InnerListView.ViewStyle := Value;
{$ENDIF}
end;

procedure TcxCustomListView.UpdateColumn(AnIndex: Integer);
begin
  InnerListView.UpdateColumn(AnIndex);
end;

procedure TcxCustomListView.UpdateColumns;
begin
  InnerListView.UpdateColumns;
end;

function TcxCustomListView.GetListColumns: TListColumns;
begin
  Result := InnerListView.Columns;
end;

function TcxCustomListView.GetListViewCanvas: TcxCanvas;
begin
  Result := InnerListView.Canvas;
end;

procedure TcxCustomListView.SetListColumns(Value: TListColumns);
begin
  InnerListView.Columns := Value;
end;

function TcxCustomListView.GetColumnClick: Boolean;
begin
  Result := InnerListView.ColumnClick;
end;

function TcxCustomListView.GetHideSelection: Boolean;
begin
  Result := InnerListView.HideSelection;
end;

function TcxCustomListView.GetIconOptions: TcxIconOptions;
begin
  Result := FIconOptions;
end;

procedure TcxCustomListView.SetIconOptions(Value: TcxIconOptions);
begin
  FIconOptions := Value;
  UpdateIconOptions;
end;

function TcxCustomListView.GetAllocBy: Integer;
begin
  Result := InnerListView.AllocBy;
end;

procedure TcxCustomListView.SetAllocBy(Value: Integer);
begin
  InnerListView.AllocBy := Value;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetHoverTime: Integer;
begin
  Result := InnerListView.HoverTime;
end;

procedure TcxCustomListView.SetHoverTime(Value: Integer);
begin
  InnerListView.HoverTime := Value;
end;
{$ENDIF}

function TcxCustomListView.GetLargeImages: TCustomImageList;
begin
  Result := InnerListView.LargeImages;
end;

procedure TcxCustomListView.SetLargeImages(Value: TCustomImageList);
begin
  InnerListView.LargeImages := Value;
end;

function TcxCustomListView.GetMultiSelect: Boolean;
begin
  Result := InnerListView.MultiSelect;
end;

function TcxCustomListView.GetOwnerData: Boolean;
begin
  Result := InnerListView.OwnerData;
end;

function TcxCustomListView.GetOwnerDraw: Boolean;
begin
  Result := InnerListView.OwnerDraw;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetOnAdvancedCustomDraw: TLVAdvancedCustomDrawEvent;
begin
  Result := InnerListView.OnAdvancedCustomDraw;
end;

procedure TcxCustomListView.SetOnAdvancedCustomDraw(Value: TLVAdvancedCustomDrawEvent);
begin
  InnerListView.OnAdvancedCustomDraw := Value;
end;

function TcxCustomListView.GetOnAdvancedCustomDrawItem: TLVAdvancedCustomDrawItemEvent;
begin
  Result := InnerListView.OnAdvancedCustomDrawItem;
end;

procedure TcxCustomListView.SetOnAdvancedCustomDrawItem(Value: TLVAdvancedCustomDrawItemEvent);
begin
  InnerListView.OnAdvancedCustomDrawItem := Value;
end;

function TcxCustomListView.GetOnAdvancedCustomDrawSubItem: TLVAdvancedCustomDrawSubItemEvent;
begin
  Result := InnerListView.OnAdvancedCustomDrawSubItem;
end;

procedure TcxCustomListView.SetOnAdvancedCustomDrawSubItem(Value: TLVAdvancedCustomDrawSubItemEvent);
begin
  InnerListView.OnAdvancedCustomDrawSubItem := Value;
end;
{$ENDIF}

function TcxCustomListView.GetOnChange: TLVChangeEvent;
begin
  Result := InnerListView.OnChange;
end;

procedure TcxCustomListView.SetOnChange(Value: TLVChangeEvent);
begin
  InnerListView.OnChange := Value;
end;

function TcxCustomListView.GetOnChanging: TLVChangingEvent;
begin
  Result := InnerListView.OnChanging;
end;

procedure TcxCustomListView.SetOnChanging(Value: TLVChangingEvent);
begin
  InnerListView.OnChanging := Value;
end;

function TcxCustomListView.GetOnColumnClick: TLVColumnClickEvent;
begin
  Result := InnerListView.OnColumnClick;
end;

procedure TcxCustomListView.SetOnColumnClick(Value: TLVColumnClickEvent);
begin
  InnerListView.OnColumnClick := Value;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetOnColumnDragged: TNotifyEvent;
begin
  Result := InnerListView.OnColumnDragged;
end;

procedure TcxCustomListView.SetOnColumnDragged(Value: TNotifyEvent);
begin
  InnerListView.OnColumnDragged := Value;
end;

function TcxCustomListView.GetOnColumnRightClick: TLVColumnRClickEvent;
begin
  Result := InnerListView.OnColumnRightClick;
end;

procedure TcxCustomListView.SetOnColumnRightClick(Value: TLVColumnRClickEvent);
begin
  InnerListView.OnColumnRightClick := Value;
end;
{$ENDIF}

function TcxCustomListView.GetOnCompare: TLVCompareEvent;
begin
  Result := InnerListView.OnCompare;
end;

procedure TcxCustomListView.SetOnCompare(Value: TLVCompareEvent);
begin
  InnerListView.OnCompare := Value;
end;

function TcxCustomListView.GetOnCustomDraw: TLVCustomDrawEvent;
begin
  Result := InnerListView.OnCustomDraw;
end;

procedure TcxCustomListView.SetOnCustomDraw(Value: TLVCustomDrawEvent);
begin
  InnerListView.OnCustomDraw := Value;
end;

function TcxCustomListView.GetOnCustomDrawItem: TLVCustomDrawItemEvent;
begin
  Result := InnerListView.OnCustomDrawItem;
end;

procedure TcxCustomListView.SetOnCustomDrawItem(Value: TLVCustomDrawItemEvent);
begin
  InnerListView.OnCustomDrawItem := Value;
end;

function TcxCustomListView.GetOnCustomDrawSubItem: TLVCustomDrawSubItemEvent;
begin
  Result := InnerListView.OnCustomDrawSubItem;
end;

procedure TcxCustomListView.SetOnCustomDrawSubItem(Value: TLVCustomDrawSubItemEvent);
begin
  InnerListView.OnCustomDrawSubItem := Value;
end;

function TcxCustomListView.GetOnData: TLVOwnerDataEvent;
begin
  Result := InnerListView.OnData;
end;

procedure TcxCustomListView.SetOnData(Value: TLVOwnerDataEvent);
begin
  InnerListView.OnData := Value;
end;

function TcxCustomListView.GetOnDataFind: TLVOwnerDataFindEvent;
begin
  Result := InnerListView.OnDataFind;
end;

procedure TcxCustomListView.SetOnDataFind(Value: TLVOwnerDataFindEvent);
begin
  InnerListView.OnDataFind := Value;
end;

function TcxCustomListView.GetOnDataHint: TLVOwnerDataHintEvent;
begin
  Result := InnerListView.OnDataHint;
end;

procedure TcxCustomListView.SetOnDataHint(Value: TLVOwnerDataHintEvent);
begin
  InnerListView.OnDataHint := Value;
end;

function TcxCustomListView.GetOnDataStateChange: TLVOwnerDataStateChangeEvent;
begin
  Result := InnerListView.OnDataStateChange;
end;

procedure TcxCustomListView.SetOnDataStateChange(Value: TLVOwnerDataStateChangeEvent);
begin
  InnerListView.OnDataStateChange := Value;
end;

function TcxCustomListView.GetOnDeletion: TLVDeletedEvent;
begin
  Result := InnerListView.OnDeletion;
end;

procedure TcxCustomListView.SetOnDeletion(Value: TLVDeletedEvent);
begin
  InnerListView.OnDeletion := Value;
end;

function TcxCustomListView.GetOnDrawItem: TLVDrawItemEvent;
begin
  Result := InnerListView.OnDrawItem;
end;

procedure TcxCustomListView.SetOnDrawItem(Value: TLVDrawItemEvent);
begin
  InnerListView.OnDrawItem := Value;
end;

function TcxCustomListView.GetOnEdited: TLVEditedEvent;
begin
  Result := InnerListView.OnEdited;
end;

procedure TcxCustomListView.SetOnEdited(Value: TLVEditedEvent);
begin
  InnerListView.OnEdited := Value;
end;

function TcxCustomListView.GetOnEditing: TLVEditingEvent;
begin
  Result := InnerListView.OnEditing;
end;

procedure TcxCustomListView.SetOnEditing(Value: TLVEditingEvent);
begin
  InnerListView.OnEditing := Value;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetOnInfoTip: TLVInfoTipEvent;
begin
  Result := InnerListView.OnInfoTip;
end;

procedure TcxCustomListView.SetOnInfoTip(Value: TLVInfoTipEvent);
begin
  InnerListView.OnInfoTip := Value;
end;
{$ENDIF}

function TcxCustomListView.GetOnInsert: TLVDeletedEvent;
begin
  Result := InnerListView.OnInsert;
end;

procedure TcxCustomListView.SetOnInsert(Value: TLVDeletedEvent);
begin
  InnerListView.OnInsert := Value;
end;

function TcxCustomListView.GetOnGetImageIndex: TLVNotifyEvent;
begin
  Result := InnerListView.OnGetImageIndex;
end;

procedure TcxCustomListView.SetOnGetImageIndex(Value: TLVNotifyEvent);
begin
  InnerListView.OnGetImageIndex := Value;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetOnGetSubItemImage: TLVSubItemImageEvent;
begin
  Result := InnerListView.OnGetSubItemImage;
end;

procedure TcxCustomListView.SetOnGetSubItemImage(Value: TLVSubItemImageEvent);
begin
  InnerListView.OnGetSubItemImage := Value;
end;
{$ENDIF}

function TcxCustomListView.GetOnSelectItem: TLVSelectItemEvent;
begin
  Result := InnerListView.OnSelectItem;
end;

procedure TcxCustomListView.SetOnSelectItem(Value: TLVSelectItemEvent);
begin
  InnerListView.OnSelectItem := Value;
end;

function TcxCustomListView.GetShowColumnHeaders: Boolean;
begin
  Result := InnerListView.ShowColumnHeaders;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetShowWorkAreas: Boolean;
begin
  Result := InnerListView.ShowWorkAreas;
end;

procedure TcxCustomListView.SetShowWorkAreas(Value: Boolean);
begin
  InnerListView.ShowWorkAreas := Value;
end;
{$ENDIF}

function TcxCustomListView.GetSmallImages: TCustomImageList;
begin
  Result := InnerListView.SmallImages;
end;

procedure TcxCustomListView.SetSmallImages(Value: TCustomImageList);
begin
  InnerListView.SmallImages := Value;
end;

function TcxCustomListView.GetSortType: TSortType;
begin
  Result := InnerListView.SortType;
end;

procedure TcxCustomListView.SetSortType(Value: TSortType);
begin
  InnerListView.SortType := Value;
end;

function TcxCustomListView.GetStateImages: TCustomImageList;
begin
  Result := InnerListView.StateImages;
end;

procedure TcxCustomListView.SetStateImages(Value: TCustomImageList);
begin
  InnerListView.StateImages := Value;
end;

function TcxCustomListView.GetViewStyle: TViewStyle;
begin
  Result := InnerListView.ViewStyle;
end;

{$IFDEF DELPHI6}
function TcxCustomListView.GetOnCreateItemClass: TLVCreateItemClassEvent;
begin
  Result := InnerListView.OnCreateItemClass;
end;

procedure TcxCustomListView.SetOnCreateItemClass(Value: TLVCreateItemClassEvent);
begin
  InnerListView.OnCreateItemClass := Value;
end;
{$ENDIF}

function TcxCustomListView.GetCheckBoxes: Boolean;
begin
  Result := InnerListView.Checkboxes;
end;

function TcxCustomListView.GetColumnFromIndex(Index: Integer): TListColumn;
begin
  Result := InnerListView.Column[Index];
end;

function TcxCustomListView.GetDropTarget: TListItem;
begin
  Result := InnerListView.DropTarget;
end;

function TcxCustomListView.GetFullDrag: Boolean;
begin
  Result := InnerListView.FullDrag;
end;

function TcxCustomListView.GetGridLines: Boolean;
begin
  Result := InnerListView.GridLines;
end;

function TcxCustomListView.GetHotTrack: Boolean;
begin
  Result := InnerListView.HotTrack;
end;

function TcxCustomListView.GetHotTrackStyles: TListHotTrackStyles;
begin
  Result := InnerListView.HotTrackStyles;
end;

function TcxCustomListView.GetItemFocused: TListItem;
begin
  Result := InnerListView.ItemFocused;
end;

function TcxCustomListView.GetRowSelect: Boolean;
begin
  Result := InnerListView.RowSelect;
end;

function TcxCustomListView.GetSelected: TListItem;
begin
  Result := InnerListView.Selected;
end;

function TcxCustomListView.GetTopItem: TListItem;
begin
  Result := InnerListView.TopItem;
end;

function TcxCustomListView.GetViewOrigin: TPoint;
begin
  Result := InnerListView.ViewOrigin;
end;

function TcxCustomListView.GetVisibleRowCount: Integer;
begin
  Result := InnerListView.VisibleRowCount;
end;

function TcxCustomListView.GetBoundingRect: TRect;
begin
  Result := InnerListView.BoundingRect;
end;

{$IFDEF DELPHI5}
function TcxCustomListView.GetWorkAreas: TWorkAreas;
begin
  Result := InnerListView.WorkAreas;
end;
{$ENDIF}

procedure TcxCustomListView.SetCheckboxes(Value: Boolean);
begin
  InnerListView.Checkboxes := value;
end;

procedure TcxCustomListView.SetDropTarget(Value: TListItem);
begin
  InnerListView.DropTarget := Value;
end;

procedure TcxCustomListView.SetFullDrag(Value: Boolean);
begin
  InnerListView.FullDrag := Value;
end;

procedure TcxCustomListView.SetGridLines(Value: Boolean);
begin
  InnerListView.GridLines := Value;
end;

procedure TcxCustomListView.SetHotTrack(Value: Boolean);
begin
  InnerListView.HotTrack := Value;
end;

procedure TcxCustomListView.SetHotTrackStyles(Value: TListHotTrackStyles);
begin
  InnerListView.HotTrackStyles := Value;
end;

procedure TcxCustomListView.SetItemFocused(Value: TListItem);
begin
  InnerListView.ItemFocused := Value;
end;

procedure TcxCustomListView.SetSelected(Value: TListItem);
begin
  InnerListView.Selected := Value;
end;

procedure TcxCustomListView.ArrangementChangeHandler(Sender: TObject);
begin
  if Assigned(InnerListView) then
    InnerListView.IconOptions.Arrangement := FIconOptions.Arrangement;
end;

procedure TcxCustomListView.AutoArrangeChangeHandler(Sender: TObject);
begin
  if Assigned(InnerListView) then
    InnerListView.IconOptions.AutoArrange := FIconOptions.AutoArrange;
end;

procedure TcxCustomListView.WrapTextChangeHandler(Sender: TObject);
begin
  if Assigned(InnerListView) then
    InnerListView.IconOptions.WrapText := FIconOptions.WrapText;
end;
{ TcxCustomListView }

end.
