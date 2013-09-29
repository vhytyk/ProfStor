{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressNavBar                                               }
{                                                                   }
{       Copyright (c) 2002-2003 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSBARS AND ALL ACCOMPANYING VCL }
{   CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.                 }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxNavBar;

{$I dxNavBarVer.inc}

interface

uses
  Classes, IniFiles, Registry, Windows, Messages, Graphics, Controls,
  Forms, ImgList, StdCtrls, ExtCtrls,
  dxNavBarBase, dxNavBarCollns, dxNavBarStyles, dxThemeManager;

type
  TdxCustomNavBar = class;
  TdxNavBarViewInfo = class;
  TdxNavBarGroupViewInfo = class;
  TdxNavBarPainter = class;

  TdxNavBarObjectState = (sActive, sDisabled, sExpanded, sHotTracked, sPressed, sSelected);
  TdxNavBarObjectStates = set of TdxNavBarObjectState;

  TdxNavBarLinkViewInfo = class
  private
    FGroupViewInfo: TdxNavBarGroupViewInfo;
    FNavBar: TdxCustomNavBar;
    FPainter: TdxNavBarPainter;
    FViewInfo: TdxNavBarViewInfo;
    FLink: TdxNavBarItemLink;
    FItem: TdxNavBarItem;
    FRect: TRect;
    FImageRect: TRect;
    FCaptionRect: TRect;
    function GetState: TdxNavBarObjectStates;
  protected
    procedure Recalculate(X, Y: Integer); virtual;
    procedure CorrectViewInfo(dX, dY: Integer); virtual;
  public
    constructor Create(AGroupViewInfo: TdxNavBarGroupViewInfo; ALink: TdxNavBarItemLink);

    function GetCaptionHeight: Integer; virtual;
    function GetDrawEdgeFlag: Integer; virtual;
    function GetImageHeight: Integer; virtual;
    function GetImageWidth: Integer; virtual;
    function IsCaptionVisible: Boolean;
    function IsImageVisible: Boolean;

    // Style attributes
    function StyleItem: TdxNavBarStyleItem; virtual;
    function Style: TdxBaseNavBarStyle; virtual;
    function Font: TFont; virtual;
    function FontColor: TColor; virtual;
    function ImageIndex: Integer; virtual;
    function ImageList: TImageList; virtual;
    // Rectangles
    function SelectionRect: TRect; virtual;
    property Rect: TRect read FRect;
    property CaptionRect: TRect read FCaptionRect;
    property ImageRect: TRect read FImageRect;

    property Link: TdxNavBarItemLink read FLink;
    property Item: TdxNavBarItem read FItem;
    property GroupViewInfo: TdxNavBarGroupViewInfo read FGroupViewInfo;
    property NavBar: TdxCustomNavBar read FNavBar;
    property Painter: TdxNavBarPainter read FPainter;
    property State: TdxNavBarObjectStates read GetState;
    property ViewInfo: TdxNavBarViewInfo read FViewInfo;
  end;
  TdxNavBarLinkViewInfoClass = class of TdxNavBarLinkViewInfo;

  TdxNavBarGroupViewInfo = class
  private
    FViewInfo: TdxNavBarViewInfo;
    FItems: TList;
    FGroup: TdxNavBarGroup;
    FNavBar: TdxCustomNavBar;
    FPainter: TdxNavBarPainter;

    FCaptionRect: TRect;
    FCaptionImageRect: TRect;
    FCaptionSignRect: TRect;
    FCaptionTextRect: TRect;
    FItemsRect: TRect;
    FRect: TRect;

    function GetControl: TdxNavBarGroupControl;
    function GetControlRect: TRect;
    function GetItemCount: Integer;
    function GetItem(Index: Integer): TdxNavBarLinkViewInfo;
    function GetState: TdxNavBarObjectStates;
  protected
    procedure AddLink(AViewInfo: TdxNavBarViewInfo; ALink: TdxNavBarItemLink);
    procedure ClearItems;

    procedure AdjustControlBounds; virtual;
    procedure RecreateInfo; virtual;
    procedure Recalculate(X, Y: Integer); virtual;
    procedure CorrectViewInfo(dX, dY: Integer); virtual;
    procedure CorrectActiveGroupViewInfo(dX, dY: Integer); virtual;
  public
    constructor Create(AViewInfo: TdxNavBarViewInfo; AGroup: TdxNavBarGroup);
    destructor Destroy; override;

    function GetLinkViewInfoByLink(ALink: TdxNavBarItemLink): TdxNavBarLinkViewInfo;
    function IndexOfLinkViewInfo(AViewInfo: TdxNavBarLinkViewInfo): Integer;

    function GetCaptionHeight: Integer; virtual;
    function GetDrawEdgeFlag: Integer; virtual;
    function GetImageHeight: Integer; virtual;
    function GetImageWidth: Integer; virtual;
    function IsCaptionVisible: Boolean;
    function IsCaptionImageVisible: Boolean;
    function IsCaptionSignVisible: Boolean;
    function IsCaptionUseSmallImages: Boolean;
    function IsItemsVisible: Boolean;
    function IsLinksUseSmallImages: Boolean;
    function IsViewAsIconView: Boolean;

    // Styles attributes
    function BgImage: TPicture; virtual;
    function BgBackColor: TColor; virtual;
    function BgBackColor2: TColor; virtual;
    function BgAlphaBlend: Byte; virtual;
    function BgAlphaBlend2: Byte; virtual;
    function BgGradientMode: TdxBarStyleGradientMode; virtual;
    function CaptionStyleItem: TdxNavBarStyleItem; virtual;
    function CaptionStyle: TdxBaseNavBarStyle; virtual;
    function CaptionImage: TPicture; virtual;
    function CaptionBackColor: TColor; virtual;
    function CaptionBackColor2: TColor; virtual;
    function CaptionAlphaBlend: Byte; virtual;
    function CaptionAlphaBlend2: Byte; virtual;
    function CaptionGradientMode: TdxBarStyleGradientMode; virtual;
    function CaptionFont: TFont; virtual;
    function CaptionFontColor: TColor; virtual;
    function CaptionSignColor: TColor; virtual;
    function CaptionHAlignment: TdxBarStyleHAlignment; virtual;
    function CaptionVAlignment: TdxBarStyleVAlignment; virtual;
    function ImageIndex: Integer; virtual;
    function ImageList: TImageList; virtual;
    // Rectangles
    property CaptionRect: TRect read FCaptionRect;
    property CaptionImageRect: TRect read FCaptionImageRect;
    property CaptionSignRect: TRect read FCaptionSignRect;
    property CaptionTextRect: TRect read FCaptionTextRect;
    property ControlRect: TRect read GetControlRect;
    property ItemsRect: TRect read FItemsRect;
    property Rect: TRect read FRect;

    property Control: TdxNavBarGroupControl read GetControl;
    property ItemCount: Integer read GetItemCount;
    property Items[Index: Integer]: TdxNavBarLinkViewInfo read GetItem;
    property Group: TdxNavBarGroup read FGroup;
    property NavBar: TdxCustomNavBar read FNavBar;
    property Painter: TdxNavBarPainter read FPainter;
    property State: TdxNavBarObjectStates read GetState;
    property ViewInfo: TdxNavBarViewInfo read FViewInfo;
  end;
  TdxNavBarGroupViewInfoClass = class of TdxNavBarGroupViewInfo;

  TdxNavBarViewInfo = class
  private
    FPainter: TdxNavBarPainter;
    FNavBar: TdxCustomNavBar;
    FGroups: TList;
    FTopScrollButtonRect: TRect;
    FBottomScrollButtonRect: TRect;
    FHintRect: TRect;
    FHintText: string;

    function GetGroupCount: Integer;
    function GetGroup(Index: Integer): TdxNavBarGroupViewInfo;
    function GetBottomScrollButtonState: TdxNavBarObjectStates;
    function GetTopScrollButtonState: TdxNavBarObjectStates;
  protected
    function GetLargeImageHeight: Integer;
    function GetLargeImageWidth: Integer;
    function GetSmallImageHeight: Integer;
    function GetSmallImageWidth: Integer;
    function GetSpaceBetweenGroups: Integer;
    class function GetGroupBorderWidth: Integer; virtual;
    class function GetGroupCaptionHeightAddon: Integer; virtual;
    class function GetGroupSeparatorWidth: Integer; virtual;
    class function GetGroupCaptionSignSize: Integer; virtual;
    class function GetGroupHorizontalEdge: Integer; virtual;
    class function GetGroupCaptionSeparatorWidth: Integer; virtual;
    class function GetLinksLargeSeparatorWidth: Integer; virtual;
    class function GetLinksSmallSeparatorWidth: Integer; virtual;
    class function GetLinksIconViewSeparatorWidth: Integer; virtual;
    class function GetLinksImageVerticalEdge: Integer; virtual;
    class function GetLinksImageHorizontalEdge: Integer; virtual;
    class function GetDragArrowHeight: Integer; virtual;
    class function GetDragArrowWidth: Integer; virtual;
    class function GetScrollButtonVerticalEdge: Integer; virtual;
    class function GetScrollButtonHorizontalEdge: Integer; virtual;
    class function GetScrollButtonVerticalSize: Integer; virtual;
    class function GetScrollButtonHorizontalSize: Integer; virtual;

    function CanHasScrollButtonInGroupCaption: Boolean; virtual;
    function CanHasImageInGroupCaption: Boolean; virtual;
    function CanHasSignInGroupCaption: Boolean; virtual;
    function CanHasGroupViewAsIconView: Boolean; virtual;
    function CanHasVisibleItemsInGroup(AGroup: TdxNavBarGroup): Boolean; virtual;
    function CanGroupsUseLargeImages: Boolean; virtual;
    function CanLinksUseLargeImages: Boolean; virtual;

    procedure AddGroup(AViewInfo: TdxNavBarViewInfo; AGroup: TdxNavBarGroup);
    procedure ClearGroups;

    procedure AdjustControlsBounds; virtual;
    procedure RecreateInfo; virtual;
    procedure Recalculate; virtual;
    procedure CorrectViewInfo; virtual;
    procedure CorrectScrollInfo; virtual;
    function GetTopScrollButtonRect: TRect; virtual;
    function GetBottomScrollButtonRect: TRect; virtual;
    procedure RecalculateHint; virtual;
    function GetGroupHintRect(AGroup: TdxNavBarGroup): TRect; virtual;
    function GetGroupHintText(AGroup: TdxNavBarGroup): string; virtual;
    function GetLinkHintRect(ALink: TdxNavBarItemLink): TRect; virtual;
    function GetLinkHintText(ALink: TdxNavBarItemLink): string; virtual;
  public
    constructor Create(APainter: TdxNavBarPainter); virtual;
    destructor Destroy; override;
    // Styles attributes
    function BgImage: TPicture; virtual;
    function BgBackColor: TColor; virtual;
    function BgBackColor2: TColor; virtual;
    function BgAlphaBlend: Byte; virtual;
    function BgAlphaBlend2: Byte; virtual;
    function BgGradientMode: TdxBarStyleGradientMode; virtual;
    function BottomButtonStyleItem: TdxNavBarStyleItem; virtual;
    function BottomButtonStyle: TdxBaseNavBarStyle; virtual;
    function BottomButtonImage: TPicture; virtual;
    function BottomButtonBackColor: TColor; virtual;
    function BottomButtonBackColor2: TColor; virtual;
    function BottomButtonAlphaBlend: Byte; virtual;
    function BottomButtonAlphaBlend2: Byte; virtual;
    function BottomButtonGradientMode: TdxBarStyleGradientMode; virtual;
    function TopButtonStyleItem: TdxNavBarStyleItem; virtual;
    function TopButtonStyle: TdxBaseNavBarStyle; virtual;
    function TopButtonImage: TPicture; virtual;
    function TopButtonBackColor: TColor; virtual;
    function TopButtonBackColor2: TColor; virtual;
    function TopButtonAlphaBlend: Byte; virtual;
    function TopButtonAlphaBlend2: Byte; virtual;
    function TopButtonGradientMode: TdxBarStyleGradientMode; virtual;
    function HintImage: TPicture; virtual;
    function HintBackColor: TColor; virtual;
    function HintBackColor2: TColor; virtual;
    function HintAlphaBlend: Byte; virtual;
    function HintAlphaBlend2: Byte; virtual;
    function HintGradientMode: TdxBarStyleGradientMode; virtual;
    function HintFont: TFont; virtual;
    function DrarDropItemTargetBackColor: TColor; virtual;
    function DrarDropGroupTargetBackColor: TColor; virtual;
    function DrarDropGroupTargetBackColor2: TColor; virtual;
    function DrarDropGroupTargetAlphaBlend: Byte; virtual;
    function DrarDropGroupTargetAlphaBlend2: Byte; virtual;
    function DrarDropGroupTargetGradient: TdxBarStyleGradientMode; virtual;

    function ActiveGroupViewInfo: TdxNavBarGroupViewInfo;
    function GetGroupViewInfoByGroup(AGroup: TdxNavBarGroup): TdxNavBarGroupViewInfo;
    function GetLinkViewInfoByLink(ALink: TdxNavBarItemLink): TdxNavBarLinkViewInfo;
    function IndexOfGroupViewInfo(AViewInfo: TdxNavBarGroupViewInfo): Integer;

    function GetGroupViewInfoAtCaptionPos(pt: TPoint): TdxNavBarGroupViewInfo; virtual;
    function GetGroupAtCaptionPos(pt: TPoint): TdxNavBarGroup;
    function GetGroupViewInfoAtItemsPos(pt: TPoint): TdxNavBarGroupViewInfo; virtual;
    function GetGroupAtItemsPos(pt: TPoint): TdxNavBarGroup;
    function GetLinkViewInfoAtPos(pt: TPoint): TdxNavBarLinkViewInfo; virtual;
    function GetLinkAtPos(pt: TPoint): TdxNavBarItemLink;
    function GetLinkViewInfoAtSelectedPos(pt: TPoint): TdxNavBarLinkViewInfo; virtual;
    function GetLinkAtSelectedPos(pt: TPoint): TdxNavBarItemLink;
    function GetViewInfoAtDragPosition(pt: TPoint; var ItemGroup: TdxNavBarGroupViewInfo;
        var Item1, Item2: TdxNavBarLinkViewInfo): Integer; virtual;
    function GetLinksAtDragPosition(pt: TPoint; var ItemGroup: TdxNavBarGroup;
        var Item1, Item2: TdxNavBarItemLink): Integer;
    // Scroll buttons
    function IsTopScrollButtonVisible: Boolean;
    function IsBottomScrollButtonVisible: Boolean;
    function IsPtTopScrollButton(pt: TPoint): Boolean;
    function IsPtBottomScrollButton(pt: TPoint): Boolean;
    property TopScrollButtonRect: TRect read FTopScrollButtonRect;
    property BottomScrollButtonRect: TRect read FBottomScrollButtonRect;
    property TopScrollButtonState: TdxNavBarObjectStates read GetTopScrollButtonState;
    property BottomScrollButtonState: TdxNavBarObjectStates read GetBottomScrollButtonState;
    // Hint
    function HintDelay: Integer; virtual;
    property HintRect: TRect read FHintRect;
    property HintText: string read FHintText;

    property GroupCount: Integer read GetGroupCount;
    property Groups[Index: Integer]: TdxNavBarGroupViewInfo read GetGroup;
    property NavBar: TdxCustomNavBar read FNavBar;
    property Painter: TdxNavBarPainter read FPainter;
  end;
  TdxNavBarViewInfoClass = class of TdxNavBarViewInfo;

  TdxBaseImagePainter = class
  protected
    class procedure InternalDrawImage(ACanvas: TCanvas; AImageList: TImageList;
        AImageIndex: Integer; R: TRect); virtual;
  public
    class procedure DrawImage(ACanvas: TCanvas; AImageList: TImageList;
        AImageIndex: Integer; R: TRect);
  end;
  TdxBaseImagePainterClass = class of TdxBaseImagePainter;

  TdxBaseSelectionPainter = class
  protected
    class procedure InternalDrawSelection(ACanvas: TCanvas; ARect: TRect;
        ABackColor: TColor; AState: TdxNavBarObjectStates); virtual;
  public
    class procedure DrawSelection(ACanvas: TCanvas; ARect: TRect;
        ABackColor: TColor; AState: TdxNavBarObjectStates);
  end;
  TdxBaseSelectionPainterClass = class of TdxBaseSelectionPainter;

  TdxBaseBackgroundPainter = class
  protected
    class procedure InternalDrawBackground(ACanvas: TCanvas; R: TRect; APicture: TPicture;
        AEraseBackground: Boolean; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode); virtual;
  public
    class procedure DrawBackground(ACanvas: TCanvas; R: TRect; APicture: TPicture;
        AEraseBackground: Boolean; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode);
  end;
  TdxBaseBackgroundPainterClass = class of TdxBaseBackgroundPainter;

  TdxBaseSignPainter = class
  protected
    class procedure InternalDrawSign(ACanvas: TCanvas; ARect: TRect; AForeColor,
        ABackColor: TColor; AState: TdxNavBarObjectStates); virtual;
  public
    class procedure DrawSign(ACanvas: TCanvas; ARect: TRect; AForeColor,
        ABackColor: TColor; AState: TdxNavBarObjectStates);
  end;
  TdxBaseSignPainterClass = class of TdxBaseSignPainter;

  TdxBaseHintPainter = class
  protected
    class procedure InternalDrawHint(ACanvas: TCanvas; ARect: TRect; AHint: string;
        APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AFont: TFont); virtual;
  public
    class procedure DrawHint(ACanvas: TCanvas; ARect: TRect; AHint: string;
        APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AFont: TFont);
  end;
  TdxBaseHintPainterClass = class of TdxBaseHintPainter;

  TdxBaseButtonPainter = class
  protected
    class procedure InternalDrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates); virtual;
  public
    class procedure DrawButton(ACanvas: TCanvas; ARect: TRect; APicture: TPicture;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
  end;
  TdxBaseButtonPainterClass = class of TdxBaseButtonPainter;

  TdxBaseScrollButtonsPainter = class
  protected
    class procedure InternalDrawBottomButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates); virtual;
    class procedure InternalDrawTopButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates); virtual;
  public
    class procedure DrawBottomButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates);
    class procedure DrawTopButton(ACanvas: TCanvas; ARect: TRect;
        AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
        AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
        AState: TdxNavBarObjectStates);
  end;
  TdxBaseScrollButtonsPainterClass = class of TdxBaseScrollButtonsPainter;

  TdxBaseDropTargetLinkPainter = class
  protected
    class procedure InternalDrawTargetLink(ACanvas: TCanvas;
        pt1, pt2, pt3, pt4, pt5, pt6: TPoint; AColor: TColor); virtual;
  public
    class procedure DrawTargetLink(ACanvas: TCanvas;
        pt1, pt2, pt3, pt4, pt5, pt6: TPoint; AColor: TColor);
  end;
  TdxBaseDropTargetLinkPainterClass = class of TdxBaseDropTargetLinkPainter;

  TdxBaseDropTargetGroupPainter = class
  protected
    class procedure InternalDrawTargetGroup(ACanvas: TCanvas; ARect: TRect;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode); virtual;
  public
    class procedure DrawTargetGroup(ACanvas: TCanvas; ARect: TRect;
        AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
        AGradientMode: TdxBarStyleGradientMode);
  end;
  TdxBaseDropTargetGroupPainterClass = class of TdxBaseDropTargetGroupPainter;

  TdxNavBarPainter = class
  private
    FNeedRecreateViewInfo: Boolean;
    FNeedRecalculateViewInfo: Boolean;
    FNeedRedrawCanvas: Boolean;
    FNavBar: TdxCustomNavBar;
    FViewInfo: TdxNavBarViewInfo;
  protected
    function ClientHeight: Integer;
    function ClientWidth: Integer;
    // Drawing
    procedure DrawNavBarControl; virtual;
    procedure DrawBackground; virtual;
    procedure DrawGroups; virtual;
    procedure DrawGroup(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupBackground(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupBorder(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupCaption(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupCaptionButton(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupCaptionText(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupCaptionImage(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupCaptionSign(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawGroupItems(AGroupViewInfo: TdxNavBarGroupViewInfo); virtual;
    procedure DrawItem(ALinkViewInfo: TdxNavBarLinkViewInfo); virtual;
    procedure DrawItemCaption(ALinkViewInfo: TdxNavBarLinkViewInfo); virtual;
    procedure DrawItemImage(ALinkViewInfo: TdxNavBarLinkViewInfo); virtual;
    procedure DrawItemSelection(ALinkViewInfo: TdxNavBarLinkViewInfo); virtual;
    procedure DrawScrollButtons; virtual;
    procedure DrawBottomScrollButton; virtual;
    procedure DrawTopScrollButton; virtual;
    procedure DrawDropTargetGroupSelection; virtual;
    procedure DrawDropTargetLinkSelection; virtual;
    procedure DrawGroupHintWindow; virtual;
    procedure DrawLinkHintWindow; virtual;

    class function ViewInfoClass: TdxNavBarViewInfoClass; virtual;
    class function GroupViewInfoClass: TdxNavBarGroupViewInfoClass; virtual;
    class function LinkViewInfoClass: TdxNavBarLinkViewInfoClass; virtual;
    class function BackgroundPainterClass: TdxBaseBackgroundPainterClass; virtual;
    class function ButtonPainterClass: TdxBaseButtonPainterClass; virtual;
    class function DropTargetGroupPainterClass: TdxBaseDropTargetGroupPainterClass; virtual;
    class function DropTargetLinkPainterClass: TdxBaseDropTargetLinkPainterClass; virtual;
    class function ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass; virtual;
    class function ImagePainterClass: TdxBaseImagePainterClass; virtual;
    class function SelectionPainterClass: TdxBaseSelectionPainterClass; virtual;
    class function SignPainterClass: TdxBaseSignPainterClass; virtual;
  public
    constructor Create(ANavBar: TdxCustomNavBar); virtual;
    destructor Destroy; override;

    function Canvas: TCanvas;
    function DC: HDC;
    function HintWindowCanvas: TCanvas;
    function HintWindowDC: HDC;

    procedure AssignDefaultBackgroundStyle; virtual;
    procedure AssignDefaultButtonStyle; virtual;
    procedure AssignDefaultButtonPressedStyle; virtual;
    procedure AssignDefaultButtonHotTrackedStyle; virtual;
    procedure AssignDefaultGroupBackgroundStyle; virtual;
    procedure AssignDefaultGroupHeaderStyle; virtual;
    procedure AssignDefaultGroupHeaderActiveStyle; virtual;
    procedure AssignDefaultGroupHeaderHotTrackedStyle; virtual;
    procedure AssignDefaultGroupHeaderPressedStyle; virtual;
    procedure AssignDefaultHintStyle; virtual;
    procedure AssignDefaultItemStyle; virtual;
    procedure AssignDefaultItemDisabledStyle; virtual;
    procedure AssignDefaultItemHotTrackedStyle; virtual;
    procedure AssignDefaultItemPressedStyle; virtual;
    procedure AssignDefaultDropTargetGroupStyle; virtual;
    procedure AssignDefaultDropTargetLinkStyle; virtual;

    procedure DoActivate; virtual;
    procedure DoGroupActivate(AGroup: TdxNavBarGroup); virtual;
    procedure DoGroupDeactivate(AGroup: TdxNavBarGroup); virtual;
    function IsGroupActive(AGroup: TdxNavBarGroup): Boolean; virtual;

    procedure Paint;
    procedure InvalidateViewInfo(AType: TdxNavBarChangeType);
    procedure InvalidateScrollButtons;

    property NavBar: TdxCustomNavBar read FNavBar;
    property ViewInfo: TdxNavBarViewInfo read FViewInfo;
  end;
  TdxNavBarPainterClass = class of TdxNavBarPainter;

  TdxNavBarDragDropFlag = (fAllowDragLink, fAllowDropLink, fAllowDragGroup, fAllowDropGroup);
  TdxNavBarDragDropFlags = set of TdxNavBarDragDropFlag;
  TdxNavBarGroupEvent = procedure(Sender: TObject; AGroup: TdxNavBarGroup) of object;
  TdxNavBarLinkEvent = procedure(Sender: TObject; ALink: TdxNavBarItemLink) of object;
  TdxNavBarCustomDrawEvent = procedure(Sender: TObject; ACanvas: TCanvas;
      AViewInfo: TdxNavBarViewInfo; var AHandled: Boolean) of object;
  TdxNavBarCustomDrawGroupEvent = procedure(Sender: TObject; ACanvas: TCanvas;
      AViewInfo: TdxNavBarGroupViewInfo; var AHandled: Boolean) of object;
  TdxNavBarCustomDrawGroupHintEvent = procedure(Sender: TObject; ACanvas: TCanvas;
      AGroup: TdxNavBarGroup; AHint: string; R: TRect; var AHandled: Boolean) of object;
  TdxNavBarCustomDrawLinkEvent = procedure(Sender: TObject; ACanvas: TCanvas;
      AViewInfo: TdxNavBarLinkViewInfo; var AHandled: Boolean) of object;
  TdxNavBarCustomDrawLinkHintEvent = procedure(Sender: TObject; ACanvas: TCanvas;
      ALink: TdxNavBarItemLink; AHint: string; R: TRect; var AHandled: Boolean) of object;
  TdxNavBarCalcGroupHintRectEvent = procedure(Sender: TObject; AGroup: TdxNavBarGroup;
      AViewInfo: TdxNavBarViewInfo; var R: TRect) of object;
  TdxNavBarCalcLinkHintRectEvent = procedure(Sender: TObject; ALink: TdxNavBarItemLink;
      AViewInfo: TdxNavBarViewInfo; var R: TRect) of object;
  TdxNavBarCalcGroupClientHeightEvent = procedure(Sender: TObject; AViewInfo: TdxNavBarGroupViewInfo;
      var AHeight: Integer) of object;
  TdxNavBarGetGroupHintEvent = procedure(Sender: TObject; AGroup: TdxNavBarGroup;
      var AHint: string) of object;
  TdxNavBarGetLinkHintEvent = procedure(Sender: TObject; ALink: TdxNavBarItemLink;
      var AHint: string) of object;

  TAbstractcxNavBarDesigner = class;
  TdxNavBarHintWindow = class;
  TdxNavBarScrollBar = class;

  TdxCustomNavBar = class(TCustomPanel)
  private
    FActiveGroup: TdxNavBarGroup;
    FActiveGroupIndex: Integer;
    FAllowSelectLinks: Boolean;
    FCanvasBitmap: TBitmap;
    FDefaultStyles: TdxNavBarDefaultStyles;
    FDesigner: TAbstractcxNavBarDesigner;
    FDragCopyCursor: TCursor;
    FDragDropFlags: TdxNavBarDragDropFlags;
    FEachGroupHasSelectedLink: Boolean;
    FHintWindow: TdxNavBarHintWindow;
    FHintWindowShowing: Boolean;
    FHintTimerID: Integer;
    FHotTrackedGroupCursor: TCursor;
    FHotTrackedLinkCursor: TCursor;
    FGroups: TdxNavBarGroups;
    FItems: TdxNavBarItems;
    FLargeChangeLink: TChangeLink;
    FLargeImages: TImageList;
    FPainter: TdxNavBarPainter;
    FScrollBar: TdxNavBarScrollBar;
    FScrollTimerID: Integer;
    FShowGroupCaptions: Boolean;
    FShowGroupsHint: Boolean;
    FShowLinksHint: Boolean;
    FSmallChangeLink: TChangeLink;
    FSmallImages: TImageList;
    FSpaceBetweenGroups: Integer;
    FStyleBackground: TdxNavBarStyleItem;
    FStyleHint: TdxNavBarStyleItem;
    FStyleDropTargetGroup: TdxNavBarStyleItem;
    FStyleDropTargetLink: TdxNavBarStyleItem;
    FStyleButton: TdxNavBarStyleItem;
    FStyleButtonHotTracked: TdxNavBarStyleItem;
    FStyleButtonPressed: TdxNavBarStyleItem;
    FStyles: TdxNavBarStyles;
    FThemeNotificator: TdxThemeChangedNotificator;
    FView: Integer;

    FOnActiveGroupChanged: TNotifyEvent;
    FOnCalcGroupHintRect: TdxNavBarCalcGroupHintRectEvent;
    FOnCalcGroupClientHeight: TdxNavBarCalcGroupClientHeightEvent;
    FOnCalcLinkHintRect: TdxNavBarCalcLinkHintRectEvent;
    FOnCustomDrawBackground: TdxNavBarCustomDrawEvent;
    FOnCustomDrawGroupCaption: TdxNavBarCustomDrawGroupEvent;
    FOnCustomDrawGroupClientBackground: TdxNavBarCustomDrawGroupEvent;
    FOnCustomDrawGroupClientForeground: TdxNavBarCustomDrawGroupEvent;
    FOnCustomDrawGroupHint: TdxNavBarCustomDrawGroupHintEvent;
    FOnCustomDrawLink: TdxNavBarCustomDrawLinkEvent;
    FOnCustomDrawLinkHint: TdxNavBarCustomDrawLinkHintEvent;
    FOnCustomDrawBottomScrollButton: TdxNavBarCustomDrawEvent;
    FOnCustomDrawTopScrollButton: TdxNavBarCustomDrawEvent;
    FOnGetGroupHint: TdxNavBarGetGroupHintEvent;
    FOnGetLinkHint: TdxNavBarGetLinkHintEvent;
    FOnGroupClick: TdxNavBarGroupEvent;
    FOnGroupHotTrack: TdxNavBarGroupEvent;
    FOnGroupPress: TdxNavBarGroupEvent;
    FOnLinkClick: TdxNavBarLinkEvent;
    FOnLinkHotTrack: TdxNavBarLinkEvent;
    FOnLinkPress: TdxNavBarLinkEvent;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;

    FEnableDragging: Boolean;
    FSourcePoint: TPoint;
    FSourceShift: TShiftState;
    FSourceGroup: TdxNavBarGroup;
    FSourceLink: TdxNavBarItemLink;
    FTargetPoint: TPoint;
    FHotTrackedGroup: TdxNavBarGroup;
    FHotTrackedLink: TdxNavBarItemLink;
    FPressedGroup: TdxNavBarGroup;
    FPressedLink: TdxNavBarItemLink;
    FScrollButtonDownIsDown: Boolean;
    FScrollButtonUpIsDown: Boolean;

    function GetActiveGroup: TdxNavBarGroup;
    function GetActiveGroupIndex: Integer;
    function GetEnableDragging: Boolean;
    function GetPainter: TdxNavBarPainter;
    function GetScrollPosition: Integer;
    function GetSourceGroup: TdxNavBarGroup;
    function GetSourceLink: TdxNavBarItemLink;
    function GetSourceItem: TdxNavBarItem;
    function GetTargetGroup: TdxNavBarGroup;
    function GetTargetLink1: TdxNavBarItemLink;
    function GetTargetLink2: TdxNavBarItemLink;
    function GetTargetLinkIndex: Integer;
    function GetViewInfo: TdxNavBarViewInfo;
    procedure SetActiveGroup(Value: TdxNavBarGroup);
    procedure SetActiveGroupIndex(Value: Integer);
    procedure SetAllowSelectLinks(const Value: Boolean);
    procedure SetDefaultStyles(const Value: TdxNavBarDefaultStyles);
    procedure SetEachGroupHasSelectedLink(const Value: Boolean);
    procedure SetLargeImages(const Value: TImageList);
    procedure SetShowGroupCaptions(const Value: Boolean);
    procedure SetSmallImages(const Value: TImageList);
    procedure SetSpaceBetweenGroups(Value: Integer);
    procedure SetStyleBackground(const Value: TdxNavBarStyleItem);
    procedure SetStyleHint(const Value: TdxNavBarStyleItem);
    procedure SetStyleDropTargetGroup(const Value: TdxNavBarStyleItem);
    procedure SetStyleDropTargetLink(const Value: TdxNavBarStyleItem);
    procedure SetStyleButton(const Value: TdxNavBarStyleItem);
    procedure SetStyleButtonHotTracked(const Value: TdxNavBarStyleItem);
    procedure SetStyleButtonPressed(const Value: TdxNavBarStyleItem);
    procedure SetView(Value: Integer);

    procedure DeSelectLinks;
    function IsAllowDragLink: Boolean;
    function IsAllowDropLink: Boolean;
    function IsAllowDragGroup: Boolean;
    function IsAllowDropGroup: Boolean;
    // Notifications
    procedure OnGroupsChanged(Sender: TObject; AType: TdxNavBarChangeType);
    procedure OnLinksChanged(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure OnItemsChanged(Sender: TObject; AType: TdxNavBarChangeType);
    procedure OnDefaultStylesChanged(Sender: TObject; AType: TdxNavBarChangeType);
    procedure OnStylesChanged(Sender: TObject; AType: TdxNavBarChangeType);
    procedure OnImagesChanged(Sender: TObject);
    procedure OnThemeChanged;
    // Messages
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMCreate(var Msg: TWMCreate); message WM_CREATE;
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SetName(const NewName: TComponentName); override;
    procedure WndProc(var Message: TMessage); override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean); override;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;

    procedure DoActiveGroupChanged; virtual;
    procedure DoGroupDragDrop(Group: TdxNavBarGroup); virtual;
    procedure DoGroupDragOver(Group: TdxNavBarGroup; var Accept: Boolean); virtual;
    procedure DoGroupHotTrack(Group: TdxNavBarGroup); virtual;
    procedure DoGroupMouseDown(Group: TdxNavBarGroup); virtual;
    procedure DoGroupMouseUp(Group: TdxNavBarGroup); virtual;
    procedure DoLinkDragDrop(Link: TdxNavBarItemLink); virtual;
    procedure DoLinkDragOver(Link: TdxNavBarItemLink; var Accept: Boolean); virtual;
    procedure DoLinkHotTrack(Link: TdxNavBarItemLink); virtual;
    procedure DoLinkMouseDown(Link: TdxNavBarItemLink); virtual;
    procedure DoLinkMouseUp(Link: TdxNavBarItemLink); virtual;
    procedure DoItemDragDrop(Item: TdxNavBarItem); virtual;
    procedure DoItemDragOver(Item: TdxNavBarItem; var Accept: Boolean); virtual;
    procedure DoBottomScrollButtonDown; virtual;
    procedure DoBottomScrollButtonUp; virtual;
    procedure DoTopScrollButtonDown; virtual;
    procedure DoTopScrollButtonUp; virtual;
    procedure DoGroupHintActivate; virtual;
    procedure DoLinkHintActivate; virtual;
    procedure DoHintDeactivate; virtual;
    // Designer
    procedure DesignerModified;
    procedure DesignerUpdate(AItem: TComponent);
    // Painting
    procedure Paint; override;
    procedure InvalidateAll(AType: TdxNavBarChangeType);
    procedure InvalidateScrollButtons;
    // Load/Save layout
    procedure LoadFromRegIni(AStorage: TCustomIniFile; LoadStyles: Boolean); virtual;
    procedure SaveToRegIni(AStorage: TCustomIniFile; SaveStyles: Boolean); virtual;

    function CreatePainter: TdxNavBarPainter; virtual;
    property CanvasBitmap: TBitmap read FCanvasBitmap;
    property Painter: TdxNavBarPainter read GetPainter;
    property ScrollBar: TdxNavBarScrollBar read FScrollBar;
    property ViewInfo: TdxNavBarViewInfo read GetViewInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Invalidate; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    procedure AssignDefaultStyles;
    procedure LoadFromIniFile(AFileName: string; LoadStyles: Boolean = True);
    procedure LoadFromRegistry(ARegistryPath: string; LoadStyles: Boolean = True);
    procedure LoadFromStream(AStream: TStream; LoadStyles: Boolean = True);
    procedure SaveToIniFile(AFileName: string; SaveStyles: Boolean = True);
    procedure SaveToRegistry(ARegistryPath: string; SaveStyles: Boolean = True);
    procedure SaveToStream(AStream: TStream; SaveStyles: Boolean = True);

    function GetGroupAtCaptionPos(pt: TPoint): TdxNavBarGroup;
    function GetGroupAtItemsPos(pt: TPoint): TdxNavBarGroup;
    function GetLinkAtPos(pt: TPoint): TdxNavBarItemLink;
    function GetLinkAtSelectedPos(pt: TPoint): TdxNavBarItemLink;
    function IsPtTopScrollButton(pt: TPoint): Boolean;
    function IsPtBottomScrollButton(pt: TPoint): Boolean;

    property EnableDragging: Boolean read GetEnableDragging;
    property SourcePoint: TPoint read FSourcePoint;
    property SourceGroup: TdxNavBarGroup read GetSourceGroup;
    property SourceLink: TdxNavBarItemLink read GetSourceLink;
    property SourceItem: TdxNavBarItem read GetSourceItem;
    property TargetPoint: TPoint read FTargetPoint;
    property TargetGroup: TdxNavBarGroup read GetTargetGroup;
    property TargetLink1: TdxNavBarItemLink read GetTargetLink1;
    property TargetLink2: TdxNavBarItemLink read GetTargetLink2;
    property TargetLinkIndex: Integer read GetTargetLinkIndex;
    property HintWindow: TdxNavBarHintWindow read FHintWindow;
    property HintWindowShowing: Boolean read FHintWindowShowing;
    property HotTrackedGroup: TdxNavBarGroup read FHotTrackedGroup;
    property HotTrackedLink: TdxNavBarItemLink read FHotTrackedLink;
    property PressedGroup: TdxNavBarGroup read FPressedGroup;
    property PressedLink: TdxNavBarItemLink read FPressedLink;
    property ScrollButtonDownIsDown: Boolean read FScrollButtonDownIsDown;
    property ScrollButtonUpIsDown: Boolean read FScrollButtonUpIsDown;
    property ScrollPosition: Integer read GetScrollPosition;

    property ActiveGroupIndex: Integer read GetActiveGroupIndex write SetActiveGroupIndex;
    property ActiveGroup: TdxNavBarGroup read GetActiveGroup write SetActiveGroup;
    property AllowSelectLinks: Boolean read FAllowSelectLinks write SetAllowSelectLinks default False;
    property DefaultStyles: TdxNavBarDefaultStyles read FDefaultStyles write SetDefaultStyles;
    property Designer: TAbstractcxNavBarDesigner read FDesigner;
    property DragCopyCursor: TCursor read FDragCopyCursor write FDragCopyCursor;
    property DragDropFlags: TdxNavBarDragDropFlags read FDragDropFlags write FDragDropFlags;
    property EachGroupHasSelectedLink: Boolean read FEachGroupHasSelectedLink write SetEachGroupHasSelectedLink default False;
    property HotTrackedGroupCursor: TCursor read FHotTrackedGroupCursor write FHotTrackedGroupCursor;
    property HotTrackedLinkCursor: TCursor read FHotTrackedLinkCursor write FHotTrackedLinkCursor;
    property Groups: TdxNavBarGroups read FGroups;
    property Items: TdxNavBarItems read FItems;
    property LargeImages: TImageList read FLargeImages write SetLargeImages;
    property ShowGroupCaptions: Boolean read FShowGroupCaptions write SetShowGroupCaptions default True;
    property ShowGroupsHint: Boolean read FShowGroupsHint write FShowGroupsHint default False;
    property ShowLinksHint: Boolean read FShowLinksHint write FShowLinksHint default False;
    property SmallImages: TImageList read FSmallImages write SetSmallImages;
    property SpaceBetweenGroups: Integer read FSpaceBetweenGroups write SetSpaceBetweenGroups default 0; 
    property StyleBackground: TdxNavBarStyleItem read FStyleBackground write SetStyleBackground;
    property StyleHint: TdxNavBarStyleItem read FStyleHint write SetStyleHint;
    property StyleDropTargetGroup: TdxNavBarStyleItem read FStyleDropTargetGroup write SetStyleDropTargetGroup;
    property StyleDropTargetLink: TdxNavBarStyleItem read FStyleDropTargetLink write SetStyleDropTargetLink;
    property StyleButton: TdxNavBarStyleItem read FStyleButton write SetStyleButton;
    property StyleButtonHotTracked: TdxNavBarStyleItem read FStyleButtonHotTracked write SetStyleButtonHotTracked;
    property StyleButtonPressed: TdxNavBarStyleItem read FStyleButtonPressed write SetStyleButtonPressed;
    property Styles: TdxNavBarStyles read FStyles;
    property View: Integer read FView write SetView;

    property OnActiveGroupChanged: TNotifyEvent read FOnActiveGroupChanged write FOnActiveGroupChanged;
    property OnCalcGroupClientHeight: TdxNavBarCalcGroupClientHeightEvent read FOnCalcGroupClientHeight write FOnCalcGroupClientHeight;
    property OnCalcGroupHintRect: TdxNavBarCalcGroupHintRectEvent read FOnCalcGroupHintRect write FOnCalcGroupHintRect;
    property OnCalcLinkHintRect: TdxNavBarCalcLinkHintRectEvent read FOnCalcLinkHintRect write FOnCalcLinkHintRect;
    property OnCustomDrawBackground: TdxNavBarCustomDrawEvent read FOnCustomDrawBackground write FOnCustomDrawBackground;
    property OnCustomDrawGroupCaption: TdxNavBarCustomDrawGroupEvent read FOnCustomDrawGroupCaption write FOnCustomDrawGroupCaption;
    property OnCustomDrawGroupClientBackground: TdxNavBarCustomDrawGroupEvent read FOnCustomDrawGroupClientBackground write FOnCustomDrawGroupClientBackground;
    property OnCustomDrawGroupClientForeground: TdxNavBarCustomDrawGroupEvent read FOnCustomDrawGroupClientForeground write FOnCustomDrawGroupClientForeground;
    property OnCustomDrawGroupHint: TdxNavBarCustomDrawGroupHintEvent read FOnCustomDrawGroupHint write FOnCustomDrawGroupHint;
    property OnCustomDrawLink: TdxNavBarCustomDrawLinkEvent read FOnCustomDrawLink write FOnCustomDrawLink;
    property OnCustomDrawLinkHint: TdxNavBarCustomDrawLinkHintEvent read FOnCustomDrawLinkHint write FOnCustomDrawLinkHint;
    property OnCustomDrawBottomScrollButton: TdxNavBarCustomDrawEvent read FOnCustomDrawBottomScrollButton write FOnCustomDrawBottomScrollButton;
    property OnCustomDrawTopScrollButton: TdxNavBarCustomDrawEvent read FOnCustomDrawTopScrollButton write FOnCustomDrawTopScrollButton;
    property OnGetGroupHint: TdxNavBarGetGroupHintEvent read FOnGetGroupHint write FOnGetGroupHint;
    property OnGetLinkHint: TdxNavBarGetLinkHintEvent read FOnGetLinkHint write FOnGetLinkHint;
    property OnGroupClick: TdxNavBarGroupEvent read FOnGroupClick write FOnGroupClick;
    property OnGroupHotTrack: TdxNavBarGroupEvent read FOnGroupHotTrack write FOnGroupHotTrack;
    property OnGroupPress: TdxNavBarGroupEvent read FOnGroupPress write FOnGroupPress;
    property OnLinkClick: TdxNavBarLinkEvent read FOnLinkClick write FOnLinkClick;
    property OnLinkHotTrack: TdxNavBarLinkEvent read FOnLinkHotTrack write FOnLinkHotTrack;
    property OnLinkPress: TdxNavBarLinkEvent read FOnLinkPress write FOnLinkPress;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  published
    property Align;
    property Anchors;
    property BorderStyle;
    property Constraints;
    property Ctl3D;
    property Enabled;
    property Locked;
    property PopupMenu;
    property Visible;

    {$IFDEF DELPHI5}	
    property OnContextPopup;
    {$ENDIF}
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TdxNavBarDragObject = class
  private
    FDragObject: TDragObject;
    FNavBar: TdxCustomNavBar;
    FSourceGroup: TdxNavBarGroup;
    FSourceLink: TdxNavBarItemLink;
    FSourceItem: TdxNavBarItem;
    FTargetGroup: TdxNavBarGroup;
    FTargetLink1: TdxNavBarItemLink;
    FTargetLink2: TdxNavBarItemLink;
    FTargetLinkIndex: Integer;
    function GetSourceItem: TdxNavBarItem;
  protected
    procedure UpdateTargets; virtual;
  public
    constructor Create(ANavBar: TdxCustomNavBar; var DragObject: TDragObject; ASourceGroup: TdxNavBarGroup;
      ASourceLink: TdxNavBarItemLink; ASourceItem: TdxNavBarItem);
    destructor Destroy; override;

    property NavBar: TdxCustomNavBar read FNavBar;
    property SourceGroup: TdxNavBarGroup read FSourceGroup;
    property SourceLink: TdxNavBarItemLink read FSourceLink;
    property SourceItem: TdxNavBarItem read GetSourceItem;
    property TargetGroup: TdxNavBarGroup read FTargetGroup;
    property TargetLink1: TdxNavBarItemLink read FTargetLink1;
    property TargetLink2: TdxNavBarItemLink read FTargetLink2;
    property TargetLinkIndex: Integer read FTargetLinkIndex;

  end;

  TdxNavBarScrollBar = class
  private
    FNavBar: TdxCustomNavBar;
    FPageSize: Integer;
    FMin: Integer;
    FPosition: Integer;
    FMax: Integer;
    FLargeChange: Integer;
    FSmallChange: Integer;
    FVisible: Boolean;

    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPageSize(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
  protected
    procedure DoScroll(var Message: TWMScroll);
  public
    constructor Create(ANavBar: TdxCustomNavBar);
    procedure SetParams(APosition, AMin, AMax: Integer);

    property Height: Integer read GetHeight;
    property LargeChange: Integer read FLargeChange write FLargeChange default 1;
    property Max: Integer read FMax write SetMax default 100;
    property Min: Integer read FMin write SetMin default 0;
    property NavBar: TdxCustomNavBar read FNavBar;
    property PageSize: Integer read FPageSize write SetPageSize;
    property Position: Integer read FPosition write SetPosition default 0;
    property SmallChange: Integer read FSmallChange write FSmallChange default 1;
    property Width: Integer read GetWidth;
    property Visible: Boolean read FVisible write SetVisible;
  end;

  TdxNavBarHintWindow = class(TCustomControl)
  private
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Paint; override;
  public
    procedure ActivateHint(Rect: TRect; const AHint: string);
    function NavBar: TdxCustomNavBar;
  end;

  TAbstractcxNavBarDesigner = class
  private
    FNavBar: TdxCustomNavBar;
  protected
    procedure Modified; virtual; abstract;
    procedure Update(AItem: TComponent); virtual; abstract;
  public
    constructor Create(ANavBar: TdxCustomNavBar);
    destructor Destroy; override;

    procedure BeginUpdate; virtual; abstract;
    procedure CancelUpdate; virtual; abstract;
    procedure EndUpdate; virtual; abstract;

    property NavBar: TdxCustomNavBar read FNavBar;
  end;


  TdxNavBar = class(TdxCustomNavBar)
  published
    property ActiveGroupIndex;
    property AllowSelectLinks;
    property DefaultStyles;
    property DragCopyCursor;
    property DragCursor;
    property DragDropFlags;
    property EachGroupHasSelectedLink;
    property HotTrackedGroupCursor;
    property HotTrackedLinkCursor;
    property LargeImages;
    property ShowGroupCaptions;
    property ShowGroupsHint;
    property ShowLinksHint;
    property SmallImages;
    property SpaceBetweenGroups;
    property StyleBackground;
    property StyleHint;
    property StyleDropTargetGroup;
    property StyleDropTargetLink;
    property StyleButton;
    property StyleButtonHotTracked;
    property StyleButtonPressed;
    property View;

    property OnActiveGroupChanged;
    property OnCalcGroupClientHeight;
    property OnCalcGroupHintRect;
    property OnCalcLinkHintRect;
    property OnCustomDrawBackground;
    property OnCustomDrawGroupCaption;
    property OnCustomDrawGroupClientBackground;
    property OnCustomDrawGroupClientForeground;
    property OnCustomDrawGroupHint;
    property OnCustomDrawLink;
    property OnCustomDrawLinkHint;
    property OnCustomDrawBottomScrollButton;
    property OnCustomDrawTopScrollButton;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnGetGroupHint;
    property OnGetLinkHint;
    property OnGroupClick;
    property OnGroupHotTrack;
    property OnGroupPress;
    property OnLinkClick;
    property OnLinkHotTrack;
    property OnLinkPress;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnStartDrag;
  end;

var
  dxNavBarDragObject: TdxNavBarDragObject;

implementation

{$R *.res}

uses
  Math, SysUtils, dxNavBarConsts, dxNavBarGraphics,
  dxNavBarViewsFact, dxNavBarBaseViews, dxNavBarXPViews,
  dxNavBarOfficeViews, dxNavBarVSToolBoxViews, dxNavBarExplorerViews;

{ TdxNavBarLinkViewInfo }

constructor TdxNavBarLinkViewInfo.Create(AGroupViewInfo: TdxNavBarGroupViewInfo; ALink: TdxNavBarItemLink);
begin
  FGroupViewInfo := AGroupViewInfo;
  FViewInfo := FGroupViewInfo.ViewInfo;
  FPainter := FViewInfo.Painter;
  FNavBar := FViewInfo.NavBar;
  FLink := ALink;
  FItem := FLink.Item;
end;

function TdxNavBarLinkViewInfo.ImageIndex: Integer;
begin
  if GroupViewInfo.IsLinksUseSmallImages then
    Result := Item.SmallImageIndex
  else Result := Item.LargeImageIndex;
end;

function TdxNavBarLinkViewInfo.ImageList: TImageList;
begin
  if GroupViewInfo.IsLinksUseSmallImages then
    Result := NavBar.SmallImages
  else Result := NavBar.LargeImages;
end;

function TdxNavBarLinkViewInfo.SelectionRect: TRect;
begin
  Result := ImageRect;
  InflateRect(Result, 2, 2)
end;

function TdxNavBarLinkViewInfo.GetCaptionHeight: Integer;
begin
  Result := 4;
  Inc(Result, GetFontHeight(Font));
end;

function TdxNavBarLinkViewInfo.GetDrawEdgeFlag: Integer;
begin
  if GroupViewInfo.IsLinksUseSmallImages then
    Result := DT_LEFT or DT_VCENTER or DT_SINGLELINE
  else Result := DT_CENTER or DT_WORDBREAK;
end;

function TdxNavBarLinkViewInfo.GetImageHeight: Integer;
begin
  if GroupViewInfo.IsLinksUseSmallImages then
    Result := ViewInfo.GetSmallImageHeight
  else Result := ViewInfo.GetLargeImageHeight;
end;

function TdxNavBarLinkViewInfo.GetImageWidth: Integer;
begin
  if GroupViewInfo.IsLinksUseSmallImages then
    Result := ViewInfo.GetSmallImageWidth
  else Result := ViewInfo.GetLargeImageWidth;
end;

function TdxNavBarLinkViewInfo.IsCaptionVisible: Boolean;
begin
  Result := (FCaptionRect.Left > FRect.Left) and (FCaptionRect.Right < FRect.Right);
end;

function TdxNavBarLinkViewInfo.IsImageVisible: Boolean;
begin
  Result := (FImageRect.Left > FRect.Left) and (FImageRect.Right < FRect.Right);
end;

function TdxNavBarLinkViewInfo.StyleItem: TdxNavBarStyleItem;
begin
  if not Item.Enabled then
    Result := Item.StyleDisabled
  else if NavBar.PressedLink = Link then
    Result := Item.StylePressed
  else if NavBar.HotTrackedLink = Link then
    Result := Item.StyleHotTracked
  else Result := Item.Style;
end;

function TdxNavBarLinkViewInfo.Style: TdxBaseNavBarStyle;
begin
  if not Item.Enabled then
    Result := NavBar.DefaultStyles.ItemDisabled
  else if NavBar.PressedLink = Link then
    Result := NavBar.DefaultStyles.ItemPressed
  else if NavBar.HotTrackedLink = Link then
    Result := NavBar.DefaultStyles.ItemHotTracked
  else Result := NavBar.DefaultStyles.Item;
end;

function TdxNavBarLinkViewInfo.Font: TFont;
begin
  if (StyleItem <> nil) and (savFont in StyleItem.Style.AssignedValues) then
    Result := StyleItem.Style.Font
  else Result := Style.Font;
end;

function TdxNavBarLinkViewInfo.FontColor: TColor;
begin
  Result := Font.Color;
end;

procedure TdxNavBarLinkViewInfo.Recalculate(X, Y: Integer);
var
  AHeight: Integer;
begin
  if GroupViewInfo.IsViewAsIconView then
  begin
    FImageRect.Top := Y + ViewInfo.GetLinksImageHorizontalEdge;
    FImageRect.Left := X + ViewInfo.GetLinksImageVerticalEdge;
    FImageRect.Bottom := FImageRect.Top + GetImageHeight;
    FImageRect.Right := FImageRect.Left + GetImageWidth;
    FRect.Left := X;
    FRect.Top := Y;
    FRect.Bottom := FImageRect.Bottom + ViewInfo.GetLinksImageVerticalEdge;
    FRect.Right := FImageRect.Right + ViewInfo.GetLinksImageHorizontalEdge;
    SetRectEmpty(FCaptionRect);
  end
  else if GroupViewInfo.IsLinksUseSmallImages then
  begin
    FImageRect.Top := Y + ViewInfo.GetLinksSmallSeparatorWidth div 2;
    FImageRect.Left := X + ViewInfo.GetLinksImageVerticalEdge;
    FImageRect.Bottom := FImageRect.Top + GetImageHeight;
    FImageRect.Right := FImageRect.Left + GetImageWidth;
    FCaptionRect.Top := FImageRect.Top + (FImageRect.Bottom - FImageRect.Top) div 2 - GetCaptionHeight div 2;
    FCaptionRect.Left := FImageRect.Right + ViewInfo.GetLinksImageVerticalEdge;
    FCaptionRect.Bottom := FCaptionRect.Top + GetCaptionHeight;
    FCaptionRect.Right := NavBar.Painter.ClientWidth - 1 - X;
    NavBar.Painter.Canvas.Font := Font;
    DrawText(NavBar.Painter.DC, PChar(Item.Caption), Length(Item.Caption),
      FCaptionRect, GetDrawEdgeFlag or DT_CALCRECT);
    if FCaptionRect.Right > NavBar.Painter.ClientWidth - 1 - X then
      FCaptionRect.Right := NavBar.Painter.ClientWidth - 1 - X;
    FRect.Left := X;
    FRect.Top := Y;
    FRect.Right := NavBar.Painter.ClientWidth - 1 - X;
    if FImageRect.Bottom > FCaptionRect.Bottom then
      FRect.Bottom := FImageRect.Bottom + ViewInfo.GetLinksSmallSeparatorWidth div 2
    else FRect.Bottom := FCaptionRect.Bottom + ViewInfo.GetLinksSmallSeparatorWidth div 2;
  end
  else
  begin
    FImageRect.Top := Y + ViewInfo.GetLinksLargeSeparatorWidth div 2;
    FImageRect.Left := (Painter.ClientWidth div 2) - (ViewInfo.GetLargeImageWidth div 2);
    FImageRect.Bottom := FImageRect.Top + GetImageHeight;
    FImageRect.Right := FImageRect.Left + GetImageWidth;
    FCaptionRect.Top := FImageRect.Bottom + ViewInfo.GetLinksImageHorizontalEdge;
    FCaptionRect.Left := X;
    FCaptionRect.Bottom := FCaptionRect.Top + GetCaptionHeight;
    FCaptionRect.Right := NavBar.Painter.ClientWidth - 1 - X;
    NavBar.Painter.Canvas.Font := Font;
    AHeight := DrawText(NavBar.Painter.DC, PChar(Item.Caption), Length(Item.Caption),
      FCaptionRect, GetDrawEdgeFlag or DT_CALCRECT);
    OffSetRect(FCaptionRect, (Painter.ClientWidth - 2 * X - (FCaptionRect.Right - FCaptionRect.Left)) div 2, 0);
    FCaptionRect.Bottom := FCaptionRect.Top + AHeight;
    FRect.Left := X;
    FRect.Top := Y;
    FRect.Right := NavBar.Painter.ClientWidth - 1 - X;
    FRect.Bottom := FCaptionRect.Bottom + ViewInfo.GetLinksLargeSeparatorWidth div 2;
  end;
end;

procedure TdxNavBarLinkViewInfo.CorrectViewInfo(dX, dY: Integer);
begin
  OffsetRect(FRect, dX, dY);
  OffsetRect(FImageRect, dX, dY);
  OffsetRect(FCaptionRect, dX, dY);
end;

function TdxNavBarLinkViewInfo.GetState: TdxNavBarObjectStates;
begin
  Result := [];
  if not Item.Enabled then
    Result := Result + [sDisabled];
  if NavBar.PressedLink = Link then
    Result := Result + [sPressed];
  if Link.IsSelected then
    Result := Result + [sSelected];
  if NavBar.HotTrackedLink = Link then
    Result := Result + [sHotTracked];
end;

{ TdxNavBarGroupViewInfo }

constructor TdxNavBarGroupViewInfo.Create(AViewInfo: TdxNavBarViewInfo; AGroup: TdxNavBarGroup);
begin
  FViewInfo := AViewInfo;
  FPainter := FViewInfo.Painter;
  FNavBar := FViewInfo.NavBar;
  FGroup := AGroup;

  FItems := TList.Create;
  RecreateInfo;
end;

destructor TdxNavBarGroupViewInfo.Destroy;
begin
  ClearItems;
  FItems.Free;
  inherited Destroy;
end;

function TdxNavBarGroupViewInfo.GetLinkViewInfoByLink(ALink: TdxNavBarItemLink): TdxNavBarLinkViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ItemCount - 1 do
    if Items[I].Link = ALink then
    begin
      Result := Items[I];
      break;
    end;
end;

function TdxNavBarGroupViewInfo.IndexOfLinkViewInfo(AViewInfo: TdxNavBarLinkViewInfo): Integer;
begin
  Result := FItems.IndexOf(AViewInfo);
end;

function TdxNavBarGroupViewInfo.BgImage: TPicture;
begin
  if (Group.StyleBackground <> nil) and (savImage in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.Image
  else Result := NavBar.DefaultStyles.GroupBackground.Image;
end;

function TdxNavBarGroupViewInfo.BgBackColor: TColor;
begin
  if (Group.StyleBackground <> nil) and (savBackColor in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.BackColor
  else Result := NavBar.DefaultStyles.GroupBackground.BackColor;
end;

function TdxNavBarGroupViewInfo.BgBackColor2: TColor;
begin
  if (Group.StyleBackground <> nil) and (savBackColor2 in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.BackColor2
  else Result := NavBar.DefaultStyles.GroupBackground.BackColor2;
end;

function TdxNavBarGroupViewInfo.BgAlphaBlend: Byte;
begin
  if (Group.StyleBackground <> nil) and (savAlphaBlending in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.AlphaBlending
  else Result := NavBar.DefaultStyles.GroupBackground.AlphaBlending;
end;

function TdxNavBarGroupViewInfo.BgAlphaBlend2: Byte;
begin
  if (Group.StyleBackground <> nil) and (savAlphaBlending2 in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.AlphaBlending2
  else Result := NavBar.DefaultStyles.GroupBackground.AlphaBlending2;
end;

function TdxNavBarGroupViewInfo.BgGradientMode: TdxBarStyleGradientMode;
begin
  if (Group.StyleBackground <> nil) and (savGradientMode in Group.StyleBackground.Style.AssignedValues) then
    Result := Group.StyleBackground.Style.GradientMode
  else Result := NavBar.DefaultStyles.GroupBackground.GradientMode;
end;

function TdxNavBarGroupViewInfo.CaptionStyleItem: TdxNavBarStyleItem;
begin
  if Group = NavBar.PressedGroup then
    Result := Group.StyleHeaderPressed
  else if Group = NavBar.HotTrackedGroup then
    Result := Group.StyleHeaderHotTracked
  else if Group = NavBar.ActiveGroup then
    Result := Group.StyleHeaderActive
  else Result := Group.StyleHeader;
end;

function TdxNavBarGroupViewInfo.CaptionStyle: TdxBaseNavBarStyle;
begin
  if Group = NavBar.PressedGroup then
    Result := NavBar.DefaultStyles.GroupHeaderPressed
  else if Group = NavBar.HotTrackedGroup then
    Result := NavBar.DefaultStyles.GroupHeaderHotTracked
  else if Group = NavBar.ActiveGroup then
    Result := NavBar.DefaultStyles.GroupHeaderActive
  else Result := NavBar.DefaultStyles.GroupHeader;
end;

function TdxNavBarGroupViewInfo.CaptionImage: TPicture;
begin
  if (CaptionStyleItem <> nil) and (savImage in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.Image
  else Result := CaptionStyle.Image;
end;

function TdxNavBarGroupViewInfo.CaptionBackColor: TColor;
begin
  if (CaptionStyleItem <> nil) and (savBackColor in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.BackColor
  else Result := CaptionStyle.BackColor;
end;

function TdxNavBarGroupViewInfo.CaptionBackColor2: TColor;
begin
  if (CaptionStyleItem <> nil) and (savBackColor2 in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.BackColor2
  else Result := CaptionStyle.BackColor2;
end;

function TdxNavBarGroupViewInfo.CaptionAlphaBlend: Byte;
begin
  if (CaptionStyleItem <> nil) and (savAlphaBlending in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.AlphaBlending
  else Result := CaptionStyle.AlphaBlending;
end;

function TdxNavBarGroupViewInfo.CaptionAlphaBlend2: Byte;
begin
  if (CaptionStyleItem <> nil) and (savAlphaBlending2 in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.AlphaBlending2
  else Result := CaptionStyle.AlphaBlending2;
end;

function TdxNavBarGroupViewInfo.CaptionGradientMode: TdxBarStyleGradientMode;
begin
  if (CaptionStyleItem <> nil) and (savGradientMode in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.GradientMode
  else Result := CaptionStyle.GradientMode;
end;

function TdxNavBarGroupViewInfo.CaptionFont: TFont;
begin
  if (CaptionStyleItem <> nil) and (savFont in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.Font
  else Result := CaptionStyle.Font;
end;

function TdxNavBarGroupViewInfo.CaptionFontColor: TColor;
begin
  Result := CaptionFont.Color;
end;

function TdxNavBarGroupViewInfo.CaptionSignColor: TColor;
begin
  Result := clBlack;
end;

function TdxNavBarGroupViewInfo.CaptionHAlignment: TdxBarStyleHAlignment;
begin
  if (CaptionStyleItem <> nil) and (savHAlignment in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.HAlignment
  else Result := CaptionStyle.HAlignment;
end;

function TdxNavBarGroupViewInfo.CaptionVAlignment: TdxBarStyleVAlignment;
begin
  if (CaptionStyleItem <> nil) and (savVAlignment in CaptionStyleItem.Style.AssignedValues) then
    Result := CaptionStyleItem.Style.VAlignment
  else Result := CaptionStyle.VAlignment;
end;

function TdxNavBarGroupViewInfo.ImageIndex: Integer;
begin
  if IsCaptionUseSmallImages then
    Result := Group.SmallImageIndex
  else Result := Group.LargeImageIndex;
end;

function TdxNavBarGroupViewInfo.ImageList: TImageList;
begin
  if IsCaptionUseSmallImages then
    Result := NavBar.SmallImages
  else Result := NavBar.LargeImages;
end;

function TdxNavBarGroupViewInfo.GetCaptionHeight: Integer;
begin
  Result := ViewInfo.GetGroupCaptionHeightAddon;
  Inc(Result, GetFontHeight(CaptionFont));
end;

function TdxNavBarGroupViewInfo.GetDrawEdgeFlag: Integer;
const
  dxHAlignment: array[TdxBarStyleHAlignment] of Integer = (DT_LEFT, DT_CENTER, DT_RIGHT);
  dxVAlignment: array[TdxBarStyleVAlignment] of Integer = (DT_TOP, DT_VCENTER, DT_BOTTOM);
begin
  Result := dxHAlignment[CaptionHAlignment] or dxVAlignment[CaptionVAlignment] or
    DT_SINGLELINE or DT_END_ELLIPSIS;
end;

function TdxNavBarGroupViewInfo.GetImageHeight: Integer;
begin
  if IsCaptionUseSmallImages then
    Result := ViewInfo.GetSmallImageHeight
  else Result := ViewInfo.GetLargeImageHeight;
end;

function TdxNavBarGroupViewInfo.GetImageWidth: Integer;
begin
  if IsCaptionUseSmallImages then
    Result := ViewInfo.GetSmallImageWidth
  else Result := ViewInfo.GetLargeImageWidth;
end;

function TdxNavBarGroupViewInfo.IsCaptionVisible: Boolean;
begin
  Result := NavBar.ShowGroupCaptions;
end;

function TdxNavBarGroupViewInfo.IsCaptionImageVisible: Boolean;
begin
  Result := ViewInfo.CanHasImageInGroupCaption and
    (FCaptionImageRect.Left >= FCaptionRect.Left) and
    (FCaptionImageRect.Right <= FCaptionRect.Right) and
    (FCaptionImageRect.Right < FCaptionSignRect.Left);
end;

function TdxNavBarGroupViewInfo.IsCaptionSignVisible: Boolean;
begin
  Result := ViewInfo.CanHasSignInGroupCaption and
    (FCaptionSignRect.Left >= FCaptionRect.Left) and
    (FCaptionSignRect.Right <= FCaptionRect.Right)
end;

function TdxNavBarGroupViewInfo.IsCaptionUseSmallImages: Boolean;
begin
  Result := not ViewInfo.CanGroupsUseLargeImages or Group.UseSmallImages;
end;

function TdxNavBarGroupViewInfo.IsItemsVisible: Boolean;
begin
  Result := ViewInfo.CanHasVisibleItemsInGroup(Group);
end;

function TdxNavBarGroupViewInfo.IsLinksUseSmallImages: Boolean;
begin
  Result := not ViewInfo.CanLinksUseLargeImages or Group.LinksUseSmallImages;
end;

function TdxNavBarGroupViewInfo.IsViewAsIconView: Boolean;
begin
  Result := ViewInfo.CanHasGroupViewAsIconView and Group.ShowAsIconView;
end;

procedure TdxNavBarGroupViewInfo.AdjustControlBounds;
begin
  if Group.Control = nil then exit;
  if IsItemsVisible and Group.ShowControl then
    Group.Control.AdjustControl(ControlRect, True)
  else Group.Control.AdjustControl(CaptionRect, False);
end;

procedure TdxNavBarGroupViewInfo.RecreateInfo;
var
  I: Integer;
begin
  ClearItems;
  if IsItemsVisible and (Control = nil) then
    for I := 0 to Group.LinkCount - 1 do
      if (Group.Links[I].Item <> nil) and Group.Links[I].Item.Visible then
        AddLink(ViewInfo, Group.Links[I]);
end;

procedure TdxNavBarGroupViewInfo.Recalculate(X, Y: Integer);
var
  I, Delta, AItemsRectBottom: Integer;
  AClientHeight: Integer;
  ItemStartX, ItemStartY: Integer;
begin
  FCaptionRect.Left := X;
  FCaptionRect.Top := Y;
  FCaptionRect.Right := NavBar.Painter.ClientWidth - X;
  if ViewInfo.CanHasScrollButtonInGroupCaption and ((Self = ViewInfo.ActiveGroupViewInfo) or
    (ViewInfo.IndexOfGroupViewInfo(Self) = ViewInfo.IndexOfGroupViewInfo(ViewInfo.ActiveGroupViewInfo) + 1)) then
    FCaptionRect.Right := FCaptionRect.Right - GetCaptionHeight - 2;
  if IsCaptionVisible then
  begin
    FCaptionRect.Bottom := Y + GetCaptionHeight;
    FCaptionTextRect := FCaptionRect;
    InflateRect(FCaptionTextRect, -2, -1);
    if ViewInfo.CanHasImageInGroupCaption then
    begin
      FCaptionImageRect.Left := FCaptionRect.Left;
      FCaptionImageRect.Bottom := FCaptionRect.Bottom;
      FCaptionImageRect.Right := FCaptionImageRect.Left + GetImageWidth;
      FCaptionImageRect.Top := FCaptionImageRect.Bottom - GetImageHeight;
      if FCaptionImageRect.Top < FCaptionRect.Top then
      begin
        Delta := FCaptionRect.Top - FCaptionImageRect.Top;
        OffsetRect(FCaptionRect, 0, Delta);
        OffsetRect(FCaptionTextRect, 0, Delta);
        OffsetRect(FCaptionImageRect, 0, Delta);
      end
      else
      begin
        Delta := (FCaptionRect.Bottom - FCaptionRect.Top) div 2 - GetImageWidth div 2;
        OffsetRect(FCaptionImageRect, 0, -Delta);
      end;
      FCaptionTextRect.Left := FCaptionImageRect.Right + 5; //TODO
    end;
    if ViewInfo.CanHasSignInGroupCaption then
    begin
      Delta := (FCaptionRect.Bottom - FCaptionRect.Top - ViewInfo.GetGroupCaptionSignSize) div 2;
      FCaptionSignRect.Top := FCaptionRect.Top + Delta + 1;
      FCaptionSignRect.Bottom := FCaptionSignRect.Top + ViewInfo.GetGroupCaptionSignSize;
      FCaptionSignRect.Right := FCaptionRect.Right - Delta;
      FCaptionSignRect.Left := FCaptionSignRect.Right - ViewInfo.GetGroupCaptionSignSize;
      FCaptionTextRect.Right := FCaptionSignRect.Left - Delta;//TODO
    end
    else SetRectEmpty(FCaptionSignRect);
  end
  else FCaptionRect.Bottom := FCaptionRect.Top;

  FRect.TopLeft := FCaptionRect.TopLeft;
  if IsItemsVisible then
  begin
    if Control <> nil then
    begin
      FRect.Bottom := FCaptionRect.Bottom + Control.OriginalHeight;
      Inc(FRect.Bottom, 2 * ViewInfo.GetGroupBorderWidth);
    end
    else
    begin
      ItemStartY := FCaptionRect.Bottom + ViewInfo.GetGroupCaptionSeparatorWidth;
      ItemStartX := X;
      AItemsRectBottom := FCaptionRect.Bottom + ViewInfo.GetGroupCaptionSeparatorWidth;
      for I := 0 to ItemCount - 1 do
      begin
        Items[I].Recalculate(ItemStartX, ItemStartY);
        if IsViewAsIconView then
        begin
          if (Items[I].Rect.Right > FCaptionRect.Right) and (I > 0) then
          begin
            ItemStartX := X;
            ItemStartY := Items[I].Rect.Bottom;
            Items[I].Recalculate(ItemStartX, ItemStartY);
          end;
          ItemStartX := Items[I].Rect.Right;
        end
        else ItemStartY := Items[I].Rect.Bottom;
        AItemsRectBottom := Items[I].Rect.Bottom;
      end;
      FRect.Bottom := AItemsRectBottom + ViewInfo.GetGroupCaptionSeparatorWidth;
    end;
  end
  else FRect.Bottom := FCaptionRect.Bottom;
  if Group.Expanded and Assigned(NavBar.OnCalcGroupClientHeight) then
  begin
    AClientHeight := (FRect.Bottom - FRect.Top) - (FCaptionRect.Bottom - FCaptionRect.Top);
    NavBar.OnCalcGroupClientHeight(NavBar, Self, AClientHeight);
    FRect.Bottom := FRect.Top + AClientHeight + (FCaptionRect.Bottom - FCaptionRect.Top);
  end;
  if ViewInfo.CanHasScrollButtonInGroupCaption and ((Self = ViewInfo.ActiveGroupViewInfo) or
    (ViewInfo.IndexOfGroupViewInfo(Self) = ViewInfo.IndexOfGroupViewInfo(ViewInfo.ActiveGroupViewInfo) + 1)) then
    FRect.Right := FCaptionRect.Right + GetCaptionHeight + 2
  else FRect.Right := FCaptionRect.Right;

  FItemsRect.Left := FCaptionRect.Left;
  FItemsRect.Top := FCaptionRect.Bottom;
  FItemsRect.BottomRight := FRect.BottomRight;
end;

procedure TdxNavBarGroupViewInfo.CorrectViewInfo(dX, dY: Integer);
var
  I: Integer;
begin
  OffsetRect(FCaptionRect, dX, dY);
  OffsetRect(FRect, dX, dY);
  OffsetRect(FItemsRect, dX, dY);
  OffsetRect(FCaptionTextRect, dX, dY);
  OffsetRect(FCaptionImageRect, dX, dY);
  OffsetRect(FCaptionSignRect, dX, dY);
  for I := 0 to ItemCount - 1 do
    Items[I].CorrectViewInfo(dX, dY);
end;

procedure TdxNavBarGroupViewInfo.CorrectActiveGroupViewInfo(dX, dY: Integer);
var
  I, OffsetY: Integer;
  ALinkViewInfo: TdxNavBarLinkViewInfo;
begin
  FRect.Right := FRect.Right + dX;
  FRect.Bottom := FRect.Bottom + dY;
  FItemsRect.Right := FItemsRect.Right + dX;
  FItemsRect.Bottom := FItemsRect.Bottom + dY;
  OffsetY := 0;
  for I := 0 to Group.TopVisibleLinkIndex - 1 do
  begin
    ALinkViewInfo := ViewInfo.GetLinkViewInfoByLink(Group.Links[I]);
    if ALinkViewInfo <> nil then
      Inc(OffsetY, ALinkViewInfo.Rect.Bottom - ALinkViewInfo.Rect.Top);
  end;
  for I := 0 to ItemCount - 1 do
    Items[I].CorrectViewInfo(0, - OffsetY);
end;

function TdxNavBarGroupViewInfo.GetControl: TdxNavBarGroupControl;
begin
  if Group.ShowControl then
    Result := Group.Control
  else Result := nil;
end;

function TdxNavBarGroupViewInfo.GetControlRect: TRect;
begin
  Result := ItemsRect;
  InflateRect(Result, -ViewInfo.GetGroupBorderWidth, -ViewInfo.GetGroupBorderWidth);
  if IsCaptionVisible then Result.Top := CaptionRect.Bottom;
end;

function TdxNavBarGroupViewInfo.GetItemCount: Integer;
begin
  Result := FItems.Count;
end;

function TdxNavBarGroupViewInfo.GetItem(Index: Integer): TdxNavBarLinkViewInfo;
begin
  Result := TdxNavBarLinkViewInfo(FItems.Items[Index]);
end;

function TdxNavBarGroupViewInfo.GetState: TdxNavBarObjectStates;
begin
  Result := [];
  if Group = NavBar.PressedGroup then
    Result := Result + [sPressed];
  if Group = NavBar.HotTrackedGroup then
    Result := Result + [sHotTracked];
  if Group.Expanded then
    Result := Result + [sExpanded];
  if Group = NavBar.ActiveGroup then
    Result := Result + [sActive];
end;

procedure TdxNavBarGroupViewInfo.AddLink(AViewInfo: TdxNavBarViewInfo; ALink: TdxNavBarItemLink);
begin
  FItems.Add(Painter.LinkViewInfoClass.Create(Self, ALink));
end;

procedure TdxNavBarGroupViewInfo.ClearItems;
var
  I: Integer;
begin
  for I := 0 to ItemCount - 1 do Items[I].Free;
  FItems.Clear;
end;

{ TdxNavBarViewInfo }

constructor TdxNavBarViewInfo.Create(APainter: TdxNavBarPainter);
begin
  FPainter := APainter;
  FNavBar := FPainter.NavBar;
  FGroups := TList.Create;
  FTopScrollButtonRect := Rect(0, 0, 0, 0);
  FBottomScrollButtonRect := Rect(0, 0, 0, 0);
end;

destructor TdxNavBarViewInfo.Destroy;
begin
  ClearGroups;
  FGroups.Free;
  inherited Destroy;
end;

function TdxNavBarViewInfo.ActiveGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  if (NavBar.ActiveGroup <> nil) then
    Result := GetGroupViewInfoByGroup(NavBar.ActiveGroup)
  else Result := nil;
end;

function TdxNavBarViewInfo.GetGroupViewInfoByGroup(AGroup: TdxNavBarGroup): TdxNavBarGroupViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to GroupCount - 1 do
    if Groups[I].Group = AGroup then
    begin
      Result := Groups[I];
      break;
    end;
end;

function TdxNavBarViewInfo.GetLinkViewInfoByLink(ALink: TdxNavBarItemLink): TdxNavBarLinkViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to GroupCount - 1 do
  begin
    Result := Groups[I].GetLinkViewInfoByLink(ALink);
    if Result <> nil then break;
  end;
end;

function TdxNavBarViewInfo.IndexOfGroupViewInfo(AViewInfo: TdxNavBarGroupViewInfo): Integer;
begin
  Result := FGroups.IndexOf(AViewInfo);
end;

function TdxNavBarViewInfo.GetGroupViewInfoAtCaptionPos(pt: TPoint): TdxNavBarGroupViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to GroupCount - 1 do
    if ptInRect(Groups[I].CaptionRect, pt) then
    begin
      Result := Groups[I];
      break;
    end;
end;

function TdxNavBarViewInfo.GetGroupAtCaptionPos(pt: TPoint): TdxNavBarGroup;
var
  AViewInfo: TdxNavBarGroupViewInfo;
begin
  AViewInfo := GetGroupViewInfoAtCaptionPos(pt);
  if (AViewInfo <> nil) and (AViewInfo.Group <> nil) and
    not (csDestroying in AViewInfo.Group.ComponentState) then
    Result := AViewInfo.Group
  else Result := nil;
end;

function TdxNavBarViewInfo.GetGroupViewInfoAtItemsPos(pt: TPoint): TdxNavBarGroupViewInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to GroupCount - 1 do
    if ptInRect(Groups[I].Rect, pt) and not ptInRect(Groups[I].CaptionRect, pt) then
    begin
      Result := Groups[I];
      break;
    end;
end;

function TdxNavBarViewInfo.GetGroupAtItemsPos(pt: TPoint): TdxNavBarGroup;
var
  AViewInfo: TdxNavBarGroupViewInfo;
begin
  AViewInfo := GetGroupViewInfoAtItemsPos(pt);
  if (AViewInfo <> nil) and (AViewInfo.Group <> nil) and
    not (csDestroying in AViewInfo.Group.ComponentState) then
    Result := AViewInfo.Group
  else Result := nil;
end;

function TdxNavBarViewInfo.GetLinkViewInfoAtPos(pt: TPoint): TdxNavBarLinkViewInfo;
var
  I: Integer;
  AGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  Result := nil;
  AGroupViewInfo := GetGroupViewInfoAtItemsPos(pt);
  if AGroupViewInfo <> nil then
    for I := 0 to AGroupViewInfo.ItemCount - 1 do
      if ptInRect(AGroupViewInfo.Items[I].Rect, pt) then
      begin
        Result := AGroupViewInfo.Items[I];
        break;
      end;
end;

function TdxNavBarViewInfo.GetLinkAtPos(pt: TPoint): TdxNavBarItemLink;
var
  AViewInfo: TdxNavBarLinkViewInfo;
begin
  AViewInfo := GetLinkViewInfoAtPos(pt);
  if (AViewInfo <> nil) and (AViewInfo.Link <> nil) and
    (AViewInfo.Link.Group <> nil) and (AViewInfo.Link.Item <> nil) then
    Result := AViewInfo.Link
  else Result := nil;
end;

function TdxNavBarViewInfo.GetLinkViewInfoAtSelectedPos(pt: TPoint): TdxNavBarLinkViewInfo;
var
  I: Integer;
  R: TRect;
  AGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  Result := nil;
  if not (IsPtBottomScrollButton(pt) or IsPtTopScrollButton(pt)) then
  begin
    AGroupViewInfo := GetGroupViewInfoAtItemsPos(pt);
    if AGroupViewInfo <> nil then
      for I := 0 to AGroupViewInfo.ItemCount - 1 do
      begin
        R := AGroupViewInfo.Items[I].CaptionRect;
        if AGroupViewInfo.IsLinksUseSmallImages then
          R.Left := AGroupViewInfo.Items[I].ImageRect.Right
        else R.Top := AGroupViewInfo.Items[I].ImageRect.Bottom;
        if ptInRect(AGroupViewInfo.Items[I].ImageRect, pt) or ptInRect(R, pt) then
        begin
          Result := AGroupViewInfo.Items[I];
          break;
        end;
      end;
  end;
end;

function TdxNavBarViewInfo.GetLinkAtSelectedPos(pt: TPoint): TdxNavBarItemLink;
var
  AViewInfo: TdxNavBarLinkViewInfo;
begin
  AViewInfo := GetLinkViewInfoAtSelectedPos(pt);
  if (AViewInfo <> nil) and (AViewInfo.Link <> nil) and
    (AViewInfo.Link.Group <> nil) and (AViewInfo.Link.Item <> nil) then
    Result := AViewInfo.Link
  else Result := nil;
end;

function TdxNavBarViewInfo.GetViewInfoAtDragPosition(pt: TPoint; var ItemGroup: TdxNavBarGroupViewInfo;
    var Item1, Item2: TdxNavBarLinkViewInfo): Integer;
var
  I, Index: Integer;
  ALinkViewInfo: TdxNavBarLinkViewInfo;
begin
  ItemGroup := nil;
  Item1 := nil;
  Item2 := nil;
  ItemGroup := GetGroupViewInfoAtItemsPos(pt);
  if ItemGroup <> nil then
  begin
    if ItemGroup.IsViewAsIconView then
    begin
      ALinkViewInfo := GetLinkViewInfoAtPos(pt);
      if ALinkViewInfo <> nil then
      begin
        Index := ItemGroup.IndexOfLinkViewInfo(ALinkViewInfo);
        if (ALinkViewInfo.Rect.Left + (ALinkViewInfo.Rect.Right - ALinkViewInfo.Rect.Left) div 2) > pt.x then
        begin
          if Index > 0 then
            Item1 := ItemGroup.Items[Index - 1];
          Item2 := ALinkViewInfo
        end
        else
        begin
          Item1 := ALinkViewInfo;
          if Index < ItemGroup.ItemCount - 1 then
            Item2 := ItemGroup.Items[Index + 1];
        end;
      end
      else
      begin
        if ItemGroup.ItemCount > 0 then
        begin
          if pt.Y < ItemGroup.Items[0].Rect.Top then
            Item2 := ItemGroup.Items[0]
          else if pt.Y > ItemGroup.Items[ItemGroup.ItemCount - 1].Rect.Top then
            Item1 := ItemGroup.Items[ItemGroup.ItemCount - 1]
          else for I := 0 to ItemGroup.ItemCount - 1 do
            if (pt.y > ItemGroup.Items[I].Rect.Top) and (pt.y < ItemGroup.Items[I].Rect.Bottom) then
            begin
              if pt.x > ItemGroup.Items[I].Rect.Right then
              begin
                Item1 := ItemGroup.Items[I];
                if I < ItemGroup.ItemCount - 1 then
                  Item2 := ItemGroup.Items[I + 1];
              end
              else if pt.x < ItemGroup.Items[I].Rect.Right then
              begin
                Item2 := ItemGroup.Items[I];
                if I > 0 then
                  Item1 := ItemGroup.Items[I - 1];
              end
            end;
        end;
      end;
    end
    else
    begin
      ALinkViewInfo := GetLinkViewInfoAtPos(pt);
      if ALinkViewInfo <> nil then
      begin
        Index := ItemGroup.IndexOfLinkViewInfo(ALinkViewInfo);
        if (ALinkViewInfo.Rect.Top + (ALinkViewInfo.Rect.Bottom - ALinkViewInfo.Rect.Top) div 2) > pt.y then
        begin
          if Index > 0 then
            Item1 := ItemGroup.Items[Index - 1];
          Item2 := ALinkViewInfo
        end
        else
        begin
          Item1 := ALinkViewInfo;
          if Index < ItemGroup.ItemCount - 1 then
            Item2 := ItemGroup.Items[Index + 1];
        end;
      end
      else
      begin
        if ItemGroup.ItemCount > 0 then
        begin
          if pt.Y < ItemGroup.Items[0].Rect.Top then
            Item2 := ItemGroup.Items[0]
          else Item1 := ItemGroup.Items[ItemGroup.ItemCount - 1];
        end;
      end;
    end;
    if (Item1 <> nil) and (Item2 <> nil) then
      Result := Item2.Link.Index
    else if Item1 <> nil then
      Result := ItemGroup.Group.LinkCount
    else Result := 0;
  end
  else Result := -1;
end;

function TdxNavBarViewInfo.GetLinksAtDragPosition(pt: TPoint; var ItemGroup: TdxNavBarGroup;
    var Item1, Item2: TdxNavBarItemLink): Integer;
var
  AGroupViewInfo: TdxNavBarGroupViewInfo;
  ALinkViewInfo1, ALinkViewInfo2: TdxNavBarLinkViewInfo;
begin
  Result := GetViewInfoAtDragPosition(pt, AGroupViewInfo, ALinkViewInfo1, ALinkViewInfo2);
  if AGroupViewInfo <> nil then
  if (AGroupViewInfo <> nil) and (AGroupViewInfo.Group <> nil) and
    not (csDestroying in AGroupViewInfo.Group.ComponentState) then
    ItemGroup := AGroupViewInfo.Group
  else ItemGroup := nil;
  if (ALinkViewInfo1 <> nil) and (ALinkViewInfo1.Link <> nil) and
    (ALinkViewInfo1.Link.Group <> nil) and ((ALinkViewInfo1.Link.Item <> nil)) then
    Item1 := ALinkViewInfo1.Link
  else Item1 := nil;
  if (ALinkViewInfo2 <> nil) and (ALinkViewInfo2.Link <> nil) and
    (ALinkViewInfo2.Link.Group <> nil) and ((ALinkViewInfo2.Link.Item <> nil)) then
    Item2 := ALinkViewInfo2.Link
  else Item2 := nil;
end;

function TdxNavBarViewInfo.IsTopScrollButtonVisible: Boolean;
begin
  Result := (FTopScrollButtonRect.Top <> FTopScrollButtonRect.Bottom) and
      (FTopScrollButtonRect.Left <> FTopScrollButtonRect.Right);
end;

function TdxNavBarViewInfo.IsBottomScrollButtonVisible: Boolean;
begin
  Result := (FBottomScrollButtonRect.Top <> FBottomScrollButtonRect.Bottom) and
      (FBottomScrollButtonRect.Left <> FBottomScrollButtonRect.Right);
end;

function TdxNavBarViewInfo.IsPtTopScrollButton(pt: TPoint): Boolean;
begin
  Result := PtInRect(FTopScrollButtonRect, pt);
end;

function TdxNavBarViewInfo.IsPtBottomScrollButton(pt: TPoint): Boolean;
begin
  Result := PtInRect(FBottomScrollButtonRect, pt);
end;

function TdxNavBarViewInfo.BgImage: TPicture;
begin
  if (NavBar.StyleBackground <> nil) and (savImage in NavBar.StyleBackground.Style.AssignedValues) then
    Result := NavBar.StyleBackground.Style.Image
  else Result := NavBar.DefaultStyles.Background.Image;
end;

function TdxNavBarViewInfo.BgBackColor: TColor;
begin
  if (NavBar.StyleBackground <> nil) and (savBackColor in NavBar.StyleBackground.Style.AssignedValues) then
    Result := NavBar.StyleBackground.Style.BackColor
  else Result := NavBar.DefaultStyles.Background.BackColor;
end;

function TdxNavBarViewInfo.BgBackColor2: TColor;
begin
  if (NavBar.StyleBackground <> nil) and (savBackColor2 in NavBar.StyleBackground.Style.AssignedValues) then
    Result := NavBar.StyleBackground.Style.BackColor2
  else Result := NavBar.DefaultStyles.Background.BackColor2;
end;

function TdxNavBarViewInfo.BgAlphaBlend: Byte;
begin
  if (NavBar.StyleBackground <> nil) and (savAlphaBlending in NavBar.StyleBackground.Style.AssignedValues) then
    Result := NavBar.StyleBackground.Style.AlphaBlending
  else Result := NavBar.DefaultStyles.Background.AlphaBlending;
end;

function TdxNavBarViewInfo.BgAlphaBlend2: Byte;
begin
  if (NavBar.StyleBackground <> nil) and (savAlphaBlending2 in NavBar.StyleBackground.Style.AssignedValues) then
    Result := NavBar.StyleBackground.Style.AlphaBlending2
  else Result := NavBar.DefaultStyles.Background.AlphaBlending2;
end;

function TdxNavBarViewInfo.BgGradientMode: TdxBarStyleGradientMode;
begin
  if (NavBar.StyleBackground <> nil) and (savGradientMode in NavBar.StyleBackground.Style.AssignedValues) then
    Result := NavBar.StyleBackground.Style.GradientMode
  else Result := NavBar.DefaultStyles.Background.GradientMode;
end;

function TdxNavBarViewInfo.BottomButtonStyleItem: TdxNavBarStyleItem;
begin
  if NavBar.ScrollButtonUpIsDown then
    Result := NavBar.StyleButtonPressed
  else if IsPtBottomScrollButton(NavBar.TargetPoint) then
    Result := NavBar.StyleButtonHotTracked
  else Result := NavBar.StyleButton;
end;

function TdxNavBarViewInfo.BottomButtonStyle: TdxBaseNavBarStyle;
begin
  if NavBar.ScrollButtonUpIsDown then
    Result := NavBar.DefaultStyles.ButtonPressed
  else if IsPtBottomScrollButton(NavBar.TargetPoint) then
    Result := NavBar.DefaultStyles.ButtonHotTracked
  else Result := NavBar.DefaultStyles.Button;
end;

function TdxNavBarViewInfo.BottomButtonImage: TPicture;
begin
  if (BottomButtonStyleItem <> nil) and (savImage in BottomButtonStyleItem.Style.AssignedValues) then
    Result := BottomButtonStyleItem.Style.Image
  else Result := BottomButtonStyle.Image;
end;

function TdxNavBarViewInfo.BottomButtonBackColor: TColor;
begin
  if (BottomButtonStyleItem <> nil) and (savBackColor in BottomButtonStyleItem.Style.AssignedValues) then
    Result := BottomButtonStyleItem.Style.BackColor
  else Result := BottomButtonStyle.BackColor;
end;

function TdxNavBarViewInfo.BottomButtonBackColor2: TColor;
begin
  if (BottomButtonStyleItem <> nil) and (savBackColor2 in BottomButtonStyleItem.Style.AssignedValues) then
    Result := BottomButtonStyleItem.Style.BackColor2
  else Result := BottomButtonStyle.BackColor2;
end;

function TdxNavBarViewInfo.BottomButtonAlphaBlend: Byte;
begin
  if (BottomButtonStyleItem <> nil) and (savAlphaBlending in BottomButtonStyleItem.Style.AssignedValues) then
    Result := BottomButtonStyleItem.Style.AlphaBlending
  else Result := BottomButtonStyle.AlphaBlending;
end;

function TdxNavBarViewInfo.BottomButtonAlphaBlend2: Byte;
begin
  if (BottomButtonStyleItem <> nil) and (savAlphaBlending2 in BottomButtonStyleItem.Style.AssignedValues) then
    Result := BottomButtonStyleItem.Style.AlphaBlending2
  else Result := BottomButtonStyle.AlphaBlending2;
end;

function TdxNavBarViewInfo.BottomButtonGradientMode: TdxBarStyleGradientMode;
begin
  if (BottomButtonStyleItem <> nil) and (savGradientMode in BottomButtonStyleItem.Style.AssignedValues) then
    Result := BottomButtonStyleItem.Style.GradientMode
  else Result := BottomButtonStyle.GradientMode;
end;

function TdxNavBarViewInfo.TopButtonStyleItem: TdxNavBarStyleItem;
begin
  if NavBar.ScrollButtonUpIsDown then
    Result := NavBar.StyleButtonPressed
  else if IsPtTopScrollButton(NavBar.TargetPoint) then
    Result := NavBar.StyleButtonHotTracked
  else Result := NavBar.StyleButton;
end;

function TdxNavBarViewInfo.TopButtonStyle: TdxBaseNavBarStyle;
begin
  if NavBar.ScrollButtonUpIsDown then
    Result := NavBar.DefaultStyles.ButtonPressed
  else if IsPtTopScrollButton(NavBar.TargetPoint) then
    Result := NavBar.DefaultStyles.ButtonHotTracked
  else Result := NavBar.DefaultStyles.Button;
end;

function TdxNavBarViewInfo.TopButtonImage: TPicture;
begin
  if (TopButtonStyleItem <> nil) and (savImage in TopButtonStyleItem.Style.AssignedValues) then
    Result := TopButtonStyleItem.Style.Image
  else Result := TopButtonStyle.Image;
end;

function TdxNavBarViewInfo.TopButtonBackColor: TColor;
begin
  if (TopButtonStyleItem <> nil) and (savBackColor in TopButtonStyleItem.Style.AssignedValues) then
    Result := TopButtonStyleItem.Style.BackColor
  else Result := TopButtonStyle.BackColor;
end;

function TdxNavBarViewInfo.TopButtonBackColor2: TColor;
begin
  if (TopButtonStyleItem <> nil) and (savBackColor2 in TopButtonStyleItem.Style.AssignedValues) then
    Result := TopButtonStyleItem.Style.BackColor2
  else Result := TopButtonStyle.BackColor2;
end;

function TdxNavBarViewInfo.TopButtonAlphaBlend: Byte;
begin
  if (TopButtonStyleItem <> nil) and (savAlphaBlending in TopButtonStyleItem.Style.AssignedValues) then
    Result := TopButtonStyleItem.Style.AlphaBlending
  else Result := TopButtonStyle.AlphaBlending;
end;

function TdxNavBarViewInfo.TopButtonAlphaBlend2: Byte;
begin
  if (TopButtonStyleItem <> nil) and (savAlphaBlending2 in TopButtonStyleItem.Style.AssignedValues) then
    Result := TopButtonStyleItem.Style.AlphaBlending2
  else Result := TopButtonStyle.AlphaBlending2;
end;

function TdxNavBarViewInfo.TopButtonGradientMode: TdxBarStyleGradientMode;
begin
  if (TopButtonStyleItem <> nil) and (savGradientMode in TopButtonStyleItem.Style.AssignedValues) then
    Result := TopButtonStyleItem.Style.GradientMode
  else Result := TopButtonStyle.GradientMode;
end;

function TdxNavBarViewInfo.HintImage: TPicture;
begin
  if (NavBar.StyleHint <> nil) and (savImage in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.Image
  else Result := NavBar.DefaultStyles.Hint.Image
end;

function TdxNavBarViewInfo.HintBackColor: TColor;
begin
  if (NavBar.StyleHint <> nil) and (savBackColor in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.BackColor
  else Result := NavBar.DefaultStyles.Hint.BackColor;
end;

function TdxNavBarViewInfo.HintBackColor2: TColor;
begin
  if (NavBar.StyleHint <> nil) and (savBackColor2 in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.BackColor2
  else Result := NavBar.DefaultStyles.Hint.BackColor2;
end;

function TdxNavBarViewInfo.HintAlphaBlend: Byte;
begin
  if (NavBar.StyleHint <> nil) and (savAlphaBlending in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.AlphaBlending
  else Result := NavBar.DefaultStyles.Hint.AlphaBlending;
end;

function TdxNavBarViewInfo.HintAlphaBlend2: Byte;
begin
  if (NavBar.StyleHint <> nil) and (savAlphaBlending2 in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.AlphaBlending2
  else Result := NavBar.DefaultStyles.Hint.AlphaBlending2;
end;

function TdxNavBarViewInfo.HintGradientMode: TdxBarStyleGradientMode;
begin
  if (NavBar.StyleHint <> nil) and (savGradientMode in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.GradientMode
  else Result := NavBar.DefaultStyles.Hint.GradientMode;
end;

function TdxNavBarViewInfo.HintFont: TFont;
begin
  if (NavBar.StyleHint <> nil) and (savFont in NavBar.StyleHint.Style.AssignedValues) then
    Result := NavBar.StyleHint.Style.Font
  else Result := NavBar.DefaultStyles.Hint.Font;
end;

function TdxNavBarViewInfo.DrarDropItemTargetBackColor: TColor;
begin
  if (NavBar.StyleDropTargetLink <> nil) and (savBackColor in NavBar.StyleDropTargetLink.Style.AssignedValues) then
    Result := NavBar.StyleDropTargetLink.Style.BackColor
  else Result := NavBar.DefaultStyles.DropTargetLink.BackColor;
end;

function TdxNavBarViewInfo.DrarDropGroupTargetBackColor: TColor;
begin
  if (NavBar.StyleDropTargetGroup <> nil) and (savBackColor in NavBar.StyleDropTargetGroup.Style.AssignedValues) then
    Result := NavBar.StyleDropTargetGroup.Style.BackColor
  else Result := NavBar.DefaultStyles.DropTargetGroup.BackColor;
end;

function TdxNavBarViewInfo.DrarDropGroupTargetBackColor2: TColor;
begin
  if (NavBar.StyleDropTargetGroup <> nil) and (savBackColor2 in NavBar.StyleDropTargetGroup.Style.AssignedValues) then
    Result := NavBar.StyleDropTargetGroup.Style.BackColor2
  else Result := NavBar.DefaultStyles.DropTargetGroup.BackColor2;
end;

function TdxNavBarViewInfo.DrarDropGroupTargetAlphaBlend: Byte;
begin
  if (NavBar.StyleDropTargetGroup <> nil) and (savAlphaBlending in NavBar.StyleDropTargetGroup.Style.AssignedValues) then
    Result := NavBar.StyleDropTargetGroup.Style.AlphaBlending
  else Result := NavBar.DefaultStyles.DropTargetGroup.AlphaBlending;
end;

function TdxNavBarViewInfo.DrarDropGroupTargetAlphaBlend2: Byte;
begin
  if (NavBar.StyleDropTargetGroup <> nil) and (savAlphaBlending2 in NavBar.StyleDropTargetGroup.Style.AssignedValues) then
    Result := NavBar.StyleDropTargetGroup.Style.AlphaBlending2
  else   Result := NavBar.DefaultStyles.DropTargetGroup.AlphaBlending2;
end;

function TdxNavBarViewInfo.DrarDropGroupTargetGradient: TdxBarStyleGradientMode;
begin
  if (NavBar.StyleDropTargetGroup <> nil) and (savGradientMode in NavBar.StyleDropTargetGroup.Style.AssignedValues) then
    Result := NavBar.StyleDropTargetGroup.Style.GradientMode
  else Result := NavBar.DefaultStyles.DropTargetGroup.GradientMode;
end;

function TdxNavBarViewInfo.GetLargeImageHeight: Integer;
begin
  if (NavBar.LargeImages <> nil) then
    Result := NavBar.LargeImages.Height
  else Result := dxNavBarDefaultLargeImageHeight;
end;

function TdxNavBarViewInfo.GetLargeImageWidth: Integer;
begin
  if (NavBar.LargeImages <> nil) then
    Result := NavBar.LargeImages.Width
  else Result := dxNavBarDefaultLargeImageWidth;
end;

function TdxNavBarViewInfo.GetSmallImageHeight: Integer;
begin
  if (NavBar.SmallImages <> nil) then
    Result := NavBar.SmallImages.Height
  else Result := dxNavBarDefaultSmallImageHeight;
end;

function TdxNavBarViewInfo.GetSmallImageWidth: Integer;
begin
  if (NavBar.SmallImages <> nil) then
    Result := NavBar.SmallImages.Width
  else Result := dxNavBarDefaultSmallImageWidth;
end;

function TdxNavBarViewInfo.GetSpaceBetweenGroups: Integer;
begin
  if NavBar.SpaceBetweenGroups > 0 then
    Result := NavBar.SpaceBetweenGroups
  else Result := GetGroupSeparatorWidth;
end;

class function TdxNavBarViewInfo.GetGroupBorderWidth: Integer;
begin
  Result := 0;
end;

class function TdxNavBarViewInfo.GetGroupCaptionHeightAddon: Integer;
begin
  Result := 6;
end;

class function TdxNavBarViewInfo.GetGroupSeparatorWidth: Integer;
begin
  Result := 0;
end;

class function TdxNavBarViewInfo.GetGroupCaptionSignSize: Integer;
begin
  Result := 16;
end;

class function TdxNavBarViewInfo.GetGroupHorizontalEdge: Integer;
begin
  Result := 0;
end;

class function TdxNavBarViewInfo.GetGroupCaptionSeparatorWidth: Integer;
begin
  Result := 8;
end;

class function TdxNavBarViewInfo.GetLinksLargeSeparatorWidth: Integer;
begin
  Result := 6;
end;

class function TdxNavBarViewInfo.GetLinksSmallSeparatorWidth: Integer;
begin
  Result := 6;
end;

class function TdxNavBarViewInfo.GetLinksIconViewSeparatorWidth: Integer;
begin
  Result := 4;
end;

class function TdxNavBarViewInfo.GetLinksImageVerticalEdge: Integer;
begin
  Result := 4;
end;

class function TdxNavBarViewInfo.GetLinksImageHorizontalEdge: Integer;
begin
  Result := 4;
end;

class function TdxNavBarViewInfo.GetDragArrowHeight: Integer;
begin
  Result := 8;
end;

class function TdxNavBarViewInfo.GetDragArrowWidth: Integer;
begin
  Result := 6;
end;

class function TdxNavBarViewInfo.GetScrollButtonVerticalEdge: Integer;
begin
  Result := 6;
end;

class function TdxNavBarViewInfo.GetScrollButtonHorizontalEdge: Integer;
begin
  Result := 6;
end;

class function TdxNavBarViewInfo.GetScrollButtonVerticalSize: Integer;
begin
  Result := 16;
end;

class function TdxNavBarViewInfo.GetScrollButtonHorizontalSize: Integer;
begin
  Result := 16;
end;

function TdxNavBarViewInfo.CanHasScrollButtonInGroupCaption: Boolean;
begin
  Result := False;
end;

function TdxNavBarViewInfo.CanHasImageInGroupCaption: Boolean;
begin
  Result := False;
end;

function TdxNavBarViewInfo.CanHasSignInGroupCaption: Boolean;
begin
  Result := False;
end;

function TdxNavBarViewInfo.CanHasGroupViewAsIconView: Boolean;
begin
  Result := True;
end;

function TdxNavBarViewInfo.CanHasVisibleItemsInGroup(AGroup: TdxNavBarGroup): Boolean;
begin
  Result := AGroup = NavBar.ActiveGroup;
end;

function TdxNavBarViewInfo.CanGroupsUseLargeImages: Boolean;
begin
  Result := True;
end;

function TdxNavBarViewInfo.CanLinksUseLargeImages: Boolean;
begin
  Result := True;
end;

procedure TdxNavBarViewInfo.RecalculateHint;
var
  AGroup: TdxNavBarGroup;
  ALink: TdxNavBarItemLink;
begin
  FHintText := '';
  AGroup := GetGroupAtCaptionPos(NavBar.TargetPoint);
  if AGroup <> nil then
  begin
    FHintText := GetGroupHintText(AGroup);
    FHintRect := GetGroupHintRect(AGroup);
  end
  else
  begin
    ALink := GetLinkAtSelectedPos(NavBar.TargetPoint);
    if ALink <> nil then
    begin
      FHintText := GetLinkHintText(ALink);
      FHintRect := GetLinkHintRect(ALink)
    end
  end;
end;

function TdxNavBarViewInfo.GetGroupHintRect(AGroup: TdxNavBarGroup): TRect;
var
  pt: TPoint;
begin
  Painter.HintWindowCanvas.Font := HintFont;
  Result := Rect(0, 0, Painter.ClientWidth, 0);
  DrawText(Painter.HintWindowDC, PChar(HintText), -1, Result, DT_CALCRECT or DT_LEFT or
    DT_WORDBREAK or DT_NOPREFIX);
  Inc(Result.Right, 6);
  Inc(Result.Bottom, 4);
  if Assigned(NavBar.OnCalcGroupHintRect) then
    NavBar.OnCalcGroupHintRect(NavBar, AGroup, Self, Result);
  pt := NavBar.ClientToScreen(NavBar.TargetPoint);
  OffsetRect(Result, pt.X + 20, pt.Y);
end;

function TdxNavBarViewInfo.GetLinkHintRect(ALink: TdxNavBarItemLink): TRect;
var
  pt: TPoint;
begin
  Painter.HintWindowCanvas.Font := HintFont;
  Result := Rect(0, 0, Painter.ClientWidth, 0);
  DrawText(Painter.HintWindowDC, PChar(HintText), -1, Result, DT_CALCRECT or DT_LEFT or
    DT_WORDBREAK or DT_NOPREFIX);
  Inc(Result.Right, 6);
  Inc(Result.Bottom, 4);
  if Assigned(NavBar.OnCalcLinkHintRect) then
    NavBar.OnCalcLinkHintRect(NavBar, ALink, Self, Result);
  pt := NavBar.ClientToScreen(NavBar.TargetPoint);
  OffsetRect(Result, pt.X + 20, pt.Y);
end;

function TdxNavBarViewInfo.GetGroupHintText(AGroup: TdxNavBarGroup): string;
begin
  Result := AGroup.Hint;
  if Assigned(NavBar.OnGetGroupHint) then
    NavBar.OnGetGroupHint(NavBar, AGroup, Result);
  Result := GetShortHint(Result);
end;

function TdxNavBarViewInfo.GetLinkHintText(ALink: TdxNavBarItemLink): string;
begin
  Result := ALink.Item.Hint;
  if Assigned(NavBar.OnGetGroupHint) then
    NavBar.OnGetLinkHint(NavBar, ALink, Result);
  Result := GetShortHint(Result);
end;

function TdxNavBarViewInfo.HintDelay: Integer;
begin
  Result := dxNavBarHintShowingInterval;
end;

procedure TdxNavBarViewInfo.AdjustControlsBounds;
var
  I: Integer;
  AGroup: TdxNavBarGroup;
  AViewInfo: TdxNavBarGroupViewInfo;
  R: TRect;
begin
  for I := 0 to NavBar.Groups.Count - 1 do
  begin
    AGroup := NavBar.Groups[I];
    AViewInfo := GetGroupViewInfoByGroup(AGroup);
    if AViewInfo <> nil then
        AViewInfo.AdjustControlBounds
    else if AGroup.Control <> nil then
    begin
      R := NavBar.BoundsRect;
      OffsetRect(R, -R.Left, -R.Top);
      AGroup.Control.AdjustControl(R, False);
    end;
  end;
end;

procedure TdxNavBarViewInfo.RecreateInfo;
var
  I: Integer;
begin
  ClearGroups;
  if NavBar.ShowGroupCaptions then
  begin
    for I := 0 to NavBar.Groups.Count - 1 do
      if NavBar.Groups[I].Visible then
        AddGroup(Self, NavBar.Groups[I]);
  end
  else if NavBar.ActiveGroup <> nil then
    AddGroup(Self, NavBar.ActiveGroup);
end;

procedure TdxNavBarViewInfo.Recalculate;
var
  I, GroupStartY: Integer;
begin
  SetRectEmpty(FTopScrollButtonRect);
  SetRectEmpty(FBottomScrollButtonRect);
  SetRectEmpty(FHintRect);

  GroupStartY := GetSpaceBetweenGroups;
  for I := 0 to GroupCount - 1 do
  begin
    Groups[I].Recalculate(GetGroupHorizontalEdge, GroupStartY);
    GroupStartY := Groups[I].Rect.Bottom + GetSpaceBetweenGroups;
  end;
end;

procedure TdxNavBarViewInfo.CorrectViewInfo;
var
  I, ActiveGroupViewInfoIndex: Integer;
  OffsetY, OffsetHeight: Integer;
begin
  ActiveGroupViewInfoIndex := IndexOfGroupViewInfo(ActiveGroupViewInfo);
  OffsetY := Painter.ClientHeight - Groups[GroupCount - 1].Rect.Bottom;
  OffsetHeight := 2 * GetScrollButtonVerticalSize + 3 * GetScrollButtonVerticalEdge;
  if (ActiveGroupViewInfo.ItemsRect.Bottom + OffsetY < ActiveGroupViewInfo.ItemsRect.Top + OffsetHeight) then
    OffsetY := ActiveGroupViewInfo.ItemsRect.Top + OffsetHeight - ActiveGroupViewInfo.ItemsRect.Bottom;
  ActiveGroupViewInfo.CorrectActiveGroupViewInfo(0, OffsetY);
  for I := ActiveGroupViewInfoIndex + 1 to GroupCount - 1 do
    Groups[I].CorrectViewInfo(0, OffsetY);
  if ActiveGroupViewInfo <> nil then
  begin
    FTopScrollButtonRect := GetTopScrollButtonRect;
    FBottomScrollButtonRect := GetBottomScrollButtonRect;
  end;
end;

procedure TdxNavBarViewInfo.CorrectScrollInfo;
var
  I, AHeight: Integer;
  ADelta: Double;
  AOldVisible: Boolean;
begin
  AOldVisible := NavBar.ScrollBar.Visible;
  if GroupCount > 0 then
  begin
    AHeight := Groups[GroupCount - 1].Rect.Bottom + GetSpaceBetweenGroups;
    if AHeight > Painter.ClientHeight then
    begin
      with NavBar.ScrollBar do
      begin
        ADelta := (Painter.ClientHeight * NavBar.ScrollBar.Height) / AHeight;
        PageSize := Round(ADelta);
        Min := 0;
        Max := AHeight - Painter.ClientHeight + Round(ADelta);
        PageSize := Round(ADelta);
        if Position + PageSize > Max then Position := Max - PageSize;
        Visible := True;
      end;
    end
    else NavBar.ScrollBar.Visible := False;
  end
  else NavBar.ScrollBar.Visible := False;

  if AOldVisible = NavBar.ScrollBar.Visible then
  begin
    for I := 0 to GroupCount - 1 do
      Groups[I].CorrectViewInfo(0, - NavBar.ScrollPosition);
    if IsTopScrollButtonVisible then
      OffsetRect(FTopScrollButtonRect, 0, - NavBar.ScrollPosition);
    if IsBottomScrollButtonVisible then
      OffsetRect(FBottomScrollButtonRect, 0, - NavBar.ScrollPosition);
  end
  else Recalculate;
end;

function TdxNavBarViewInfo.GetTopScrollButtonRect: TRect;
begin
  SetRectEmpty(Result);
  if not (sDisabled in TopScrollButtonState) then
  begin
    Result := ActiveGroupViewInfo.ItemsRect;
    Result.Left := Result.Right - GetScrollButtonHorizontalSize;
    Result.Bottom := Result.Top + GetScrollButtonVerticalSize;
    OffSetRect(Result, - GetScrollButtonHorizontalEdge, GetScrollButtonVerticalEdge);
  end;
end;

function TdxNavBarViewInfo.GetBottomScrollButtonRect: TRect;
begin
  SetRectEmpty(Result);
  if not (sDisabled in BottomScrollButtonState) then
  begin
    Result := ActiveGroupViewInfo.ItemsRect;
    Result.Left := Result.Right - GetScrollButtonHorizontalSize;
    Result.Bottom := Result.Top + GetScrollButtonVerticalSize;
    OffSetRect(Result, - GetScrollButtonHorizontalEdge, - GetScrollButtonVerticalEdge);
    OffSetRect(Result, 0, ActiveGroupViewInfo.ItemsRect.Bottom -
        ActiveGroupViewInfo.ItemsRect.Top - GetScrollButtonVerticalSize);
  end;
end;

function TdxNavBarViewInfo.GetGroupCount: Integer;
begin
  Result := FGroups.Count;
end;

function TdxNavBarViewInfo.GetGroup(Index: Integer): TdxNavBarGroupViewInfo;
begin
  Result := TdxNavBarGroupViewInfo(FGroups.Items[Index]);
end;

procedure TdxNavBarViewInfo.AddGroup(AViewInfo: TdxNavBarViewInfo; AGroup: TdxNavBarGroup);
begin
  FGroups.Add(Painter.GroupViewInfoClass.Create(AViewInfo, AGroup));
end;

procedure TdxNavBarViewInfo.ClearGroups;
var
  I: Integer;
begin
  for I := 0 to GroupCount - 1 do Groups[I].Free;
  FGroups.Clear;
end;

function TdxNavBarViewInfo.GetBottomScrollButtonState: TdxNavBarObjectStates;
begin
  Result := [];
  if NavBar.ScrollButtonDownIsDown then
    Result := Result + [sPressed];
  if not ((ActiveGroupViewInfo <> nil) and (ActiveGroupViewInfo.ItemCount > 0) and
    (ActiveGroupViewInfo.Items[ActiveGroupViewInfo.ItemCount - 1].Rect.Bottom >
    ActiveGroupViewInfo.Rect.Bottom)) then
    Result := Result + [sDisabled];
  if IsPtBottomScrollButton(NavBar.TargetPoint) then
    Result := Result + [sHotTracked];
end;

function TdxNavBarViewInfo.GetTopScrollButtonState: TdxNavBarObjectStates;
begin
  Result := [];
  if NavBar.ScrollButtonUpIsDown then
    Result := Result + [sPressed];
  if not ((ActiveGroupViewInfo <> nil) and (ActiveGroupViewInfo.ItemCount > 0) and
    (ActiveGroupViewInfo.Group.TopVisibleLinkIndex > 0)) then
    Result := Result + [sDisabled];
  if IsPtTopScrollButton(NavBar.TargetPoint) then
    Result := Result + [sHotTracked];
end;

{ TdxBaseImagePainter }

class procedure TdxBaseImagePainter.DrawImage(ACanvas: TCanvas;
  AImageList: TImageList; AImageIndex: Integer; R: TRect);
begin
  InternalDrawImage(ACanvas, AImageList, AImageIndex, R);
end;

class procedure TdxBaseImagePainter.InternalDrawImage(ACanvas: TCanvas;
  AImageList: TImageList; AImageIndex: Integer; R: TRect);
begin
end;

{ TdxBaseSelectionPainter }

class procedure TdxBaseSelectionPainter.DrawSelection(ACanvas: TCanvas;
  ARect: TRect; ABackColor: TColor; AState: TdxNavBarObjectStates);
begin
  InternalDrawSelection(ACanvas, ARect, ABackColor, AState);
end;

class procedure TdxBaseSelectionPainter.InternalDrawSelection(
  ACanvas: TCanvas; ARect: TRect; ABackColor: TColor;
  AState: TdxNavBarObjectStates);
begin

end;

{ TdxBaseBackgroundPainter }

class procedure TdxBaseBackgroundPainter.DrawBackground(ACanvas: TCanvas;
  R: TRect; APicture: TPicture; AEraseBackground: Boolean; AColor1,
  AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode);
begin
  InternalDrawBackground(ACanvas, R, APicture, AEraseBackground,
    AColor1, AColor2, AAlphaBlend1, AAlphaBlend2, AGradientMode);
end;

class procedure TdxBaseBackgroundPainter.InternalDrawBackground(
  ACanvas: TCanvas; R: TRect; APicture: TPicture;
  AEraseBackground: Boolean; AColor1, AColor2: TColor; AAlphaBlend1,
  AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode);
begin

end;

{ TdxBaseSignPainter }

class procedure TdxBaseSignPainter.DrawSign(ACanvas: TCanvas; ARect: TRect;
  AForeColor, ABackColor: TColor; AState: TdxNavBarObjectStates);
begin
  InternalDrawSign(ACanvas, ARect, AForeColor, ABackColor, AState);
end;

class procedure TdxBaseSignPainter.InternalDrawSign(ACanvas: TCanvas;
  ARect: TRect; AForeColor, ABackColor: TColor;
  AState: TdxNavBarObjectStates);
begin

end;

{ TdxBaseHintPainter }

class procedure TdxBaseHintPainter.DrawHint(ACanvas: TCanvas; ARect: TRect;
  AHint: string; APicture: TPicture; AColor1, AColor2: TColor;
  AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AFont: TFont);
begin
  InternalDrawHint(ACanvas, ARect, AHint, APicture, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode, AFont);
end;

class procedure TdxBaseHintPainter.InternalDrawHint(ACanvas: TCanvas;
  ARect: TRect; AHint: string; APicture: TPicture; AColor1,
  AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AFont: TFont);
begin

end;

{ TdxBaseButtonPainter }

class procedure TdxBaseButtonPainter.DrawButton(ACanvas: TCanvas;
  ARect: TRect; APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1,
  AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
begin
  InternalDrawButton(ACanvas, ARect, APicture, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode, AState);
end;

class procedure TdxBaseButtonPainter.InternalDrawButton(ACanvas: TCanvas;
  ARect: TRect; APicture: TPicture; AColor1, AColor2: TColor; AAlphaBlend1,
  AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
begin

end;

{ TdxBaseScrollButtonsPainter }

class procedure TdxBaseScrollButtonsPainter.DrawBottomButton(
  ACanvas: TCanvas; ARect: TRect;
  AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
  AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
begin
  InternalDrawBottomButton(ACanvas, ARect, AButtonPainterClass, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode, AState);
end;

class procedure TdxBaseScrollButtonsPainter.DrawTopButton(ACanvas: TCanvas;
  ARect: TRect; AButtonPainterClass: TdxBaseButtonPainterClass; AColor1,
  AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode; AState: TdxNavBarObjectStates);
begin
  InternalDrawTopButton(ACanvas, ARect, AButtonPainterClass, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode, AState);
end;

class procedure TdxBaseScrollButtonsPainter.InternalDrawBottomButton(
  ACanvas: TCanvas; ARect: TRect;
  AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
  AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
begin

end;

class procedure TdxBaseScrollButtonsPainter.InternalDrawTopButton(
  ACanvas: TCanvas; ARect: TRect;
  AButtonPainterClass: TdxBaseButtonPainterClass; AColor1, AColor2: TColor;
  AAlphaBlend1, AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode;
  AState: TdxNavBarObjectStates);
begin

end;

{ TdxBaseDropTargetLinkPainter }

class procedure TdxBaseDropTargetLinkPainter.DrawTargetLink(
  ACanvas: TCanvas; pt1, pt2, pt3, pt4, pt5, pt6: TPoint; AColor: TColor);
begin
  InternalDrawTargetLink(ACanvas, pt1, pt2, pt3, pt4, pt5, pt6, AColor);
end;

class procedure TdxBaseDropTargetLinkPainter.InternalDrawTargetLink(
  ACanvas: TCanvas; pt1, pt2, pt3, pt4, pt5, pt6: TPoint; AColor: TColor);
begin

end;

{ TdxBaseDropTargetGroupPainter }

class procedure TdxBaseDropTargetGroupPainter.DrawTargetGroup(ACanvas: TCanvas;
  ARect: TRect; AColor1, AColor2: TColor; AAlphaBlend1, AAlphaBlend2: Byte;
  AGradientMode: TdxBarStyleGradientMode);
begin
  InternalDrawTargetGroup(ACanvas, ARect, AColor1, AColor2,
    AAlphaBlend1, AAlphaBlend2, AGradientMode);
end;

class procedure TdxBaseDropTargetGroupPainter.InternalDrawTargetGroup(
  ACanvas: TCanvas; ARect: TRect; AColor1, AColor2: TColor; AAlphaBlend1,
  AAlphaBlend2: Byte; AGradientMode: TdxBarStyleGradientMode);
begin

end;

{ TdxNavBarPainter }

constructor TdxNavBarPainter.Create(ANavBar: TdxCustomNavBar);
begin
  FNavBar := ANavBar;
  FViewInfo := ViewInfoClass.Create(Self);

  FNeedRecreateViewInfo := True;
  FNeedRecalculateViewInfo := True;
  FNeedRedrawCanvas := True;
  DoActivate;
end;

destructor TdxNavBarPainter.Destroy;
begin
  FViewInfo.Free;
  inherited;
end;

function TdxNavBarPainter.Canvas: TCanvas;
begin
  Result := NavBar.CanvasBitmap.Canvas;
end;

function TdxNavBarPainter.DC: HDC;
begin
  Result := Canvas.Handle;
end;

function TdxNavBarPainter.HintWindowCanvas: TCanvas;
begin
  Result := NavBar.HintWindow.Canvas;
end;

function TdxNavBarPainter.HintWindowDC: HDC;
begin
  Result := HintWindowCanvas.Handle;
end;

procedure TdxNavBarPainter.InvalidateViewInfo(AType: TdxNavBarChangeType);
begin
  if AType = doRecreate then
  begin
    FNeedRecreateViewInfo := True;
    FNeedRecalculateViewInfo := True;
  end
  else if AType = doRecalc then
    FNeedRecalculateViewInfo := True;
  FNeedRedrawCanvas := True;
end;

procedure TdxNavBarPainter.Paint;
var
  I: Integer;
begin
  if NavBar.CanvasBitmap.Width = 0 then
    NavBar.CanvasBitmap.Width := NavBar.ClientWidth;
  if NavBar.CanvasBitmap.Height = 0 then
    NavBar.CanvasBitmap.Height := NavBar.ClientHeight;

  if FNeedRecreateViewInfo then
    ViewInfo.RecreateInfo;
  if FNeedRecalculateViewInfo then
    ViewInfo.Recalculate;
  if FNeedRedrawCanvas then DrawNavBarControl;
  for I := 0 to ViewInfo.GroupCount - 1 do
    if (ViewInfo.Groups[I].Control <> nil) and ViewInfo.Groups[I].Control.Visible then
      with ViewInfo.Groups[I].ControlRect do
        ExcludeClipRect(NavBar.Canvas.Handle, Left, Top, Right, Bottom);
  BitBlt(NavBar.Canvas.Handle, 0, 0, ClientWidth, ClientHeight, DC, 0, 0, SRCCOPY);
  
  FNeedRecreateViewInfo := False;
  FNeedRecalculateViewInfo := False;
  FNeedRedrawCanvas := False;
end;

procedure TdxNavBarPainter.InvalidateScrollButtons;
begin
  if ViewInfo.IsTopScrollButtonVisible then
    Windows.InvalidateRect(NavBar.Handle, @ViewInfo.TopScrollButtonRect, True);
  if ViewInfo.IsBottomScrollButtonVisible then
    Windows.InvalidateRect(NavBar.Handle, @ViewInfo.BottomScrollButtonRect, True);
end;

function TdxNavBarPainter.ClientHeight: Integer;
begin
  Result := NavBar.ClientHeight;
end;

function TdxNavBarPainter.ClientWidth: Integer;
begin
  Result := NavBar.ClientWidth;
end;

procedure TdxNavBarPainter.AssignDefaultBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Background.Image.Graphic := nil;
    Background.BackColor := clAppWorkSpace;
    Background.BackColor2 := clAppWorkSpace;
    Background.AlphaBlending := 255;
    Background.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultButtonStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Button.Image.Graphic := nil;
    Button.BackColor := clBtnFace;
    Button.BackColor2 := clBtnFace;
    Button.AlphaBlending := 255;
    Button.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultButtonPressedStyle;
begin
  with NavBar.DefaultStyles do
    ButtonPressed.Assign(NavBar.DefaultStyles.Button);
end;

procedure TdxNavBarPainter.AssignDefaultButtonHotTrackedStyle;
begin
  with NavBar.DefaultStyles do
    ButtonHotTracked.Assign(NavBar.DefaultStyles.Button);
end;

procedure TdxNavBarPainter.AssignDefaultGroupBackgroundStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupBackground.Image.Graphic := nil;
    GroupBackground.BackColor := clAppWorkSpace;
    GroupBackground.BackColor2 := clAppWorkSpace;
    GroupBackground.AlphaBlending := 255;
    GroupBackground.AlphaBlending2 := 255;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultGroupHeaderStyle;
begin
  with NavBar.DefaultStyles do
  begin
    GroupHeader.Image.Graphic := nil;
    GroupHeader.BackColor := clBtnFace;
    GroupHeader.BackColor2 := clBtnFace;
    GroupHeader.AlphaBlending := 255;
    GroupHeader.AlphaBlending2 := 255;
    GroupHeader.Font.Color := clBtnText;
    GroupHeader.Font.Size := 8;
    GroupHeader.Font.Style := [];
    GroupHeader.Font.Name := 'MS Sans Serif';
    GroupHeader.HAlignment := haCenter;
    GroupHeader.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultGroupHeaderActiveStyle;
begin
  with NavBar.DefaultStyles do
    GroupHeaderActive.Assign(NavBar.DefaultStyles.GroupHeader);
end;

procedure TdxNavBarPainter.AssignDefaultGroupHeaderHotTrackedStyle;
begin
  with NavBar.DefaultStyles do
    GroupHeaderHotTracked.Assign(NavBar.DefaultStyles.GroupHeader);
end;

procedure TdxNavBarPainter.AssignDefaultGroupHeaderPressedStyle;
begin
  with NavBar.DefaultStyles do
    GroupHeaderPressed.Assign(NavBar.DefaultStyles.GroupHeader);
end;

procedure TdxNavBarPainter.AssignDefaultHintStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Hint.Image.Graphic := nil;
    Hint.BackColor := clInfoBk;
    Hint.BackColor2 := clInfoBk;
    Hint.AlphaBlending := 255;
    Hint.AlphaBlending2 := 255;
    Hint.Font.Color := clInfoText;
    Hint.Font.Size := 8;
    Hint.Font.Style := [];
    Hint.Font.Name := 'MS Sans Serif';
    Hint.HAlignment := haCenter;
    Hint.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultItemStyle;
begin
  with NavBar.DefaultStyles do
  begin
    Item.Image.Graphic := nil;
    Item.Font.Color := clBtnHighlight;
    Item.Font.Size := 8;
    Item.Font.Style := [];
    Item.Font.Name := 'MS Sans Serif';
    Item.HAlignment := haCenter;
    Item.VAlignment := vaCenter;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultItemDisabledStyle;
begin
  with NavBar.DefaultStyles do
  begin
    ItemDisabled.Assign(NavBar.DefaultStyles.Item);
    ItemDisabled.Font.Color := clBtnText;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultItemHotTrackedStyle;
begin
  with NavBar.DefaultStyles do
    ItemHotTracked.Assign(NavBar.DefaultStyles.Item);
end;

procedure TdxNavBarPainter.AssignDefaultItemPressedStyle;
begin
  with NavBar.DefaultStyles do
    ItemPressed.Assign(NavBar.DefaultStyles.Item);
end;

procedure TdxNavBarPainter.AssignDefaultDropTargetGroupStyle;
begin
  with NavBar.DefaultStyles do
  begin
    DropTargetGroup.Image.Graphic := nil;
    DropTargetGroup.BackColor := clHighlight;
    DropTargetGroup.BackColor2 := clHighlight;
    DropTargetGroup.AlphaBlending := 60;
    DropTargetGroup.AlphaBlending2 := 60;
  end;
end;

procedure TdxNavBarPainter.AssignDefaultDropTargetLinkStyle;
begin
  with NavBar.DefaultStyles do
  begin
    DropTargetLink.Image.Graphic := nil;
    DropTargetLink.BackColor := clBlack;
  end;
end;

class function TdxNavBarPainter.ViewInfoClass: TdxNavBarViewInfoClass;
begin
  Result := TdxNavBarViewInfo;
end;

class function TdxNavBarPainter.GroupViewInfoClass: TdxNavBarGroupViewInfoClass;
begin
  Result := TdxNavBarGroupViewInfo;
end;

class function TdxNavBarPainter.LinkViewInfoClass: TdxNavBarLinkViewInfoClass;
begin
  Result := TdxNavBarLinkViewInfo;
end;

class function TdxNavBarPainter.BackgroundPainterClass: TdxBaseBackgroundPainterClass;
begin
  Result := TdxBaseBackgroundPainter;
end;

class function TdxNavBarPainter.ButtonPainterClass: TdxBaseButtonPainterClass;
begin
  Result := TdxBaseButtonPainter;
end;

class function TdxNavBarPainter.DropTargetGroupPainterClass: TdxBaseDropTargetGroupPainterClass;
begin
  Result := TdxNavBarDropTargetGroupPainter;
end;

class function TdxNavBarPainter.DropTargetLinkPainterClass: TdxBaseDropTargetLinkPainterClass;
begin
  Result := TdxNavBarDropTargetLinkPainter;
end;

class function TdxNavBarPainter.ScrollButtonsPainterClass: TdxBaseScrollButtonsPainterClass;
begin
  Result := TdxBaseScrollButtonsPainter;
end;

class function TdxNavBarPainter.ImagePainterClass: TdxBaseImagePainterClass;
begin
  Result := TdxNavBarImagePainter;
end;

class function TdxNavBarPainter.SelectionPainterClass: TdxBaseSelectionPainterClass;
begin
  Result := TdxBaseSelectionPainter;
end;

class function TdxNavBarPainter.SignPainterClass: TdxBaseSignPainterClass;
begin
  Result := TdxBaseSignPainter;
end;

procedure TdxNavBarPainter.DoActivate;
begin
  if NavBar.ScrollBar <> nil then
    NavBar.ScrollBar.Visible := False;
  NavBar.DeSelectLinks;
end;

procedure TdxNavBarPainter.DoGroupActivate(AGroup: TdxNavBarGroup);
begin
  if NavBar.ActiveGroupIndex <> AGroup.Index then
    NavBar.ActiveGroup := AGroup;
end;

procedure TdxNavBarPainter.DoGroupDeactivate(AGroup: TdxNavBarGroup);
begin
end;

function TdxNavBarPainter.IsGroupActive(AGroup: TdxNavBarGroup): Boolean;
begin
  Result := AGroup = NavBar.ActiveGroup;
end;

procedure TdxNavBarPainter.DrawNavBarControl;
var
  AHandled: Boolean;
begin
  AHandled := False;
  if Assigned(NavBar.OnCustomDrawBackground) then
    NavBar.OnCustomDrawBackground(NavBar, Canvas, ViewInfo, AHandled);
  if not AHandled then DrawBackground;
  DrawGroups;
  DrawScrollButtons;
  DrawDropTargetGroupSelection;
  DrawDropTargetLinkSelection;
end;

procedure TdxNavBarPainter.DrawBackground;
begin
  with ViewInfo do
    BackgroundPainterClass.DrawBackground(Canvas, NavBar.ClientRect, BgImage, True,
        BgBackColor, BgBackColor2, BgAlphaBlend, BgAlphaBlend2,
        BgGradientMode);
end;

procedure TdxNavBarPainter.DrawDropTargetGroupSelection;
var
  AGroupViewInfo: TdxNavBarGroupViewInfo;
begin
  if not NavBar.EnableDragging or (NavBar.SourceGroup = nil) or
    not (fAllowDropGroup in NavBar.DragDropFlags) then exit;
  AGroupViewInfo := ViewInfo.GetGroupViewInfoAtCaptionPos(NavBar.TargetPoint);
  if AGroupViewInfo = nil then
    AGroupViewInfo := ViewInfo.GetGroupViewInfoAtItemsPos(NavBar.TargetPoint);
  if (AGroupViewInfo <> nil) and (AGroupViewInfo.Group <> NavBar.SourceGroup) then
    with ViewInfo do
    DropTargetGroupPainterClass.DrawTargetGroup(Canvas, AGroupViewInfo.CaptionRect,
        DrarDropGroupTargetBackColor, DrarDropGroupTargetBackColor2,
        DrarDropGroupTargetAlphaBlend, DrarDropGroupTargetAlphaBlend2,
        DrarDropGroupTargetGradient);
end;

procedure TdxNavBarPainter.DrawDropTargetLinkSelection;
var
  lpt1, lpt2, lapt1, lapt2, lapt3, rapt1, rapt2, rapt3: TPoint;
  Item1, Item2: TdxNavBarLinkViewInfo;
  ItemGroup: TdxNavBarGroupViewInfo;
begin
  if not NavBar.EnableDragging or ((NavBar.SourceLink = nil) and (NavBar.SourceItem = nil)) or
    not (fAllowDropLink in NavBar.DragDropFlags) then exit;
  ViewInfo.GetViewInfoAtDragPosition(NavBar.TargetPoint, ItemGroup, Item1, Item2);
  if (Item1 <> nil) and (NavBar.SourceItem = nil) and (Item1.Link = NavBar.SourceLink) then exit;
  if (Item2 <> nil) and (NavBar.SourceItem = nil) and (Item2.Link = NavBar.SourceLink) then exit;

  if (Item1 <> nil) or (Item2 <> nil) then
  begin
    if Item1 <> nil then
    begin
      if not ItemGroup.IsViewAsIconView then
      begin
        lpt1.x := Item1.Rect.Left;
        lpt1.y := Item1.Rect.Bottom;
      end
      else
      begin
        lpt1.x := Item1.Rect.Right;
        lpt1.y := Item1.Rect.Top;
      end;
      lpt2 := Item1.Rect.BottomRight;
    end
    else
    begin
      lpt1 := Item2.Rect.TopLeft;
      if not ItemGroup.IsViewAsIconView then
      begin
        lpt2.x := Item2.Rect.Right;
        lpt2.y := Item2.Rect.Top;
      end
      else
      begin
        lpt2.x := Item2.Rect.Left;
        lpt2.y := Item2.Rect.Bottom;
      end;
    end;
    if PtInRect(ItemGroup.ItemsRect, lpt1) and PtInRect(ItemGroup.ItemsRect, lpt2) then
    begin
      if not ItemGroup.IsViewAsIconView then
      begin
        lapt1.x := lpt1.x + ViewInfo.GetDragArrowWidth;
        lapt1.y := lpt1.y;
        lapt2.x := lpt1.x;
        if Item1 <> nil then
          lapt2.y := lpt1.y - ViewInfo.GetDragArrowHeight div 2
        else lapt2.y := lpt1.y;
        lapt3.x := lpt1.x;
        if Item2 <> nil then
          lapt3.y := lpt1.y + ViewInfo.GetDragArrowHeight div 2
        else lapt3.y := lpt1.y;
        rapt1.x := lapt1.x + (ItemGroup.Rect.Right - ItemGroup.Rect.Left) - 1 - 2 * ViewInfo.GetDragArrowWidth;
        rapt1.y := lapt1.y;
        rapt2.x := lapt2.x + (ItemGroup.Rect.Right - ItemGroup.Rect.Left) - 1;
        rapt2.y := lapt2.y;
        rapt3.x := lapt3.x + (ItemGroup.Rect.Right - ItemGroup.Rect.Left) - 1;
        rapt3.y := lapt3.y;
        DropTargetLinkPainterClass.DrawTargetLink(Canvas, lapt1, lapt2, lapt3, rapt1, rapt2, rapt3,
          ViewInfo.DrarDropItemTargetBackColor);
      end
      else DropTargetLinkPainterClass.DrawTargetLink(Canvas, lpt1, lpt1, lpt1, lpt2, lpt2, lpt2,
        ViewInfo.DrarDropItemTargetBackColor);
    end;
  end;

end;

procedure TdxNavBarPainter.DrawGroupHintWindow;
begin
  with ViewInfo do
    TdxNavBarHintPainter.DrawHint(HintWindowCanvas, NavBar.HintWindow.ClientRect,
        ViewInfo.HintText, HintImage, HintBackColor, HintBackColor2,
        HintAlphaBlend, HintAlphaBlend2, HintGradientMode, HintFont);
end;

procedure TdxNavBarPainter.DrawLinkHintWindow;
begin
  with ViewInfo do
    TdxNavBarHintPainter.DrawHint(HintWindowCanvas, NavBar.HintWindow.ClientRect,
        ViewInfo.HintText, HintImage, HintBackColor, HintBackColor2,
        HintAlphaBlend, HintAlphaBlend2, HintGradientMode, HintFont);
end;

procedure TdxNavBarPainter.DrawGroup(AGroupViewInfo: TdxNavBarGroupViewInfo);
var
  AHandled: Boolean;
begin
  AHandled := False;
  if Assigned(NavBar.OnCustomDrawGroupClientBackground) then
    NavBar.OnCustomDrawGroupClientBackground(NavBar, Canvas, AGroupViewInfo, AHandled);
  if not AHandled then
  begin
    DrawGroupBackground(AGroupViewInfo);
    DrawGroupBorder(AGroupViewInfo);
  end;
  if AGroupViewInfo.Control = nil then
  begin
    AHandled := False;
    if Assigned(NavBar.OnCustomDrawGroupClientForeground) then
      NavBar.OnCustomDrawGroupClientForeground(NavBar, Canvas, AGroupViewInfo, AHandled);
    if not AHandled then DrawGroupItems(AGroupViewInfo);
  end;
  if AGroupViewInfo.IsCaptionVisible then
  begin
    AHandled := False;
    if Assigned(NavBar.OnCustomDrawGroupCaption) then
      NavBar.OnCustomDrawGroupCaption(NavBar, Canvas, AGroupViewInfo, AHandled);
    if not AHandled then DrawGroupCaption(AGroupViewInfo);
  end;
end;

procedure TdxNavBarPainter.DrawGroupBackground(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  with AGroupViewInfo do
    BackgroundPainterClass.DrawBackground(Canvas, ItemsRect, BgImage, False, BgBackColor,
      BgBackColor2, BgAlphaBlend, BgAlphaBlend2, BgGradientMode);
end;

procedure TdxNavBarPainter.DrawGroupBorder(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
end;

procedure TdxNavBarPainter.DrawGroupCaption(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  DrawGroupCaptionButton(AGroupViewInfo);
  DrawGroupCaptionText(AGroupViewInfo);
  if AGroupViewInfo.IsCaptionImageVisible then
    DrawGroupCaptionImage(AGroupViewInfo);
  if AGroupViewInfo.IsCaptionSignVisible then
    DrawGroupCaptionSign(AGroupViewInfo);
end;

procedure TdxNavBarPainter.DrawGroupCaptionButton(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  with AGroupViewInfo do
    ButtonPainterClass.DrawButton(Canvas, CaptionRect, CaptionImage,
      CaptionBackColor, CaptionBackColor2, CaptionAlphaBlend, CaptionAlphaBlend2,
      CaptionGradientMode, State);
end;

procedure TdxNavBarPainter.DrawGroupCaptionText(AGroupViewInfo: TdxNavBarGroupViewInfo);
var
  R: TRect;
begin
  with AGroupViewInfo do
  begin
    R := CaptionTextRect;
    Canvas.Brush.Style := bsClear;
    Canvas.Font := CaptionFont;
    Canvas.Font.Color := CaptionFontColor;
    DrawText(DC, PChar(Group.Caption), Length(Group.Caption), R, GetDrawEdgeFlag);
  end;
end;

procedure TdxNavBarPainter.DrawGroupCaptionImage(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  with AGroupViewInfo do
    ImagePainterClass.DrawImage(Canvas, ImageList, ImageIndex, CaptionImageRect);
end;

procedure TdxNavBarPainter.DrawGroupCaptionSign(AGroupViewInfo: TdxNavBarGroupViewInfo);
begin
  if AGroupViewInfo.Group.ShowExpandButton then
    with AGroupViewInfo do
      SignPainterClass.DrawSign(Canvas, CaptionSignRect, CaptionSignColor, clWindow, State);
end;

procedure TdxNavBarPainter.DrawGroupItems(AGroupViewInfo: TdxNavBarGroupViewInfo);
var
  I: Integer;
  ALinkViewInfo: TdxNavBarLinkViewInfo;
begin
  for I := 0 to AGroupViewInfo.ItemCount - 1 do
  begin
    ALinkViewInfo := AGroupViewInfo.Items[I];
    if ALinkViewInfo.Rect.Top < AGroupViewInfo.ItemsRect.Top then continue;
    if ALinkViewInfo.Rect.Top > AGroupViewInfo.ItemsRect.Bottom then continue;
    if ALinkViewInfo.Rect.Bottom > AGroupViewInfo.ItemsRect.Bottom then
      ExcludeClipRect(DC, ALinkViewInfo.Rect.Left, AGroupViewInfo.ItemsRect.Bottom,
        ALinkViewInfo.Rect.Right, ALinkViewInfo.Rect.Bottom);
    DrawItem(ALinkViewInfo);
    SelectClipRgn(DC, 0);
  end;
end;

procedure TdxNavBarPainter.DrawGroups;
var
  I: Integer;
begin
  for I := 0 to ViewInfo.GroupCount - 1 do
    DrawGroup(ViewInfo.Groups[I]);
end;

procedure TdxNavBarPainter.DrawItem(ALinkViewInfo: TdxNavBarLinkViewInfo);
var
  AHandled: Boolean;
begin
  AHandled := False;
  if Assigned(NavBar.OnCustomDrawLink) then
    NavBar.OnCustomDrawLink(NavBar, Canvas, ALinkViewInfo, AHandled);
  if not AHandled then
  begin
    if (ALinkViewInfo.ImageList <> nil) and (0 <= ALinkViewInfo.ImageIndex) and
      (ALinkViewInfo.ImageIndex < ALinkViewInfo.ImageList.Count) then
    begin
      DrawItemSelection(ALinkViewInfo);
      if ALinkViewInfo.IsImageVisible then
        DrawItemImage(ALinkViewInfo);
    end;
    DrawItemCaption(ALinkViewInfo);
  end;
end;

procedure TdxNavBarPainter.DrawItemCaption(ALinkViewInfo: TdxNavBarLinkViewInfo);
var
  R: TRect;
  Flag: Integer;
begin
  with ALinkViewInfo do
  begin
    R := CaptionRect;
    if GroupViewInfo.IsLinksUseSmallImages then
      Flag := GetDrawEdgeFlag or DT_END_ELLIPSIS
    else
    begin
      if (R.Left < Rect.Left) or (R.Right > Rect.Right) then
      begin
        R.Left := Rect.Left;
        R.Right := Rect.Right;
        Flag := GetDrawEdgeFlag or DT_END_ELLIPSIS
      end
      else Flag := GetDrawEdgeFlag;
    end;
    Canvas.Brush.Style := bsClear;
    Canvas.Font := Font;
    Canvas.Font.Color := FontColor;
    DrawText(DC, PChar(Item.Caption), Length(Item.Caption), R, Flag);
  end;
end;

procedure TdxNavBarPainter.DrawItemImage(ALinkViewInfo: TdxNavBarLinkViewInfo);
begin
  with ALinkViewInfo do
    ImagePainterClass.DrawImage(Canvas, ImageList, ImageIndex, ImageRect);
end;

procedure TdxNavBarPainter.DrawItemSelection(ALinkViewInfo: TdxNavBarLinkViewInfo);
begin
end;

procedure TdxNavBarPainter.DrawScrollButtons;
var
  AHandled: Boolean;
begin
  if ViewInfo.IsTopScrollButtonVisible then
  begin
    AHandled := False;
    if Assigned(NavBar.OnCustomDrawTopScrollButton) then
      NavBar.OnCustomDrawTopScrollButton(NavBar, Canvas, ViewInfo, AHandled);
    if not AHandled then DrawTopScrollButton;
  end;
  if ViewInfo.IsBottomScrollButtonVisible then
  begin
    AHandled := False;  
    if Assigned(NavBar.OnCustomDrawBottomScrollButton) then
      NavBar.OnCustomDrawBottomScrollButton(NavBar, Canvas, ViewInfo, AHandled);
    if not AHandled then DrawBottomScrollButton;
  end;
end;

procedure TdxNavBarPainter.DrawBottomScrollButton;
begin
  with ViewInfo do
    ScrollButtonsPainterClass.DrawBottomButton(Canvas, BottomScrollButtonRect,
      ButtonPainterClass, BottomButtonBackColor, BottomButtonBackColor2,
      BottomButtonAlphaBlend, BottomButtonAlphaBlend2, BottomButtonGradientMode,
      BottomScrollButtonState);
end;

procedure TdxNavBarPainter.DrawTopScrollButton;
begin
  with ViewInfo do
    ScrollButtonsPainterClass.DrawTopButton(Canvas, TopScrollButtonRect,
      ButtonPainterClass, TopButtonBackColor, TopButtonBackColor2,
      TopButtonAlphaBlend, TopButtonAlphaBlend2, TopButtonGradientMode,
      TopScrollButtonState);
end;

{ TdxCustomNavBar }

constructor TdxCustomNavBar.Create(AOwner: TComponent);
begin
  inherited;
  FCanvasBitmap := TBitmap.Create;
  FScrollBar := TdxNavBarScrollBar.Create(Self);

  FGroups := TdxNavBarGroups.Create(Self, TdxNavBarGroup);
  FGroups.OnChange := OnGroupsChanged;
  FGroups.OnLinksChange := OnLinksChanged;
  FItems := TdxNavBarItems.Create(Self, TdxNavBarItem);
  FItems.OnChange := OnItemsChanged;
  FStyles := TdxNavBarStyles.Create(Self, TdxNavBarStyleItem);
  FStyles.OnChange := OnStylesChanged;
  FDefaultStyles := TdxNavBarDefaultStyles.Create(Self);
  FDefaultStyles.OnChange := OnDefaultStylesChanged;

  FLargeChangeLink := TChangeLink.Create;
  FSmallChangeLink := TChangeLink.Create;
  FLargeChangeLink.OnChange := OnImagesChanged;
  FSmallChangeLink.OnChange := OnImagesChanged;
  FThemeNotificator := TdxThemeChangedNotificator.Create;
  FThemeNotificator.OnThemeChanged := OnThemeChanged;
  FHintWindow := TdxNavBarHintWindow.Create(Self);
  FHintWindowShowing := False;

  DragCursor := dxNavBarDragCursor;
  FDragCopyCursor := dxNavBarDragCopyCursor;
  FDragDropFlags := [fAllowDragLink, fAllowDropLink, fAllowDragGroup, fAllowDropGroup];
  FHotTrackedGroupCursor := crDefault;
  FHotTrackedLinkCursor := dxNavBarLinksCursor;
  FShowGroupCaptions := True;
  FShowGroupsHint := False;
  FShowLinksHint := False;
  FSpaceBetweenGroups := 0;
  FView := 0;

  BevelInner := bvNone;
  BevelOuter := bvNone;
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption];
  Height := 300;
  Width := 150;

  AssignDefaultStyles;
end;

destructor TdxCustomNavBar.Destroy;
begin
  FScrollBar.Free;

  FThemeNotificator.Free;
  FHintWindow.Free;
  FSmallChangeLink.Free;
  FLargeChangeLink.Free;

  FStyles.Free;
  FItems.Free;
  FGroups.Free;
  FDefaultStyles.Free;

  FDesigner.Free;
  FPainter.Free;
  FCanvasBitmap.Free;
  inherited;
end;

procedure TdxCustomNavBar.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  if (CanvasBitmap <> nil) and HandleAllocated then
  begin
    if CanvasBitmap.Width <= ClientWidth then
      CanvasBitmap.Width := ClientWidth + 10;
    if CanvasBitmap.Height <= ClientHeight then
      CanvasBitmap.Height := ClientHeight + 10;
    InvalidateAll(doRecalc);
  end;
end;

procedure TdxCustomNavBar.Loaded;
begin
  inherited;
  if (0 <= FActiveGroupIndex) and (FActiveGroupIndex < Groups.Count) then
    ActiveGroup := Groups[FActiveGroupIndex];
  DefaultStyles.AssignDefaultValues(True);
  InvalidateAll(doRecalc);
end;

procedure TdxCustomNavBar.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent is TdxNavBarGroup then
    begin
      if (AComponent as TdxNavBarGroup) = FHotTrackedGroup then FHotTrackedGroup := nil;
      if (AComponent as TdxNavBarGroup) = FPressedGroup then FPressedGroup := nil;
      if (AComponent as TdxNavBarGroup) = ActiveGroup then ActiveGroup := nil;
      (AComponent as TdxNavBarGroup).RemoveFromCollection(Groups);
    end;
    if AComponent is TdxNavBarItem then
      (AComponent as TdxNavBarItem).RemoveFromCollection(Items);
    if AComponent is TdxNavBarStyleItem then
      (AComponent as TdxNavBarStyleItem).RemoveFromCollection(Styles);
    if (AComponent = LargeImages) then LargeImages := nil;
    if (AComponent = SmallImages) then SmallImages := nil;
    if (AComponent = StyleBackground) then StyleBackground := nil;
    if (AComponent = StyleHint) then StyleHint := nil;
    if (AComponent = StyleDropTargetGroup) then StyleDropTargetGroup := nil;
    if (AComponent = StyleDropTargetLink) then StyleDropTargetLink := nil;
    if (AComponent = StyleButton) then StyleButton := nil;
    if (AComponent = StyleButtonHotTracked) then StyleButtonHotTracked := nil;
    if (AComponent = StyleButtonPressed) then StyleButtonPressed := nil;
  end;
end;

procedure TdxCustomNavBar.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  for I := 0 to Groups.Count - 1 do
    if Groups[I].Owner = Root then
      Proc(Groups[I]);
  for I := 0 to Items.Count - 1 do
    if Items[I].Owner = Root then
      Proc(Items[I]);
  for I := 0 to Styles.Count - 1 do
    if Styles[I].Owner = Root then
      Proc(Styles[I]);
  for I := 0 to Groups.Count - 1 do
    if (Groups[I].Control <> nil) and (Groups[I].Control.Owner = Root) then
      Proc(Groups[I].Control);
end;

procedure TdxCustomNavBar.SetName(const NewName: TComponentName);
var
  OldName, NewItemName: string;
  I, L: Integer;

  procedure UpdateName(AComponent: TComponent);
  begin
    NewItemName := AComponent.Name;
    if Pos(OldName, NewItemName) = 1 then
    begin
      System.Delete(NewItemName, 1, L);
      System.Insert(Name, NewItemName, 1);
      try
        AComponent.Name := NewItemName;
      except
        on EComponentError do ; {Ignore rename errors }
      end;
    end;
  end;

begin
  OldName := Name;
  L := Length(OldName);
  inherited;
  if (csDesigning in ComponentState) then
  begin
    if Designer <> nil then Designer.BeginUpdate;
    try
      for I := 0 to Groups.Count - 1 do
         UpdateName(Groups[I]);
      for I := 0 to Items.Count - 1 do
         UpdateName(Items[I]);
      for I := 0 to Styles.Count - 1 do
         UpdateName(Styles[I]);
    finally
      if Designer <> nil then Designer.EndUpdate;
    end;
  end;
end;

procedure TdxCustomNavBar.WndProc(var Message: TMessage);
begin
  if (FHintWindowShowing) then
    with Message do
      if ((Msg >= WM_KEYFIRST) and (Msg <= WM_KEYLAST)) or
        ((Msg = CM_ACTIVATE) or (Msg = CM_DEACTIVATE)) or
        (Msg = CM_APPKEYDOWN) or (Msg = CM_APPSYSCOMMAND) or
        (Msg = WM_COMMAND) or ((Msg > WM_MOUSEMOVE) and
        (Msg <= WM_MOUSELAST)) or (Msg = WM_NCMOUSEMOVE) then
         DoHintDeactivate;
  inherited WndProc(Message);
end;

procedure TdxCustomNavBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoHintDeactivate;
  inherited  MouseDown(Button, Shift, X, Y);
  FSourceShift := Shift;
  if ssLeft in FSourceShift then
  begin
    FSourcePoint := Point(X, Y);
    if ViewInfo.IsPtTopScrollButton(FSourcePoint) then
      DoTopScrollButtonDown
    else if ViewInfo.IsPtBottomScrollButton(FSourcePoint) then
      DoBottomScrollButtonDown
    else
    begin
      FSourceGroup := ViewInfo.GetGroupAtCaptionPos(FSourcePoint);
      if FSourceGroup <> nil then
        DoGroupMouseDown(FSourceGroup);
      FSourceLink := ViewInfo.GetLinkAtSelectedPos(FSourcePoint);
      if FSourceLink <> nil then
        DoLinkMouseDown(FSourceLink);
    end;
  end
  else if (FHotTrackedGroup <> nil) or (FHotTrackedLink <> nil) then
  begin
    FHotTrackedGroup := nil;
    FHotTrackedLink := nil;
    InvalidateAll(doRedraw);
  end;
end;

procedure TdxCustomNavBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if EnableDragging then exit;
  inherited  MouseUp(Button, Shift, X, Y);
  FSourcePoint := Point(X, Y);
  if ViewInfo.IsPtTopScrollButton(FSourcePoint) or ScrollButtonUpIsDown then
    DoTopScrollButtonUp
  else if ViewInfo.IsPtBottomScrollButton(FSourcePoint) or ScrollButtonDownIsDown then
    DoBottomScrollButtonUp
  else
  begin
    FScrollButtonDownIsDown := False;
    FScrollButtonUpIsDown := False;
    if FSourceGroup <> nil then
      DoGroupMouseUp(FSourceGroup)
    else if FSourceLink <> nil then
      DoLinkMouseUp(FSourceLink);
  end;
  FSourceGroup := nil;
  FSourceLink := nil;
  FSourceShift := [];
end;

procedure TdxCustomNavBar.MouseMove(Shift: TShiftState; X, Y: Integer);
  function IsDragBegining: Boolean;
  begin
    Result := (Abs(FSourcePoint.X - X)  > 3) or (Abs(FSourcePoint.Y - Y)  > 3);
  end;
  function CanDrag: Boolean;
  begin
    Result := (IsAllowDragGroup and (FSourceGroup <> nil)) or
      (IsAllowDragLink and (FSourceLink <> nil) and FSourceLink.Item.Enabled);
  end;
var
  ALink: TdxNavBarItemLink;
  AGroup: TdxNavBarGroup;
begin
  FTargetPoint := Point(X, Y);
  if ViewInfo.IsTopScrollButtonVisible or ViewInfo.IsBottomScrollButtonVisible then
    InvalidateScrollButtons;
  if CanDrag and IsDragBegining then
  begin
    FSourceShift := [];
    FEnableDragging := True;
    DragMode := dmAutomatic;
    BeginDrag(True);
  end
  else
  begin
    inherited MouseMove(Shift, X, Y);
    if FSourceShift = [] then
    begin
      ALink := ViewInfo.GetLinkAtSelectedPos(FTargetPoint);
      if ALink <> FHotTrackedLink then
        DoLinkHotTrack(ALink);
      AGroup := ViewInfo.GetGroupAtCaptionPos(FTargetPoint);
      if AGroup <> FHotTrackedGroup then
        DoGroupHotTrack(AGroup);
    end;
  end;
end;

procedure TdxCustomNavBar.DragOver(Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  FTargetPoint := Point(X, Y);
  FScrollButtonDownIsDown := False;
  FScrollButtonUpIsDown := False;
  if FPressedGroup <> nil then
  begin
    FPressedGroup := nil;
    InvalidateAll(doRedraw);
  end;
  if FPressedLink <> nil then
  begin
    FPressedLink := nil;
    InvalidateAll(doRedraw);
  end;
  if ViewInfo.IsTopScrollButtonVisible or ViewInfo.IsBottomScrollButtonVisible then
    InvalidateScrollButtons;
  if dxNavBarDragObject <> nil then
  begin
    dxNavBarDragObject.UpdateTargets;
    if (SourceItem <> nil) and IsAllowDropLink then
      DoItemDragOver(SourceItem, Accept)
    else if (SourceLink <> nil) and IsAllowDropLink then
      DoLinkDragOver(SourceLink, Accept)
    else if (SourceGroup <> nil) and IsAllowDropGroup then
      DoGroupDragOver(SourceGroup, Accept);
  end;
  if Assigned(OnDragOver) then
    OnDragOver(Self, Source, X, Y, State, Accept);
end;

procedure TdxCustomNavBar.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  if Target = Self then
  begin
    if FPressedGroup <> nil then
    begin
      FPressedGroup := nil;
      InvalidateAll(doRedraw);
    end;
    if FPressedLink <> nil then
    begin
      FPressedLink := nil;
      InvalidateAll(doRedraw);
    end;
    FTargetPoint := Point(X, Y);
    FHotTrackedLink := ViewInfo.GetLinkAtSelectedPos(FTargetPoint);
    FHotTrackedGroup := ViewInfo.GetGroupAtCaptionPos(FTargetPoint);
    if dxNavBarDragObject <> nil then
    begin
      dxNavBarDragObject.UpdateTargets;
      if (SourceItem <> nil) and IsAllowDropLink then
        DoItemDragDrop(SourceItem)
      else if (SourceLink <> nil) and IsAllowDropLink then
        DoLinkDragDrop(SourceLink)
      else if (SourceGroup <> nil) and IsAllowDropGroup then
        DoGroupDragDrop(SourceGroup)
    end;
  end;
  if Assigned(OnEndDrag) then
    OnEndDrag(Self, Target, X, Y);
  dxNavBarDragObject.Free;
  dxNavBarDragObject := nil;
  FEnableDragging := False;
  DragMode := dmManual;
  FSourceGroup := nil;
  FSourceLink := nil;
end;

procedure TdxCustomNavBar.DoStartDrag(var DragObject: TDragObject);
begin
  inherited;
  if dxNavBarDragObject = nil then
    dxNavBarDragObject := TdxNavBarDragObject.Create(Self, DragObject, FSourceGroup, FSourceLink, nil);
  DoLinkHotTrack(nil);
  DoGroupHotTrack(nil);
end;

procedure ScrollButtonsTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  Bar: TdxCustomNavBar;
begin
  Bar := TdxCustomNavBar(FindControl(wnd));
  if Bar = nil then Exit;
  Bar.FScrollButtonUpIsDown := Bar.ViewInfo.IsPtTopScrollButton(Bar.TargetPoint);
  Bar.FScrollButtonDownIsDown := Bar.ViewInfo.IsPtBottomScrollButton(Bar.TargetPoint);
  if Bar.ScrollButtonUpIsDown or Bar.ScrollButtonDownIsDown then
  begin
   if Bar.ScrollButtonUpIsDown and not (sDisabled in Bar.ViewInfo.TopScrollButtonState) then
      Bar.ActiveGroup.TopVisibleLinkIndex:= Bar.ActiveGroup.TopVisibleLinkIndex - 1;
    if Bar.ScrollButtonDownIsDown and not (sDisabled in Bar.ViewInfo.BottomScrollButtonState) then
      Bar.ActiveGroup.TopVisibleLinkIndex := Bar.ActiveGroup.TopVisibleLinkIndex + 1;
  end
  else
  begin
    KillTimer(Bar.Handle, Bar.FScrollTimerID);
    Bar.FScrollTimerID := -1;
  end;
end;

procedure TdxCustomNavBar.DoGroupDragDrop(Group: TdxNavBarGroup);
begin
  if TargetGroup <> nil then
    Group.Index := TargetGroup.Index;
end;

procedure TdxCustomNavBar.DoGroupDragOver(Group: TdxNavBarGroup; var Accept: Boolean);
begin
  Accept := (Group <> TargetGroup) and (TargetGroup <> nil);
  InvalidateAll(doRedraw);
end;

procedure TdxCustomNavBar.DoGroupHotTrack(Group: TdxNavBarGroup);
begin
  DoHintDeactivate;
  if FHotTrackedGroup <> nil then
    InvalidateAll(doRecalc);
  FHotTrackedGroup := Group;
  DoGroupHintActivate;
  if FHotTrackedGroup <> nil then
    InvalidateAll(doRecalc);
  if Assigned(FOnGroupHotTrack) then
    FOnGroupHotTrack(Self, FHotTrackedGroup);
end;

procedure TdxCustomNavBar.DoGroupMouseDown(Group: TdxNavBarGroup);
begin
  FPressedGroup := Group;
  if Assigned(FOnGroupPress) then
    FOnGroupPress(Self, FPressedGroup);
  InvalidateAll(doRecalc);
end;

procedure TdxCustomNavBar.DoGroupMouseUp(Group: TdxNavBarGroup);
begin
  if Assigned(Group.OnClick) then
    Group.OnClick(Group)
  else if Assigned(FOnGroupClick) then
    FOnGroupClick(Self, Group);
  if Painter.IsGroupActive(Group) then
    Painter.DoGroupDeactivate(Group)
  else Painter.DoGroupActivate(Group);
  FPressedGroup := nil;
  InvalidateAll(doRecalc);
end;

procedure TdxCustomNavBar.DoLinkDragDrop(Link: TdxNavBarItemLink);
var
  AIndex: Integer;
  ASourceLink: TdxNavBarItemLink;
begin
  AIndex := TargetLinkIndex;
  if AIndex > -1 then
  begin
    if (TargetGroup = Link.Group) and (AIndex > Link.Index) then Dec(AIndex);
    if Link.Group <> TargetGroup then
    begin
      Link.Group.SelectedLinkIndex := -1;
      ASourceLink := TargetGroup.CreateLink(Link.Item);
      ASourceLink.Index := AIndex;
      Link.Group.RemoveLink(Link.Index);
    end
    else ASourceLink := Link;
    ASourceLink.Index := AIndex;
    InvalidateAll(doRedraw);
  end;
end;

procedure TdxCustomNavBar.DoLinkDragOver(Link: TdxNavBarItemLink; var Accept: Boolean);
var
  Group: TdxNavBarGroup;
begin
  Accept := True;
  if ViewInfo.IsPtTopScrollButton(TargetPoint) or ViewInfo.IsPtBottomScrollButton(TargetPoint) then
    FScrollTimerID := SetTimer(Handle, 1, dxNavBarScrollInterval, @ScrollButtonsTimerProc)
  else
  begin
    Group := ViewInfo.GetGroupAtCaptionPos(FTargetPoint);
    if Group <> nil then
    begin
      Painter.DoGroupActivate(Group);
      Accept := False;
    end
    else Accept := (TargetGroup <> nil) and (TargetLink1 <> Link) and (TargetLink2 <> Link);
    InvalidateAll(doRedraw);
  end;
end;

procedure TdxCustomNavBar.DoLinkHotTrack(Link: TdxNavBarItemLink);
begin
  DoHintDeactivate;
  if FHotTrackedLink <> nil then
    InvalidateAll(doRecalc);
  FHotTrackedLink := Link;
  DoLinkHintActivate;
  if FHotTrackedLink <> nil then
    InvalidateAll(doRecalc);
  if Assigned(FOnLinkHotTrack) then
    FOnLinkHotTrack(Self, FHotTrackedLink);
end;

procedure TdxCustomNavBar.DoLinkMouseDown(Link: TdxNavBarItemLink);
begin
  if (Link.Group.SelectedLinkIndex > -1) then
    InvalidateAll(doRecalc);
  if (Link.Item <> nil) and Link.Item.Enabled then
  begin
    FPressedLink := Link;
    if Assigned(FOnLinkPress) then
      FOnLinkPress(Self, FPressedLink);
    if not EachGroupHasSelectedLink then DeSelectLinks;
    InvalidateAll(doRecalc);
  end;
end;

procedure TdxCustomNavBar.DoLinkMouseUp(Link: TdxNavBarItemLink);
begin
  if Link.Item.Enabled then
  begin
    if (Link.Item <> nil) and Assigned(Link.Item.OnClick) then
      Link.Item.OnClick(Link.Item)
    else if (Link.Item <> nil) and (Link.Item.Action <> nil) then
      Link.Item.Action.Execute
    else if Assigned(OnLinkClick) then
      OnLinkClick(Self, Link);
    if (FPressedLink <> nil) and AllowSelectLinks then
      Link.Group.SelectedLinkIndex := FPressedLink.Index;
    FPressedLink := nil;
    InvalidateAll(doRecalc);
  end;
end;

procedure TdxCustomNavBar.DoItemDragDrop(Item: TdxNavBarItem);
begin
  if TargetGroup <> nil then
  begin
    with TargetGroup.CreateLink(Item) do
      Index := TargetLinkIndex;
  end;
end;

procedure TdxCustomNavBar.DoItemDragOver(Item: TdxNavBarItem; var Accept: Boolean);
var
  Group: TdxNavBarGroup;
begin
  Accept := True;
  if ViewInfo.IsPtTopScrollButton(FTargetPoint) or ViewInfo.IsPtBottomScrollButton(FTargetPoint) then
    FScrollTimerID := SetTimer(Handle, 1, dxNavBarScrollInterval, @ScrollButtonsTimerProc)
  else
  begin
    Group := ViewInfo.GetGroupAtCaptionPos(FTargetPoint);
    if Group <> nil then
    begin
      Painter.DoGroupActivate(Group);
      Accept := False;
    end
    else Accept := TargetGroup <> nil;
    InvalidateAll(doRedraw);
  end;
end;

procedure TdxCustomNavBar.DoBottomScrollButtonDown;
begin
  if not (sDisabled in ViewInfo.BottomScrollButtonState) then
  begin
    FScrollButtonUpIsDown := False;
    FScrollButtonDownIsDown := True;
    FScrollTimerID := SetTimer(Handle, 1, dxNavBarScrollInterval, @ScrollButtonsTimerProc);
    if ActiveGroup <> nil then
      ActiveGroup.TopVisibleLinkIndex := ActiveGroup.TopVisibleLinkIndex + 1;
    InvalidateScrollButtons;
  end;
end;

procedure TdxCustomNavBar.DoBottomScrollButtonUp;
begin
  FScrollButtonDownIsDown := False;
  KillTimer(Handle, FScrollTimerID);
  FScrollTimerID := -1;
  InvalidateScrollButtons;
end;

procedure TdxCustomNavBar.DoTopScrollButtonDown;
begin
  if not (sDisabled in ViewInfo.TopScrollButtonState) then
  begin
    FScrollButtonDownIsDown := False;
    FScrollButtonUpIsDown := True;
    FScrollTimerID := SetTimer(Handle, 1, dxNavBarScrollInterval, @ScrollButtonsTimerProc);
    if ActiveGroup <> nil then
      ActiveGroup.TopVisibleLinkIndex := ActiveGroup.TopVisibleLinkIndex - 1;
    InvalidateScrollButtons;
  end;
end;

procedure TdxCustomNavBar.DoTopScrollButtonUp;
begin
  FScrollButtonUpIsDown := False;
  KillTimer(Handle, FScrollTimerID);
  FScrollTimerID := -1;
  InvalidateScrollButtons;
end;

procedure HintTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  Bar: TdxCustomNavBar;
begin
  Bar := TdxCustomNavBar(FindControl(wnd));
  if Bar <> nil then
  begin
    Bar.ViewInfo.RecalculateHint;
    if Bar.ViewInfo.HintText <> '' then
    begin
      Bar.HintWindow.ActivateHint(Bar.ViewInfo.HintRect, Bar.ViewInfo.HintText);
      Bar.FHintWindowShowing := True;
      Bar.Hint := GetLongHint(Bar.ViewInfo.HintText);
    end;
    KillTimer(Bar.Handle, Bar.FHintTimerID);
    Bar.FHintTimerID := -1;
  end;
end;

procedure TdxCustomNavBar.DoGroupHintActivate;
begin
  if not EnableDragging and ShowGroupsHint and (HotTrackedGroup <> nil) then
    FHintTimerID := SetTimer(Handle, 1, ViewInfo.HintDelay, @HintTimerProc);
end;

procedure TdxCustomNavBar.DoLinkHintActivate;
begin
  if not EnableDragging and ShowLinksHint and (HotTrackedLink <> nil) then
    FHintTimerID := SetTimer(Handle, 1, ViewInfo.HintDelay, @HintTimerProc);
end;

procedure TdxCustomNavBar.DoHintDeactivate;
begin
  if (FHintTimerID <> -1) then
  begin
    KillTimer(Handle, FHintTimerID);
    FHintTimerID := -1;
  end;
  if IsWindowVisible(FHintWindow.Handle) then
    ShowWindow(FHintWindow.Handle, SW_HIDE);
  FHintWindowShowing := False;
end;

procedure TdxCustomNavBar.DesignerModified;
begin
  if Designer <> nil then
    Designer.Modified;
end;

procedure TdxCustomNavBar.DesignerUpdate(AItem: TComponent);
begin
  if Designer <> nil then
    Designer.Update(AItem);
end;

procedure TdxCustomNavBar.OnGroupsChanged(Sender: TObject; AType: TdxNavBarChangeType);
begin
  InvalidateAll(aType);
  DesignerModified;
end;

procedure TdxCustomNavBar.OnLinksChanged(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  if FHotTrackedLink = ALink then
    FHotTrackedLink := nil;
  if FPressedLink = ALink then
    FPressedLink := nil;
end;

procedure TdxCustomNavBar.OnItemsChanged(Sender: TObject; AType: TdxNavBarChangeType);
begin
  InvalidateAll(aType);
  DesignerModified;
end;

procedure TdxCustomNavBar.OnDefaultStylesChanged(Sender: TObject; AType: TdxNavBarChangeType);
begin
  InvalidateAll(doRecreate);
  DesignerModified;
end;

procedure TdxCustomNavBar.OnStylesChanged(Sender: TObject; AType: TdxNavBarChangeType);
begin
  InvalidateAll(doRecreate);
  DesignerModified;
end;

procedure TdxCustomNavBar.OnImagesChanged(Sender: TObject);
begin
  InvalidateAll(doRecreate);
end;

procedure TdxCustomNavBar.OnThemeChanged;
begin
  InvalidateAll(doRecreate);
end;

procedure TdxCustomNavBar.DoActiveGroupChanged;
begin
  if not (csDestroying in ComponentState) then
    if Assigned(FOnActiveGroupChanged) then
      FOnActiveGroupChanged(Self);
end;

procedure TdxCustomNavBar.Paint;
begin
  Painter.Paint;
end;

procedure TdxCustomNavBar.Invalidate;
begin
  if FPainter <> nil then
    Painter.InvalidateViewInfo(doRedraw);
  inherited;
end;

procedure TdxCustomNavBar.InvalidateAll(AType: TdxNavBarChangeType);
begin
  if csDestroying in  ComponentState then exit;
  Painter.InvalidateViewInfo(AType);
  if HandleAllocated then Invalidate;
end;

procedure TdxCustomNavBar.InvalidateScrollButtons;
begin
  if csDestroying in  ComponentState then exit;
  Painter.InvalidateViewInfo(doRedraw);
  if HandleAllocated then Painter.InvalidateScrollButtons;
end;

procedure TdxCustomNavBar.LoadFromRegIni(AStorage: TCustomIniFile; LoadStyles: Boolean);

  procedure ReadStyle(AIndex: Integer);
  var
    ASection, ABuffer, AText: string;
    AStream: TStringStream;
    AGraphicClass: TGraphicClass;
    AGraphic: TGraphic;
    AStyleItem: TdxNavBarStyleItem;
  begin
    with AStorage do
    begin
      ASection := 'Style' + IntToStr(AIndex);
      AStyleItem := Styles.Add;
      with AStyleItem.Style do
      begin
        BackColor := ReadInteger(ASection, 'BackColor', BackColor);
        BackColor2 := ReadInteger(ASection, 'BackColor2', BackColor2);
        AlphaBlending := ReadInteger(ASection, 'AlphaBlending', AlphaBlending);
        AlphaBlending2 := ReadInteger(ASection, 'AlphaBlending2', AlphaBlending2);
        Font.Charset := ReadInteger(ASection, 'FontCharset', Font.Charset);
        Font.Color := ReadInteger(ASection, 'FontColor', Font.Color);
        Font.Height :=ReadInteger(ASection, 'FontHeight', Font.Height);
        Font.Name := ReadString(ASection, 'FontName', Font.Name);
        Font.Pitch := TFontPitch(ReadInteger(ASection, 'FontPitch', Integer(Font.Pitch)));
        Font.Size := ReadInteger(ASection, 'FontSize', Font.Size);
        if ReadBool(ASection, 'FontStyleBold', fsBold in Font.Style) then
          Font.Style := Font.Style + [fsBold];
        if ReadBool(ASection, 'FontStyleItalic', fsItalic in Font.Style) then
          Font.Style := Font.Style + [fsItalic];
        if ReadBool(ASection, 'FontStyleUnderline', fsUnderline in Font.Style) then
          Font.Style := Font.Style + [fsUnderline];
        if ReadBool(ASection, 'FontStyleStrikeOut', fsStrikeOut in Font.Style) then
          Font.Style := Font.Style + [fsStrikeOut];
        GradientMode := TdxBarStyleGradientMode(ReadInteger(ASection, 'GradientMode', Integer(GradientMode)));
        if ValueExists(ASection, 'Image') then
        begin
          AText := ReadString(ASection, 'Image', '');
          SetLength(ABuffer, Length(AText) div 2);
          HexToBin(PChar(AText), PChar(ABuffer), Length(AText) div 2);
          AStream := TStringStream.Create(ABuffer);
          try
            AStream.Position := 0;
            AGraphicClass := TGraphicClass(GetClass(ReadString(ASection, 'ImageClass', '')));
            if AGraphicClass <> nil then
            begin
              AGraphic := AGraphicClass.Create;
              try
                AGraphic.LoadFromStream(AStream);
                Image.Graphic := AGraphic;
              finally
                AGraphic.Free;
              end;
            end;
          finally
            AStream.Free;
          end;
        end;
        HAlignment := TdxBarStyleHAlignment(ReadInteger(ASection, 'HAlignment', Integer(HAlignment)));
        VAlignment := TdxBarStyleVAlignment(ReadInteger(ASection, 'VAlignment', Integer(VAlignment)));
        AStyleItem.Tag := ReadInteger(ASection, 'Tag', AStyleItem.Tag);
      end;
    end;
  end;
  procedure ReadItem(AIndex: Integer);
  var
    ASection: string;
  begin
    with AStorage do
    begin
      ASection := 'Item' + IntToStr(AIndex);
      with Items.Add do
      begin
        Caption := ReadString(ASection, 'Caption', Caption);
        Enabled := ReadBool(ASection, 'Enabled', Enabled);
        Hint := ReadString(ASection, 'Hint', Hint);
        LargeImageIndex := ReadInteger(ASection, 'LargeImageIndex', LargeImageIndex);
        SmallImageIndex := ReadInteger(ASection, 'SmallImageIndex', SmallImageIndex);
        if LoadStyles and (Styles.Count > 0) then
        begin
          if ValueExists(ASection, 'StyleStyleIndex') then
            Style := Styles[ReadInteger(ASection, 'StyleStyleIndex', 0)];
          if ValueExists(ASection, 'StyleDisabledStyleIndex') then
            StyleDisabled := Styles[ReadInteger(ASection, 'StyleDisabledStyleIndex', 0)];
          if ValueExists(ASection, 'StyleHotTrackedStyleIndex') then
            StyleHotTracked := Styles[ReadInteger(ASection, 'StyleHotTrackedStyleIndex', 0)];
          if ValueExists(ASection, 'StylePressedStyleIndex') then
            StylePressed := Styles[ReadInteger(ASection, 'StylePressedStyleIndex', 0)];
        end;
        Tag := ReadInteger(ASection, 'Tag', Tag);
        Visible := ReadBool(ASection, 'Visible', Visible);
      end;
    end;
  end;
  procedure ReadGroup(AIndex: Integer);
  var
    J, ALinkCount: Integer;
    ASection: string;
  begin
    with AStorage do
    begin
      ASection := 'Group' + IntToStr(AIndex);
      with Groups.Add do
      begin
        Caption := ReadString(ASection, 'Caption', Caption);
        Expanded := ReadBool(ASection, 'Expanded', Expanded);
        Hint := ReadString(ASection, 'Hint', Hint);
        LargeImageIndex := ReadInteger(ASection, 'LargeImageIndex', LargeImageIndex);
        LinksUseSmallImages := ReadBool(ASection, 'LinksUseSmallImages', LinksUseSmallImages);
        ALinkCount := ReadInteger(ASection, 'LinkCount', 0);
        for J := 0 to ALinkCount - 1 do
          if ValueExists(ASection, 'Link' + IntToStr(J) + 'ItemIndex') then
            CreateLink(Items[ReadInteger(ASection, 'Link' + IntToStr(J) + 'ItemIndex', -1)]);
        SelectedLinkIndex := ReadInteger(ASection, 'SelectedLinkIndex', SelectedLinkIndex);
        ShowAsIconView := ReadBool(ASection, 'ShowAsIconView', ShowAsIconView);
        ShowExpandButton := ReadBool(ASection, 'ShowExpandButton', ShowExpandButton);
        SmallImageIndex := ReadInteger(ASection, 'SmallImageIndex', SmallImageIndex);
        if LoadStyles and (Styles.Count > 0) then
        begin
          if ValueExists(ASection, 'StyleBackgroundStyleIndex') then
            StyleBackground := Styles[ReadInteger(ASection, 'StyleBackgroundStyleIndex', 0)];
          if ValueExists(ASection, 'StyleHeaderStyleIndex') then
            StyleHeader := Styles[ReadInteger(ASection, 'StyleHeaderStyleIndex', 0)];
          if ValueExists(ASection, 'StyleHeaderActiveStyleIndex') then
            StyleHeaderActive := Styles[ReadInteger(ASection, 'StyleHeaderActiveStyleIndex', 0)];
          if ValueExists(ASection, 'StyleHeaderHotTrackedStyleIndex') then
            StyleHeaderHotTracked := Styles[ReadInteger(ASection, 'StyleHeaderHotTrackedStyleIndex', 0)];
          if ValueExists(ASection, 'StyleHeaderPressedStyleIndex') then
            StyleHeaderPressed := Styles[ReadInteger(ASection, 'StyleHeaderPressedStyleIndex', 0)];
        end;
        Tag := ReadInteger(ASection, 'Tag', Tag);
        TopVisibleLinkIndex := ReadInteger(ASection, 'TopVisibleLinkIndex', TopVisibleLinkIndex);
        UseSmallImages := ReadBool(ASection, 'UseSmallImages', UseSmallImages);
        Visible := ReadBool(ASection, 'Visible', Visible);
      end;
    end;
  end;
var
  I, ACount: Integer;
begin
  with AStorage do
  begin
    View := ReadInteger('Layout', 'View', View);
    if LoadStyles and ValueExists('Layout', 'StyleCount') then
    begin
      Styles.Clear;
      ACount := ReadInteger('Layout', 'StyleCount', Styles.Count);
      for I := 0 to ACount - 1 do ReadStyle(I);
    end;
    if ValueExists('Layout', 'ItemCount') then
    begin
      Items.Clear;
      ACount := ReadInteger('Layout', 'ItemCount', Items.Count);
      for I := 0 to ACount - 1 do ReadItem(I);
    end;
    if ValueExists('Layout', 'GroupCount') then
    begin
      Groups.Clear;
      ACount := ReadInteger('Layout', 'GroupCount', Groups.Count);
      for I := 0 to ACount - 1 do ReadGroup(I);
    end;
    if LoadStyles and (Styles.Count > 0) then
    begin
      if ValueExists('Layout', 'StyleBackgroundStyleIndex') then
        StyleBackground := Styles[ReadInteger('Layout', 'StyleBackgroundStyleIndex', 0)];
      if ValueExists('Layout', 'StyleButtonStyleIndex') then
        StyleButton := Styles[ReadInteger('Layout', 'StyleButtonStyleIndex', 0)];
      if ValueExists('Layout', 'StyleButtonHotTrackedStyleIndex') then
        StyleButtonHotTracked := Styles[ReadInteger('Layout', 'StyleButtonHotTrackedStyleIndex', 0)];
      if ValueExists('Layout', 'StyleButtonPressedStyleIndex') then
        StyleButtonPressed := Styles[ReadInteger('Layout', 'StyleButtonPressedStyleIndex', 0)];
      if ValueExists('Layout', 'StyleDropTargetGroupStyleIndex') then
        StyleDropTargetGroup := Styles[ReadInteger('Layout', 'StyleDropTargetGroupStyleIndex', 0)];
      if ValueExists('Layout', 'StyleDropTargetLinkStyleIndex') then
        StyleDropTargetLink := Styles[ReadInteger('Layout', 'StyleDropTargetLinkStyleIndex', 0)];
      if ValueExists('Layout', 'StyleHintStyleIndex') then
        StyleHint := Styles[ReadInteger('Layout', 'StyleHintPressedStyleIndex', 0)];
    end;
  end;
end;

procedure TdxCustomNavBar.SaveToRegIni(AStorage: TCustomIniFile; SaveStyles: Boolean);

  procedure WriteStyle(AStyleItem: TdxNavBarStyleItem);
  var
    ASection, AText: string;
    AStream: TStringStream;
  begin
    with AStorage do
    begin
      ASection := 'Style' + IntToStr(AStyleItem.Index);
      with AStyleItem.Style do
      begin
        if savBackColor in AssignedValues then
          WriteInteger(ASection, 'BackColor', BackColor);
        if savBackColor2 in AssignedValues then
          WriteInteger(ASection, 'BackColor2', BackColor2);
        if savAlphaBlending in AssignedValues then
          WriteInteger(ASection, 'AlphaBlending', AlphaBlending);
        if savAlphaBlending2 in AssignedValues then
          WriteInteger(ASection, 'AlphaBlending2', AlphaBlending2);
        if savFont in AssignedValues then
        begin
          WriteInteger(ASection, 'FontCharset', Integer(Font.Charset));
          WriteInteger(ASection, 'FontColor', Font.Color);
          WriteInteger(ASection, 'FontHeight', Font.Height);
          WriteString(ASection, 'FontName', Font.Name);
          WriteInteger(ASection, 'FontPitch', Integer(Font.Pitch));
          WriteInteger(ASection, 'FontSize', Font.Size);
          WriteBool(ASection, 'FontStyleBold', fsBold in Font.Style);
          WriteBool(ASection, 'FontStyleItalic', fsItalic in Font.Style);
          WriteBool(ASection, 'FontStyleUnderline', fsUnderline in Font.Style);
          WriteBool(ASection, 'FontStyleStrikeOut', fsStrikeOut in Font.Style);
        end;
        if savGradientMode in AssignedValues then
          WriteInteger(ASection, 'GradientMode', Integer(GradientMode));
        if (savImage in AssignedValues) and (Image.Graphic <> nil) and
          not Image.Graphic.Empty then
        begin
          AStream := TStringStream.Create('');
          try
            Image.Graphic.SaveToStream(AStream);
            AStream.Position := 0;
            SetLength(AText, Length(AStream.DataString) * 2);
            BinToHex(PChar(AStream.DataString), PChar(AText), Length(AStream.DataString));
            WriteString(ASection, 'ImageClass', Image.Graphic.ClassName);
            WriteString(ASection, 'Image', AText);
          finally
            AStream.Free;
          end;
        end;
        if savHAlignment in AssignedValues then
          WriteInteger(ASection, 'HAlignment', Integer(HAlignment));
        if savVAlignment in AssignedValues then
          WriteInteger(ASection, 'VAlignment', Integer(VAlignment));
        WriteInteger(ASection, 'Tag', AStyleItem.Tag);
      end;
    end;
  end;
  procedure WriteItem(AItem: TdxNavBarItem);
  var
    ASection: string;
  begin
    with AStorage do
    begin
      ASection := 'Item' + IntToStr(AItem.Index);
      with AItem do
      begin
        WriteString(ASection, 'Caption', Caption);
        WriteBool(ASection, 'Enabled', Enabled);
        WriteString(ASection, 'Hint', Hint);
        WriteInteger(ASection, 'LargeImageIndex', LargeImageIndex);
        WriteInteger(ASection, 'SmallImageIndex', SmallImageIndex);
        if SaveStyles and (Styles.Count > 0) then
        begin
          if Style <> nil then
            WriteInteger(ASection, 'StyleStyleIndex', Style.Index);
          if StyleDisabled <> nil then
            WriteInteger(ASection, 'StyleDisabledStyleIndex', StyleDisabled.Index);
          if StyleHotTracked <> nil then
            WriteInteger(ASection, 'StyleHotTrackedStyleIndex', StyleHotTracked.Index);
          if StylePressed <> nil then
            WriteInteger(ASection, 'StylePressedStyleIndex', StylePressed.Index);
        end;
        WriteInteger(ASection, 'Tag', Tag);
        WriteBool(ASection, 'Visible', Visible);
      end;
    end;
  end;
  procedure WriteGroup(AGroup: TdxNavBarGroup);
  var
    J: Integer;
    ASection: string;
  begin
    with AStorage do
    begin
      ASection := 'Group' + IntToStr(AGroup.Index);
      with AGroup do
      begin
        WriteString(ASection, 'Caption', Caption);
        WriteBool(ASection, 'Expanded', Expanded);
        WriteString(ASection, 'Hint', Hint);
        WriteInteger(ASection, 'LargeImageIndex', LargeImageIndex);
        WriteInteger(ASection, 'LinkCount', LinkCount);
        for J := 0 to LinkCount - 1 do
          if Links[J].Item <> nil then
            WriteInteger(ASection, 'Link' + IntToStr(J) + 'ItemIndex', Links[J].Item.Index);
        WriteBool(ASection, 'LinksUseSmallImages', LinksUseSmallImages);
        WriteInteger(ASection, 'SelectedLinkIndex', SelectedLinkIndex);
        WriteBool(ASection, 'ShowAsIconView', ShowAsIconView);
        WriteBool(ASection, 'ShowExpandButton', ShowExpandButton);
        WriteInteger(ASection, 'SmallImageIndex', SmallImageIndex);
        if SaveStyles and (Styles.Count > 0) then
        begin
          if StyleBackground <> nil then
            WriteInteger(ASection, 'StyleBackgroundStyleIndex', StyleBackground.Index);
          if StyleHeader <> nil then
            WriteInteger(ASection, 'StyleHeaderStyleIndex', StyleHeader.Index);
          if StyleHeaderActive <> nil then
            WriteInteger(ASection, 'StyleHeaderActiveStyleIndex', StyleHeaderActive.Index);
          if StyleHeaderHotTracked <> nil then
            WriteInteger(ASection, 'StyleHeaderHotTrackedStyleIndex', StyleHeaderHotTracked.Index);
          if StyleHeaderPressed <> nil then
            WriteInteger(ASection, 'StyleHeaderPressedStyleIndex', StyleHeaderPressed.Index);
        end;
        WriteInteger(ASection, 'Tag', Tag);
        WriteInteger(ASection, 'TopVisibleLinkIndex', TopVisibleLinkIndex);
        WriteBool(ASection, 'UseSmallImages', UseSmallImages);
        WriteBool(ASection, 'Visible', Visible);
      end;
    end;
  end;
var
  I: Integer;
  ASections: TStringList;
begin
  with AStorage do
  begin
    ASections := TStringList.Create;
    try
      ReadSections(ASections);
      for I := 0 to ASections.Count - 1 do
        if (Pos('Layout', ASections[I]) > 0) or (Pos('Group', ASections[I]) > 0) or
          (Pos('Item', ASections[I]) > 0) or (Pos('Style', ASections[I]) > 0) then
        EraseSection(ASections[I]);
    finally
      ASections.Free;
    end;

    WriteInteger('Layout', 'View', View);
    if SaveStyles then
    begin
      WriteInteger('Layout', 'StyleCount', Styles.Count);
      for I := 0 to Styles.Count - 1 do
        WriteStyle(Styles[I]);
    end;
    WriteInteger('Layout', 'ItemCount', Items.Count);
    for I := 0 to Items.Count - 1 do
      WriteItem(Items[I]);
    WriteInteger('Layout', 'GroupCount', Groups.Count);
    for I := 0 to Groups.Count - 1 do
      WriteGroup(Groups[I]);
    if SaveStyles and (Styles.Count > 0) then
    begin
      if StyleBackground <> nil then
        WriteInteger('Layout', 'StyleBackgroundStyleIndex', StyleBackground.Index);
      if StyleButton <> nil then
        WriteInteger('Layout', 'StyleButtonStyleIndex', StyleButton.Index);
      if StyleButtonHotTracked <> nil then
        WriteInteger('Layout', 'StyleButtonHotTrackedStyleIndex', StyleButtonHotTracked.Index);
      if StyleButtonPressed <> nil then
        WriteInteger('Layout', 'StyleButtonPressedStyleIndex', StyleButtonPressed.Index);
      if StyleDropTargetGroup <> nil then
        WriteInteger('Layout', 'StyleDropTargetGroupStyleIndex', StyleDropTargetGroup.Index);
      if StyleDropTargetLink <> nil then
        WriteInteger('Layout', 'StyleDropTargetLinkStyleIndex', StyleDropTargetLink.Index);
      if StyleHint <> nil then
        WriteInteger('Layout', 'StyleHintStyleIndex', StyleHint.Index);
    end;
  end;
end;

function TdxCustomNavBar.CreatePainter: TdxNavBarPainter;
begin
  Result := dxNavBarViewsFactory.PainterClasses[FView].Create(Self);
end;

function TdxCustomNavBar.GetActiveGroup: TdxNavBarGroup;
begin
  if (FActiveGroup = nil) and (Groups.Count > 0) then
    FActiveGroup := Groups[0];
  Result := FActiveGroup;
end;

function TdxCustomNavBar.GetActiveGroupIndex: Integer;
begin
  if ActiveGroup <> nil then
    Result := ActiveGroup.Index
  else Result := -1;
end;

function TdxCustomNavBar.GetEnableDragging: Boolean;
begin
  Result := (dxNavBarDragObject <> nil) or FEnableDragging;
end;

function TdxCustomNavBar.GetPainter: TdxNavBarPainter;
begin
  if FPainter = nil then
    FPainter := CreatePainter;
  Result := FPainter;
end;

function TdxCustomNavBar.GetScrollPosition: Integer;
begin
  if (FScrollBar <> nil) and FScrollBar.Visible then
    Result := FScrollBar.Position
  else Result := 0;
end;

function TdxCustomNavBar.GetSourceGroup: TdxNavBarGroup;
begin
  if EnableDragging and (dxNavBarDragObject <> nil) then
    Result := dxNavBarDragObject.SourceGroup
  else Result := FSourceGroup;
end;

function TdxCustomNavBar.GetSourceLink: TdxNavBarItemLink;
begin
  if EnableDragging and (dxNavBarDragObject <> nil) then
    Result := dxNavBarDragObject.SourceLink
  else Result := FSourceLink;
end;

function TdxCustomNavBar.GetSourceItem: TdxNavBarItem;
begin
  if EnableDragging and (dxNavBarDragObject <> nil) then
    Result := dxNavBarDragObject.SourceItem
  else Result := nil;
end;

function TdxCustomNavBar.GetTargetGroup: TdxNavBarGroup;
begin
  if dxNavBarDragObject <> nil then
    Result := dxNavBarDragObject.TargetGroup
  else Result := nil;
end;

function TdxCustomNavBar.GetTargetLink1: TdxNavBarItemLink;
begin
  if dxNavBarDragObject <> nil then
    Result := dxNavBarDragObject.TargetLink1
  else Result := nil;
end;

function TdxCustomNavBar.GetTargetLink2: TdxNavBarItemLink;
begin
  if dxNavBarDragObject <> nil then
    Result := dxNavBarDragObject.TargetLink2
  else Result := nil;
end;

function TdxCustomNavBar.GetTargetLinkIndex: Integer;
begin
  if dxNavBarDragObject <> nil then
    Result := dxNavBarDragObject.TargetLinkIndex
  else Result := -1;
end;

function TdxCustomNavBar.GetViewInfo: TdxNavBarViewInfo;
begin
  if Painter <> nil then
    Result := Painter.ViewInfo
  else Result := nil;
end;

procedure TdxCustomNavBar.SetActiveGroup(Value: TdxNavBarGroup);
begin
  if FActiveGroup <> Value then
  begin
    FActiveGroup := Value;
    InvalidateAll(doRecreate);
    DoActiveGroupChanged;
  end;
end;

procedure TdxCustomNavBar.SetActiveGroupIndex(Value: Integer);
begin
  if not (csLoading in ComponentState) then
  begin
    if (0 <= Value) and (Value < Groups.Count) then
      ActiveGroup := Groups[Value];
  end
  else FActiveGroupIndex := Value;
end;

procedure TdxCustomNavBar.SetAllowSelectLinks(const Value: Boolean);
begin
  if FAllowSelectLinks <> Value then
  begin
    FAllowSelectLinks := Value;
    if not FAllowSelectLinks then DeSelectLinks;
    InvalidateAll(doRedraw);
  end;
end;

procedure TdxCustomNavBar.SetDefaultStyles(const Value: TdxNavBarDefaultStyles);
begin
  FDefaultStyles.Assign(Value);
end;

procedure TdxCustomNavBar.SetEachGroupHasSelectedLink(const Value: Boolean);
begin
  if FEachGroupHasSelectedLink <> Value then
  begin
    FEachGroupHasSelectedLink := Value;
    if not FEachGroupHasSelectedLink then DeSelectLinks;
    InvalidateAll(doRedraw);
  end;
end;

procedure TdxCustomNavBar.SetLargeImages(const Value: TImageList);
begin
  if FLargeImages <> Value then
  begin
    if (FLargeImages <> nil) and not (csDestroying in  FLargeImages.ComponentState) then
      FLargeImages.UnRegisterChanges(FLargeChangeLink);
    FLargeImages := Value;
    if FLargeImages <> nil then
    begin
      FLargeImages.RegisterChanges(FLargeChangeLink);
      FLargeImages.FreeNotification(Self);
    end;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetShowGroupCaptions(const Value: Boolean);
begin
  if FShowGroupCaptions <> Value then
  begin
    FShowGroupCaptions := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetSmallImages(const Value: TImageList);
begin
  if FSmallImages <> Value then
  begin
    if (FSmallImages <> nil) and not (csDestroying in  FSmallImages.ComponentState) then
      FSmallImages.UnRegisterChanges(FSmallChangeLink);
    FSmallImages := Value;
    if (FSmallImages <> nil) then
    begin
      FSmallImages.RegisterChanges(FSmallChangeLink);
      FSmallImages.FreeNotification(Self);
    end;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetSpaceBetweenGroups(Value: Integer);
begin
  if FSpaceBetweenGroups <> Value then
  begin
    if Value < 0 then Value := 0;
    FSpaceBetweenGroups := Value;
    InvalidateAll(doRecalc);
  end;
end;

procedure TdxCustomNavBar.SetStyleBackground(const Value: TdxNavBarStyleItem);
begin
  if FStyleBackground <> Value then
  begin
    FStyleBackground := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetStyleHint(const Value: TdxNavBarStyleItem);
begin
  if FStyleHint <> Value then
  begin
    FStyleHint := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetStyleDropTargetGroup(const Value: TdxNavBarStyleItem);
begin
  if FStyleDropTargetGroup <> Value then
  begin
    FStyleDropTargetGroup := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetStyleDropTargetLink(const Value: TdxNavBarStyleItem);
begin
  if FStyleDropTargetLink <> Value then
  begin
    FStyleDropTargetLink := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetStyleButton(const Value: TdxNavBarStyleItem);
begin
  if FStyleButton <> Value then
  begin
    FStyleButton := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetStyleButtonHotTracked(const Value: TdxNavBarStyleItem);
begin
  if FStyleButtonHotTracked <> Value then
  begin
    FStyleButtonHotTracked := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetStyleButtonPressed(const Value: TdxNavBarStyleItem);
begin
  if FStyleButtonPressed <> Value then
  begin
    FStyleButtonPressed := Value;
    InvalidateAll(doRecreate);
  end;
end;

procedure TdxCustomNavBar.SetView(Value: Integer);
begin
  if FView <> Value then
  begin
    if Value < 0 then Value := 0;
    if Value >= dxNavBarViewsFactory.Count then
      Value := dxNavBarViewsFactory.Count - 1;
    FView := Value;
    FPainter.Free;
    FPainter := nil;
    AssignDefaultStyles;
    InvalidateAll(doRecreate);
    DesignerUpdate(nil);
  end;
end;

procedure TdxCustomNavBar.AssignDefaultStyles;
begin
  if csLoading in ComponentState then exit;
  DefaultStyles.AssignDefaultValues(False);
  InvalidateAll(doRecalc);
end;

procedure TdxCustomNavBar.LoadFromIniFile(AFileName: string; LoadStyles: Boolean = True);
var
  AStream: TFileStream;
begin
  if AFileName = '' then exit;
{$IFDEF DELPHI6}
  AStream := TFileStream.Create(AFileName, fmOpenRead, fmShareDenyWrite);
{$ELSE}
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
{$ENDIF}
  try
    LoadFromStream(AStream, LoadStyles);
  finally
    AStream.Free;
  end;
end;

procedure TdxCustomNavBar.LoadFromRegistry(ARegistryPath: string; LoadStyles: Boolean = True);
var
  Storage: TRegistryIniFile;
begin
  if ARegistryPath = '' then exit;
  Storage := TRegistryIniFile.Create(ARegistryPath);
  try
    LoadFromRegIni(Storage, LoadStyles);
  finally
    Storage.Free;
  end;
end;

procedure TdxCustomNavBar.LoadFromStream(AStream: TStream; LoadStyles: Boolean = True);
var
  Storage: TMemIniFile;
  AStrings: TStringList;
begin
  Storage := TMemIniFile.Create('');
  AStrings := TStringList.Create;
  try
    AStrings.LoadFromStream(AStream);
    Storage.SetStrings(AStrings);
    LoadFromRegIni(Storage, LoadStyles);
  finally
    AStrings.Free;
    Storage.Free;
  end;
end;

procedure TdxCustomNavBar.SaveToIniFile(AFileName: string; SaveStyles: Boolean = True);
var
  AStream: TFileStream;
begin
  if AFileName = '' then exit;
{$IFDEF DELPHI6}
  AStream := TFileStream.Create(AFileName, fmCreate, fmShareExclusive);
{$ELSE}
  AStream := TFileStream.Create(AFileName, fmCreate or fmShareExclusive);
{$ENDIF}
  try
    SaveToStream(AStream, SaveStyles);
  finally
    AStream.Free;
  end;
end;

procedure TdxCustomNavBar.SaveToRegistry(ARegistryPath: string; SaveStyles: Boolean = True);
var
  Storage: TRegistryIniFile;
begin
  if ARegistryPath = '' then exit;
  Storage := TRegistryIniFile.Create(ARegistryPath);
  try
    SaveToRegIni(Storage, SaveStyles);
  finally
    Storage.Free;
  end;
end;

procedure TdxCustomNavBar.SaveToStream(AStream: TStream; SaveStyles: Boolean = True);
var
  Storage: TMemIniFile;
  AStrings: TStringList;
begin
  Storage := TMemIniFile.Create('');
  AStrings := TStringList.Create;
  try
    SaveToRegIni(Storage, SaveStyles);
    Storage.GetStrings(AStrings);
    AStrings.SaveToStream(AStream);
  finally
    AStrings.Free;
    Storage.Free;
  end;
end;

function TdxCustomNavBar.GetGroupAtCaptionPos(pt: TPoint): TdxNavBarGroup;
begin
  Result := ViewInfo.GetGroupAtCaptionPos(pt);
end;

function TdxCustomNavBar.GetGroupAtItemsPos(pt: TPoint): TdxNavBarGroup;
begin
  Result := ViewInfo.GetGroupAtItemsPos(pt);
end;

function TdxCustomNavBar.GetLinkAtPos(pt: TPoint): TdxNavBarItemLink;
begin
  Result := ViewInfo.GetLinkAtPos(pt);
end;

function TdxCustomNavBar.GetLinkAtSelectedPos(pt: TPoint): TdxNavBarItemLink;
begin
  Result := ViewInfo.GetLinkAtSelectedPos(pt);
end;

function TdxCustomNavBar.IsPtTopScrollButton(pt: TPoint): Boolean;
begin
  Result := ViewInfo.IsPtTopScrollButton(pt);
end;

function TdxCustomNavBar.IsPtBottomScrollButton(pt: TPoint): Boolean;
begin
  Result := ViewInfo.IsPtBottomScrollButton(pt);
end;

procedure TdxCustomNavBar.DeSelectLinks;
var
  I: Integer;
begin
  for I := 0 to Groups.Count - 1 do
    Groups[I].SelectedLinkIndex := -1;
end;

function TdxCustomNavBar.IsAllowDragLink: Boolean;
begin
  Result := fAllowDragLink in FDragDropFlags;
end;

function TdxCustomNavBar.IsAllowDropLink: Boolean;
begin
  Result := fAllowDropLink in FDragDropFlags;
end;

function TdxCustomNavBar.IsAllowDragGroup: Boolean;
begin
  Result := fAllowDragGroup in FDragDropFlags;
end;

function TdxCustomNavBar.IsAllowDropGroup: Boolean;
begin
  Result := fAllowDropGroup in FDragDropFlags;
end;

procedure TdxCustomNavBar.CMMouseLeave(var Message: TMessage);
begin
  DoHintDeactivate;
  FTargetPoint := Point(-1, -1);
  FPressedGroup := nil;
  FPressedLink := nil;
  FHotTrackedGroup := nil;
  FHotTrackedLink := nil;
  if dxNavBarDragObject <> nil then
    dxNavBarDragObject.UpdateTargets;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  InvalidateAll(doRedraw);
end;

procedure TdxCustomNavBar.CMMouseEnter(var Message: TMessage);
begin
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  InvalidateAll(doRedraw);
end;

procedure TdxCustomNavBar.CMSysColorChange(var Message: TMessage);
begin
  InvalidateAll(doRedraw);
end;

procedure TdxCustomNavBar.WMVScroll(var Message: TWMVScroll);
var
  I: Integer;
begin
  if Message.ScrollCode = SB_THUMBTRACK then
    for I := 0 to Groups.Count - 1 do
      if Groups[I].Control <> nil then exit;

  ScrollBar.DoScroll(Message);
  InvalidateAll(doRecalc);
end;

procedure TdxCustomNavBar.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TdxCustomNavBar.WMSetCursor(var Msg: TWMSetCursor);
begin
  if FHotTrackedGroup <> nil then
    SetCursor(Screen.Cursors[FHotTrackedGroupCursor])
  else if (HotTrackedLink <> nil) and (HotTrackedLink.Item.Enabled) then
    SetCursor(Screen.Cursors[HotTrackedLinkCursor])
  else inherited;
end;

procedure TdxCustomNavBar.WMCreate(var Msg: TWMCreate);
begin
  inherited;
  InvalidateAll(doRecreate);
end;

type
  TdxDragObject = class(TDragControlObject)
  protected
    function GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor; override;
  end;

function TdxDragObject.GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor;
var
  Wnd: TWinControl;
begin
  Wnd := FindVCLWindow(Point(X, Y));
  if Accepted and (Wnd is TdxCustomNavBar) then
  begin
    if dxNavBarDragObject.SourceItem <> nil then
      Result := TdxCustomNavBar(Wnd).DragCopyCursor
    else Result := TdxCustomNavBar(Wnd).DragCursor;
 end
 else Result := inherited GetDragCursor(Accepted, X, Y);
end;

{ TdxNabBarDragObject }

constructor TdxNavBarDragObject.Create(ANavBar: TdxCustomNavBar; var DragObject: TDragObject;
    ASourceGroup: TdxNavBarGroup; ASourceLink: TdxNavBarItemLink; ASourceItem: TdxNavBarItem);
begin
  FNavBar := ANavBar;
  FDragObject := TdxDragObject.Create(ANavBar);
  DragObject := FDragObject;
  FSourceLink := ASourceLink;
  FSourceGroup := ASourceGroup;
  FSourceItem := ASourceItem;
end;

destructor TdxNavBarDragObject.Destroy;
begin
  FDragObject.Free;
  inherited;
end;

procedure TdxNavBarDragObject.UpdateTargets;
begin
  if SourceGroup <> nil then
  begin
    FTargetGroup := NavBar.ViewInfo.GetGroupAtCaptionPos(NavBar.TargetPoint);
    if FTargetGroup = nil then
      FTargetGroup := NavBar.ViewInfo.GetGroupAtItemsPos(NavBar.TargetPoint);
  end
  else if (SourceLink <> nil) or (SourceItem <> nil) then
    FTargetLinkIndex := NavBar.ViewInfo.GetLinksAtDragPosition(NavBar.TargetPoint,
      FTargetGroup, FTargetLink1, FTargetLink2);
end;

function TdxNavBarDragObject.GetSourceItem: TdxNavBarItem;
begin
  if FSourceItem <> nil then
    Result := FSourceItem
  else if (GetKeyState(VK_CONTROL) < 0) and (FSourceLink <> nil) then
    Result := FSourceLink.Item
  else Result := nil;
end;

{ TdxNavBarScrollBar }

constructor TdxNavBarScrollBar.Create(ANavBar: TdxCustomNavBar);
begin
  FNavBar := ANavBar;
  FPosition := 0;
  FMin := 0;
  FMax := 100;
  FSmallChange := 2;
  FLargeChange := 10;
end;

procedure TdxNavBarScrollBar.DoScroll(var Message: TWMScroll);
var
  ScrollPos: Integer;
  NewPos: Longint;
  ScrollInfo: TScrollInfo;
begin
  with Message do
  begin
    NewPos := FPosition;
    case TScrollCode(ScrollCode) of
      scLineUp:
        Dec(NewPos, FSmallChange);
      scLineDown:
        Inc(NewPos, FSmallChange);
      scPageUp:
        Dec(NewPos, FLargeChange);
      scPageDown:
        Inc(NewPos, FLargeChange);
      scPosition, scTrack:
        with ScrollInfo do
        begin
          cbSize := SizeOf(ScrollInfo);
          fMask := SIF_ALL;
          GetScrollInfo(NavBar.Handle, SB_VERT, ScrollInfo);
          NewPos := nTrackPos;
        end;
      scTop:
        NewPos := FMin;
      scBottom:
        NewPos := FMax;
    end;
    if NewPos < FMin then NewPos := FMin;
    if NewPos > FMax then NewPos := FMax;
    ScrollPos := NewPos;
    SetPosition(ScrollPos);
  end;
end;

function TdxNavBarScrollBar.GetHeight: Integer;
begin
  Result := NavBar.ClientHeight;
end;

function TdxNavBarScrollBar.GetWidth: Integer;
begin
  Result := GetSystemMetrics(SM_CXVSCROLL);
end;

procedure TdxNavBarScrollBar.SetMax(const Value: Integer);
begin
  SetParams(FPosition, FMin, Value);
end;

procedure TdxNavBarScrollBar.SetMin(const Value: Integer);
begin
  SetParams(FPosition, Value, FMax);
end;

procedure TdxNavBarScrollBar.SetPageSize(const Value: Integer);
var
  ScrollInfo: TScrollInfo;
begin
  if (FPageSize = Value) or (Value > FMax) then exit;
  FPageSize := Value;
  ScrollInfo.cbSize := SizeOf(ScrollInfo);
  ScrollInfo.nPage := Value;
  ScrollInfo.fMask := SIF_PAGE;
  if NavBar.HandleAllocated then
    SetScrollInfo(NavBar.Handle, SB_VERT, ScrollInfo, True);
end;

procedure TdxNavBarScrollBar.SetParams(APosition, AMin, AMax: Integer);
begin
  if (AMax < AMin) or (AMax < FPageSize) then exit;
  if APosition < AMin then APosition := AMin;
  if APosition > AMax then APosition := AMax;
  if (FMin <> AMin) or (FMax <> AMax) then
  begin
    FMin := AMin;
    FMax := AMax;
    if NavBar.HandleAllocated then
      SetScrollRange(NavBar.Handle, SB_VERT, AMin, AMax, FPosition = APosition);
  end;
  if FPosition <> APosition then
  begin
    FPosition := APosition;
    if NavBar.HandleAllocated then
      SetScrollPos(NavBar.Handle, SB_VERT, FPosition, True)
  end;
end;

procedure TdxNavBarScrollBar.SetPosition(const Value: Integer);
begin
  SetParams(Value, FMin, FMax);
end;

procedure TdxNavBarScrollBar.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    ShowScrollBar(NavBar.Handle, SB_VERT, Value);
  end;
end;

{ TdxNavBarHintWindow }

procedure TdxNavBarHintWindow.ActivateHint(Rect: TRect; const AHint: string);
begin
  Caption := AHint;
  UpdateBoundsRect(Rect);
  if Rect.Top + Height > Screen.DesktopHeight then
    Rect.Top := Screen.DesktopHeight - Height;
  if Rect.Left + Width > Screen.DesktopWidth then
    Rect.Left := Screen.DesktopWidth - Width;
  if Rect.Left < Screen.DesktopLeft then Rect.Left := Screen.DesktopLeft;
  if Rect.Bottom < Screen.DesktopTop then Rect.Bottom := Screen.DesktopTop;
  SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height,
    SWP_NOACTIVATE);
  ShowWindow(Handle, SW_SHOWNOACTIVATE);
  Invalidate;
end;

function TdxNavBarHintWindow.NavBar: TdxCustomNavBar;
begin
  if Owner is TdxCustomNavBar then
    Result := Owner as TdxCustomNavBar
  else Result := nil;
end;

procedure TdxNavBarHintWindow.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TdxNavBarHintWindow.WMNCHitTest(var Message: TWMNCHitTest);
begin
  Message.Result := HTTRANSPARENT;
end;

procedure TdxNavBarHintWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_POPUP;
    WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    if NewStyleControls then ExStyle := WS_EX_TOOLWINDOW;
    AddBiDiModeExStyle(ExStyle);
  end;
end;

procedure TdxNavBarHintWindow.Paint;
var
  AHandled: Boolean;
begin
  if NavBar <> nil then
  begin
    AHandled := False;
    if NavBar.HotTrackedGroup <> nil then
    begin
      if Assigned(NavBar.OnCustomDrawGroupHint) then
        NavBar.OnCustomDrawGroupHint(NavBar, Canvas, NavBar.HotTrackedGroup,
          NavBar.ViewInfo.HintText, ClientRect, AHandled);
      if not AHandled then NavBar.Painter.DrawGroupHintWindow;
    end
    else if NavBar.HotTrackedLink <> nil then
    begin
      if Assigned(NavBar.OnCustomDrawLinkHint) then
        NavBar.OnCustomDrawLinkHint(NavBar, Canvas, NavBar.HotTrackedLink,
          NavBar.ViewInfo.HintText, ClientRect, AHandled);
      if not AHandled then NavBar.Painter.DrawLinkHintWindow;
    end;
  end
  else inherited Paint;
end;

{ TAbstractcxNavBarDesigner }

constructor TAbstractcxNavBarDesigner.Create(ANavBar: TdxCustomNavBar);
begin
  FNavBar := ANavBar;
  if FNavBar <> nil then
    FNavBar.FDesigner := Self;
end;

destructor TAbstractcxNavBarDesigner.Destroy;
begin
  if NavBar <> nil then
    NavBar.FDesigner := nil;
  inherited Destroy;
end;

initialization
  RegisterClasses([TdxNavBar]);
  dxNavBarDragObject := nil;
  Screen.Cursors[dxNavBarDragCursor] := LoadCursor(HInstance, 'dxNavBarDragCursor');
  Screen.Cursors[dxNavBarDragCopyCursor] := LoadCursor(HInstance, 'dxNavBarDragCopyCursor');
  Screen.Cursors[dxNavBarLinksCursor] := LoadCursor(HInstance, 'dxNavBarLinksCursor');

finalization
  DestroyCursor(Screen.Cursors[dxNavBarLinksCursor]);
  DestroyCursor(Screen.Cursors[dxNavBarDragCopyCursor]);
  DestroyCursor(Screen.Cursors[dxNavBarDragCursor]);

end.
