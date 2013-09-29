{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressQuantumGrid                                           }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSQUANTUMGRID AND ALL            }
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

unit cxGridRows;

{$I cxGridVer.inc}

interface

uses
{$IFDEF VCL}
  Windows,
{$ELSE}
  Types,
{$ENDIF}
  Classes, Graphics, Controls,
  cxClasses, cxControls, cxGraphics, cxLookAndFeelPainters,
  cxGridCommon, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridViewData,
  cxGridDetailsSite;

const
  htPreview = htGridBase + 31;

type
  TcxGridDataCellViewInfoClass = class of TcxGridDataCellViewInfo;
  TcxGridDataCellViewInfo = class;
  TcxGridDataRowCellsAreaViewInfo = class;
  TcxGridDataRowViewInfo = class;
  TcxGridNewItemRowViewInfo = class;
  TcxGridGroupCellViewInfo = class;
  TcxGridGroupRowViewInfo = class;
  TcxGridExpandButtonCellViewInfo = class;
  TcxGridMasterDataRowViewInfo = class;

  { hit tests }

  TcxGridPreviewHitTest = class(TcxGridRecordCellHitTest)
  protected
    class function GetHitTestCode: Integer; override;
  end;

  { painters }

  TcxGridDataCellPainter = class(TcxGridTableDataCellPainter)
  private
    function GetViewInfo: TcxGridDataCellViewInfo;
  protected
    procedure DrawBorder(ABorder: TcxBorder); override;
    function ExcludeFromClipRect: Boolean; override;
    property ViewInfo: TcxGridDataCellViewInfo read GetViewInfo;
  end;

  TcxGridDataRowPainter = class(TcxCustomGridRowPainter)
  private
    function GetViewInfo: TcxGridDataRowViewInfo;
  protected
    function GetShowCells: Boolean; virtual;
    procedure Paint; override;
    property ShowCells: Boolean read GetShowCells;
    property ViewInfo: TcxGridDataRowViewInfo read GetViewInfo;
  end;

  TcxGridNewItemRowPainter = class(TcxGridDataRowPainter)
  private
    function GetViewInfo: TcxGridNewItemRowViewInfo;
  protected
    procedure DrawBackground; override;
    procedure DrawNewItemRowSeparator; virtual;
    function GetShowCells: Boolean; override;
    procedure Paint; override;
    property ViewInfo: TcxGridNewItemRowViewInfo read GetViewInfo;
  end;

  TcxGridExpandButtonCellPainter = class(TcxCustomGridCellPainter)
  private
    function GetViewInfo: TcxGridExpandButtonCellViewInfo;
  protected
    procedure DrawBorder(ABorder: TcxBorder); override;
    property ViewInfo: TcxGridExpandButtonCellViewInfo read GetViewInfo;
  end;

  TcxGridMasterDataRowPainter = class(TcxGridDataRowPainter)
  private
    function GetViewInfo: TcxGridMasterDataRowViewInfo;
  protected
    procedure DrawDetailsSite; virtual;
    procedure DrawDetailsArea; virtual;
    procedure DrawExpandButtonCell; virtual;
    function NeedsPainting: Boolean; override;
    procedure Paint; override;
    property ViewInfo: TcxGridMasterDataRowViewInfo read GetViewInfo;
  end;

  TcxGridGroupCellPainter = class(TcxCustomGridCellPainter)
  private
    function GetViewInfo: TcxGridGroupCellViewInfo;
  protected
    procedure DrawBorder(ABorder: TcxBorder); override;
    property ViewInfo: TcxGridGroupCellViewInfo read GetViewInfo;
  end;

  TcxGridGroupRowPainter = class(TcxCustomGridRowPainter)
  private
    function GetViewInfo: TcxGridGroupRowViewInfo;
  protected
    procedure DrawBackground; override;
    procedure DrawSeparator; override;
    procedure Paint; override;
    property ViewInfo: TcxGridGroupRowViewInfo read GetViewInfo;
  end;

  { view infos }

  TcxGridCellViewInfo = class(TcxGridTableCellViewInfo)
  private
    function GetGridView: TcxGridTableView;
    function GetGridLines: TcxGridLines;
    function GetGridRecord: TcxCustomGridRow;
    function GetGridViewInfo: TcxGridTableViewInfo;
    function GetRecordViewInfo: TcxCustomGridRowViewInfo;
  protected
    function GetBorderColor(AIndex: TcxBorder): TColor; override;
    function GetBorderWidth(AIndex: TcxBorder): Integer; override;
    procedure GetViewParams(var AParams: TcxViewParams); override;

    property GridView: TcxGridTableView read GetGridView;
    property GridLines: TcxGridLines read GetGridLines;
    property GridRecord: TcxCustomGridRow read GetGridRecord;
    property GridViewInfo: TcxGridTableViewInfo read GetGridViewInfo;
    property RecordViewInfo: TcxCustomGridRowViewInfo read GetRecordViewInfo;
  end;

  // data row

  TcxGridDataCellViewInfo = class(TcxGridTableDataCellViewInfo)
  private
    function GetCacheItem: TcxGridTableViewInfoCacheItem;
    function GetGridView: TcxGridTableView;
    function GetGridLines: TcxGridLines;
    function GetGridRecord: TcxGridDataRow;
    function GetGridViewInfo: TcxGridTableViewInfo;
    function GetItem: TcxGridColumn;
    function GetRecordViewInfo: TcxGridDataRowViewInfo;
  protected
    function CalculateWidth: Integer; override;
    function GetBorderColor(AIndex: TcxBorder): TColor; override;
    function GetBorders: TcxBorders; override;
    function GetBorderWidth(AIndex: TcxBorder): Integer; override;
    function GetMultiLine: Boolean; override;
    function GetPainterClass: TcxCustomGridCellPainterClass; override;

    property CacheItem: TcxGridTableViewInfoCacheItem read GetCacheItem;
    property GridView: TcxGridTableView read GetGridView;
    property GridLines: TcxGridLines read GetGridLines;
    property GridRecord: TcxGridDataRow read GetGridRecord;
    property GridViewInfo: TcxGridTableViewInfo read GetGridViewInfo;
  public
    procedure BeforeRecalculation; override;
    property Item: TcxGridColumn read GetItem;
    property RecordViewInfo: TcxGridDataRowViewInfo read GetRecordViewInfo;
  end;

  TcxGridDataRowCellsAreaViewInfoClass = class of TcxGridDataRowCellsAreaViewInfo;

  TcxGridDataRowCellsAreaViewInfo = class(TcxGridCellViewInfo)
  private
    function GetRecordViewInfo: TcxGridDataRowViewInfo;
  protected
    function CalculateHeight: Integer; override;
    function CalculateVisible: Boolean; virtual;
    function CalculateWidth: Integer; override;
    function GetBorders: TcxBorders; override;
    function GetIsBottom: Boolean; virtual;
  public
    constructor Create(ARecordViewInfo: TcxCustomGridRecordViewInfo); override;
    function CanDrawSelected: Boolean; override;
    property IsBottom: Boolean read GetIsBottom;
    property RecordViewInfo: TcxGridDataRowViewInfo read GetRecordViewInfo;
  end;

  TcxGridPreviewCellViewInfoClass = class of TcxGridPreviewCellViewInfo;

  TcxGridPreviewCellViewInfo = class(TcxGridDataCellViewInfo)
  private
    function GetPreview: TcxGridPreview;
  protected
    function CalculateHeight: Integer; override;
    function CalculateWidth: Integer; override;
    function GetAutoHeight: Boolean; override;
    function GetBackgroundBitmap: TBitmap; override;
    function GetBorders: TcxBorders; override;
    procedure GetEditViewDataContentOffsets(var R: TRect); override;
    function GetHeight: Integer; override;
    function GetHitTestClass: TcxCustomGridHitTestClass; override;
    function GetMaxLineCount: Integer; override;
    function GetMultiLine: Boolean; override;
    function GetTextAreaBounds: TRect; override;
    property Preview: TcxGridPreview read GetPreview;
  end;

  TcxGridDataRowViewInfo = class(TcxCustomGridRowViewInfo)
  private
    FCellHeight: Integer;
    FCellsAreaBounds: TRect;
    FCellsAreaViewInfo: TcxGridDataRowCellsAreaViewInfo;
    FCellViewInfos: TList;
    FPreviewViewInfo: TcxGridPreviewCellViewInfo;
    function GetCellViewInfo(Index: Integer): TcxGridDataCellViewInfo;
    function GetCellViewInfoCount: Integer;
    function GetGridRecord: TcxGridDataRow;
    function GetHasPreview: Boolean;
    function GetInternalCellViewInfo(Index: Integer): TcxGridDataCellViewInfo;
    procedure CreateViewInfos;
    procedure DestroyViewInfos;
  protected
    procedure CalculateCellViewInfo(AIndex: Integer); virtual;
    function CalculateHeight: Integer; override;
    function CanSize: Boolean; override;
    procedure CheckRowHeight(var AValue: Integer); override;
    function GetAutoHeight: Boolean; override;
    function GetBackgroundBitmapBounds: TRect; override;
    function GetBaseHeight: Integer; override;
    function GetPainterClass: TcxCustomGridCellPainterClass; override;
    procedure Offset(DX, DY: Integer); override;
    procedure SetRowHeight(Value: Integer); override;

    function GetCellHeight(AIndex: Integer): Integer; reintroduce; virtual;
    function GetCellHeightValue: Integer; virtual;
    function GetCellLeftBound(AIndex: Integer): Integer; virtual;
    function GetCellTopBound(AIndex: Integer): Integer; virtual;
    function GetCellsAreaBounds: TRect; virtual;
    function GetCellsAreaViewInfoClass: TcxGridDataRowCellsAreaViewInfoClass; virtual;
    function GetCellViewInfoClass(AIndex: Integer): TcxGridDataCellViewInfoClass; virtual;
    function GetCellWidth(AIndex: Integer): Integer; virtual;
    function GetPreviewViewInfoClass: TcxGridPreviewCellViewInfoClass; virtual;
    function GetShowPreview: Boolean; virtual;
    function IsCellVisible(AIndex: Integer): Boolean; virtual;

    property CellHeight: Integer read GetCellHeightValue;
    property ShowPreview: Boolean read GetShowPreview;
  public
    constructor Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
      ARecord: TcxCustomGridRecord); override;
    destructor Destroy; override;
    procedure BeforeCellRecalculation(ACell: TcxGridTableCellViewInfo); virtual;
    procedure BeforeRecalculation; override;
    procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;
      AHeight: Integer = -1); override;
    function GetBoundsForItem(AItem: TcxCustomGridTableItem): TRect; override;
    function GetCellBorders(AIsRight, AIsBottom: Boolean): TcxBorders; virtual;
    function GetCellViewInfoByItem(AItem: TcxCustomGridTableItem): TcxGridTableDataCellViewInfo; override;
    function GetHitTest(const P: TPoint): TcxCustomGridHitTest; override;

    property CellsAreaBounds: TRect read GetCellsAreaBounds;
    property CellsAreaViewInfo: TcxGridDataRowCellsAreaViewInfo read FCellsAreaViewInfo;
    property CellViewInfoCount: Integer read GetCellViewInfoCount;
    property CellViewInfos[Index: Integer]: TcxGridDataCellViewInfo read GetCellViewInfo;
    property GridRecord: TcxGridDataRow read GetGridRecord;
    property HasPreview: Boolean read GetHasPreview;
    property InternalCellViewInfos[Index: Integer]: TcxGridDataCellViewInfo read GetInternalCellViewInfo;
    property PreviewViewInfo: TcxGridPreviewCellViewInfo read FPreviewViewInfo;
  end;

  // new item row

  TcxGridNewItemRowViewInfo = class(TcxGridDataRowViewInfo)
  private
    FHeight: Integer;
    function GetNewItemRowSeparatorColor: TColor;
    function GetNewItemRowSeparatorWidth: Integer;
  protected
    function CalculateSelected: Boolean; override;
    function GetAlignmentHorz: TAlignment; override;
    function GetAlignmentVert: TcxAlignmentVert; override;
    function GetAutoHeight: Boolean; override;
    function GetBottomPartHeight: Integer; override;
    function GetCellLeftBound(AIndex: Integer): Integer; override;
    function GetCellWidth(AIndex: Integer): Integer; override;
    function GetHeight: Integer; override;
    function GetNewItemRowSeparatorBounds: TRect; virtual;
    function GetShowInfoText: Boolean; virtual;
    function GetShowPreview: Boolean; override;
    function GetShowSeparator: Boolean; override;
    function GetText: string; override;
    function GetTextAreaBounds: TRect; override;
    procedure GetViewParams(var AParams: TcxViewParams); override;
    function HasLastHorzGridLine: Boolean; override;

    function GetPainterClass: TcxCustomGridCellPainterClass; override;

    property NewItemRowSeparatorWidth: Integer read GetNewItemRowSeparatorWidth;
    property ShowInfoText: Boolean read GetShowInfoText;
  public
    property NewItemRowSeparatorBounds: TRect read GetNewItemRowSeparatorBounds;
    property NewItemRowSeparatorColor: TColor read GetNewItemRowSeparatorColor;
  end;

  // details site

  TcxGridDetailsSiteViewInfoClass = class of TcxGridDetailsSiteViewInfo;

  TcxGridDetailsSiteViewInfo = class(TcxCustomGridDetailsSiteViewInfo)
  private
    FMasterDataRowViewInfo: TcxGridMasterDataRowViewInfo;
    function GetCacheItem: TcxGridMasterTableViewInfoCacheItem;
    function GetMasterGridView: TcxCustomGridView;
    function GetMasterGridViewInfo: TcxCustomGridViewInfo;
  protected
    procedure ControlFocusChanged; virtual;
    function GetActiveGridView: TcxCustomGridView; override;
    function GetActiveGridViewExists: Boolean; override;
    function GetActiveGridViewValue: TcxCustomGridView; override;
    function GetActiveLevel: TcxGridLevel; override;
    function GetCanvas: TcxCanvas; override;
    function GetHeight: Integer; override;
    function GetLookAndFeelPainter: TcxCustomLookAndFeelPainterClass; override;
    function GetMaxHeight: Integer; override;
    function GetMaxNormalHeight: Integer; override;
    function GetMaxWidth: Integer; override;
    function GetNormalHeight: Integer; override;
    function GetVisible: Boolean; override;
    function GetWidth: Integer; override;

    procedure InitTabHitTest(AHitTest: TcxGridDetailsSiteTabHitTest); override;

    property CacheItem: TcxGridMasterTableViewInfoCacheItem read GetCacheItem;
    property MasterGridView: TcxCustomGridView read GetMasterGridView;
    property MasterGridViewInfo: TcxCustomGridViewInfo read GetMasterGridViewInfo;
    property MasterDataRowViewInfo: TcxGridMasterDataRowViewInfo read FMasterDataRowViewInfo;
  public
    constructor Create(AMasterDataRowViewInfo: TcxGridMasterDataRowViewInfo); reintroduce; virtual;
    procedure ChangeActiveTab(ALevel: TcxGridLevel); override;
  end;

  // master data row

  TcxGridExpandButtonCellViewInfoClass = class of TcxGridExpandButtonCellViewInfo;

  TcxGridExpandButtonCellViewInfo = class(TcxGridCellViewInfo)
  private
    function GetRecordViewInfo: TcxGridMasterDataRowViewInfo;
    function GetRightBorderRestSpaceBounds: TRect;
  protected
    function CalculateHeight: Integer; override;
    function CalculateWidth: Integer; override;
    function GetBackgroundBitmap: TBitmap; override;
    function GetBaseWidth: Integer; virtual;
    function GetBorderBounds(AIndex: TcxBorder): TRect; override;
    function GetBorders: TcxBorders; override;
    function GetPainterClass: TcxCustomGridCellPainterClass; override;

    property BaseWidth: Integer read GetBaseWidth;
    property RecordViewInfo: TcxGridMasterDataRowViewInfo read GetRecordViewInfo;
    property RightBorderRestSpaceBounds: TRect read GetRightBorderRestSpaceBounds;
  end;

  TcxGridDetailsAreaViewInfoClass = class of TcxGridDetailsAreaViewInfo;

  TcxGridDetailsAreaViewInfo = class(TcxGridCellViewInfo)
  private
    function GetRecordViewInfo: TcxGridMasterDataRowViewInfo;
  protected
    function CalculateHeight: Integer; override;
    function CalculateWidth: Integer; override;
    function GetBorders: TcxBorders; override;
    property RecordViewInfo: TcxGridMasterDataRowViewInfo read GetRecordViewInfo;
  end;

  TcxGridMasterDataRowViewInfo = class(TcxGridDataRowViewInfo)
  private
    FDetailsAreaViewInfo: TcxGridDetailsAreaViewInfo;
    FDetailsSiteViewInfo: TcxGridDetailsSiteViewInfo;
    FExpandButtonCellViewInfo: TcxGridExpandButtonCellViewInfo;
    FRestHeight: Integer;
    function GetCacheItem: TcxGridMasterTableViewInfoCacheItem;
    function GetDetailsSiteIndentBounds: TRect;
    function GetGridRecord: TcxGridMasterDataRow;
  protected
    procedure CalculateExpandButtonBounds(var ABounds: TRect); override;
    function CalculateHeight: Integer; override;
    function CalculateRestHeight(ARowHeight: Integer): Integer; virtual;
    procedure ControlFocusChanged; override;
    function GetDataHeight: Integer; override;
    function GetDataIndent: Integer; override;
    function GetDataWidth: Integer; override;
    function GetExpandButtonAreaBounds: TRect; override;
    function GetMaxHeight: Integer; override;
    function IsDetailVisible(ADetail: TcxCustomGridView): Boolean; override;
    procedure VisibilityChanged(AVisible: Boolean); override;

    function GetPainterClass: TcxCustomGridCellPainterClass; override;

    function GetDetailsAreaViewInfoClass: TcxGridDetailsAreaViewInfoClass; virtual;
    function GetDetailsSiteViewInfoClass: TcxGridDetailsSiteViewInfoClass; virtual;
    function GetExpandButtonCellViewInfoClass: TcxGridExpandButtonCellViewInfoClass; virtual;

    property CacheItem: TcxGridMasterTableViewInfoCacheItem read GetCacheItem;
    property DetailsAreaViewInfo: TcxGridDetailsAreaViewInfo read FDetailsAreaViewInfo;
    property DetailsSiteIndentBounds: TRect read GetDetailsSiteIndentBounds;
    property ExpandButtonCellViewInfo: TcxGridExpandButtonCellViewInfo read FExpandButtonCellViewInfo;
    property RestHeight: Integer read FRestHeight write FRestHeight;
  public
    constructor Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
      ARecord: TcxCustomGridRecord); override;
    destructor Destroy; override;
    procedure BeforeRecalculation; override;
    procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;
      AHeight: Integer = -1); override;
    function GetHitTest(const P: TPoint): TcxCustomGridHitTest; override;
    property DetailsSiteViewInfo: TcxGridDetailsSiteViewInfo read FDetailsSiteViewInfo;
    property GridRecord: TcxGridMasterDataRow read GetGridRecord;
  end;

  // group row

  TcxGridGroupCellViewInfo = class(TcxGridCellViewInfo)
  private
    function GetExpandedAreaBounds: TRect;
    function GetGridRecord: TcxGridGroupRow;
    function GetRecordViewInfo: TcxGridGroupRowViewInfo;
  protected
    function CalculateHeight: Integer; override;
    function CalculateWidth: Integer; override;
    function CustomDraw(ACanvas: TcxCanvas): Boolean; override;
    function GetAlignmentVert: TcxAlignmentVert; override;
    function GetAlwaysSelected: Boolean; override;
    function GetBackgroundBitmap: TBitmap; override;
    function GetBorderBounds(AIndex: TcxBorder): TRect; override;
    function GetBorderColor(AIndex: TcxBorder): TColor; override;
    function GetBorders: TcxBorders; override;
    function GetBorderWidth(AIndex: TcxBorder): Integer; override;
    function GetPainterClass: TcxCustomGridCellPainterClass; override;
    function GetText: string; override;
    function GetTextAreaBounds: TRect; override;
    procedure GetViewParams(var AParams: TcxViewParams); override;
    function HasCustomDraw: Boolean; override;

    property ExpandedAreaBounds: TRect read GetExpandedAreaBounds;
    property GridRecord: TcxGridGroupRow read GetGridRecord;
    property RecordViewInfo: TcxGridGroupRowViewInfo read GetRecordViewInfo;
  public
    function CanDrawSelected: Boolean; override;
  end;

  TcxGridGroupRowViewInfo = class(TcxCustomGridRowViewInfo)
  private
    FCellViewInfo: TcxGridGroupCellViewInfo;
    function GetGridRecord: TcxGridGroupRow;
  protected
    procedure CalculateExpandButtonBounds(var ABounds: TRect); override;
    function CalculateHeight: Integer; override;
    function CanSize: Boolean; override;
    procedure CheckRowHeight(var AValue: Integer); override;
    function GetAutoHeight: Boolean; override;
    function GetBackgroundBitmap: TBitmap; override;
    function GetExpandButtonAreaBounds: TRect; override;
    //function GetFocusRectBounds: TRect; override;
    function GetPainterClass: TcxCustomGridCellPainterClass; override;
    function GetSeparatorBounds: TRect; override;
    function GetSeparatorIndentBounds: TRect; virtual;
    function HasFocusRect: Boolean; override;
    function HasFooter(ALevel: Integer): Boolean; override;
    procedure Offset(DX, DY: Integer); override;
    procedure SetRowHeight(Value: Integer); override;
  public
    constructor Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
      ARecord: TcxCustomGridRecord); override;
    destructor Destroy; override;
    procedure BeforeRecalculation; override;
    procedure Calculate(ALeftBound, ATopBound: Integer; AWidth: Integer = -1;
      AHeight: Integer = -1); override;
    {procedure GetDataCellViewParams(AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableCellViewInfo; var AParams: TcxViewParams); override;}
    property CellViewInfo: TcxGridGroupCellViewInfo read FCellViewInfo;
    property GridRecord: TcxGridGroupRow read GetGridRecord;
    property SeparatorIndentBounds: TRect read GetSeparatorIndentBounds;
  end;

implementation

uses
{$IFNDEF VCL}
  Qt,
{$ENDIF}
  SysUtils, cxCustomData, cxGrid;

type
  TcxCustomGridAccess = class(TcxCustomGrid);
  TcxGridLevelAccess = class(TcxGridLevel);
  TcxGridColumnAccess = class(TcxGridColumn);
  TcxGridTableViewAccess = class(TcxGridTableView);

{ TcxGridPreviewHitTest }

class function TcxGridPreviewHitTest.GetHitTestCode: Integer;
begin
  Result := htPreview;
end;

{ TcxGridDataCellPainter }

function TcxGridDataCellPainter.GetViewInfo: TcxGridDataCellViewInfo;
begin
  Result := TcxGridDataCellViewInfo(inherited ViewInfo);
end;

procedure TcxGridDataCellPainter.DrawBorder(ABorder: TcxBorder);
begin
  if ExcludeFromClipRect then
    inherited
  else
    TcxGridTablePainter(ViewInfo.GridViewInfo.Painter).AddGridLine(ViewInfo.BorderBounds[ABorder]);
end;

function TcxGridDataCellPainter.ExcludeFromClipRect: Boolean;
begin
  Result := ViewInfo.RecordViewInfo.CellsAreaViewInfo.Visible;
end;

{ TcxGridDataRowPainter }

function TcxGridDataRowPainter.GetViewInfo: TcxGridDataRowViewInfo;
begin
  Result := TcxGridDataRowViewInfo(inherited ViewInfo);
end;

function TcxGridDataRowPainter.GetShowCells: Boolean;
begin
  Result := True;
end;

procedure TcxGridDataRowPainter.Paint;
var
  AClipRegion: TcxRegion;

  procedure DrawCells;
  begin
    ViewInfo.RecordsViewInfo.PainterClass.DrawDataRowCells(ViewInfo);
  end;

  procedure DrawPreview;
  begin
    with ViewInfo do
      if HasPreview and (PreviewViewInfo.Height <> 0) then
        PreviewViewInfo.Paint;
  end;

begin
  if ShowCells then
  begin
    AClipRegion := Canvas.GetClipRegion;
    try
      DrawCells;
      DrawPreview;
    finally
      Canvas.SetClipRegion(AClipRegion, roSet);
    end;
  end;
  inherited;
end;

{ TcxGridNewItemRowPainter }

function TcxGridNewItemRowPainter.GetViewInfo: TcxGridNewItemRowViewInfo;
begin
  Result := TcxGridNewItemRowViewInfo(inherited ViewInfo);
end;

procedure TcxGridNewItemRowPainter.DrawBackground;
begin
  if not ShowCells and not ViewInfo.Transparent then
  begin
    Canvas.Brush.Color := ViewInfo.Params.Color;
    Canvas.FillRect(ViewInfo.ContentBounds);
  end
  else
    inherited;
end;

procedure TcxGridNewItemRowPainter.DrawNewItemRowSeparator;
begin
  with ViewInfo, LookAndFeelPainter do
    DrawHeader(Self.Canvas, NewItemRowSeparatorBounds, NewItemRowSeparatorBounds,
      [], cxBordersAll, cxbsNormal, taLeftJustify, vaTop, False, False, '', nil,
      DefaultHeaderTextColor, NewItemRowSeparatorColor);
end;

function TcxGridNewItemRowPainter.GetShowCells: Boolean;
begin
  Result := ViewInfo.Text = '';
end;

procedure TcxGridNewItemRowPainter.Paint;
begin
  inherited;
  DrawText;
  DrawNewItemRowSeparator;
end;

{ TcxGridExpandButtonCellPainter }

function TcxGridExpandButtonCellPainter.GetViewInfo: TcxGridExpandButtonCellViewInfo;
begin
  Result := TcxGridExpandButtonCellViewInfo(inherited ViewInfo);
end;

procedure TcxGridExpandButtonCellPainter.DrawBorder(ABorder: TcxBorder);
begin
  inherited;
  if ABorder = bRight then
  begin
    Canvas.Brush.Color := ViewInfo.Params.Color;
    Canvas.FillRect(ViewInfo.RightBorderRestSpaceBounds);
  end;
end;

{ TcxGridMasterDataRowPainter }

function TcxGridMasterDataRowPainter.GetViewInfo: TcxGridMasterDataRowViewInfo;
begin
  Result := TcxGridMasterDataRowViewInfo(inherited ViewInfo);
end;

procedure TcxGridMasterDataRowPainter.DrawDetailsSite;
begin
  ViewInfo.DetailsSiteViewInfo.Paint(Canvas);
end;

procedure TcxGridMasterDataRowPainter.DrawDetailsArea;
begin
  ViewInfo.DetailsAreaViewInfo.Paint;
end;

procedure TcxGridMasterDataRowPainter.DrawExpandButtonCell;
begin
  ViewInfo.ExpandButtonCellViewInfo.Paint;
end;

function TcxGridMasterDataRowPainter.NeedsPainting: Boolean;
begin
  Result := inherited NeedsPainting or
    Canvas.RectVisible(ViewInfo.DetailsAreaViewInfo.Bounds);
end;

procedure TcxGridMasterDataRowPainter.Paint;
begin
  DrawExpandButtonCell;
  if ViewInfo.DetailsSiteViewInfo.Visible then
  begin
    DrawDetailsSite;
    DrawDetailsArea;
  end;
  inherited;
end;

{ TcxGridGroupCellPainter }

function TcxGridGroupCellPainter.GetViewInfo: TcxGridGroupCellViewInfo;
begin
  Result := TcxGridGroupCellViewInfo(inherited ViewInfo);
end;

procedure TcxGridGroupCellPainter.DrawBorder(ABorder: TcxBorder);
begin
  inherited;
  with Canvas, ViewInfo do
    if (ABorder = bBottom) and GridRecord.Expanded then
      if GridViewInfo.LevelIndentBackgroundBitmap = nil then
      begin
        Brush.Color := GridViewInfo.LevelIndentColors[GridRecord.Level];
        FillRect(ExpandedAreaBounds);
      end
      else        {4}                                                     
        FillRect(ExpandedAreaBounds, GridViewInfo.LevelIndentBackgroundBitmap);
end;

{ TcxGridGroupRowPainter }

function TcxGridGroupRowPainter.GetViewInfo: TcxGridGroupRowViewInfo;
begin
  Result := TcxGridGroupRowViewInfo(inherited ViewInfo);
end;

procedure TcxGridGroupRowPainter.DrawBackground;
begin  {4}
end;

procedure TcxGridGroupRowPainter.DrawSeparator;
var
  R: TRect;
begin
  R := ViewInfo.SeparatorIndentBounds;
  if not IsRectEmpty(R) then
    DrawIndentPart(ViewInfo.Level, R);
  inherited;
end;

procedure TcxGridGroupRowPainter.Paint;
begin
  ViewInfo.CellViewInfo.Paint;
  inherited;
end;

{ TcxGridCellViewInfo }

function TcxGridCellViewInfo.GetGridView: TcxGridTableView;
begin
  Result := TcxGridTableView(inherited GridView);
end;

function TcxGridCellViewInfo.GetGridLines: TcxGridLines;
begin
  Result := RecordViewInfo.GridLines;
end;

function TcxGridCellViewInfo.GetGridRecord: TcxCustomGridRow;
begin
  Result := TcxCustomGridRow(inherited GridRecord);
end;

function TcxGridCellViewInfo.GetGridViewInfo: TcxGridTableViewInfo;
begin
  Result := TcxGridTableViewInfo(inherited GridViewInfo);
end;

function TcxGridCellViewInfo.GetRecordViewInfo: TcxCustomGridRowViewInfo;
begin
  Result := TcxCustomGridRowViewInfo(inherited RecordViewInfo);
end;

function TcxGridCellViewInfo.GetBorderColor(AIndex: TcxBorder): TColor;
begin
  Result := GridViewInfo.GridLineColor;
end;

function TcxGridCellViewInfo.GetBorderWidth(AIndex: TcxBorder): Integer;
begin
  Result := GridViewInfo.GridLineWidth;
end;

procedure TcxGridCellViewInfo.GetViewParams(var AParams: TcxViewParams);
begin
  GridView.Styles.GetDataCellParams(GridRecord, nil, AParams, True, Self);
end;

{ TcxGridDataCellViewInfo }

function TcxGridDataCellViewInfo.GetBorderColor(AIndex: TcxBorder): TColor;
begin
  Result := GridViewInfo.GridLineColor;
end;

function TcxGridDataCellViewInfo.GetBorderWidth(AIndex: TcxBorder): Integer;
begin
  Result := GridViewInfo.GridLineWidth;
end;

function TcxGridDataCellViewInfo.GetCacheItem: TcxGridTableViewInfoCacheItem;
begin
  Result := TcxGridTableViewInfoCacheItem(inherited CacheItem);
end;

function TcxGridDataCellViewInfo.GetGridView: TcxGridTableView;
begin
  Result := TcxGridTableView(inherited GridView);
end;

function TcxGridDataCellViewInfo.GetGridLines: TcxGridLines;
begin
  Result := RecordViewInfo.GridLines;
end;

function TcxGridDataCellViewInfo.GetGridRecord: TcxGridDataRow;
begin
  Result := TcxGridDataRow(inherited GridRecord);
end;

function TcxGridDataCellViewInfo.GetGridViewInfo: TcxGridTableViewInfo;
begin
  Result := TcxGridTableViewInfo(inherited GridViewInfo);
end;

function TcxGridDataCellViewInfo.GetItem: TcxGridColumn;
begin
  Result := TcxGridColumn(inherited Item);
end;

function TcxGridDataCellViewInfo.GetRecordViewInfo: TcxGridDataRowViewInfo;
begin
  Result := TcxGridDataRowViewInfo(inherited RecordViewInfo);
end;

function TcxGridDataCellViewInfo.CalculateWidth: Integer;
begin
  Result := RecordViewInfo.GetCellWidth(Item.VisibleIndex);
end;

function TcxGridDataCellViewInfo.GetBorders: TcxBorders;
begin
  Result := RecordViewInfo.GetCellBorders(Item.IsMostRight,
    Item.IsMostBottom and RecordViewInfo.CellsAreaViewInfo.IsBottom);
end;

function TcxGridDataCellViewInfo.GetMultiLine: Boolean;
begin
  Result := RecordViewInfo.AutoHeight;
end;

function TcxGridDataCellViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridDataCellPainter;
end;

procedure TcxGridDataCellViewInfo.BeforeRecalculation;
begin
  inherited;
  RecordViewInfo.BeforeCellRecalculation(Self);
end;

{ TcxGridDataRowCellsAreaViewInfo }

constructor TcxGridDataRowCellsAreaViewInfo.Create(ARecordViewInfo: TcxCustomGridRecordViewInfo);
begin
  inherited;
  Visible := CalculateVisible;
end;

function TcxGridDataRowCellsAreaViewInfo.GetRecordViewInfo: TcxGridDataRowViewInfo;
begin
  Result := TcxGridDataRowViewInfo(inherited RecordViewInfo);
end;

function TcxGridDataRowCellsAreaViewInfo.CalculateHeight: Integer;
begin
  Result := 0;
end;

function TcxGridDataRowCellsAreaViewInfo.CalculateVisible: Boolean;
begin
  Result := RecordViewInfo.GridViewInfo.HeaderViewInfo.Count = 0;
end;

function TcxGridDataRowCellsAreaViewInfo.CalculateWidth: Integer;
begin
  Result := 0;
end;

function TcxGridDataRowCellsAreaViewInfo.GetBorders: TcxBorders;
begin
  Result := GridViewInfo.GetCellBorders(True, IsBottom);
end;

function TcxGridDataRowCellsAreaViewInfo.GetIsBottom: Boolean;
begin
  Result :=
    not RecordViewInfo.HasPreview or (GridView.Preview.Place = ppTop) or
    (RecordViewInfo.PreviewViewInfo.Height = 0);
end;

function TcxGridDataRowCellsAreaViewInfo.CanDrawSelected: Boolean;
begin
  Result := True;
end;

{ TcxGridPreviewCellViewInfo }

function TcxGridPreviewCellViewInfo.GetPreview: TcxGridPreview;
begin
  Result := GridView.Preview;
end;

function TcxGridPreviewCellViewInfo.CalculateHeight: Integer;

  function GetMaxValue: Integer;
  begin
    Result := Preview.MaxLineCount * GridViewInfo.GetFontHeight(Params.Font);
    GetCellTextAreaSize(Result);
  end;

begin
  if CacheItem.IsPreviewHeightAssigned then
    Result := Height
  else
  begin
    if AutoHeight then
      Result := inherited CalculateHeight
    else
    begin
      CalculateParams;
      Result := GetMaxValue;
    end;
    if Result <> 0 then
      Result := RecordViewInfo.RecordsViewInfo.GetCellHeight(Result);
  end;
end;

function TcxGridPreviewCellViewInfo.CalculateWidth: Integer;
begin
  Result := RecordViewInfo.DataWidth;
end;

function TcxGridPreviewCellViewInfo.GetAutoHeight: Boolean;
begin
  Result := Preview.AutoHeight;
end;

function TcxGridPreviewCellViewInfo.GetBackgroundBitmap: TBitmap;
begin  {4}
  Result := GridView.BackgroundBitmaps.GetBitmap(bbPreview);
end;

function TcxGridPreviewCellViewInfo.GetBorders: TcxBorders;
begin
  Result := GridViewInfo.GetCellBorders(True,
    (Preview.Place = ppBottom) or (RecordViewInfo.CellViewInfoCount = 0));
end;

procedure TcxGridPreviewCellViewInfo.GetEditViewDataContentOffsets(var R: TRect);
begin
  inherited;
  R.Left := Preview.LeftIndent;
  R.Right := Preview.RightIndent;
end;

function TcxGridPreviewCellViewInfo.GetHeight: Integer;
begin
  if CacheItem.IsPreviewHeightAssigned then
    Result := CacheItem.PreviewHeight
  else
  begin
    Result := CalculateHeight;
    CacheItem.PreviewHeight := Result;
  end;
end;

function TcxGridPreviewCellViewInfo.GetHitTestClass: TcxCustomGridHitTestClass;
begin
  Result := TcxGridPreviewHitTest;
end;

function TcxGridPreviewCellViewInfo.GetMaxLineCount: Integer;
begin
  Result := Preview.MaxLineCount;
end;

function TcxGridPreviewCellViewInfo.GetMultiLine: Boolean;
begin
  Result := True;
end;

function TcxGridPreviewCellViewInfo.GetTextAreaBounds: TRect;
begin
  Result := inherited GetTextAreaBounds;
  InflateRect(Result, cxGridCellTextOffset, 0);
  Inc(Result.Left, Preview.LeftIndent);
  Dec(Result.Right, Preview.RightIndent);
end;

{ TcxGridDataRowViewInfo }

constructor TcxGridDataRowViewInfo.Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
  ARecord: TcxCustomGridRecord);
begin
  inherited;
  CreateViewInfos;
end;

destructor TcxGridDataRowViewInfo.Destroy;
begin
  DestroyViewInfos;
  inherited;
end;

function TcxGridDataRowViewInfo.GetCellViewInfo(Index: Integer): TcxGridDataCellViewInfo;
begin
  Result := InternalCellViewInfos[Index];
  if Result = nil then
  begin
    Result := GetCellViewInfoClass(Index).Create(Self, GridView.VisibleColumns[Index]);
    FCellViewInfos[Index] := Result;
  end;
end;

function TcxGridDataRowViewInfo.GetCellViewInfoCount: Integer;
begin
  Result := FCellViewInfos.Count;
end;

function TcxGridDataRowViewInfo.GetGridRecord: TcxGridDataRow;
begin
  Result := TcxGridDataRow(inherited GridRecord);
end;

function TcxGridDataRowViewInfo.GetHasPreview: Boolean;
begin
  Result := FPreviewViewInfo <> nil;
end;

function TcxGridDataRowViewInfo.GetInternalCellViewInfo(Index: Integer): TcxGridDataCellViewInfo;
begin
  Result := TcxGridDataCellViewInfo(FCellViewInfos[Index]);
end;

procedure TcxGridDataRowViewInfo.CreateViewInfos;
begin
  FCellViewInfos := TList.Create;
  FCellViewInfos.Count := GridViewInfo.HeaderViewInfo.Count;
  FCellsAreaViewInfo := GetCellsAreaViewInfoClass.Create(Self);
  if ShowPreview then
    FPreviewViewInfo := GetPreviewViewInfoClass.Create(Self, GridView.Preview.Column);
end;

procedure TcxGridDataRowViewInfo.DestroyViewInfos;
var
  I: Integer;
begin
  FPreviewViewInfo.Free;
  FCellsAreaViewInfo.Free;
  for I := 0 to CellViewInfoCount - 1 do
    InternalCellViewInfos[I].Free;
  FCellViewInfos.Free;
end;

procedure TcxGridDataRowViewInfo.CalculateCellViewInfo(AIndex: Integer);
begin
  CellViewInfos[AIndex].Calculate(GetCellLeftBound(AIndex), GetCellTopBound(AIndex),
    -1, GetCellHeight(AIndex));
end;

function TcxGridDataRowViewInfo.CalculateHeight: Integer;
var
  I, AHeight: Integer;
begin
  if AutoHeight then
  begin
    Result := 0;
    for I := 0 to CellViewInfoCount - 1 do
    begin
      AHeight := CellViewInfos[I].CalculateHeight;
      if AHeight > Result then Result := AHeight;
    end;
    Result := RecordsViewInfo.GetCellHeight(Result);
    with RecordsViewInfo do
      if Result < DataRowHeight then Result := DataRowHeight;
  end
  else
    Result := RecordsViewInfo.DataRowHeight;
  if HasPreview then
    Inc(Result, PreviewViewInfo.Height);
  Inc(Result, inherited CalculateHeight);
end;

function TcxGridDataRowViewInfo.CanSize: Boolean;
begin
  Result := RecordsViewInfo.CanDataRowSize;
end;

procedure TcxGridDataRowViewInfo.CheckRowHeight(var AValue: Integer);
begin
  Dec(AValue, NonBaseHeight);
  GridView.OptionsView.CheckDataRowHeight(AValue);
  Inc(AValue, NonBaseHeight);
end;

function TcxGridDataRowViewInfo.GetAutoHeight: Boolean;
begin
  Result := RecordsViewInfo.AutoDataRecordHeight;
end;

function TcxGridDataRowViewInfo.GetBackgroundBitmapBounds: TRect;
begin   {4}
  Result := inherited GetBackgroundBitmapBounds;
  if HasPreview and (FPreviewViewInfo.BackgroundBitmap <> nil) then
    with CellsAreaBounds do
    begin
      Result.Top := Top;
      Result.Bottom := Bottom;
    end;
end;

function TcxGridDataRowViewInfo.GetBaseHeight: Integer;
begin
  Result := inherited GetBaseHeight;
  if HasPreview then
    Dec(Result, PreviewViewInfo.Height);
end;

function TcxGridDataRowViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridDataRowPainter;
end;

procedure TcxGridDataRowViewInfo.Offset(DX, DY: Integer);

  procedure OffsetCells;
  var
    I: Integer;
    ACellViewInfo: TcxGridDataCellViewInfo;
  begin
    for I := 0 to CellViewInfoCount - 1 do
    begin
      ACellViewInfo := InternalCellViewInfos[I];
      if IsCellVisible(I) then
        if (ACellViewInfo = nil) or not ACellViewInfo.Calculated then
          CalculateCellViewInfo(I)
        else
          ACellViewInfo.DoOffset(DX, DY)
      else
        if (DX <> 0) and (ACellViewInfo <> nil) then
        begin
          ACellViewInfo.Free;
          FCellViewInfos[I] := nil;
        end;
    end;
  end;

begin       {2}
  inherited;
  OffsetRect(FCellsAreaBounds, DX, DY);
  OffsetCells;
  FCellsAreaViewInfo.DoOffset(DX, DY);
  if FPreviewViewInfo <> nil then
    FPreviewViewInfo.DoOffset(DX, DY);
end;

procedure TcxGridDataRowViewInfo.SetRowHeight(Value: Integer);
begin
  if RowHeight <> Value then
    GridView.OptionsView.DataRowHeight := Value - NonBaseHeight;
end;

function TcxGridDataRowViewInfo.GetCellHeight(AIndex: Integer): Integer;
begin
  Result := GridViewInfo.GetCellHeight(AIndex, FCellHeight);
end;

function TcxGridDataRowViewInfo.GetCellHeightValue: Integer;
begin
  if AutoHeight then
  begin
    Result := DataHeight;
    if HasPreview then Dec(Result, PreviewViewInfo.Height);
  end
  else
    Result := RecordsViewInfo.RowHeight;
end;

function TcxGridDataRowViewInfo.GetCellLeftBound(AIndex: Integer): Integer;
begin
  Result := GridViewInfo.HeaderViewInfo[AIndex].DataOffset;
end;

function TcxGridDataRowViewInfo.GetCellTopBound(AIndex: Integer): Integer;
begin
  Result := FCellsAreaBounds.Top + GridViewInfo.GetCellTopOffset(AIndex, FCellHeight);
end;

function TcxGridDataRowViewInfo.GetCellsAreaBounds: TRect;
begin
  with Result do
  begin
    Left := DataIndent;
    Right := Left + DataWidth;
    Top := Bounds.Top;
    Bottom := Top + DataHeight;
    if HasPreview then
      if PreviewViewInfo.Preview.Place = ppTop then
        Inc(Top, PreviewViewInfo.Height)
      else
        Dec(Bottom, PreviewViewInfo.Height);
  end;
end;

function TcxGridDataRowViewInfo.GetCellsAreaViewInfoClass: TcxGridDataRowCellsAreaViewInfoClass;
begin
  Result := TcxGridDataRowCellsAreaViewInfoClass(RecordsViewInfo.GetDataRowCellsAreaViewInfoClass);
end;

function TcxGridDataRowViewInfo.GetCellViewInfoClass(AIndex: Integer): TcxGridDataCellViewInfoClass;
begin
  Result := TcxGridDataCellViewInfoClass(TcxGridColumnAccess(GridView.Columns[AIndex]).GetViewInfoClass);
end;

function TcxGridDataRowViewInfo.GetCellWidth(AIndex: Integer): Integer;
begin
  Result := GridViewInfo.HeaderViewInfo[AIndex].RealWidth;
end;

function TcxGridDataRowViewInfo.GetPreviewViewInfoClass: TcxGridPreviewCellViewInfoClass;
begin
  Result := TcxGridPreviewCellViewInfo;
end;

function TcxGridDataRowViewInfo.GetShowPreview: Boolean;
begin
  Result := GridView.Preview.Active;
end;

function TcxGridDataRowViewInfo.IsCellVisible(AIndex: Integer): Boolean;
begin
  Result := GridViewInfo.HeaderViewInfo[AIndex].Visible;
end;

procedure TcxGridDataRowViewInfo.BeforeCellRecalculation(ACell: TcxGridTableCellViewInfo);
begin
end;

procedure TcxGridDataRowViewInfo.BeforeRecalculation;
var
  I: Integer;
begin
  inherited;
  FCellsAreaViewInfo.BeforeRecalculation;
  for I := 0 to CellViewInfoCount - 1 do
    if InternalCellViewInfos[I] <> nil then
      InternalCellViewInfos[I].BeforeRecalculation;
  if FPreviewViewInfo <> nil then
    FPreviewViewInfo.BeforeRecalculation;
end;

procedure TcxGridDataRowViewInfo.Calculate(ALeftBound, ATopBound: Integer;
  AWidth: Integer = -1; AHeight: Integer = -1);
var
  I: Integer;

  procedure CalculatePreview;

    function GetTopBound: Integer;
    begin
      if PreviewViewInfo.Preview.Place = ppTop then
        Result := ATopBound
      else
        Result := FCellsAreaBounds.Bottom;
    end;

  begin
    PreviewViewInfo.Calculate(FCellsAreaBounds.Left, GetTopBound);
  end;

begin
  inherited;
  FCellsAreaBounds := CellsAreaBounds;
  if HasPreview then CalculatePreview;
  FCellHeight := CellHeight;
  for I := 0 to CellViewInfoCount - 1 do
    if IsCellVisible(I) then CalculateCellViewInfo(I);
  if FCellsAreaViewInfo.Visible then
    FCellsAreaViewInfo.Calculate(FCellsAreaBounds);
end;

function TcxGridDataRowViewInfo.GetBoundsForItem(AItem: TcxCustomGridTableItem): TRect;
begin
  if InternalCellViewInfos[AItem.VisibleIndex] = nil then
    Result := inherited GetBoundsForItem(AItem)
  else
    Result := InternalCellViewInfos[AItem.VisibleIndex].Bounds;
end;

function TcxGridDataRowViewInfo.GetCellBorders(AIsRight, AIsBottom: Boolean): TcxBorders;
begin
  Result := GridViewInfo.GetCellBorders(AIsRight, AIsBottom);
end;

function TcxGridDataRowViewInfo.GetCellViewInfoByItem(AItem: TcxCustomGridTableItem): TcxGridTableDataCellViewInfo;
begin
  if TcxGridColumn(AItem).IsPreview then
    Result := FPreviewViewInfo
  else
    if AItem.VisibleIndex = -1 then
      Result := nil
    else
      Result := InternalCellViewInfos[AItem.VisibleIndex];
end;

function TcxGridDataRowViewInfo.GetHitTest(const P: TPoint): TcxCustomGridHitTest;
var
  I: Integer;
  ACellViewInfo: TcxGridDataCellViewInfo;
  AHitTest: TcxCustomGridHitTest;
begin
  Result := inherited GetHitTest(P);
  if (Result <> nil) and (Result.ClassType = GetHitTestClass) then
  begin
    for I := 0 to CellViewInfoCount - 1 do
    begin
      ACellViewInfo := InternalCellViewInfos[I];
      if ACellViewInfo <> nil then
      begin
        AHitTest := ACellViewInfo.GetHitTest(P);
        if AHitTest <> nil then
        begin
          Result := AHitTest;
          Exit;
        end;
      end;
    end;
    if HasPreview then
    begin
      AHitTest := PreviewViewInfo.GetHitTest(P);
      if AHitTest <> nil then
      begin
        Result := AHitTest;
        Exit;
      end;
    end;
  end;
end;

{ TcxGridNewItemRowViewInfo }

function TcxGridNewItemRowViewInfo.GetNewItemRowSeparatorColor: TColor;
begin
  Result := GridView.OptionsView.GetNewItemRowSeparatorColor;
end;

function TcxGridNewItemRowViewInfo.GetNewItemRowSeparatorWidth: Integer;
begin
  Result := GridView.OptionsView.NewItemRowSeparatorWidth;
end;

function TcxGridNewItemRowViewInfo.CalculateSelected: Boolean;
begin
  Result := GridRecord.Selected;
end;

function TcxGridNewItemRowViewInfo.GetAlignmentHorz: TAlignment;
begin
  Result := taCenter;
end;

function TcxGridNewItemRowViewInfo.GetAlignmentVert: TcxAlignmentVert;
begin
  Result := vaCenter;
end;

function TcxGridNewItemRowViewInfo.GetAutoHeight: Boolean;
begin
  Result := False;
end;

function TcxGridNewItemRowViewInfo.GetBottomPartHeight: Integer;
begin
  Result := inherited GetBottomPartHeight + NewItemRowSeparatorWidth;
end;

function TcxGridNewItemRowViewInfo.GetCellLeftBound(AIndex: Integer): Integer;
begin
  Result := GridViewInfo.HeaderViewInfo[AIndex].Bounds.Left;
end;

function TcxGridNewItemRowViewInfo.GetCellWidth(AIndex: Integer): Integer;
begin
  Result := GridViewInfo.HeaderViewInfo[AIndex].Width;
end;

function TcxGridNewItemRowViewInfo.GetHeight: Integer;
begin
  if FHeight = 0 then
    FHeight := CalculateHeight;
  Result := FHeight;
end;

function TcxGridNewItemRowViewInfo.GetNewItemRowSeparatorBounds: TRect;
begin
  Result := Bounds;
  Result.Top := Result.Bottom - NewItemRowSeparatorWidth;
end;

function TcxGridNewItemRowViewInfo.GetShowInfoText: Boolean;
begin
  Result := not Focused;
end;

function TcxGridNewItemRowViewInfo.GetShowPreview: Boolean;
begin
  Result := False;
end;

function TcxGridNewItemRowViewInfo.GetShowSeparator: Boolean;
begin
  Result := False;
end;

function TcxGridNewItemRowViewInfo.GetText: string;
begin
  if ShowInfoText then
    Result := GridView.OptionsView.NewItemRowInfoText
  else
    Result := inherited GetText;
end;

function TcxGridNewItemRowViewInfo.GetTextAreaBounds: TRect;
begin
  Result := ContentBounds;
  with GridViewInfo.ScrollableAreaBoundsHorz do
  begin
    Result.Left := Left;
    if Result.Right > Right then
      Result.Right := Right;
  end;
end;

procedure TcxGridNewItemRowViewInfo.GetViewParams(var AParams: TcxViewParams);
begin
  GridView.Styles.GetViewParams(vsNewItemRowInfoText, GridRecord, nil, AParams);
end;

function TcxGridNewItemRowViewInfo.HasLastHorzGridLine: Boolean;
begin
  Result := False;
end;

function TcxGridNewItemRowViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridNewItemRowPainter;
end;

{ TcxGridDetailsSiteViewInfo }

constructor TcxGridDetailsSiteViewInfo.Create(AMasterDataRowViewInfo: TcxGridMasterDataRowViewInfo);
begin
  FMasterDataRowViewInfo := AMasterDataRowViewInfo;
  inherited Create(TcxGridLevel(FMasterDataRowViewInfo.GridView.Level));
end;

function TcxGridDetailsSiteViewInfo.GetCacheItem: TcxGridMasterTableViewInfoCacheItem;
begin
  Result := FMasterDataRowViewInfo.CacheItem;
end;

function TcxGridDetailsSiteViewInfo.GetMasterGridView: TcxCustomGridView;
begin
  Result := FMasterDataRowViewInfo.GridView;
end;

function TcxGridDetailsSiteViewInfo.GetMasterGridViewInfo: TcxCustomGridViewInfo;
begin
  Result := FMasterDataRowViewInfo.GridViewInfo;
end;

procedure TcxGridDetailsSiteViewInfo.ControlFocusChanged;
begin
  if Visible and ActiveGridViewExists and (ActiveGridView <> nil) then
    ActiveGridView.Controller.ControlFocusChanged;
end;

function TcxGridDetailsSiteViewInfo.GetActiveGridView: TcxCustomGridView;
begin
  Result := FMasterDataRowViewInfo.GridRecord.ActiveDetailGridView;
end;

function TcxGridDetailsSiteViewInfo.GetActiveGridViewExists: Boolean;
var
  AMasterGridRecord: TcxGridMasterDataRow;
begin
  Result := inherited GetActiveGridViewExists;
  if not Result and not (csDestroying in ComponentState) then
  begin
    AMasterGridRecord := FMasterDataRowViewInfo.GridRecord;
    Result :=
      (AMasterGridRecord <> nil) and AMasterGridRecord.ActiveDetailGridViewExists and
      not AMasterGridRecord.ActiveDetailGridView.IsDestroying;
  end;
end;

function TcxGridDetailsSiteViewInfo.GetActiveGridViewValue: TcxCustomGridView;
begin
  Result := inherited GetActiveGridViewValue;
  if (Result <> nil) and (Result.ViewInfo <> nil) then
    Result.ViewInfo.IsInternalUse := MasterGridViewInfo.IsInternalUse;
end;

function TcxGridDetailsSiteViewInfo.GetActiveLevel: TcxGridLevel;
begin
  Result := FMasterDataRowViewInfo.GridRecord.ActiveDetailLevel;
end;

function TcxGridDetailsSiteViewInfo.GetCanvas: TcxCanvas;
begin
  Result := MasterGridViewInfo.Canvas;
end;

function TcxGridDetailsSiteViewInfo.GetHeight: Integer;
begin
  if CacheItem.IsDetailsSiteHeightAssigned then
    Result := CacheItem.DetailsSiteHeight
  else
  begin
    Result := inherited GetHeight;
    CacheItem.DetailsSiteHeight := Result;
  end;
end;

function TcxGridDetailsSiteViewInfo.GetLookAndFeelPainter: TcxCustomLookAndFeelPainterClass;
begin
  Result := MasterGridViewInfo.LookAndFeelPainter;
end;

function TcxGridDetailsSiteViewInfo.GetMaxHeight: Integer;
begin
  Result := FMasterDataRowViewInfo.RestHeight;
  TcxGridLevelAccess(Level).CheckHeight(Result);
end;

function TcxGridDetailsSiteViewInfo.GetMaxNormalHeight: Integer;
begin
  Result := inherited GetMaxNormalHeight;
  TcxGridLevelAccess(Level).CheckHeight(Result);
end;

function TcxGridDetailsSiteViewInfo.GetMaxWidth: Integer;
begin
  Result := MasterGridViewInfo.ClientWidth -
    FMasterDataRowViewInfo.LevelIndent -
    FMasterDataRowViewInfo.ExpandButtonCellViewInfo.BaseWidth;
end;

function TcxGridDetailsSiteViewInfo.GetNormalHeight: Integer;
begin
  if CacheItem.IsDetailsSiteNormalHeightAssigned then
    Result := CacheItem.DetailsSiteNormalHeight
  else
  begin
    Result := inherited GetNormalHeight;
    CacheItem.DetailsSiteNormalHeight := Result;
  end;
end;

function TcxGridDetailsSiteViewInfo.GetVisible: Boolean;
begin
  Result := FMasterDataRowViewInfo.Expanded and inherited GetVisible;
end;

function TcxGridDetailsSiteViewInfo.GetWidth: Integer;
begin
  if CacheItem.IsDetailsSiteWidthAssigned then
    Result := CacheItem.DetailsSiteWidth
  else
  begin
    Result := inherited GetWidth;
    CacheItem.DetailsSiteWidth := Result;
  end;
end;

procedure TcxGridDetailsSiteViewInfo.InitTabHitTest(AHitTest: TcxGridDetailsSiteTabHitTest);
begin
  AHitTest.Owner := MasterDataRowViewInfo.GridRecord;
end;

procedure TcxGridDetailsSiteViewInfo.ChangeActiveTab(ALevel: TcxGridLevel);
begin
  MasterDataRowViewInfo.GridRecord.ActiveDetailIndex := ALevel.Index;
end;

{ TcxGridExpandButtonCellViewInfo }

function TcxGridExpandButtonCellViewInfo.GetRecordViewInfo: TcxGridMasterDataRowViewInfo;
begin
  Result := TcxGridMasterDataRowViewInfo(inherited RecordViewInfo);
end;

function TcxGridExpandButtonCellViewInfo.GetRightBorderRestSpaceBounds: TRect;
begin
  Result := inherited GetBorderBounds(bRight);
  Result.Bottom := BorderBounds[bRight].Top;
end;

function TcxGridExpandButtonCellViewInfo.CalculateHeight: Integer;
begin
  Result := RecordViewInfo.DataHeight;
  if RecordViewInfo.DetailsSiteViewInfo.Visible then
    Inc(Result, RecordViewInfo.DetailsAreaViewInfo.CalculateHeight);
end;

function TcxGridExpandButtonCellViewInfo.CalculateWidth: Integer;
begin
  Result := GridViewInfo.ClientBounds.Left + RecordViewInfo.LevelIndent +
    BaseWidth - RecordViewInfo.ContentIndent;
end;

function TcxGridExpandButtonCellViewInfo.GetBackgroundBitmap: TBitmap;
begin
  Result := RecordViewInfo.BackgroundBitmap;
end;

function TcxGridExpandButtonCellViewInfo.GetBaseWidth: Integer;
begin
  Result := GridViewInfo.LevelIndent;
end;

function TcxGridExpandButtonCellViewInfo.GetBorderBounds(AIndex: TcxBorder): TRect;
begin
  Result := inherited GetBorderBounds(AIndex);
  if AIndex = bRight then
  begin
    Inc(Result.Top, RecordViewInfo.DataHeight);
    if bBottom in Borders then
      Dec(Result.Top, BorderWidth[bBottom]);
  end;
end;

function TcxGridExpandButtonCellViewInfo.GetBorders: TcxBorders;
begin
  Result := GridViewInfo.GetCellBorders(False, True);
  if RecordViewInfo.Expanded and (bBottom in Result) then
    Include(Result, bRight)
  else
    Exclude(Result, bRight);
end;

function TcxGridExpandButtonCellViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridExpandButtonCellPainter;
end;

{ TcxGridDetailsAreaViewInfo }

function TcxGridDetailsAreaViewInfo.GetRecordViewInfo: TcxGridMasterDataRowViewInfo;
begin
  Result := TcxGridMasterDataRowViewInfo(inherited RecordViewInfo);
end;

function TcxGridDetailsAreaViewInfo.CalculateHeight: Integer;
begin
  Result := RecordViewInfo.DetailsSiteViewInfo.Height;
end;

function TcxGridDetailsAreaViewInfo.CalculateWidth: Integer;
begin
  Result := RecordViewInfo.DetailsSiteViewInfo.MaxWidth;
end;

function TcxGridDetailsAreaViewInfo.GetBorders: TcxBorders;
begin
  if GridLines in [glBoth, glHorizontal] then
    Result := [bBottom]
  else
    Result := [];
end;

{ TcxGridMasterDataRowViewInfo }

constructor TcxGridMasterDataRowViewInfo.Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
  ARecord: TcxCustomGridRecord);
begin
  inherited;
  FDetailsAreaViewInfo := GetDetailsAreaViewInfoClass.Create(Self);
  FDetailsSiteViewInfo := GetDetailsSiteViewInfoClass.Create(Self);
  FExpandButtonCellViewInfo := GetExpandButtonCellViewInfoClass.Create(Self);
end;

destructor TcxGridMasterDataRowViewInfo.Destroy;
begin
  FExpandButtonCellViewInfo.Free;
  FDetailsSiteViewInfo.Free;
  FDetailsAreaViewInfo.Free;
  inherited;
end;

function TcxGridMasterDataRowViewInfo.GetCacheItem: TcxGridMasterTableViewInfoCacheItem;
begin
  Result := TcxGridMasterTableViewInfoCacheItem(inherited CacheItem);
end;

function TcxGridMasterDataRowViewInfo.GetDetailsSiteIndentBounds: TRect;
begin
  with DetailsSiteViewInfo.Bounds do
    Result := Rect(ContentIndent, Top, Left, Bottom);
end;

function TcxGridMasterDataRowViewInfo.GetGridRecord: TcxGridMasterDataRow;
begin
  Result := TcxGridMasterDataRow(inherited GridRecord);
end;

procedure TcxGridMasterDataRowViewInfo.CalculateExpandButtonBounds(var ABounds: TRect);
begin
  ABounds := ExpandButtonAreaBounds;
  inherited;
end;

function TcxGridMasterDataRowViewInfo.CalculateHeight: Integer;
begin
  Result := inherited CalculateHeight;
  if DetailsSiteViewInfo.Visible then
  begin
    FRestHeight := CalculateRestHeight(Result);
    Inc(Result, DetailsSiteViewInfo.Height);
  end;
end;

function TcxGridMasterDataRowViewInfo.CalculateRestHeight(ARowHeight: Integer): Integer;
begin
  Result := RecordsViewInfo.GetRestHeight(Bounds.Top) - ARowHeight;
end;

procedure TcxGridMasterDataRowViewInfo.ControlFocusChanged;
begin
  inherited;
  DetailsSiteViewInfo.ControlFocusChanged;
end;

function TcxGridMasterDataRowViewInfo.GetDataHeight: Integer;
begin
  Result := inherited GetDataHeight;
  if DetailsSiteViewInfo.Visible then
    Dec(Result, DetailsSiteViewInfo.Height);
end;

function TcxGridMasterDataRowViewInfo.GetDataIndent: Integer;
begin
  Result := inherited GetDataIndent + GridViewInfo.LevelIndent;
end;

function TcxGridMasterDataRowViewInfo.GetDataWidth: Integer;
begin
  Result := inherited GetDataWidth - GridViewInfo.LevelIndent;
end;

function TcxGridMasterDataRowViewInfo.GetExpandButtonAreaBounds: TRect;
begin
  Result := Rect(ContentIndent, Bounds.Top, DataIndent, Bounds.Top + DataHeight);
end;

function TcxGridMasterDataRowViewInfo.GetMaxHeight: Integer;
begin
  Result := inherited GetMaxHeight;
  if DetailsSiteViewInfo.Visible then
    if not DetailsSiteViewInfo.FullyVisible and not GridViewInfo.CalculateDown and (Index > 0) then
      Result := MaxInt div 2
    else
      Result := Result - DetailsSiteViewInfo.Height + DetailsSiteViewInfo.NormalHeight;
end;

function TcxGridMasterDataRowViewInfo.IsDetailVisible(ADetail: TcxCustomGridView): Boolean;
begin
  Result := DetailsSiteViewInfo.Visible and (DetailsSiteViewInfo.ActiveLevel = ADetail.Level);
end;

procedure TcxGridMasterDataRowViewInfo.VisibilityChanged(AVisible: Boolean);
begin
  inherited;
  if DetailsSiteViewInfo.Visible then
    DetailsSiteViewInfo.VisibilityChanged(AVisible);
end;

function TcxGridMasterDataRowViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridMasterDataRowPainter;
end;

function TcxGridMasterDataRowViewInfo.GetDetailsAreaViewInfoClass: TcxGridDetailsAreaViewInfoClass;
begin
  Result := TcxGridDetailsAreaViewInfo;
end;

function TcxGridMasterDataRowViewInfo.GetDetailsSiteViewInfoClass: TcxGridDetailsSiteViewInfoClass;
begin
  Result := TcxGridDetailsSiteViewInfo;
end;

function TcxGridMasterDataRowViewInfo.GetExpandButtonCellViewInfoClass: TcxGridExpandButtonCellViewInfoClass;
begin
  Result := TcxGridExpandButtonCellViewInfo;
end;

procedure TcxGridMasterDataRowViewInfo.BeforeRecalculation;
begin
  inherited;
  FDetailsAreaViewInfo.BeforeRecalculation;
  FExpandButtonCellViewInfo.BeforeRecalculation;
end;

procedure TcxGridMasterDataRowViewInfo.Calculate(ALeftBound, ATopBound: Integer;
  AWidth: Integer = -1; AHeight: Integer = -1);
var
  ADetailLeftBound, ADetailTopBound: Integer;

  function NeedCalculateDetail: Boolean;
  begin
    Result := DetailsSiteViewInfo.Visible and
      (GridViewInfo.IsCalculating or
        DetailsSiteViewInfo.ActiveGridViewExists and
          (DetailsSiteViewInfo.ActiveGridView.Site.Left = cxGridInvisibleCoordinate));
  end;

begin
  inherited;
  ExpandButtonCellViewInfo.Calculate(ContentIndent, ATopBound);
  if NeedCalculateDetail then
  begin
    ADetailLeftBound := ExpandButtonCellViewInfo.Bounds.Right;
    ADetailTopBound := ATopBound + DataHeight;
    DetailsSiteViewInfo.Calculate(ADetailLeftBound, ADetailTopBound);
    DetailsAreaViewInfo.Calculate(ADetailLeftBound, ADetailTopBound);
  end;
end;

function TcxGridMasterDataRowViewInfo.GetHitTest(const P: TPoint): TcxCustomGridHitTest;
begin
  if DetailsSiteViewInfo.Visible and PtInRect(DetailsSiteViewInfo.Bounds, P) then
    Result := DetailsSiteViewInfo.GetHitTest(P)
  else
    Result := inherited GetHitTest(P);
end;

{ TcxGridGroupCellViewInfo }

function TcxGridGroupCellViewInfo.GetExpandedAreaBounds: TRect;
begin
  Result := inherited GetBorderBounds(bBottom);
  Result.Right := BorderBounds[bBottom].Left;
end;

function TcxGridGroupCellViewInfo.GetGridRecord: TcxGridGroupRow;
begin
  Result := TcxGridGroupRow(inherited GridRecord);
end;

function TcxGridGroupCellViewInfo.GetRecordViewInfo: TcxGridGroupRowViewInfo;
begin
  Result := TcxGridGroupRowViewInfo(inherited RecordViewInfo);
end;

function TcxGridGroupCellViewInfo.CalculateHeight: Integer;
begin
  Result := RecordViewInfo.DataHeight;
end;

function TcxGridGroupCellViewInfo.CalculateWidth: Integer;
begin
  with RecordViewInfo, Bounds do
    Result := Right - Left - LevelIndent;
end;

function TcxGridGroupCellViewInfo.CustomDraw(ACanvas: TcxCanvas): Boolean;
begin
  Result := inherited CustomDraw(ACanvas);
  if not Result then
    TcxGridTableViewAccess(GridView).DoCustomDrawGroupCell(ACanvas, Self, Result);
end;

function TcxGridGroupCellViewInfo.GetAlignmentVert: TcxAlignmentVert;
begin
  Result := vaCenter;
end;

function TcxGridGroupCellViewInfo.GetAlwaysSelected: Boolean;
begin
  Result := True;
end;

function TcxGridGroupCellViewInfo.GetBackgroundBitmap: TBitmap;
begin   {4}
  Result := RecordViewInfo.BackgroundBitmap;
end;

function TcxGridGroupCellViewInfo.GetBorderBounds(AIndex: TcxBorder): TRect;
begin
  Result := inherited GetBorderBounds(AIndex);
  if (AIndex = bBottom) and GridRecord.Expanded then
    Result.Left := RecordViewInfo.LevelIndentVertLineBounds[GridRecord.Level].Left;
end;

function TcxGridGroupCellViewInfo.GetBorderColor(AIndex: TcxBorder): TColor;
begin
  Result := GridViewInfo.GridLineColor;
end;

function TcxGridGroupCellViewInfo.GetBorders: TcxBorders;
begin
  Result := GridViewInfo.GetCellBorders(True, True);
end;

function TcxGridGroupCellViewInfo.GetBorderWidth(AIndex: TcxBorder): Integer;
begin
  Result := GridViewInfo.GridLineWidth;
end;

function TcxGridGroupCellViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridGroupCellPainter;
end;

function TcxGridGroupCellViewInfo.GetText: string;
begin
  Result := GridRecord.DisplayText;
end;

function TcxGridGroupCellViewInfo.GetTextAreaBounds: TRect;
begin
  Result := inherited GetTextAreaBounds;
  Inc(Result.Left, GridViewInfo.LevelIndent);
end;

procedure TcxGridGroupCellViewInfo.GetViewParams(var AParams: TcxViewParams);
begin
  GridView.Styles.GetDataCellParams(GridRecord, nil, Params, True, Self);
end;

function TcxGridGroupCellViewInfo.HasCustomDraw: Boolean;
begin
  Result := TcxGridTableViewAccess(GridView).HasCustomDrawGroupCell;
end;

function TcxGridGroupCellViewInfo.CanDrawSelected: Boolean;
begin
  Result := True;
end;

{ TcxGridGroupRowViewInfo }

constructor TcxGridGroupRowViewInfo.Create(ARecordsViewInfo: TcxCustomGridRecordsViewInfo;
  ARecord: TcxCustomGridRecord); 
begin
  inherited;
  FCellViewInfo := TcxGridGroupCellViewInfo.Create(Self);
end;

destructor TcxGridGroupRowViewInfo.Destroy;
begin
  FCellViewInfo.Free;
  inherited;
end;

function TcxGridGroupRowViewInfo.GetGridRecord: TcxGridGroupRow;
begin
  Result := TcxGridGroupRow(inherited GridRecord);
end;

procedure TcxGridGroupRowViewInfo.CalculateExpandButtonBounds(var ABounds: TRect);
begin
  ABounds := FCellViewInfo.ContentBounds;
  inherited;
end;

function TcxGridGroupRowViewInfo.CalculateHeight: Integer;
begin
  if AutoHeight then
  begin
    CellViewInfo.CalculateParams;
    Result := RecordsViewInfo.CalculateCustomGroupRowHeight(CellViewInfo.Params);
  end
  else
    Result := RecordsViewInfo.GroupRowHeight;
  Inc(Result, inherited CalculateHeight);
end;

function TcxGridGroupRowViewInfo.CanSize: Boolean;
begin
  Result := GridView.OptionsCustomize.GroupRowSizing;
end;

procedure TcxGridGroupRowViewInfo.CheckRowHeight(var AValue: Integer);
begin
  Dec(AValue, NonBaseHeight);
  GridView.OptionsView.CheckGroupRowHeight(AValue);
  Inc(AValue, NonBaseHeight);
end;

function TcxGridGroupRowViewInfo.GetAutoHeight: Boolean;
begin
  Result := inherited GetAutoHeight and (GridView.OptionsView.GroupRowHeight = 0);
end;

function TcxGridGroupRowViewInfo.GetBackgroundBitmap: TBitmap;
begin   {4}
  Result := RecordsViewInfo.GroupBackgroundBitmap;
end;

function TcxGridGroupRowViewInfo.GetExpandButtonAreaBounds: TRect;
begin
  Result := FCellViewInfo.ContentBounds;
  Result.Right := Result.Left + GridViewInfo.LevelIndent;
end;

{function TcxGridGroupRowViewInfo.GetFocusRectBounds: TRect;
begin
  Result := inherited GetFocusRectBounds;
  Inc(Result.Left, GridViewInfo.LevelIndent);
end;}

function TcxGridGroupRowViewInfo.GetPainterClass: TcxCustomGridCellPainterClass;
begin
  Result := TcxGridGroupRowPainter;
end;

function TcxGridGroupRowViewInfo.GetSeparatorBounds: TRect;
begin
  Result := inherited GetSeparatorBounds;
  if Expanded then Inc(Result.Left, GridViewInfo.LevelIndent);
end;

function TcxGridGroupRowViewInfo.GetSeparatorIndentBounds: TRect;
begin
  Result := inherited GetSeparatorBounds;
  Result.Right := SeparatorBounds.Left;
end;

function TcxGridGroupRowViewInfo.HasFocusRect: Boolean;
begin
  Result := True;
end;

function TcxGridGroupRowViewInfo.HasFooter(ALevel: Integer): Boolean;
begin
  Result := inherited HasFooter(ALevel) or
    (GridView.OptionsView.GroupFooters = gfAlwaysVisible) and
    (ALevel = 0) and not GridRecord.Expanded;
end;

procedure TcxGridGroupRowViewInfo.Offset(DX, DY: Integer);
begin                        {2}
  inherited;
  FCellViewInfo.DoOffset(DX, DY);
end;

procedure TcxGridGroupRowViewInfo.SetRowHeight(Value: Integer);
begin
  if RowHeight <> Value then
    GridView.OptionsView.GroupRowHeight := Value - NonBaseHeight;
end;

procedure TcxGridGroupRowViewInfo.BeforeRecalculation;
begin
  inherited;
  FCellViewInfo.BeforeRecalculation;
end;

procedure TcxGridGroupRowViewInfo.Calculate(ALeftBound, ATopBound: Integer;
  AWidth: Integer = -1; AHeight: Integer = -1);
begin
  inherited;
  FCellViewInfo.Calculate(ALeftBound + LevelIndent, ATopBound);
end;

end.
