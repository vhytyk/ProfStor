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

unit cxHeader;

{$I cxExtEdVer.inc}

interface

uses
{$IFDEF VCL}
  Windows, Messages,
{$ENDIF}
  SysUtils, Classes, Controls, ImgList, Graphics,
  cxControls, cxContainer, cxLookAndFeels, cxLookAndFeelPainters, cxGraphics,
  cxEditUtils, cxEdit, cxExtEditConsts, cxExtEditUtils, cxClasses;

type
  TcxHeaderSortOrder = (soNone, soAscending, soDescending);
  TcxCustomHeader = class;
  TcxHeader = class;
  TcxHeaderSection = class;
  TcxHeaderSections = class;
  TcxSectionTrackState = (tsTrackBegin, tsTrackMove, tsTrackEnd, tsTrackNone);

  TcxDrawSectionEvent = procedure(HeaderControl: TcxCustomHeader;
    Section: TcxHeaderSection; const ARect: TRect; Pressed: Boolean) of object;
  TcxSectionNotifyEvent = procedure(HeaderControl: TcxCustomHeader;
    Section: TcxHeaderSection) of object;
  TcxSectionTrackEvent = procedure(HeaderControl: TcxCustomHeader;
    Section: TcxHeaderSection; Width: Integer; State: TcxSectionTrackState) of object;
  TcxSectionDragEvent = procedure (Sender: TObject; FromSection, ToSection: TcxHeaderSection;
    var AllowDrag: Boolean) of object;
  TcxSectionChangingSortOrderEvent = procedure (Sender: TObject;
    const Section: TcxHeaderSection; const AOldSortOrder: TcxHeaderSortOrder;
    var ANewSortOrder: TcxHeaderSortOrder; var AllowChange: Boolean) of object;
  TcxSectionChangedSortOrderEvent = procedure (Sender: TObject;
    const Section: TcxHeaderSection; const ASortOrder: TcxHeaderSortOrder) of object;

  { TcxHeaderSection }
  TcxHeaderSection = class(TCollectionItem)
  private
    FText: string;
    FWidth: Integer;
    FMinWidth: TcxNaturalNumber;
    FMaxWidth: TcxNaturalNumber;
    FAlignment: TAlignment;
    FAllowClick: Boolean;
    FAutoSize: Boolean;
    FImageIndex: TImageIndex;
    FBiDiMode: TBiDiMode;
    FParentBiDiMode: Boolean;
    FSortOrder: TcxHeaderSortOrder;
    FNativeIndex: Integer;
    function GetLeft: Integer;
    function GetRight: Integer;
    function IsBiDiModeStored: Boolean;
    function GetHeaderControl: TcxCustomHeader;
    procedure SetAlignment(Value: TAlignment);
    procedure SetAutoSize(Value: Boolean);
    procedure SetBiDiMode(Value: TBiDiMode);
    procedure SetMaxWidth(Value: TcxNaturalNumber);
    procedure SetMinWidth(Value: TcxNaturalNumber);
    procedure SetParentBiDiMode(Value: Boolean);
    procedure SetText(const Value: string);
    procedure SetWidth(Value: Integer);
    procedure SetImageIndex(const Value: TImageIndex);
    procedure SetSortOrder(Value: TcxHeaderSortOrder);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure ParentBiDiModeChanged;
    function UseRightToLeftAlignment: Boolean;
    function UseRightToLeftReading: Boolean;
    property Left: Integer read GetLeft;
    property Right: Integer read GetRight;
    property NativeIndex: Integer read FNativeIndex;
    property HeaderControl: TcxCustomHeader read GetHeaderControl;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property AllowClick: Boolean read FAllowClick write FAllowClick default False;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property MaxWidth: TcxNaturalNumber read FMaxWidth write SetMaxWidth default 1000;
    property MinWidth: TcxNaturalNumber read FMinWidth write SetMinWidth default 30;
    property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True;
    property SortOrder: TcxHeaderSortOrder read FSortOrder write SetSortOrder default soNone;
    property Text: string read FText write SetText;
    property Width: Integer read FWidth write SetWidth default 50;
  end;

  { TcxHeaderSections }
  TcxHeaderSections = class(TCollection)
  private
    FHeaderControl: TcxCustomHeader;
    FOnSectionAdd: TNotifyEvent;
    FOnSectionDelete: TNotifyEvent;
    function GetItem(Index: Integer): TcxHeaderSection;
    procedure SetItem(Index: Integer; Value: TcxHeaderSection);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
{$IFDEF DELPHI6}
    procedure Notify(Item: TCollectionItem; Action: TCollectionNotification); override;
{$ENDIF}
  public
    constructor Create(HeaderControl: TcxCustomHeader);
    procedure Assign(Source: TPersistent); override;
    procedure Delete(Index: Integer);
    function Add: TcxHeaderSection;
    function Insert(Index: Integer): TcxHeaderSection;
    property Items[Index: Integer]: TcxHeaderSection read GetItem write SetItem; default;
  end;

  { TcxCustomHeader }
  TcxCustomHeader = class(TcxControl)
  private
    FDragReorder: Boolean;
    FFromIndex: Integer;
    FToIndex: Integer;
    FUpdatingSectionOrder: Boolean;
    FSectionDragged: Boolean;
    FMouseOnSizer: Boolean;
    FSectionResize: Boolean;
    FSections: TcxHeaderSections;
    FSelectedSection: Integer;
    FTrackedSection: Integer;
    FSectionStream: TMemoryStream;
    FImages: TCustomImageList;
    FImageChangeLink: TChangeLink;
    FOnSectionClick: TcxSectionNotifyEvent;
    FOnSectionResize: TcxSectionNotifyEvent;
    FOnSectionEndResize: TcxSectionNotifyEvent;
    FOnSectionTrack: TcxSectionTrackEvent;
    FOnDrawSection: TcxDrawSectionEvent;
    FOnSectionEndDrag: TNotifyEvent;
    FOnSectionDrag: TcxSectionDragEvent;
    FOnSectionChangingSortOrder: TcxSectionChangingSortOrderEvent;
    FOnSectionChangedSortOrder: TcxSectionChangedSortOrderEvent;
    FOnSectionChange: TNotifyEvent;
    FPrevMousePos: TPoint;
    FAllowSort: Boolean;
    FResizeUpdate: Boolean;
    FLineDC: HDC;
    FLineVisible: Boolean;
    FBrush: TBrush;
    FPrevBrush: HBrush;
    FLastDrawPointOnMove: TPoint;
    procedure ImageListChange(Sender: TObject);
    procedure SetSections(const Value: TcxHeaderSections);
    procedure UpdateSection(Index: Integer);
    procedure UpdateSections;
    procedure SetImages(const Value: TCustomImageList);
    procedure SetAllowSort(Value: Boolean);
    function GetPainterClass: TcxCustomLookAndFeelPainterClass; virtual;
    function GetSectionIndexAtPos(X, Y: Integer): Integer;
    procedure PaintDragSection(X, Y, Index: Integer);
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMCaptureChanged(var Message: TMessage); message WM_CAPTURECHANGED;
    procedure SectionAddHandler(Sender: TObject);
    procedure SectionDeleteHandler(Sender: TObject);
    procedure AllocateSplitLineDC;
    procedure ReleaseSplitLine;
    procedure DrawSplitLine(const APoint: TPoint);
    procedure InitResize(X, Y: Integer);
    procedure FitToClientWidth;
  protected
    function DoSectionDrag(FromSection, ToSection: TcxHeaderSection): Boolean; virtual;
    procedure DoSectionEndDrag; virtual;
    function GetSectionRect(Index: Integer): TRect; virtual;
    function CreateSection: TcxHeaderSection; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues); override;
    procedure Notification(ACOmponent: TComponent; Operation: TOperation); override;
    procedure DrawSection(Section: TcxHeaderSection; const ARect: TRect;
      Pressed: Boolean); dynamic;
    procedure DoSectionClickEvent(Section: TcxHeaderSection); dynamic;
    procedure DoSectionChangeSortOrderEvent(Section: TcxHeaderSection;
      DisableSort: Boolean); dynamic;
    procedure DoSectionDragEvent(FromSection, ToSection: TcxHeaderSection; var AllowDrag: Boolean); dynamic;
    procedure DoSectionEndDragEvent; dynamic;
    procedure DoSectionResizeEvent(Section: TcxHeaderSection); dynamic;
    procedure DoSectionEndResizeEvent(Section: TcxHeaderSection); dynamic;
    procedure DoSectionTrackEvent(Section: TcxHeaderSection; Width: Integer;
      State: TcxSectionTrackState); dynamic;
    procedure DisableSort; virtual;
    procedure Paint; override;
    property AllowSort: Boolean read FAllowSort write SetAllowSort default True;
    property ResizeUpdate: Boolean read FResizeUpdate write FResizeUpdate default True;
    property OnSectionChangingSortOrder: TcxSectionChangingSortOrderEvent
      read FOnSectionChangingSortOrder write FOnSectionChangingSortOrder;
    property OnSectionChangedSortOrder: TcxSectionChangedSortOrderEvent
      read FOnSectionChangedSortOrder write FOnSectionChangedSortOrder;
    property OnSectionChange: TNotifyEvent read FOnSectionChange
      write FOnSectionChange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FlipChildren(AllLevels: Boolean); override;
  published
    property Align default alNone;
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DragReorder: Boolean read FDragReorder write FDragReorder default False;
    property Enabled;
    property Images: TCustomImageList read FImages write SetImages;
    property Constraints;
    property Sections: TcxHeaderSections read FSections write SetSections;
    property LookAndFeel;
    property OnDrawSection: TcxDrawSectionEvent read FOnDrawSection write FOnDrawSection;
    property OnSectionClick: TcxSectionNotifyEvent read FOnSectionClick
      write FOnSectionClick;
    property OnSectionDrag: TcxSectionDragEvent read FOnSectionDrag
      write FOnSectionDrag;
    property OnSectionEndDrag: TNotifyEvent read FOnSectionEndDrag
      write FOnSectionEndDrag;
    property OnSectionResize: TcxSectionNotifyEvent read FOnSectionResize
      write FOnSectionResize;
    property OnSectionEndResize: TcxSectionNotifyEvent read FOnSectionEndResize
      write FOnSectionEndResize;
    property OnSectionTrack: TcxSectionTrackEvent read FOnSectionTrack
      write FOnSectionTrack;
  end;

  { TcxHeader }
  TcxHeader = class(TcxCustomHeader)
  private
    function GetOnDrawSection: TcxDrawSectionEvent;
    function GetOnSectionClick: TcxSectionNotifyEvent;
    function GetOnSectionResize: TcxSectionNotifyEvent;
    function GetOnSectionEndResize: TcxSectionNotifyEvent;
    function GetOnSectionTrack: TcxSectionTrackEvent;
    procedure SetOnDrawSection(const Value: TcxDrawSectionEvent);
    procedure SetOnSectionClick(const Value: TcxSectionNotifyEvent);
    procedure SetOnSectionResize(const Value: TcxSectionNotifyEvent);
    procedure SetOnSectionEndResize(const Value: TcxSectionNotifyEvent);
    procedure SetOnSectionTrack(const Value: TcxSectionTrackEvent);
  published
    property Align;
    property AllowSort;
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property Images;
    property LookAndFeel;
    property Color;
    property Constraints;
    property Sections;
    property ShowHint;
    property ParentBiDiMode;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ResizeUpdate;
    property Visible;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}    
    property OnDragDrop;
    property OnDragOver;
    property OnDrawSection: TcxDrawSectionEvent read GetOnDrawSection
      write SetOnDrawSection;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnSectionClick: TcxSectionNotifyEvent read GetOnSectionClick
      write SetOnSectionClick;
    property OnSectionResize: TcxSectionNotifyEvent read GetOnSectionResize
      write SetOnSectionResize;
    property OnSectionEndResize: TcxSectionNotifyEvent read GetOnSectionEndResize
      write SetOnSectionEndResize;
    property OnSectionTrack: TcxSectionTrackEvent read GetOnSectionTrack
      write SetOnSectionTrack;
    property OnSectionDrag;
    property OnSectionEndDrag;
    property OnSectionChangingSortOrder;
    property OnSectionChangedSortOrder;
    property OnSectionChange;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation

uses
{$IFDEF VCL}
  dxThemeConsts, dxThemeManager, dxUxTheme,
{$ENDIF}
  Math, Forms;

function GetNextSortOrder(const ASortOrder: TcxHeaderSortOrder;
  const AWithNone: Boolean): TcxHeaderSortOrder;
begin
  case ASortOrder of
    soNone: Result := soAscending;
    soAscending: Result := soDescending;
    else
    begin
      if AWithNone = True then
        Result := soNone
      else
        Result := soAscending;
    end;
  end;
end;

{ TcxCustomHeader }
procedure TcxCustomHeader.CMBiDiModeChanged(var Message: TMessage);
var
  Loop: Integer;
begin
  inherited;
  if HandleAllocated then
    for Loop := 0 to Sections.Count - 1 do
      if Sections[Loop].ParentBiDiMode then
        Sections[Loop].ParentBiDiModeChanged;
end;

constructor TcxCustomHeader.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [];
  Align := alNone;
  Height := 17;
  Width := 117;
  FResizeUpdate := True;
  FAllowSort := True;
  FLineVisible := False;
  FDragReorder := False;
  FSections := TcxHeaderSections.Create(Self);
  FSections.FOnSectionAdd := SectionAddHandler;
  FSections.FOnSectionDelete := SectionDeleteHandler;
  DoubleBuffered := True;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FSectionDragged := False;
  FMouseOnSizer := False;
  FSectionResize := False;
  FUpdatingSectionOrder := False;
  FSectionStream := nil;
  FSelectedSection := -1;
end;

procedure TcxCustomHeader.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

function TcxCustomHeader.CreateSection: TcxHeaderSection;
begin
  Result := TcxHeaderSection.Create(Sections);
end;

procedure TcxCustomHeader.CreateWnd;

  procedure ReadSections;
  var
    Reader: TReader;
  begin
    if FSectionStream = nil then Exit;
    Sections.Clear;
    Reader := TReader.Create(FSectionStream, 1024);
    try
      Reader.ReadValue;
      Reader.ReadCollection(Sections);
    finally
      Reader.Free;
    end;
    FSectionStream.Free;
    FSectionStream := nil;
  end;

begin
  inherited CreateWnd;
  if FSectionStream <> nil then
    ReadSections
  else
    UpdateSections;
end;

destructor TcxCustomHeader.Destroy;
begin
  FSections.Free;
  FImageChangeLink.Free;
  if Assigned(FSectionStream) then FSectionStream.Free;
  if Assigned(FBrush) then FreeAndNil(FBrush);
  inherited Destroy;
end;

procedure TcxCustomHeader.DestroyWnd;
var
  Writer: TWriter;
begin
  if FSectionStream = nil then
    FSectionStream := TMemoryStream.Create;
  Writer := TWriter.Create(FSectionStream, 1024);
  try
    Writer.WriteCollection(FSections);
  finally
    Writer.Free;
    FSectionStream.Position := 0;
  end;
  inherited DestroyWnd;
end;

procedure TcxCustomHeader.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  Invalidate;
end;

procedure TcxCustomHeader.Notification(ACOmponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Images) then
    Images := nil;
end;

procedure TcxCustomHeader.SetSections(const Value: TcxHeaderSections);
begin
  FSections.Assign(Value);
end;

procedure TcxCustomHeader.UpdateSection(Index: Integer);
var
  P: TPoint;
begin
  if (FSections.Count > 0) and (Index in [0..FSections.Count - 1]) then
  begin
    GetCursorPos(P);
    P := ScreenToClient(P);
    DrawSection(FSections[Index], GetSectionRect(Index),
       (Index = FSelectedSection) and FSections.Items[Index].AllowClick and
       (GetSectionIndexAtPos(P.X, P.Y) = Index));

    if Assigned(FOnSectionChange) then
      FOnSectionChange(Self);
  end
  else
    UpdateSections;
end;

procedure TcxCustomHeader.UpdateSections;
begin
  Invalidate;
end;

procedure TcxCustomHeader.SectionAddHandler(Sender: TObject);
begin
  if Assigned(OnSectionChange) then OnSectionChange(Self);
end;

procedure TcxCustomHeader.SectionDeleteHandler(Sender: TObject);
begin
  if Assigned(OnSectionChange) then OnSectionChange(Self);
end;

procedure TcxCustomHeader.AllocateSplitLineDC;
begin
  FLineDC := GetDCEx(Parent.Handle, 0, DCX_CACHE or DCX_CLIPSIBLINGS or DCX_LOCKWINDOWUPDATE);
  if not ResizeUpdate then
  begin
    if not Assigned(FBrush) then
    begin
      FBrush := TBrush.Create;
      {$IFDEF DELPHI4}
      FBrush.Bitmap := AllocPatternBitmap(clBlack, clWhite);
      {$ENDIF}
    end;
    FPrevBrush := SelectObject(FLineDC, FBrush.Handle);
  end;
end;

procedure TcxCustomHeader.DrawSplitLine(const APoint: TPoint);
begin
  FLineVisible := not FLineVisible;
  FLastDrawPointOnMove := APoint;
  PatBlt(FLineDC, Self.Left + APoint.X, 1, 1, Parent.Height - 1, DSTINVERT);
end;

procedure TcxCustomHeader.ReleaseSplitLine;
begin
  if FLineVisible then DrawSplitLine(FLastDrawPointOnMove);
  if FPrevBrush <> 0 then SelectObject(FLineDC, FPrevBrush);
  ReleaseDC(Parent.Handle, FLineDC);
  if FBrush <> nil then FreeAndNil(FBrush);
end;

procedure TcxCustomHeader.InitResize(X, Y: Integer);
begin
  FLineVisible := False;
  AllocateSplitLineDC;
  if not ResizeUpdate then DrawSplitLine(Point(X, Y));
end;

function TcxCustomHeader.DoSectionDrag(FromSection,
  ToSection: TcxHeaderSection): Boolean;
begin
  Result := True;
  DoSectionDragEvent(FromSection, ToSection, Result);
end;

procedure TcxCustomHeader.DoSectionEndDrag;
begin
  FSectionDragged := False;
  Sections[FFromIndex].Index := FToIndex;
  DoSectionEndDragEvent;
end;

procedure TcxCustomHeader.DrawSection(Section: TcxHeaderSection;
  const ARect: TRect; Pressed: Boolean);

  function MouseInCtl(Control: TControl; SubRect: TRect): Boolean;
  var
    P: TPoint;
    R: TRect;
  begin
    Result := Assigned(Control) and Assigned(Control.Parent);
    if Result then
      with Control do
      begin
        GetCursorPos(P);
        P := Parent.ScreenToClient(P);
        R := Rect(Left, Top, Left + Width, Top + Height);
        OffsetRect(SubRect, Left, Top);
        Result := PtInRect(R, P) and PtInRect(SubRect, P);
      end;
  end;

const
  AlignmentsHorz: array[TAlignment] of Integer =
    (cxAlignLeft, cxAlignRight, cxAlignHCenter);
var
  R, FImageRect, FTextRect, FSortRect: TRect;
  AState: TcxButtonState;
  FSavedPenColor: TColor;
begin
  if Assigned(FOnDrawSection) then
    FOnDrawSection(Self, Section, ARect, Pressed)
  else
  with Canvas do
  begin
    //
    // Prepare working area.
    //
    Brush.Color := Self.Color;
    FillRect(ARect);

    //
    //  Prepare all kind of rects
    //
    R := ARect;
    FTextRect := R;
    InflateRect(FTextRect, -2, -2);

    if Assigned(Images) and (Section.ImageIndex >= 0) then
    begin
      FImageRect := FTextRect;
      Windows.DrawText(Handle,
        PChar(Section.Text),
        Length(Section.Text),
        FImageRect,
        dt_center or dt_singleline or dt_calcrect);

        case Section.Alignment of
          taLeftJustify:
            FTextRect.Left := FImageRect.Left + Images.Width + 2;
          taRightJustify:
            FImageRect.Left := FImageRect.Left + (FTextRect.Right - FImageRect.Right) - Images.Width - 2;
          taCenter:
            FImageRect.Left := FImageRect.Left + (FTextRect.Right - FImageRect.Right) div 2 - Images.Width - 2;
        end;
    end;

    //
    // Paint the headers
    //
    if not Enabled then
      AState := cxbsDisabled
    else
      if Pressed then
        AState := cxbsPressed
       else
         if MouseInCtl(Self, R) and not (csDesigning in ComponentState) then
           AState := cxbsHot
         else
           AState := cxbsNormal;

    GetPainterClass.DrawHeader(
       Self.Canvas,
       R,
       FTextRect,
       [nBottom],
       cxBordersAll,
       AState,
       Section.Alignment,
       vaCenter,
       False,
       True,
       Section.Text,
       Self.Canvas.Font,
       Self.Canvas.Pen.Color,
       Self.Canvas.Brush.Color
    );

    //
    // Paint sort mark
    //
    if Section.SortOrder <> soNone then
    begin
      FSavedPenColor := Self.Canvas.Pen.Color;
      FSortRect := R;
      Dec(FSortRect.Right, 4);
      FSortRect.Left := FSortRect.Right - 7;
      GetPainterClass.DrawSortingMark(Self.Canvas, FSortRect, Section.SortOrder = soAscending);
      Self.Canvas.Pen.Color := FSavedPenColor;
    end;

    //
    // Paint image
    //
    if Assigned(Images) and (Section.ImageIndex >= 0) then
      Self.Canvas.DrawImage(Images, FImageRect.Left,
        FImageRect.Top, Section.ImageIndex);
  end;
end;

procedure TcxCustomHeader.ImageListChange(Sender: TObject);
begin
  UpdateSections;
end;

procedure TcxCustomHeader.WMSize(var Message: TWMSize);
begin
  inherited;
  FitToClientWidth;
end;

procedure TcxCustomHeader.FitToClientWidth;
var
  I, Count, WorkWidth, TmpWidth, Remain: Integer;
  List: TList;
  Section: TcxHeaderSection;
begin
  if HandleAllocated and not (csReading in ComponentState) then
  begin
    { Try to fit all sections within client width }
    List := TList.Create;
    try
      WorkWidth := ClientWidth;
      for I := 0 to Sections.Count - 1 do
      begin
        Section := Sections[I];
        if Section.AutoSize then
          List.Add(Section)
        else
          Dec(WorkWidth, Section.Width);
      end;
      if List.Count > 0 then
      begin
        Sections.BeginUpdate;
        try
          repeat
            Count := List.Count;
            Remain := WorkWidth mod Count;
            { Try to redistribute sizes to those sections which can take it }
            TmpWidth := WorkWidth div Count;
            for I := Count - 1 downto 0 do
            begin
              Section := TcxHeaderSection(List[I]);
              if I = 0 then
                Inc(TmpWidth, Remain);
              Section.Width := TmpWidth;
            end;

            { Verify new sizes don't conflict with min/max section widths and
              adjust if necessary. }
            TmpWidth := WorkWidth div Count;
            for I := Count - 1 downto 0 do
            begin
              Section := TcxHeaderSection(List[I]);
              if I = 0 then
                Inc(TmpWidth, Remain);
              if Section.Width <> TmpWidth then
              begin
                List.Delete(I);
                Dec(WorkWidth, Section.Width);
              end;
            end;
          until (List.Count = 0) or (List.Count = Count);
        finally
          Sections.EndUpdate;
        end;
      end;
    finally
      List.Free;
    end;
  end;
end;

procedure TcxCustomHeader.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  Invalidate;
end;

procedure TcxCustomHeader.SetImages(const Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
  end;
  UpdateSections;
end;

procedure TcxCustomHeader.DoSectionClickEvent(Section: TcxHeaderSection);
begin
  if Assigned(FOnSectionClick) then FOnSectionClick(Self, Section);
end;

procedure TcxCustomHeader.DoSectionChangeSortOrderEvent(Section: TcxHeaderSection;
  DisableSort: Boolean);
var
  FOldSortOrder, FNewSortOrder: TcxHeaderSortOrder;
  FAllowChange: Boolean;
begin
  if not AllowSort then Exit;

  FOldSortOrder := Section.SortOrder;
  if DisableSort then
    FNewSortOrder := soNone
  else
    FNewSortOrder := GetNextSortOrder(Section.SortOrder, False);

  FAllowChange := True;

  if Assigned(FOnSectionChangingSortOrder) then
    FOnSectionChangingSortOrder(Self, Section, FOldSortOrder, FNewSortOrder, FAllowChange);

  if FAllowChange = True then
  begin
    Section.FSortOrder := FNewSortOrder;
    if Assigned(FOnSectionChangedSortOrder) then
      FOnSectionChangedSortOrder(Self, Section, FNewSortOrder);
  end;
end;

procedure TcxCustomHeader.DoSectionDragEvent(FromSection, ToSection: TcxHeaderSection;
  var AllowDrag: Boolean);
begin
  if Assigned(FOnSectionDrag) then
    FOnSectionDrag(Self, FromSection, ToSection, AllowDrag);
  FSectionDragged := AllowDrag;
end;

procedure TcxCustomHeader.DoSectionEndDragEvent;
begin
  if Assigned(FOnSectionEndDrag) then FOnSectionEndDrag(Self);
end;

procedure TcxCustomHeader.DoSectionResizeEvent(Section: TcxHeaderSection);
begin
  if Assigned(FOnSectionResize) then FOnSectionResize(Self, Section);
end;

procedure TcxCustomHeader.DoSectionEndResizeEvent(Section: TcxHeaderSection);
begin
  if Assigned(FOnSectionEndResize) then FOnSectionEndResize(Self, Section);
  if (Sections.Count > 0) and Sections[Sections.Count - 1].AutoSize then
    FitToClientWidth;
end;

procedure TcxCustomHeader.DoSectionTrackEvent(Section: TcxHeaderSection;
  Width: Integer; State: TcxSectionTrackState);
begin
  if Assigned(FOnSectionTrack) then FOnSectionTrack(Self, Section, Width, State);
end;

procedure TcxCustomHeader.FlipChildren(AllLevels: Boolean);
var
  Loop, FirstWidth, LastWidth: Integer;
  ASectionsList: TcxHeaderSections;
begin
  if HandleAllocated and (Sections.Count > 0) then
  begin
    { Get the true width of the last section }
    LastWidth := ClientWidth;
    FirstWidth := Sections[0].Width;
    for Loop := 0 to Sections.Count - 2 do Dec(LastWidth, Sections[Loop].Width);
    { Flip 'em }
    ASectionsList := TcxHeaderSections.Create(Self);
    try
      for Loop := 0 to Sections.Count - 1 do
        with ASectionsList.Add do
          Assign(Self.Sections[Loop]);
      for Loop := 0 to Sections.Count - 1 do
        Sections[Loop].Assign(ASectionsList[Sections.Count - Loop - 1]);
    finally
      ASectionsList.Free;
    end;
    { Set the width of the last Section }
    if Sections.Count > 1 then
    begin
      Sections[Sections.Count-1].Width := FirstWidth;
      Sections[0].Width := LastWidth;
    end;
    UpdateSections;
  end;
end;

procedure TcxCustomHeader.Paint;
var
  I: Integer;
  P: TPoint;
  R: TRect;
begin
  inherited Paint;

  Canvas.Brush.Color := Self.Color;
  Canvas.FillRect(ClientRect);

  if (FSections.Count = 0) and (csDesigning in ComponentState) then
  begin
    Canvas.Pen.Style := psDash;
    Canvas.Brush.Style := bsClear;
    Windows.Rectangle(Canvas.Handle, ClientRect.Left, ClientRect.Top, ClientRect.Right, ClientRect.Bottom);
  end
  else
  begin
    GetCursorPos(P);
    P := ScreenToClient(P);

    for I := 0 to FSections.Count - 1 do
    begin
      R := GetSectionRect(I);

      if (I > 0) and (LookAndFeel.Kind = lfUltraFlat) then
        Dec(R.Left, 1);

      DrawSection(FSections.Items[I], R, (FSelectedSection = I) and
        (GetSectionIndexAtPos(P.X, P.Y) = I));
    end;
  end;
end;

function TcxCustomHeader.GetSectionRect(Index: Integer): TRect;
var
  I: Integer;
begin
  Result := Rect(0, 0, 0, 0);
  for I := 0 to Index - 1 do
    Result.Left := Result.Left + FSections.Items[I].Width;
  Result.Right := Result.Left + FSections.Items[Index].Width;
  Result.Bottom := Height;
end;

function TcxCustomHeader.GetPainterClass: TcxCustomLookAndFeelPainterClass;
begin
  Result := LookAndFeel.Painter;
{$IFDEF VCL}
  if AreVisualStylesAvailable and LookAndFeel.NativeStyle then
      Result := TcxWinXPLookAndFeelPainter
  else
{$ELSE}
  if not LookAndFeel.NativeStyle then
{$ENDIF}
    case LookAndFeel.Kind of
      lfFlat: Result := TcxFlatLookAndFeelPainter;
      lfUltraFlat: Result := TcxUltraFlatLookAndFeelPainter;
      lfStandard: Result := TcxStandardLookAndFeelPainter;
    end;
end;

procedure TcxCustomHeader.WMCaptureChanged(var Message: TMessage);
begin
  inherited;
end;

procedure TcxCustomHeader.WMLButtonDown(var Message: TWMLButtonDown);
begin
  if FMouseOnSizer and (FTrackedSection > -1) then
  begin
    DoSectionTrackEvent(FSections[FTrackedSection],
      FSections[FTrackedSection].Width, tsTrackBegin);
    SetCaptureControl(Self);
    FSectionResize := True;
    InitResize(Message.XPos, Message.YPos);
  end
  else
    if FTrackedSection >= 0 then
      FSelectedSection := FTrackedSection
    else
      FSelectedSection := -1;

  FFromIndex := GetSectionIndexAtPos(Message.XPos, Message.YPos);

  if ResizeUpdate then Invalidate;
  FPrevMousePos := Point(Message.XPos, Message.YPos);
end;

procedure TcxCustomHeader.WMMouseMove(var Message: TWMMouseMove);
var
  R: TRect;
  P, FLinePoint: TPoint;
  AState: TShiftState;
  FCalcNewWidth: Integer;
begin
  if (FTrackedSection <> GetSectionIndexAtPos(P.X, P.Y)) and
    not (csDesigning in ComponentState) then
    Invalidate;

  P := Point(Message.XPos, Message.YPos);
  AState := KeysToShiftState(Message.Keys);
  if not (ssLeft in AState) then
  begin
    FSelectedSection := -1;
    FTrackedSection := GetSectionIndexAtPos(P.X, P.Y);
    if FTrackedSection >= 0 then
    begin
      R := GetSectionRect(FTrackedSection);
      if (P.X >= R.Right - 7) and (P.X <= R.Right) then
        FMouseOnSizer := True
      else
      if (FTrackedSection > 0 ) and (P.X >= R.Left) and (P.X <= R.Left + 7) then
      begin
        FMouseOnSizer := True;
        Dec(FTrackedSection);
      end
      else
        FMouseOnSizer := False;

      if FMouseOnSizer then
        Screen.Cursor := crHSplit
      else
        Screen.Cursor := crDefault;
    end
    else
    if FSections.Count > 0 then
    begin
      R := GetSectionRect(FSections.Count - 1);
      if (P.X >= R.Right) and (P.X <= R.Right + 7) then
      begin
        Screen.Cursor := crHSplit;
        FTrackedSection := FSections.Count - 1;
      end
      else
        Screen.Cursor := crDefault;
    end;
  end
  else // left mouse button pressed
  if FMouseOnSizer then
  begin
    if FSectionResize then
    begin
      FCalcNewWidth := FSections.Items[FTrackedSection].Width -
        (GetSectionRect(FTrackedSection).Right - P.X);
      if FCalcNewWidth < FSections.Items[FTrackedSection].MinWidth then
        FCalcNewWidth := FSections.Items[FTrackedSection].MinWidth
      else
        if FCalcNewWidth > FSections.Items[FTrackedSection].MaxWidth then
          FCalcNewWidth := FSections.Items[FTrackedSection].MaxWidth;
      if (FCalcNewWidth + GetSectionRect(FTrackedSection).Left) > Width then
        FCalcNewWidth := Width - GetSectionRect(FTrackedSection).Left;
      if FCalcNewWidth <> FSections.Items[FTrackedSection].Width then
      begin
        DoSectionResizeEvent(FSections.Items[FTrackedSection]);
        if not ResizeUpdate then
        begin
          if FLineVisible then DrawSplitLine(FLastDrawPointOnMove);
          FLinePoint := P;
          FLinePoint.X := GetSectionRect(FTrackedSection).Left + FCalcNewWidth;
          DrawSplitLine(FLinePoint);
        end
        else
        begin
          FSections.Items[FTrackedSection].Width := FCalcNewWidth;
          DoSectionTrackEvent(FSections[FTrackedSection],
            FSections[FTrackedSection].Width, tsTrackMove);
          UpdateSections;
        end;
      end;
    end
    else
    if FSelectedSection >= 0 then
      PaintDragSection(P.X, P.Y, FSelectedSection)
    else
      UpdateSection(FSelectedSection);
  end
  else
    if FDragReorder then
    begin
      Cursor := crDrag;
      FSectionDragged := True;
      FToIndex := GetSectionIndexAtPos(Message.XPos, Message.YPos);
      DoSectionDrag(FSections[FFromIndex], FSections[FToIndex]);
    end;
  FPrevMousePos := Point(Message.XPos, Message.YPos);
  inherited;
end;

procedure TcxCustomHeader.WMLButtonUp(var Message: TWMLButtonUp);
var
  AState: TShiftState;
begin
  if FMouseOnSizer and (FTrackedSection <> -1) then
  begin
    if not ResizeUpdate then
    begin
      FSections[FTrackedSection].Width := FLastDrawPointOnMove.X - GetSectionRect(FTrackedSection).Left;
      ReleaseSplitLine;
    end;
  end
  else
    if FSectionDragged and FDragReorder then
    begin
      DoSectionEndDrag;
      Cursor := crDefault;
    end
    else
    begin
      if (FSelectedSection >= 0) and FSections[FSelectedSection].AllowClick and
        (GetSectionIndexAtPos(Message.XPos, Message.YPos) = FSelectedSection) then
      begin
        Cursor := crDefault;
        AState := KeysToShiftState(Message.Keys);
        DoSectionClickEvent(FSections[FSelectedSection]);
        DoSectionChangeSortOrderEvent(FSections[FSelectedSection], AState = [ssCtrl]);
      end;
    end;

  if FTrackedSection <> -1 then
  begin
    if FMouseOnSizer then
      DoSectionTrackEvent(FSections[FTrackedSection],
        FSections[FTrackedSection].Width, tsTrackEnd)
    else
      DoSectionTrackEvent(FSections[FTrackedSection],
        FSections[FTrackedSection].Width, tsTrackNone);
    DoSectionEndResizeEvent(FSections[FTrackedSection]);
  end;

  if not PtInRect(ClientRect, Point(Message.XPos, Message.YPos)) then
    Screen.Cursor := crDefault;

  SetCaptureControl(nil);
  FSectionResize := False;
  FSelectedSection := -1;
  Invalidate;

  FPrevMousePos := Point(Message.XPos, Message.YPos);
end;

function TcxCustomHeader.GetSectionIndexAtPos(X, Y: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FSections.Count - 1 do
    if PtInRect(GetSectionRect(I), Point(X, Y)) then
    begin
      Result := I;
      Break;
    end;
end;

procedure TcxCustomHeader.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if not (csDesigning in ComponentState) then
    Invalidate;
end;

procedure TcxCustomHeader.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if not FSectionResize then
    Screen.Cursor := crDefault;

  if FSelectedSection >= 0 then
    UpdateSection(FSelectedSection);

  if not (csDesigning in ComponentState) then
    Invalidate;
end;

procedure TcxCustomHeader.PaintDragSection(X, Y, Index: Integer);
var
  R: TRect;
begin
  Canvas.Pen.Mode := pmMerge;
  Canvas.Pen.Color := clLime;
  R := GetSectionRect(Index);
  OffsetRect(R, X - R.Left, 0);
  Canvas.FillRect(R);
end;

procedure TcxCustomHeader.SetAllowSort(Value: Boolean);
begin
  if FAllowSort <> Value then
  begin
    FAllowSort := Value;
    if not FAllowSort then DisableSort;
  end;
end;

procedure TcxCustomHeader.DisableSort;
var
  I: Integer;
begin
  Sections.BeginUpdate;
  try
    for I := 0 to Sections.Count - 1 do
      Sections[I].SortOrder := soNone;
  finally
    Sections.EndUpdate;
  end;
end;
{ TcxCustomHeader }

{ TcxHeaderSection }
constructor TcxHeaderSection.Create(Collection: TCollection);
begin
  FWidth := 50;
  FMaxWidth := 1000;
  FMinWidth := 30;
  FAllowClick := False;
  FImageIndex := -1;
  FParentBiDiMode := True;
  inherited Create(Collection);
  ParentBiDiModeChanged;
  FNativeIndex := Index;
end;

procedure TcxHeaderSection.Assign(Source: TPersistent);
begin
  if Source is TcxHeaderSection then
  begin
    Alignment := TcxHeaderSection(Source).Alignment;
    AllowClick := TcxHeaderSection(Source).AllowClick;
    AutoSize := TcxHeaderSection(Source).AutoSize;
    BiDiMode := TcxHeaderSection(Source).BiDiMode;
    ImageIndex := TcxHeaderSection(Source).ImageIndex;
    MinWidth := TcxHeaderSection(Source).MinWidth;
    MaxWidth := TcxHeaderSection(Source).MaxWidth;
    ParentBiDiMode := TcxHeaderSection(Source).ParentBiDiMode;
    SortOrder := TcxHeaderSection(Source).SortOrder;
    Text := TcxHeaderSection(Source).Text;
    Width := TcxHeaderSection(Source).Width;
  end
  else
    inherited Assign(Source);
end;

procedure TcxHeaderSection.SetBiDiMode(Value: TBiDiMode);
begin
  if Value <> FBiDiMode then
  begin
    FBiDiMode := Value;
    FParentBiDiMode := False;
    Changed(False);
  end;
end;

function TcxHeaderSection.IsBiDiModeStored: Boolean;
begin
  Result := not FParentBiDiMode;
end;

function TcxHeaderSection.GetHeaderControl: TcxCustomHeader;
begin
  Result := TcxHeaderSections(Collection).FHeaderControl;
end;

procedure TcxHeaderSection.SetParentBiDiMode(Value: Boolean);
begin
  if FParentBiDiMode <> Value then
  begin
    FParentBiDiMode := Value;
    ParentBiDiModeChanged;
  end;
end;

procedure TcxHeaderSection.ParentBiDiModeChanged;
begin
  if FParentBiDiMode then
  begin
    if GetOwner <> nil then
    begin
      BiDiMode := TcxHeaderSections(GetOwner).FHeaderControl.BiDiMode;
      FParentBiDiMode := True;
    end;
  end;
end;

function TcxHeaderSection.UseRightToLeftReading: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);
end;

function TcxHeaderSection.UseRightToLeftAlignment: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode = bdRightToLeft);
end;

function TcxHeaderSection.GetDisplayName: string;
begin
  Result := Text;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

function TcxHeaderSection.GetLeft: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Index - 1 do
    Inc(Result, TcxHeaderSections(Collection)[I].Width);
end;

function TcxHeaderSection.GetRight: Integer;
begin
  Result := Left + Width;
end;

procedure TcxHeaderSection.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Changed(False);
  end;
end;

procedure TcxHeaderSection.SetAutoSize(Value: Boolean);
begin
  if Value <> FAutoSize then
  begin
    FAutoSize := Value;
    if TcxHeaderSections(Collection).FHeaderControl <> nil then
      TcxHeaderSections(Collection).FHeaderControl.AdjustSize;
  end;
end;

procedure TcxHeaderSection.SetMaxWidth(Value: TcxNaturalNumber);
begin
  if Value < FMinWidth then
    Value := FMinWidth;
  if Value > 10000 then
    Value := 10000;
  FMaxWidth := Value;
  SetWidth(FWidth);
end;

procedure TcxHeaderSection.SetMinWidth(Value: TcxNaturalNumber);
begin
  if Value > FMaxWidth then
    Value := FMaxWidth;
  FMinWidth := Value;
  SetWidth(FWidth);
end;

procedure TcxHeaderSection.SetText(const Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    Changed(False);
    TcxHeaderSections(Collection).FHeaderControl.Invalidate;
  end;
end;

procedure TcxHeaderSection.SetSortOrder(Value: TcxHeaderSortOrder);
begin
  if FSortOrder <> Value then
  begin
    FSortOrder := Value;
    Changed(False);
    TcxHeaderSections(Collection).FHeaderControl.Invalidate;
  end;
end;

procedure TcxHeaderSection.SetWidth(Value: Integer);
begin
  if Value < FMinWidth then
    Value := FMinWidth;
  if Value > FMaxWidth then
    Value := FMaxWidth;
  if FWidth <> Value then
  begin
    FWidth := Value;

    if Collection <> nil then
      Changed(Index < Collection.Count - 1);

    TcxHeaderSections(Collection).FHeaderControl.Invalidate;
    TcxHeaderSections(Collection).FHeaderControl.DoSectionResizeEvent(Self);
    TcxHeaderSections(Collection).FHeaderControl.DoSectionEndResizeEvent(Self);
  end;
end;

procedure TcxHeaderSection.SetImageIndex(const Value: TImageIndex);
begin
  if Value <> FImageIndex then
  begin
    FImageIndex := Value;
    Changed(False);
  end;
end;
{ TcxHeaderSection }

{ TcxHeaderSections }
constructor TcxHeaderSections.Create(HeaderControl: TcxCustomHeader);
begin
  inherited Create(TcxHeaderSection);
  FHeaderControl := HeaderControl;
end;

procedure TcxHeaderSections.Assign(Source: TPersistent);
var
  FHeaderSection: TcxHeaderSection;
  I: Integer;
begin
  if (Source is TcxHeaderSections) then
  begin
    Clear;
    for I := 0 to (Source as TcxHeaderSections).Count - 1 do
    begin
      FHeaderSection := Add;
      FHeaderSection.Assign((Source as TcxHeaderSections).Items[I]);
    end;
  end
  else
    inherited Assign(Source);
end;

{$IFDEF DELPHI6}
procedure TcxHeaderSections.Notify(Item: TCollectionItem; Action: TCollectionNotification);
begin
  inherited Notify(Item, Action);
  case Action of
    cnAdded:
      if Assigned(FOnSectionAdd) then
        FOnSectionAdd(Self);
    cnDeleting:
      if Assigned(FOnSectionDelete) then
        FOnSectionDelete(Self);
  end;
end;
{$ENDIF}

function TcxHeaderSections.Add: TcxHeaderSection;
begin
  Result := TcxHeaderSection.Create(Self);
{$IFNDEF DELPHI6}
  if Assigned(FOnSectionAdd) then
    FOnSectionAdd(Self);
{$ENDIF}
end;

procedure TcxHeaderSections.Delete(Index: Integer);
begin
  TcxHeaderSection(Items[Index]).Free;
{$IFNDEF DELPHI6}
  if Assigned(FOnSectionDelete) then
    FOnSectionDelete(Self);
{$ELSE}
  Notify(nil, cnDeleting);
{$ENDIF}
end;

function TcxHeaderSections.GetItem(Index: Integer): TcxHeaderSection;
begin
  Result := TcxHeaderSection(inherited GetItem(Index));
end;

function TcxHeaderSections.GetOwner: TPersistent;
begin
  Result := FHeaderControl;
end;

procedure TcxHeaderSections.SetItem(Index: Integer; Value: TcxHeaderSection);
begin
  inherited SetItem(Index, Value);
end;

procedure TcxHeaderSections.Update(Item: TCollectionItem);
begin
  if FHeaderControl = nil then Exit;
  if Item <> nil then
    FHeaderControl.UpdateSection(Item.Index)
  else
    FHeaderControl.UpdateSections;
end;

function TcxHeaderSections.Insert(Index: Integer): TcxHeaderSection;
begin
  BeginUpdate;
  try
    if Index < 0 then Index := 0;
    if Index > Count then Index := Count - 1;

    Result := Add;
    Result.Index := Index;
  finally
    EndUpdate;
  end;
end;
{ TcxHeaderSections }

{ TcxHeader }
function TcxHeader.GetOnDrawSection: TcxDrawSectionEvent;
begin
  Result := TcxDrawSectionEvent(inherited OnDrawSection);
end;

function TcxHeader.GetOnSectionClick: TcxSectionNotifyEvent;
begin
  Result := TcxSectionNotifyEvent(inherited OnSectionClick);
end;

function TcxHeader.GetOnSectionResize: TcxSectionNotifyEvent;
begin
  Result := TcxSectionNotifyEvent(inherited OnSectionResize);
end;

function TcxHeader.GetOnSectionEndResize: TcxSectionNotifyEvent;
begin
  Result := TcxSectionNotifyEvent(inherited OnSectionEndResize);
end;

function TcxHeader.GetOnSectionTrack: TcxSectionTrackEvent;
begin
  Result := TcxSectionTrackEvent(inherited OnSectionTrack);
end;

procedure TcxHeader.SetOnDrawSection(const Value: TcxDrawSectionEvent);
begin
  inherited OnDrawSection := TcxDrawSectionEvent(Value);
end;

procedure TcxHeader.SetOnSectionClick(const Value: TcxSectionNotifyEvent);
begin
  inherited OnSectionClick := TcxSectionNotifyEvent(Value);
end;

procedure TcxHeader.SetOnSectionResize(const Value: TcxSectionNotifyEvent);
begin
  inherited OnSectionResize := TcxSectionNotifyEvent(Value);
end;

procedure TcxHeader.SetOnSectionEndResize(const Value: TcxSectionNotifyEvent);
begin
  inherited OnSectionEndResize := TcxSectionNotifyEvent(Value);
end;

procedure TcxHeader.SetOnSectionTrack(const Value: TcxSectionTrackEvent);
begin
  inherited OnSectionTrack := TcxSectionTrackEvent(Value);
end;
{ TcxHeader }

end.
