
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
unit cxNavigator;

{$I cxEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages, dxThemeManager,
{$ELSE}
  Qt, QTypes,
{$ENDIF}
{$IFDEF DELPHI6}
  Types,
{$ENDIF}
  Classes, SysUtils, Controls, ExtCtrls, Forms, Graphics, ImgList, StdCtrls,
  cxClasses, cxControls, cxFilter, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

const
  NavigatorButtonCount = 15;

  NBDI_FIRST        = 0;
  NBDI_PRIORPAGE    = 1;
  NBDI_PRIOR        = 2;
  NBDI_NEXT         = 3;
  NBDI_NEXTPAGE     = 4;
  NBDI_LAST         = 5;
  NBDI_INSERT       = 6;
  NBDI_DELETE       = 7;
  NBDI_EDIT         = 8;
  NBDI_POST         = 9;
  NBDI_CANCEL       = 10;
  NBDI_REFRESH      = 11;
  NBDI_SAVEBOOKMARK = 12;
  NBDI_GOTOBOOKMARK = 13;
  NBDI_FILTER       = 14;

resourcestring //TODO move to strs contants
  cxNavigatorHint_First = 'First record';
  cxNavigatorHint_Prior = 'Prior record';
  cxNavigatorHint_PriorPage = 'Prior page';
  cxNavigatorHint_Next = 'Next record';
  cxNavigatorHint_NextPage = 'Next page';
  cxNavigatorHint_Last = 'Last record';
  cxNavigatorHint_Insert = 'Insert record';
  cxNavigatorHint_Delete = 'Delete record';
  cxNavigatorHint_Edit = 'Edit record';
  cxNavigatorHint_Post = 'Post edit';
  cxNavigatorHint_Cancel = 'Cancel edit';
  cxNavigatorHint_Refresh = 'Refresh data';
  cxNavigatorHint_SaveBookmark = 'Save Bookmark';
  cxNavigatorHint_GotoBookmark = 'Goto Bookmark';
  cxNavigatorHint_Filter = 'Filter data';
  cxNavigator_DeleteRecordQuestion = 'Delete record?';

type
  TcxCustomNavigatorButtons = class;

  IcxNavigatorOwner = interface
  ['{504B7F43-8847-46C5-B84A-C24F8E5E61A6}']
    function GetNavigatorBounds: TRect;
    function GetNavigatorButtons: TcxCustomNavigatorButtons;
    function GetNavigatorCanvas: TCanvas;
    function GetNavigatorControl: TWinControl;
    function GetNavigatorFocused: Boolean;
    function GetNavigatorLookAndFeel: TcxLookAndFeel;
    function GetNavigatorOwner: TComponent;
    function GetNavigatorShowHint: Boolean;
    function GetNavigatorTabStop: Boolean;
    procedure NavigatorButtonsStateChanged;
    procedure RefreshNavigator;
  end;

  TcxNavigatorButton = class(TPersistent)
  private
    FEnabled: Boolean;
    FHint: string;
    FDefaultIndex: Integer;
    FImageIndex: Integer;
    FVisible: Boolean;
    FonClick: TNotifyEvent;

    FButtons: TcxCustomNavigatorButtons;

    function GetInternalImageIndex: Integer;
    function GetIternalImages: TCustomImageList;
    procedure SetEnabled(Value: Boolean);
    procedure SetImageIndex(Value: Integer);
    procedure SetVisible(const Value: Boolean);
  protected
    function  GetOwner: TPersistent; override;
    function GetInternalEnabled: Boolean;
    function GetInternalHint: string;
    procedure DoClick; dynamic;

    function GetNavigator: IcxNavigatorOwner;

    property DefaultIndex: Integer read FDefaultIndex write FDefaultIndex;
    property InternalImageIndex: Integer read GetInternalImageIndex;
    property InternalImages: TCustomImageList read GetIternalImages;
  public
    constructor Create(AButtons: TcxCustomNavigatorButtons);
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
    procedure Click;
    function GetImageSize: TSize;

    property Buttons: TcxCustomNavigatorButtons read FButtons;
    property Navigator: IcxNavigatorOwner read GetNavigator;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Hint: string read FHint write FHint;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

  TcxCustomNavigator = class;

  TcxNavigatorButtonClickEvent = procedure(Sender: TObject; AButtonIndex: Integer;
    var ADone: Boolean) of object;

  TcxCustomNavigatorButtons = class(TPersistent)
  private
    FNavigator: IcxNavigatorOwner;
    FButtons: array [0 .. NavigatorButtonCount - 1] of TcxNavigatorButton;
    FImages: TCustomImageList;
    FImageChangeLink: TChangeLink;
    FConfirmDelete: Boolean;
    FOnButtonClick: TcxNavigatorButtonClickEvent;

    function GetButton(Index: Integer): TcxNavigatorButton;
    function GetButtonCount: Integer;
    function GetDefaultImages: TCustomImageList;
    procedure SetButton(Index: Integer; const Value: TcxNavigatorButton);
    procedure SetImages(const Value: TCustomImageList);

    procedure ImageListChange(Sender: TObject);
  protected
    function  GetOwner: TPersistent; override;
    procedure CreateButtons; virtual;
    procedure DestroyButtons; virtual;

    procedure DoButtonClick(ADefaultIndex: Integer); virtual;
    function GetButtonEnabled(ADefaultIndex: Integer): Boolean; virtual;
    function GetButtonHint(ADefaultIndex: Integer): string; virtual;
    function GetButtonImageOffset: Integer; virtual;
    function IsNavigatorEnabled: Boolean;

    property ConfirmDelete: Boolean read FConfirmDelete write FConfirmDelete default True;
    property Images: TCustomImageList read FImages write SetImages;

    property First: TcxNavigatorButton index NBDI_FIRST read GetButton write SetButton;
    property PriorPage: TcxNavigatorButton index NBDI_PRIORPAGE read GetButton write SetButton;
    property Prior: TcxNavigatorButton index NBDI_PRIOR read GetButton write SetButton;
    property Next: TcxNavigatorButton index NBDI_NEXT read GetButton write SetButton;
    property NextPage: TcxNavigatorButton index NBDI_NEXTPAGE read GetButton write SetButton;
    property Last: TcxNavigatorButton index NBDI_LAST read GetButton write SetButton;
    property Insert: TcxNavigatorButton index NBDI_INSERT read GetButton write SetButton;
    property Delete: TcxNavigatorButton index NBDI_DELETE read GetButton write SetButton;
    property Edit: TcxNavigatorButton index NBDI_EDIT read GetButton write SetButton;
    property Post: TcxNavigatorButton index NBDI_POST read GetButton write SetButton;
    property Cancel: TcxNavigatorButton index NBDI_CANCEL read GetButton write SetButton;
    property Refresh: TcxNavigatorButton index NBDI_REFRESH read GetButton write SetButton;
    property SaveBookmark: TcxNavigatorButton index NBDI_SAVEBOOKMARK read GetButton write SetButton;
    property GotoBookmark: TcxNavigatorButton index NBDI_GOTOBOOKMARK read GetButton write SetButton;
    property Filter: TcxNavigatorButton index NBDI_FILTER read GetButton write SetButton;
  public
    constructor Create(ANavigator: IcxNavigatorOwner); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure ClickButton(Index: Integer);
    procedure ReleaseBookmark; virtual;

    property ButtonCount: Integer read GetButtonCount;
    property Buttons[Index: Integer]: TcxNavigatorButton read GetButton; default;
    property DefaultImages: TCustomImageList read GetDefaultImages;
    property Navigator: IcxNavigatorOwner read FNavigator;
  published
    property OnButtonClick: TcxNavigatorButtonClickEvent read FOnButtonClick
      write FOnButtonClick;
  end;

  PcxNavigatorButtonViewInfo = ^TcxNavigatorButtonViewInfo;
  TcxNavigatorButtonViewInfo = record
    Button: TcxNavigatorButton;
    Bounds: TRect;
    Enabled: Boolean;
    Hint: string;
  end;

  TcxNavigatorViewInfo = class
  private
    FButtonPressTimer: TTimer;
    FButtons: TList;
    FCanvas: TcxCanvas;
    FFocusedButton: TcxNavigatorButton;
    FHintTimer: TTimer;
    FHintWindow: THintWindow;
    FHintWindowShowing: Boolean;
    FHotTrackButtonViewInfo: PcxNavigatorButtonViewInfo;
    FIsDirty: Boolean;
    FIsInplace: Boolean;
    FIsSelected: Boolean;
    FNavigator: IcxNavigatorOwner;
    FPressedButtonViewInfo: PcxNavigatorButtonViewInfo;

    function GetButton(Index: Integer): PcxNavigatorButtonViewInfo;
    function GetButtonCount: Integer;
    function GetFocusedButton: PcxNavigatorButtonViewInfo;
    procedure SetFocusedButton(Value: PcxNavigatorButtonViewInfo);

    procedure DoButtonPressTimer(Sender: TObject);
    procedure DoHintTimer(Sender: TObject);

    procedure UpdateSelected;
  protected
    function GetButtonBorderExtent(APainter: TcxCustomLookAndFeelPainterClass;
      AButtonIndex, AButtonCount: Integer): TRect;
    function GetButtonState(AButton: PcxNavigatorButtonViewInfo): TcxButtonState;
    function GetMinButtonSize(AButtonIndex, AButtonCount: Integer): TSize;
    function GetVisibleButtonCount: Integer;
    procedure InvalidateButton(AButton: PcxNavigatorButtonViewInfo);
    procedure PaintButton(AButtonIndex: Integer);
    procedure HintActivate(AShow: Boolean);

    property Canvas: TcxCanvas read FCanvas;
    property FocusedButton: PcxNavigatorButtonViewInfo read GetFocusedButton
      write SetFocusedButton;
    property HotTrackButtonViewInfo: PcxNavigatorButtonViewInfo
      read FHotTrackButtonViewInfo write FHotTrackButtonViewInfo;
    property Navigator: IcxNavigatorOwner read FNavigator;
    property PressedButtonViewInfo: PcxNavigatorButtonViewInfo
      read FPressedButtonViewInfo write FPressedButtonViewInfo;
  public
    constructor Create(ANavigator: IcxNavigatorOwner; AIsInplace: Boolean = True);
    destructor Destroy; override;
    procedure Calculate;
    procedure CheckSize(var AWidth, AHeight: Integer);
    procedure Clear;
    procedure DoEnter;
    procedure DoExit;
    function GetButtonAt(const pt: TPoint): TcxNavigatorButton;
    function GetButtonViewInfoAt(const pt: TPoint): PcxNavigatorButtonViewInfo;
    function GetButtonViewInfoByButton(AButton: TcxNavigatorButton): PcxNavigatorButtonViewInfo;
    procedure MakeIsDirty;
    procedure MouseDown(X, Y: Integer);
    procedure MouseMove(X, Y: Integer);
    procedure MouseUp(X, Y: Integer);
    procedure Paint;
    procedure PressArrowKey(ALeftKey: Boolean);
    procedure UpdateButtonsEnabled;

    property ButtonCount: Integer read GetButtonCount;
    property Buttons[Index: Integer]: PcxNavigatorButtonViewInfo read GetButton;
  end;

  TcxNavigatorViewInfoClass = class of TcxNavigatorViewInfo;

  TcxCustomNavigator = class(TcxControl, IcxNavigatorOwner, IcxMouseTrackingCaller)
  private
    FButtons: TcxCustomNavigatorButtons;
    FButtonsEvents: TNotifyEvent;
    FMouseInControl: Boolean;
    FViewInfo: TcxNavigatorViewInfo;
  {$IFDEF VCL}
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
  {$ENDIF}
  protected
    function CanFocusOnClick: Boolean; override;
    function CreateButtons: TcxCustomNavigatorButtons; virtual;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure EnabledChanged; {$IFDEF VCL}dynamic;{$ELSE}override;{$ENDIF}
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseEnter(AControl: TControl); override;
    procedure MouseLeave(AControl: TControl); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    //IcxMouseTrackingCaller
    procedure IcxMouseTrackingCaller.MouseLeave = NavigatorMouseLeave;
    procedure NavigatorMouseLeave;
   // IcxNavigatorOwner
    function GetNavigatorBounds: TRect;
    function GetNavigatorButtons: TcxCustomNavigatorButtons;
    function GetNavigatorCanvas: TCanvas;
    function GetNavigatorControl: TWinControl;
    function GetNavigatorFocused: Boolean;
    function GetNavigatorLookAndFeel: TcxLookAndFeel;
    function GetNavigatorOwner: TComponent;
    function GetNavigatorShowHint: Boolean;
    function GetNavigatorTabStop: Boolean;
    function GetViewInfoClass: TcxNavigatorViewInfoClass; virtual;
    procedure NavigatorButtonsStateChanged;
    procedure RefreshNavigator;
{$IFDEF VCL}
    procedure CreateWnd; override;
    procedure WndProc(var Message: TMessage); override;
{$ELSE}
    procedure CreateWidget; override;
{$ENDIF}
    property CustomButtons: TcxCustomNavigatorButtons read FButtons;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure ClickButton(Index: Integer);
  published
    property TabStop default False;
    property ButtonsEvents: TNotifyEvent read FButtonsEvents write FButtonsEvents;
  end;

  TcxNavigatorControlNotifier = class
  private
    FList: TList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddNavigator(ANavigator: IcxNavigatorOwner);
    procedure RemoveNavigator(ANavigator: IcxNavigatorOwner);
    procedure RefreshNavigatorButtons;
  end;

  IcxNavigator = interface
  ['{A15F80CA-DE56-47CB-B0EB-035D0BF90E9D}']
    function CanDelete: Boolean;
    function CanEdit: Boolean;
    function CanInsert: Boolean;
    function IsBof: Boolean;
    function IsBookmarkAvailable: Boolean;
    function IsEditing: Boolean;
    function IsEof: Boolean;
    procedure ClearBookmark;
    procedure DoAction(AButtonIndex: Integer);
    function GetNotifier: TcxNavigatorControlNotifier;
    function IsActionSupported(AButtonIndex: Integer): Boolean;
  end;

  TcxNavigatorControlButtonsGetControl = function: IcxNavigator of object;

  TcxNavigatorControlButtons = class(TcxCustomNavigatorButtons)
  private
    FOnGetControl: TcxNavigatorControlButtonsGetControl;

    function GetControl: IcxNavigator;
  protected
    procedure DoButtonClick(ADefaultIndex: Integer); override;
    function GetButtonEnabled(ADefaultIndex: Integer): Boolean; override;

    property Control: IcxNavigator read GetControl;
  public
    procedure ReleaseBookmark; override;
    property OnGetControl: TcxNavigatorControlButtonsGetControl
      read FOnGetControl write FOnGetControl;
  published
    property ConfirmDelete;
    property Images;

    property First;
    property PriorPage;
    property Prior;
    property Next;
    property NextPage;
    property Last;
    property Insert;
    property Delete;
    property Edit;
    property Post;
    property Cancel;
    property Refresh;
    property SaveBookmark;
    property GotoBookmark;
    property Filter;
  end;

  TcxNavigatorControlButtonsClass = class of TcxNavigatorControlButtons;

  TcxCustomNavigatorControl = class(TcxCustomNavigator)
  private
    FControl: TComponent;

    function GetButtons: TcxNavigatorControlButtons;
    function GetControl: IcxNavigator;
    procedure SetButtons(Value: TcxNavigatorControlButtons);
    procedure SetControl(Value: TComponent);
  protected
    function CreateButtons: TcxCustomNavigatorButtons; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure InitButtons; virtual;
    property Buttons: TcxNavigatorControlButtons read GetButtons write SetButtons;
    property Control: TComponent read FControl write SetControl;
  public
    destructor Destroy; override;
  end;

  TcxNavigator = class(TcxCustomNavigatorControl)
  published
    property Control;
    property Buttons;
    property LookAndFeel;

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
    property Ctl3D;
    property ParentCtl3D;
{$ENDIF}
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
{$IFDEF VCL}
    property OnEndDock;
{$ENDIF}
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnResize;
{$IFDEF VCL}
    property OnStartDock;
{$ENDIF}
    property OnStartDrag;
  end;

implementation

{$R cxNavigator.res}

uses
{$IFDEF VCL}
  dxThemeConsts, dxUxTheme,
{$ENDIF}
  cxContainer, cxEditPaintUtils, cxEditUtils;

const
  cxInitRepeatPause = 400;
  cxRepeatPause = 100;

var
  FNavigatorImages: TImageList = nil;

{ TcxNavigatorButton }

constructor TcxNavigatorButton.Create(AButtons: TcxCustomNavigatorButtons);
begin
  inherited Create;
  FButtons := AButtons;
  FImageIndex := -1;
  FDefaultIndex := -1;
  FVisible := True;
  FEnabled := True;
end;

destructor TcxNavigatorButton.Destroy;
begin
  inherited Destroy;
end;

function  TcxNavigatorButton.GetOwner: TPersistent;
begin
  Result := FButtons;
end;

procedure TcxNavigatorButton.Assign(Source: TPersistent);
begin
  if Source is TcxNavigatorButton then
    with Source as TcxNavigatorButton do
    begin
      Self.Enabled := Enabled;
      Self.Hint := Hint;
      Self.ImageIndex  := ImageIndex;
      Self.Visible := Visible;
      Self.OnClick := OnClick;
    end
  else
    inherited Assign(Source);
end;

procedure TcxNavigatorButton.Click;
begin
  if GetInternalEnabled then
    DoClick;
end;

function TcxNavigatorButton.GetInternalEnabled: Boolean;
begin
  Result := Enabled;
  if Result then
    Result := Buttons.GetButtonEnabled(DefaultIndex);
end;

function TcxNavigatorButton.GetInternalHint: string;
begin
  Result := Hint;
  if Hint = '' then
    Result := Buttons.GetButtonHint(DefaultIndex);
end;


procedure TcxNavigatorButton.DoClick;
var
  ADone: Boolean;
begin
  if Assigned(OnClick) then
    OnClick(Self)
  else
  begin
    ADone := False;
    if Assigned(Buttons.FOnButtonClick) then
      Buttons.FOnButtonClick(Buttons, DefaultIndex, ADone);
    if not ADone then
      Buttons.DoButtonClick(DefaultIndex);
  end;
end;

function TcxNavigatorButton.GetImageSize: TSize;
begin
  Result.cx := InternalImages.Width;
  Result.cy := InternalImages.Height;
end;

function TcxNavigatorButton.GetNavigator: IcxNavigatorOwner;
begin
  Result := Buttons.Navigator;
end;

procedure TcxNavigatorButton.SetEnabled(Value: Boolean);
begin
  if Enabled <> Value then
  begin
    FEnabled := Value;
    if Visible then
      Navigator.RefreshNavigator;
  end;
end;

function TcxNavigatorButton.GetInternalImageIndex: Integer;
begin
  if (Buttons.Images <> nil) and (ImageIndex > -1) then
    Result := ImageIndex
  else Result := DefaultIndex;
end;

function TcxNavigatorButton.GetIternalImages: TCustomImageList;
begin
  if (Buttons.Images <> nil) and (ImageIndex > -1) then
    Result := Buttons.Images
  else Result := Buttons.DefaultImages;
end;

procedure TcxNavigatorButton.SetImageIndex(Value: Integer);
begin
  if ImageIndex <> Value then
  begin
    FImageIndex := Value;
    if Visible then
      Navigator.RefreshNavigator;
  end;
end;

procedure TcxNavigatorButton.SetVisible(const Value: Boolean);
begin
  if Visible <> Value then
  begin
    FVisible := Value;
    Navigator.RefreshNavigator;
  end;
end;

{ TcxCustomNavigatorButtons }

constructor TcxCustomNavigatorButtons.Create(ANavigator: IcxNavigatorOwner);
begin
  inherited Create;
  FNavigator := ANavigator;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  CreateButtons;
  FConfirmDelete := True;
end;

destructor TcxCustomNavigatorButtons.Destroy;
begin
  FreeAndNil(FImageChangeLink);
  DestroyButtons;
  inherited Destroy;
end;

procedure TcxCustomNavigatorButtons.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TcxCustomNavigatorButtons then
    with TcxCustomNavigatorButtons(Source) do
    begin
      for I := 0 to ButtonCount - 1 do
        Self.FButtons[I].Assign(FButtons[I]);
      Self.ConfirmDelete := ConfirmDelete;
      Self.Images := Images;
    end
  else
    inherited Assign(Source);
end;

procedure TcxCustomNavigatorButtons.ClickButton(Index: Integer);
begin
  Buttons[Index].Click;
end;

procedure TcxCustomNavigatorButtons.ReleaseBookmark;
begin
end;

procedure TcxCustomNavigatorButtons.CreateButtons;
var
  I: Integer;
begin
  for I := 0 to NavigatorButtonCount - 1 do
  begin
    FButtons[I] := TcxNavigatorButton.Create(Self);
    FButtons[I].DefaultIndex := I;
  end;  
end;

function  TcxCustomNavigatorButtons.GetOwner: TPersistent;
begin
  Result := FNavigator.GetNavigatorOwner;
end;

procedure TcxCustomNavigatorButtons.DestroyButtons;
var
  I: Integer;
begin
  for I := 0 to NavigatorButtonCount - 1 do
    FButtons[I].Free;
end;

procedure TcxCustomNavigatorButtons.DoButtonClick(ADefaultIndex: Integer);
begin
end;

function TcxCustomNavigatorButtons.GetButtonEnabled(ADefaultIndex: Integer): Boolean;
begin
  Result := IsNavigatorEnabled;
end;

function TcxCustomNavigatorButtons.GetButtonHint(ADefaultIndex: Integer): string;
begin
  case ADefaultIndex of
    NBDI_FIRST: Result := cxGetResourceString(@cxNavigatorHint_First);
    NBDI_PRIORPAGE: Result := cxGetResourceString(@cxNavigatorHint_PriorPage);
    NBDI_PRIOR: Result := cxGetResourceString(@cxNavigatorHint_Prior);
    NBDI_LAST: Result := cxGetResourceString(@cxNavigatorHint_Last);
    NBDI_NEXT: Result := cxGetResourceString(@cxNavigatorHint_Next);
    NBDI_NEXTPAGE: Result := cxGetResourceString(@cxNavigatorHint_NextPage);
    NBDI_INSERT: Result := cxGetResourceString(@cxNavigatorHint_Insert);
    NBDI_DELETE: Result := cxGetResourceString(@cxNavigatorHint_Delete);
    NBDI_EDIT: Result := cxGetResourceString(@cxNavigatorHint_Edit);
    NBDI_POST: Result := cxGetResourceString(@cxNavigatorHint_Post);
    NBDI_CANCEL: Result := cxGetResourceString(@cxNavigatorHint_Cancel);
    NBDI_REFRESH: Result := cxGetResourceString(@cxNavigatorHint_Refresh);
    NBDI_SAVEBOOKMARK: Result := cxGetResourceString(@cxNavigatorHint_SaveBookmark);
    NBDI_GOTOBOOKMARK: Result := cxGetResourceString(@cxNavigatorHint_GotoBookmark);
    NBDI_FILTER: Result := cxGetResourceString(@cxNavigatorHint_Filter);
    else Result := '';
  end;
end;

function TcxCustomNavigatorButtons.GetButtonImageOffset: Integer;
begin
  Result := 2;
end;

function TcxCustomNavigatorButtons.IsNavigatorEnabled: Boolean;
begin
  Result := Navigator.GetNavigatorControl.Enabled;
end;

function TcxCustomNavigatorButtons.GetButton(Index: Integer): TcxNavigatorButton;
begin
  Result := FButtons[Index];
end;

function TcxCustomNavigatorButtons.GetButtonCount: Integer;
begin
  Result := High(FButtons) - Low(FButtons) + 1;
end;

function TcxCustomNavigatorButtons.GetDefaultImages: TCustomImageList;

  procedure LoadImageListFromResource(AImageList: TCustomImageList;
    const AResName: string; AMaskColor: TColor);
{$IFNDEF VCL}
  var
    ABitmap: TBitmap;
    I: Integer;
{$ENDIF}
  begin
{$IFDEF VCL}
    AImageList.GetInstRes(HInstance, rtBitmap, AResName,
      AImageList.Width, [], AMaskColor);
{$ELSE}
    ABitmap := TBitmap.Create;
    try
      ABitmap.LoadFromResourceName(HInstance, AResName);
      with TImageList.CreateSize(AImageList.Width, AImageList.Height) do
      try
        Add(ABitmap, nil);
        for I := 0 to Count - 1 do
        begin
          GetBitmap(I, ABitmap);
          AImageList.AddMasked(ABitmap, AMaskColor);
        end;
      finally
        Free;
      end;
    finally
      ABitmap.Free;
    end;
{$ENDIF}
  end;

begin
  if FNavigatorImages = nil then
  begin
    FNavigatorImages := TImageList.Create(nil);
    FNavigatorImages.Height := 11;
    FNavigatorImages.Width := 12;
    LoadImageListFromResource(FNavigatorImages, 'CXNAVIGATORBUTTONS', {$IFDEF VCL}clOlive{$ELSE}clDefault{$ENDIF});
  end;
  Result := FNavigatorImages;
end;

procedure TcxCustomNavigatorButtons.SetButton(Index: Integer; const Value: TcxNavigatorButton);
begin
  FButtons[Index].Assign(Value);
end;

procedure TcxCustomNavigatorButtons.SetImages(const Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Navigator.GetNavigatorOwner);
  end;
  Navigator.RefreshNavigator;
end;

procedure TcxCustomNavigatorButtons.ImageListChange(Sender: TObject);
begin
  Navigator.RefreshNavigator;
end;

{ TcxNavigatorViewInfo }

constructor TcxNavigatorViewInfo.Create(ANavigator: IcxNavigatorOwner;
  AIsInplace: Boolean = True);
begin
  FNavigator := ANavigator;
  FIsDirty := True;
  FIsInplace := AIsInplace;
  FButtons := TList.Create;
  FHintWindowShowing := False;
  FButtonPressTimer := TTimer.Create(nil);
  FButtonPressTimer.OnTimer := DoButtonPressTimer;
  FButtonPressTimer.Enabled := False;
  FHintTimer := TTimer.Create(nil);
  FHintTimer.Interval := 500;
  FHintTimer.OnTimer := DoHintTimer;
  FHintTimer.Enabled := False;
  FCanvas := TcxCanvas.Create(nil);
end;

destructor TcxNavigatorViewInfo.Destroy;
begin
  FreeAndNil(FCanvas);
  FreeAndNil(FHintTimer);
  FreeAndNil(FButtonPressTimer);
  FreeAndNil(FHintWindow);
  Clear;
  FreeAndNil(FButtons);
  inherited Destroy;
end;

procedure TcxNavigatorViewInfo.Calculate;
var
  AHeight, AWidth: Integer;
  I: Integer;
  ANavigatorBounds: TRect;
begin
  ANavigatorBounds := Navigator.GetNavigatorBounds;
  with ANavigatorBounds do
  begin
    AWidth := Right - Left;
    AHeight := Bottom - Top;
  end;
  CheckSize(AWidth, AHeight);
  for I := 0 to ButtonCount - 1 do
  begin
    Buttons[I].Enabled := Buttons[I].Button.GetInternalEnabled;
    Buttons[I].Hint := Buttons[I].Button.GetInternalHint;
  end;
  FIsDirty := False;
end;

procedure TcxNavigatorViewInfo.CheckSize(var AWidth, AHeight: Integer);

  procedure CheckButtonCount;
  var
    APButtonViewInfo: PcxNavigatorButtonViewInfo;
    AVisibleButtonCount, I: Integer;
  begin
    AVisibleButtonCount := GetVisibleButtonCount;
    if AVisibleButtonCount < FButtons.Count then
      for I := 1 to FButtons.Count - AVisibleButtonCount do
      begin
        Dispose(PcxNavigatorButtonViewInfo(FButtons[AVisibleButtonCount]));
        FButtons.Delete(AVisibleButtonCount);
      end
    else
      for I := FButtons.Count to AVisibleButtonCount - 1 do
      begin
        New(APButtonViewInfo);
        FButtons.Add(APButtonViewInfo);
      end;
  end;

var
  AButtonViewInfo: PcxNavigatorButtonViewInfo;
  AButtonVisibleIndex: Integer;
  AMinWidth, AMinHeight, ADifX: Integer;
  AMinSize: TSize;
  ANavigatorBounds: TRect;
  ANavigatorButtons: TcxCustomNavigatorButtons;
  AVisibleButtonCount: Integer;
  I: Integer;
begin
  ANavigatorBounds := Navigator.GetNavigatorBounds;
  with ANavigatorBounds do
  begin
    AWidth := Right - Left;
    AHeight := Bottom - Top;
  end;

  FIsDirty := True;
  FHotTrackButtonViewInfo := nil;
  FPressedButtonViewInfo := nil;

  AMinWidth := 0;
  AMinHeight := 0;
  ANavigatorButtons := Navigator.GetNavigatorButtons;
  AVisibleButtonCount := GetVisibleButtonCount;
  CheckButtonCount;
  AButtonVisibleIndex := 0;
  for I := 0 to  ANavigatorButtons.ButtonCount - 1 do
    if ANavigatorButtons[I].Visible then
    begin
      AButtonViewInfo := PcxNavigatorButtonViewInfo(FButtons[AButtonVisibleIndex]);
      AButtonViewInfo.Button := ANavigatorButtons[I];
      AMinSize := GetMinButtonSize(AButtonVisibleIndex, AVisibleButtonCount);
      Inc(AMinWidth, AMinSize.cx);
      if AMinHeight < AMinSize.cy then
        AMinHeight := AMinSize.cy;
      Inc(AButtonVisibleIndex);
    end;
  ADifX := 0;
  if AHeight < AMinHeight then
    AHeight := AMinHeight;
  if AWidth < AMinWidth then
    AWidth := AMinWidth
  else
  begin
    if ButtonCount > 0 then
      ADifX := (AWidth - AMinWidth) div ButtonCount;
    AWidth := AMinWidth + ADifX * ButtonCount;
  end;
  AMinWidth := ANavigatorBounds.Left;
  for I := 0 to ButtonCount - 1 do
  begin
    with Buttons[I]^.Bounds do
    begin
      Left := AMinWidth;
      Top := ANavigatorBounds.Top;
      Right := Left + GetMinButtonSize(I, AVisibleButtonCount).cx + ADifX;
      AMinWidth := Right;
      Bottom := Top + AHeight;
    end;
  end;
end;

procedure TcxNavigatorViewInfo.Clear;
var
  I: Integer;
begin
  FIsDirty := True;
  FHotTrackButtonViewInfo := nil;
  FPressedButtonViewInfo := nil;
  for I := 0 to ButtonCount - 1 do
    Dispose(PcxNavigatorButtonViewInfo(FButtons[I]));
  FButtons.Clear;
end;

procedure TcxNavigatorViewInfo.DoEnter;
begin
  InvalidateButton(FocusedButton);
  UpdateSelected;
end;

procedure TcxNavigatorViewInfo.DoExit;
begin
  InvalidateButton(FocusedButton);
  UpdateSelected;
end;

function TcxNavigatorViewInfo.GetButtonAt(const pt: TPoint): TcxNavigatorButton;
var
  AViewInfo: PcxNavigatorButtonViewInfo;
begin
  AViewInfo := GetButtonViewInfoAt(pt);
  if AViewInfo <> nil then
    Result := AViewInfo.Button
  else Result := nil;
end;

function TcxNavigatorViewInfo.GetButtonViewInfoAt(const pt: TPoint): PcxNavigatorButtonViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ButtonCount - 1 do
    if PtInRect(Buttons[I].Bounds, pt) then
    begin
      Result := Buttons[I];
      Break;
    end;
end;

function TcxNavigatorViewInfo.GetButtonViewInfoByButton(AButton: TcxNavigatorButton): PcxNavigatorButtonViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ButtonCount - 1 do
    if Buttons[I].Button = AButton then
    begin
      Result := Buttons[I];
      break;
    end;
end;

procedure TcxNavigatorViewInfo.MakeIsDirty;
begin
  FIsDirty := True;
end;

procedure TcxNavigatorViewInfo.MouseDown(X, Y: Integer);
var
  AButtonViewInfo: PcxNavigatorButtonViewInfo;
begin
  FHintTimer.Enabled := False;
  HintActivate(False);
  AButtonViewInfo := GetButtonViewInfoAt(Point(X, Y));
  if (AButtonViewInfo <> nil)
    and (GetButtonState(AButtonViewInfo) <> cxbsDisabled)  then
  begin
    FButtonPressTimer.Interval := cxInitRepeatPause;
    FButtonPressTimer.Enabled := True;
    PressedButtonViewInfo := AButtonViewInfo;
    FocusedButton := AButtonViewInfo;
    InvalidateButton(PressedButtonViewInfo);
  end;
  UpdateSelected;
end;

procedure TcxNavigatorViewInfo.MouseMove(X, Y: Integer);
var
  AButtonViewInfo: PcxNavigatorButtonViewInfo;
begin
  AButtonViewInfo := GetButtonViewInfoAt(Point(X, Y));
  if AButtonViewInfo <> HotTrackButtonViewInfo then
  begin
    if (HotTrackButtonViewInfo <> nil)
      and (GetButtonState(HotTrackButtonViewInfo) <> cxbsDisabled) then
      InvalidateButton(HotTrackButtonViewInfo);
    FHotTrackButtonViewInfo := AButtonViewInfo;
    if (HotTrackButtonViewInfo <> nil)
      and (GetButtonState(HotTrackButtonViewInfo) <> cxbsDisabled) then
      InvalidateButton(HotTrackButtonViewInfo);
    if FHintWindowShowing then
      HintActivate(True)
    else FHintTimer.Enabled := True;
  end;
  if HotTrackButtonViewInfo = nil then
    HintActivate(False);
  UpdateSelected;
end;

procedure TcxNavigatorViewInfo.MouseUp(X, Y: Integer);
var
  AButtonViewInfo: PcxNavigatorButtonViewInfo;
begin
  FButtonPressTimer.Enabled := False;
  AButtonViewInfo := PressedButtonViewInfo;
  FPressedButtonViewInfo := nil;
  InvalidateButton(AButtonViewInfo);
  FHintTimer.Enabled := True;
  UpdateSelected;
  if AButtonViewInfo <> nil then
    AButtonViewInfo.Button.DoClick;
end;

procedure TcxNavigatorViewInfo.Paint;

  function GetBorderColor: TColor;
  var
    ANavigatorControl: TWinControl;
  begin
    ANavigatorControl := Navigator.GetNavigatorControl;
    if FIsInplace and ANavigatorControl.Enabled then
      Result := clBtnText
    else
      if FIsSelected or (not FIsInplace and
          (csDesigning in ANavigatorControl.ComponentState) and ANavigatorControl.Enabled) then
        Result := clHighlight
      else
        Result := clBtnShadow;
  end;

var
  R: TRect;
  I: Integer;
begin
  FCanvas.Canvas := Navigator.GetNavigatorCanvas;
{$IFNDEF VCL}
  Canvas.Canvas.Start;
  try
{$ENDIF}
    if FIsDirty then
      Calculate;
    for I := 0 to ButtonCount - 1 do
      PaintButton(I);
    R := Navigator.GetNavigatorBounds;
    if Navigator.GetNavigatorLookAndFeel.GetAvailablePainter({$IFDEF VCL}[totButton]{$ENDIF}) =
        TcxUltraFlatLookAndFeelPainter then
      Canvas.FrameRect(R, GetBorderColor);
    if FIsInplace then
      Canvas.ExcludeClipRect(R);
{$IFNDEF VCL}
  finally
    Canvas.Canvas.Stop;
  end;
{$ENDIF}
end;

procedure TcxNavigatorViewInfo.PressArrowKey(ALeftKey: Boolean);
var
  AIndex: Integer;
begin
  AIndex := FButtons.IndexOf(FocusedButton);
  if AIndex < 0 then exit;
  if ALeftKey then
  begin
    if AIndex > 0 then
      FocusedButton := Buttons[AIndex - 1];
  end else
  begin
    if AIndex < ButtonCount - 1 then
      FocusedButton := Buttons[AIndex + 1];
  end;
end;

procedure TcxNavigatorViewInfo.UpdateButtonsEnabled;
var
  I: Integer;
begin
  for I := 0 to ButtonCount - 1 do
    if Buttons[I].Enabled <> Buttons[I].Button.GetInternalEnabled then
    begin
      Buttons[I].Enabled := not Buttons[I].Enabled;
      InvalidateButton(Buttons[I]);
    end;
end;


procedure TcxNavigatorViewInfo.InvalidateButton(AButton: PcxNavigatorButtonViewInfo);
var
  ANavigatorControl: TWinControl;
begin
  if AButton <> nil then
  begin
    ANavigatorControl := Navigator.GetNavigatorControl;
    if ANavigatorControl.HandleAllocated then
{$IFDEF VCL}
      Windows.InvalidateRect(ANavigatorControl.Handle, @(AButton^.Bounds), False);
{$ELSE}
      ANavigatorControl.InvalidateRect(AButton^.Bounds, False);
{$ENDIF}
  end;
end;

procedure TcxNavigatorViewInfo.PaintButton(AButtonIndex: Integer);
var
  AButton: PcxNavigatorButtonViewInfo;
  AButtonBorderExtent, AButtonBounds: TRect;
  AButtonState: TcxButtonState;
  AImageRect: TRect;
  AImageSize: TSize;
  APainter: TcxCustomLookAndFeelPainterClass;
  AStretchedImageDrawing: Boolean;
  R: TRect;
{$IFDEF VCL}
  ABackgroundBitmap: TBitmap;
  AButtonNativeState: Integer;
  ATheme: TTheme;
  R1, R2: TRect;
{$ENDIF}
begin
  AButton := PcxNavigatorButtonViewInfo(FButtons[AButtonIndex]);
  AButtonBounds := AButton.Bounds;
  if not Canvas.RectVisible(AButtonBounds) then
    Exit;
  AButtonState := GetButtonState(AButton);
  APainter := Navigator.GetNavigatorLookAndFeel.GetAvailablePainter({$IFDEF VCL}[totButton]{$ENDIF});
{$IFDEF VCL}
  if APainter = TcxWinXPLookAndFeelPainter then
  begin
    ATheme := OpenTheme(totButton);
    if IsThemeBackgroundPartiallyTransparent(ATheme, BP_PUSHBUTTON,
        BtnStateToXPBtnState(AButtonState)) then
      InflateRect(AButtonBounds, 1, 1);
  end;
{$ENDIF}
  R := AButtonBounds;
  AImageSize := AButton.Button.GetImageSize;
  AButtonBorderExtent := GetButtonBorderExtent(APainter, AButtonIndex, FButtons.Count);
  with AButtonBounds do
  begin
    AStretchedImageDrawing :=
      (Right - Left - 1 - AButtonBorderExtent.Left - AButtonBorderExtent.Right < AImageSize.cx) or
      (Bottom - Top - 1 - AButtonBorderExtent.Top - AButtonBorderExtent.Bottom < AImageSize.cy);
    if AStretchedImageDrawing then
      AImageRect := Rect(Left + AButtonBorderExtent.Left, Top + AButtonBorderExtent.Top,
        Right - AButtonBorderExtent.Right - 1, Bottom - AButtonBorderExtent.Bottom - 1)
    else
    begin
      AImageRect.Left := Left + (Right - Left - AImageSize.cx) div 2;
      AImageRect.Top := Top + (Bottom - Top - AImageSize.cy) div 2;
      AImageRect.Right := AImageRect.Left + AImageSize.cx;
      AImageRect.Bottom := AImageRect.Top + AImageSize.cy;
    end;
    if GetButtonState(AButton) = cxbsPressed then
      OffsetRect(AImageRect, 1, 1);
  end;

{$IFDEF VCL}
  if APainter = TcxWinXPLookAndFeelPainter then
  begin
    ABackgroundBitmap := TBitmap.Create;
    try
      ATheme := OpenTheme(totButton);
      AButtonNativeState := BtnStateToXPBtnState(AButtonState);
      ABackgroundBitmap.Width := AImageSize.cx;
      ABackgroundBitmap.Height := AImageSize.cy;
      with AButtonBounds do
        R1 := Rect(0, 0, Right - Left, Bottom - Top);
      OffsetRect(R1, AButtonBounds.Left - AImageRect.Left, AButtonBounds.Top - AImageRect.Top);
      R2 := Rect(0, 0, AImageSize.cx, AImageSize.cy);
      DrawThemeBackground(ATheme, ABackgroundBitmap.Canvas.Handle, BP_PUSHBUTTON,
        AButtonNativeState, @R1, @R2);
      if IsThemeBackgroundPartiallyTransparent(ATheme, BP_PUSHBUTTON, AButtonNativeState) then
        if FIsInplace then
          cxEditFillRect(Canvas.Handle, AButtonBounds, GetSolidBrush(Canvas, clWindow))
        else
          DrawThemeParentBackground(Navigator.GetNavigatorControl.Handle, Canvas.Handle, @AButtonBounds);
      DrawGlyph(Canvas, AButton.Button.InternalImages,
        AButton.Button.InternalImageIndex, AImageRect, APainter.ButtonColor(AButtonState),
        AButtonState <> cxbsDisabled, ABackgroundBitmap);
    finally
      FreeAndNil(ABackgroundBitmap);
    end;
  end
  else
{$ENDIF}
    DrawGlyph(Canvas, AButton.Button.InternalImages,
      AButton.Button.InternalImageIndex, AImageRect,
      APainter.ButtonColor(AButtonState), AButtonState <> cxbsDisabled);
  if Navigator.GetNavigatorTabStop and (AButton = FocusedButton) and Navigator.GetNavigatorFocused then
    Canvas.DrawFocusRect(AImageRect);
  Canvas.ExcludeClipRect(AImageRect);
  APainter.DrawGroupButton(Canvas, R, AButtonState, FButtons.Count,
    AButtonIndex, clWindow);
{$IFDEF VCL}
  if APainter = TcxWinXPLookAndFeelPainter then
    Canvas.ExcludeClipRect(AButton.Bounds);
{$ENDIF}
end;

procedure TcxNavigatorViewInfo.HintActivate(AShow: Boolean);

  function FindScanline(P: Pointer {EAX}; AMaxLen: Cardinal{EDX};
    AValue: Cardinal{ECX}): Cardinal; assembler;
  asm
    PUSH    EDI
    MOV     EDI, EAX
    MOV     EAX, ECX
    MOV     ECX,EDX
    REPE    SCASB
    MOV     EAX,ECX
    POP     EDI
  end;

  function GetCursorHeightMargin: Integer;
{$IFDEF VCL}
  var
    ACursorIconInfo: TIconInfo;
    ABitmapInfoHeaderSize, ABitmapImageSize, AImageSize: DWORD;
    ABitmap: PBitmapInfoHeader;
    ABitmapImage: Pointer;
    ABytesPerLine: Integer;
  begin
    Result := GetSystemMetrics(SM_CYCURSOR);
    if GetIconInfo(GetCursor, ACursorIconInfo) then
    try
      GetDIBSizes(ACursorIconInfo.hbmMask, ABitmapInfoHeaderSize, ABitmapImageSize);
      ABitmap := AllocMem(DWORD(ABitmapInfoHeaderSize) + ABitmapImageSize);
      try
        ABitmapImage := Pointer(DWORD(ABitmap) + ABitmapInfoHeaderSize);
        if GetDIB(ACursorIconInfo.hbmMask, 0, ABitmap^, ABitmapImage^) and
            (ABitmap^.biBitCount = 1) then
        begin
          with ABitmap^ do
          begin
            ABytesPerLine := ((biWidth * biBitCount + 31) and not 31) div 8;
            AImageSize := biWidth * ABytesPerLine;
            ABitmapImage := Pointer(DWORD(ABitmapImage) + ABitmapImageSize - AImageSize);
            Result := FindScanline(ABitmapImage, AImageSize, $FF);
            if (Result = 0) and (biHeight >= 2 * biWidth) then
              Result := FindScanline(Pointer(DWORD(ABitmapImage) - AImageSize),
                AImageSize, $00);
            Result := Result div ABytesPerLine;
          end;
          Dec(Result, ACursorIconInfo.yHotSpot);
        end;
      finally
        FreeMem(ABitmap, ABitmapInfoHeaderSize + ABitmapImageSize);
      end;
    finally
      if ACursorIconInfo.hbmColor <> 0 then DeleteObject(ACursorIconInfo.hbmColor);
      if ACursorIconInfo.hbmMask <> 0 then DeleteObject(ACursorIconInfo.hbmMask);
    end;
  end;
{$ELSE}
  const
    ADefaultCursorHeight = 20;
  var
    P: TPoint;
    ACurrentCursor: QCursorH;
    ACursorBitmap: QPixmapH;
  begin
    ACurrentCursor := Screen.Cursors[Screen.Cursor];
    QCursor_HotSpot(ACurrentCursor, @P);
    ACursorBitmap := QCursor_Bitmap(ACurrentCursor);
    if ACursorBitmap = nil then
      Result := ADefaultCursorHeight
    else Result := P.Y - QPixmap_height(ACursorBitmap);
  end;
{$ENDIF}

var
  AHint: string;
  AParentForm: TCustomForm;
  P: TPoint;
  R: TRect;
begin
  if FHintWindow <> nil then
  begin
    FHintWindow.Hide;
    {$IFDEF VCL}
    if IsWindowVisible(FHintWindow.Handle) then
     ShowWindow(FHintWindow.Handle, SW_HIDE);
    {$ENDIF}
    FreeAndNil(FHintWindow);
  end;
  FHintTimer.Enabled := False;
  FHintWindowShowing := False;
  if (HotTrackButtonViewInfo <> nil) then
    AHint := GetShortHint(HotTrackButtonViewInfo.Hint)
  else
    AHint := '';
  AParentForm := GetParentForm(Navigator.GetNavigatorControl);
  AShow := AShow and Navigator.GetNavigatorShowHint and (AHint <> '') and ((AParentForm = nil) or (not AParentForm.HandleAllocated) or {$IFDEF VCL}AParentForm.Active{$ELSE}QWidget_isActiveWindow(AParentForm.Handle){$ENDIF});
  if AShow then
  begin
    FHintWindow := HintWindowClass.Create(nil);
    P := InternalGetCursorPos;
    Inc(P.Y, GetCursorHeightMargin);
    R := FHintWindow.CalcHintRect(Screen.Width, AHint, nil);
    R := Rect(P.X, P.Y, P.X + R.Right, P.Y + R.Bottom - R.Top);
    FHintWindow.Color := Application.HintColor;
    FHintWindow.ActivateHint(R, AHint);
    FHintWindowShowing := True;
  end;
end;

function TcxNavigatorViewInfo.GetButton(Index: Integer): PcxNavigatorButtonViewInfo;
begin
  Result := PcxNavigatorButtonViewInfo(FButtons[Index]);
end;

function TcxNavigatorViewInfo.GetButtonCount: Integer;
begin
  Result := FButtons.Count;
end;

function TcxNavigatorViewInfo.GetFocusedButton: PcxNavigatorButtonViewInfo;
begin
  if (FFocusedButton <> nil) and not FFocusedButton.Visible then
    FFocusedButton := nil;
  if (FFocusedButton = nil) and (ButtonCount > 0) then
    FFocusedButton := Buttons[0].Button;
  if (FFocusedButton <> nil) then
    Result := GetButtonViewInfoByButton(FFocusedButton)
  else Result := nil;  
end;

procedure TcxNavigatorViewInfo.SetFocusedButton(Value: PcxNavigatorButtonViewInfo);
var
  AOldButtonViewInfo: PcxNavigatorButtonViewInfo;
begin
  AOldButtonViewInfo := GetFocusedButton;
  if AOldButtonViewInfo <> Value then
  begin
    FFocusedButton := Value.Button;
    InvalidateButton(AOldButtonViewInfo);
    InvalidateButton(Value);
  end;
end;

function TcxNavigatorViewInfo.GetButtonBorderExtent(APainter: TcxCustomLookAndFeelPainterClass;
  AButtonIndex, AButtonCount: Integer): TRect;
var
  AButtonBorderWidth: Integer;
{$IFDEF VCL}
  ATheme: TTheme;
  CR, R: TRect;
{$ENDIF}
begin
{$IFDEF VCL}
  if APainter = TcxWinXPLookAndFeelPainter then
  begin
    ATheme := OpenTheme(totButton);
    R := Rect(0, 0, 100, 100);
    GetThemeBackgroundContentRect(ATheme, Navigator.GetNavigatorCanvas.Handle,
      BP_PUSHBUTTON, PBS_NORMAL, @R, CR);
    Result := Rect(CR.Left, CR.Top, R.Right - CR.Right, R.Bottom - CR.Bottom);
    if IsThemeBackgroundPartiallyTransparent(ATheme, BP_PUSHBUTTON, PBS_NORMAL) then
      InflateRect(Result, 1, 1);
  end
  else
{$ENDIF}
    if APainter = TcxUltraFlatLookAndFeelPainter then
    begin
      Result := Rect(1, 2, 1, 2);
      if AButtonIndex = 0 then
        Inc(Result.Left)
      else
        if AButtonIndex = AButtonCount - 1 then
          Inc(Result.Right);
    end
    else
    begin
      AButtonBorderWidth := APainter.ButtonBorderSize;
      Result := Rect(AButtonBorderWidth, AButtonBorderWidth, AButtonBorderWidth,
        AButtonBorderWidth);
    end;
end;

function TcxNavigatorViewInfo.GetButtonState(AButton: PcxNavigatorButtonViewInfo): TcxButtonState;
begin
  Result := cxbsNormal;
  if not AButton^.Enabled then
    Result := cxbsDisabled
  else
    if (AButton = PressedButtonViewInfo)
      and (AButton = HotTrackButtonViewInfo) then
      Result := cxbsPressed
    else
      if AButton = HotTrackButtonViewInfo then
        Result := cxbsHot;
end;

function TcxNavigatorViewInfo.GetMinButtonSize(AButtonIndex, AButtonCount: Integer): TSize;
var
  AButtonBorderExtent: TRect;
  APainter: TcxCustomLookAndFeelPainterClass;
begin
  Result.cx := PcxNavigatorButtonViewInfo(FButtons[AButtonIndex])^.Button.GetImageSize.cx;
  APainter := Navigator.GetNavigatorLookAndFeel.GetAvailablePainter({$IFDEF VCL}[totButton]{$ENDIF});
  AButtonBorderExtent := GetButtonBorderExtent(APainter, AButtonIndex, AButtonCount);
  Inc(Result.cx, AButtonBorderExtent.Left + AButtonBorderExtent.Right + 1);
  Result.cy := AButtonBorderExtent.Top + AButtonBorderExtent.Bottom + 1;
end;

function TcxNavigatorViewInfo.GetVisibleButtonCount: Integer;
var
  ANavigatorButtons: TcxCustomNavigatorButtons;
  I: Integer;
begin
  Result := 0;
  ANavigatorButtons := Navigator.GetNavigatorButtons;
  for I := 0 to  ANavigatorButtons.ButtonCount - 1 do
    if ANavigatorButtons[I].Visible then
      Inc(Result);
end;

procedure TcxNavigatorViewInfo.DoButtonPressTimer(Sender: TObject);
begin
  FButtonPressTimer.Interval := cxRepeatPause;
  if (HotTrackButtonViewInfo <> nil) and (HotTrackButtonViewInfo = PressedButtonViewInfo) and
      PressedButtonViewInfo.Enabled and (PressedButtonViewInfo.Button.DefaultIndex in [NBDI_PRIOR, NBDI_NEXT]) then
    try
      PressedButtonViewInfo.Button.DoClick;
    except
      FButtonPressTimer.Enabled := False;
      raise;
    end;
end;

procedure TcxNavigatorViewInfo.DoHintTimer(Sender: TObject);
begin
  HintActivate(True);
end;

procedure TcxNavigatorViewInfo.UpdateSelected;
var
  AIsSelected: Boolean;
  ANavigatorControl: TWinControl;
  R1, R2: TRect;
begin
  if Navigator.GetNavigatorLookAndFeel.Painter <> TcxUltraFlatLookAndFeelPainter then
    Exit;
  ANavigatorControl := Navigator.GetNavigatorControl;
  AIsSelected := (HotTrackButtonViewInfo <> nil) or (PressedButtonViewInfo <> nil) or
    Navigator.GetNavigatorFocused;
  if AIsSelected <> FIsSelected then
  begin
    FIsSelected := AIsSelected;
    R1 := Navigator.GetNavigatorBounds;
    R2 := R1;
    InflateRect(R2, -1, -1);
    InternalInvalidate(ANavigatorControl.Handle, R1, R2, False);
  end;
end;

{ TcxCustomNavigator }

constructor TcxCustomNavigator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] + [csOpaque];
  FButtons := CreateButtons;
  FViewInfo := GetViewInfoClass.Create(Self, False);
  TabStop := False;
  Height := 25;
{$IFNDEF VCL}
  InputKeys := [ikArrows];
{$ENDIF}
end;

destructor TcxCustomNavigator.Destroy;
begin
  EndMouseTracking(Self);
  FreeAndNil(FViewInfo);
  FreeAndNil(FButtons);
  inherited Destroy;
end;

procedure TcxCustomNavigator.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if (FViewInfo <> nil) and HandleAllocated then
    FViewInfo.CheckSize(AWidth, AHeight);
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
end;

procedure TcxCustomNavigator.ClickButton(Index: Integer);
begin
  CustomButtons.ClickButton(Index);
end;

function TcxCustomNavigator.CanFocusOnClick: Boolean;
begin
  Result := TabStop;
end;

function TcxCustomNavigator.CreateButtons: TcxCustomNavigatorButtons;
begin
  Result := TcxCustomNavigatorButtons.Create(Self);
end;

procedure TcxCustomNavigator.Paint;
begin
  FViewInfo.Paint;
end;

procedure TcxCustomNavigator.DoEnter;
begin
  inherited DoEnter;
  FViewInfo.DoEnter;
end;

procedure TcxCustomNavigator.DoExit;
begin
  inherited DoExit;
  FViewInfo.DoExit;
end;

procedure TcxCustomNavigator.EnabledChanged;
begin
  {$IFNDEF VCL}inherited EnabledChanged;{$ENDIF}
  RefreshNavigator;
end;

procedure TcxCustomNavigator.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_LEFT) or (Key = VK_RIGHT) then
    FViewInfo.PressArrowKey(Key = VK_LEFT);
  if (Key = VK_SPACE) and (FViewInfo.FocusedButton <> nil)
    and FViewInfo.FocusedButton.Enabled then
    FViewInfo.FocusedButton.Button.DoClick;  
end;

procedure TcxCustomNavigator.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button = mbLeft then
    FViewInfo.MouseDown(X, Y);
end;

procedure TcxCustomNavigator.MouseEnter(AControl: TControl);
var
  ABounds: TRect;
begin
  inherited MouseEnter(AControl);
{$IFDEF DELPHI7}
  if IsDesigning then
    Exit;
{$ENDIF}
  if not FMouseInControl and ({$IFDEF VCL}GetCapture = 0{$ELSE}QWidget_mouseGrabber = nil{$ENDIF}) then
  begin
    ABounds := GetControlRect(Self);
    MapWindowRect(Handle, {$IFDEF VCL}0{$ELSE}nil{$ENDIF}, ABounds);
    BeginMouseTracking(nil, ABounds, Self);
    FMouseInControl := True;
  end;
end;

procedure TcxCustomNavigator.MouseLeave(AControl: TControl);
begin
  inherited MouseLeave(AControl);
{$IFDEF DELPHI7}
  if IsDesigning then
    Exit;
{$ENDIF}
  EndMouseTracking(Self);
  FViewInfo.MouseMove(-1, -1);
  FMouseInControl := False;
end;

procedure TcxCustomNavigator.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  FViewInfo.MouseMove(X, Y);
end;

procedure TcxCustomNavigator.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FViewInfo.MouseUp(X, Y);
end;

procedure TcxCustomNavigator.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  inherited LookAndFeelChanged(Sender, AChangedValues);
{$IFDEF VCL}
  RecreateWnd
{$ELSE}
  RecreateWidget
{$ENDIF}
end;

procedure TcxCustomNavigator.NavigatorMouseLeave;
begin
  FViewInfo.MouseMove(-1, -1);
//  FViewInfo.FHintWindow.Free;
//  FViewInfo.FHintWindow := THintWindow.Create(nil);
end;

function TcxCustomNavigator.GetNavigatorBounds: TRect;
begin
  Result := Rect(0, 0, ClientWidth, ClientHeight);
end;

function TcxCustomNavigator.GetNavigatorButtons: TcxCustomNavigatorButtons;
begin
  Result := CustomButtons;
end;

function TcxCustomNavigator.GetNavigatorCanvas: TCanvas;
begin
  Result := Canvas.Canvas;
end;

function TcxCustomNavigator.GetNavigatorControl: TWinControl;
begin
  Result := Self;
end;

function TcxCustomNavigator.GetNavigatorLookAndFeel: TcxLookAndFeel;
begin
  Result := LookAndFeel;
end;

function TcxCustomNavigator.GetNavigatorFocused: Boolean;
begin
  Result := Focused;
end;

function TcxCustomNavigator.GetNavigatorShowHint: Boolean;
begin
  Result := ShowHint;
end;

function TcxCustomNavigator.GetNavigatorTabStop: Boolean;
begin
  Result := TabStop;
end;

function TcxCustomNavigator.GetViewInfoClass: TcxNavigatorViewInfoClass;
begin
  Result := TcxNavigatorViewInfo;
end;

function TcxCustomNavigator.GetNavigatorOwner: TComponent;
begin
  Result := Self;
end;

procedure TcxCustomNavigator.NavigatorButtonsStateChanged;
begin
  FViewInfo.UpdateButtonsEnabled;
end;

procedure TcxCustomNavigator.RefreshNavigator;
var
  AWidth, AHeight: Integer;
begin
  if not HandleAllocated then
    Exit;
  FViewInfo.MakeIsDirty;
  AWidth := Width;
  AHeight := Height;
  FViewInfo.CheckSize(AWidth, AHeight);
  if (AWidth <> Width) or (Height <> AHeight) then
    SetBounds(Left, Top, AWidth, AHeight)
  else
    Invalidate;
end;

{$IFDEF VCL}
procedure TcxCustomNavigator.CreateWnd;
begin
  inherited CreateWnd;
  SetBounds(Left, Top, Width, Height);
end;

procedure TcxCustomNavigator.WndProc(var Message: TMessage);
begin
  if (FViewInfo <> nil) and (FViewInfo.FHintWindowShowing) then
    with Message do
      if ((Msg >= WM_KEYFIRST) and (Msg <= WM_KEYLAST)) or
        ((Msg = CM_ACTIVATE) or (Msg = CM_DEACTIVATE)) or
        (Msg = CM_APPKEYDOWN) or (Msg = CM_APPSYSCOMMAND) or
        (Msg = WM_COMMAND) or ((Msg > WM_MOUSEMOVE) and
        (Msg <= WM_MOUSELAST)) or (Msg = WM_NCMOUSEMOVE) then
         FViewInfo.HintActivate(False);
  inherited WndProc(Message);
end;

{$ELSE}

procedure TcxCustomNavigator.CreateWidget;
begin
  inherited CreateWidget;
  SetBounds(Left, Top, Width, Height);
end;
{$ENDIF}

{$IFDEF VCL}
procedure TcxCustomNavigator.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  EnabledChanged;
end;

procedure TcxCustomNavigator.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;
{$ENDIF}

{ TcxNavigatorControlNotifier }

constructor TcxNavigatorControlNotifier.Create;
begin
  FList := TList.Create;
end;

destructor TcxNavigatorControlNotifier.Destroy;
begin
  FreeAndNil(FList);
  inherited Destroy;
end;

procedure TcxNavigatorControlNotifier.AddNavigator(ANavigator: IcxNavigatorOwner);
begin
  if FList.IndexOf(Pointer(ANavigator)) < 0 then
    FList.Add(Pointer(ANavigator));
end;

procedure TcxNavigatorControlNotifier.RemoveNavigator(ANavigator: IcxNavigatorOwner);
begin
  FList.Remove(Pointer(ANavigator));
end;

procedure TcxNavigatorControlNotifier.RefreshNavigatorButtons;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    IcxNavigatorOwner(FList[I]).NavigatorButtonsStateChanged;
end;

{ TcxNavigatorControlButtons }
procedure TcxNavigatorControlButtons.ReleaseBookmark;
var
  ANavigatorControl: IcxNavigator;
begin
  ANavigatorControl := Control;
  if (ANavigatorControl <> nil) and ANavigatorControl.IsBookmarkAvailable then
    ANavigatorControl.ClearBookmark;
end;

function TcxNavigatorControlButtons.GetControl: IcxNavigator;
begin
  if Assigned(FOnGetControl) then
    Result := FOnGetControl
  else
    Result := nil;
end;

procedure TcxNavigatorControlButtons.DoButtonClick(ADefaultIndex: Integer);
var
  ANavigatorControl: IcxNavigator;
begin
  ANavigatorControl := Control;
  if ANavigatorControl <> nil then
    ANavigatorControl.DoAction(ADefaultIndex);
  FNavigator.NavigatorButtonsStateChanged;
end;

function TcxNavigatorControlButtons.GetButtonEnabled(ADefaultIndex: Integer): Boolean;
var
  ANavigatorControl: IcxNavigator;
begin
  ANavigatorControl := Control;
  Result := (ANavigatorControl <> nil) and IsNavigatorEnabled;
  if Result then
  begin
    case ADefaultIndex of
      NBDI_FIRST, NBDI_PRIOR, NBDI_PRIORPAGE: Result := not ANavigatorControl.IsBof;
      NBDI_LAST, NBDI_NEXT, NBDI_NEXTPAGE: Result := not ANavigatorControl.IsEof;
      NBDI_INSERT: Result :=  ANavigatorControl.CanInsert;
      NBDI_DELETE: Result := ANavigatorControl.CanDelete;
      NBDI_EDIT: Result := ANavigatorControl.CanEdit
        and not ANavigatorControl.IsEditing;
      NBDI_POST, NBDI_CANCEL:  Result := ANavigatorControl.CanEdit
        and ANavigatorControl.IsEditing;
      NBDI_GOTOBOOKMARK: Result := ANavigatorControl.IsBookmarkAvailable;
    end;
  end;
end;

{ TcxCustomNavigatorControl }
destructor TcxCustomNavigatorControl.Destroy;
begin
  Control := nil;
  inherited Destroy;
end;

function TcxCustomNavigatorControl.CreateButtons: TcxCustomNavigatorButtons;
begin
  Result := TcxNavigatorControlButtons.Create(Self);
  TcxNavigatorControlButtons(Result).OnGetControl := GetControl;
end;


procedure TcxCustomNavigatorControl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Control) then
    Control := nil;
end;

procedure TcxCustomNavigatorControl.InitButtons;
var
  ANavigator: IcxNavigator;
  I: Integer;
begin
  if FControl = nil then
    for I := 0 to FButtons.ButtonCount - 1 do
      FButtons[I].Visible := True
  else
  begin
    FControl.GetInterface(IcxNavigator, ANavigator);
    for I := 0 to FButtons.ButtonCount - 1 do
      with FButtons[I] do
        Visible := ANavigator.IsActionSupported(DefaultIndex);
  end;
end;

function TcxCustomNavigatorControl.GetButtons: TcxNavigatorControlButtons;
begin
  Result := TcxNavigatorControlButtons(CustomButtons);
end;

function TcxCustomNavigatorControl.GetControl: IcxNavigator;
begin
  if Control <> nil then
    Control.GetInterface(IcxNavigator, Result)
  else
    Result := nil;
end;

procedure TcxCustomNavigatorControl.SetButtons(Value: TcxNavigatorControlButtons);
begin
  CustomButtons.Assign(Value);
end;

procedure TcxCustomNavigatorControl.SetControl(Value: TComponent);
var
  ANavigator: IcxNavigator;
begin
  if (Value <> FControl) and ((Value = nil) or Value.GetInterface(IcxNavigator,
    ANavigator)) then
  begin
    if FControl <> nil then
    begin
    {$IFDEF DELPHI5}
      FControl.RemoveFreeNotification(Self);
    {$ENDIF}
      FControl.GetInterface(IcxNavigator, ANavigator);
      if ANavigator.GetNotifier <> nil then
        ANavigator.GetNotifier.RemoveNavigator(Self);
    end;
    FControl := Value;
    if (FControl <> nil) then
    begin
      FControl.FreeNotification(Self);
      FControl.GetInterface(IcxNavigator, ANavigator);
      if ANavigator.GetNotifier <> nil then
        ANavigator.GetNotifier.AddNavigator(Self);
    end;
    InitButtons;
    RefreshNavigator;
  end;
end;

initialization

finalization

  if FNavigatorImages <> nil then
  begin
    FNavigatorImages.Free;
    FNavigatorImages := nil;
  end;

end.
