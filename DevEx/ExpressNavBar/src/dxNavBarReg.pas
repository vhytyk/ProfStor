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

unit dxNavBarReg;

{$I dxNavBarVer.inc}

interface

procedure Register;

implementation

uses
  Classes, Windows, Graphics, Controls, Forms, ImgList, SysUtils, Math,
  {$IFDEF DELPHI6}DesignIntf, DesignEditors, VCLEditors, {$ELSE}DsgnIntf,{$ENDIF} ToolsAPI,
  dxNavBar, dxNavBarBase, dxNavBarCollns, dxNavBarStyles, dxNavBarConsts,
  dxNavBarDsgnConsts, dxfmNavBarDsgnEditor, dxNavBarViewsFact;

type
  TdxNavBarViewProperty = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

{$IFDEF DELPHI5}
  TdxNavBarSmallImageIndexProperty = class(TIntegerProperty
{$IFDEF DELPHI6}
   ,ICustomPropertyDrawing, ICustomPropertyListDrawing
{$ENDIF})
  protected
    function GetCollectionItem: TdxNavBarComponentCollectionItem; virtual;
    function GetImages: TCustomImageList; virtual;
    function GetNavBar: TdxCustomNavBar; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure ListMeasureWidth(const Value: string;
      ACanvas: TCanvas; var AWidth: Integer); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean); {$IFNDEF DELPHI6} override;{$ENDIF}
   {$IFDEF DELPHI6}
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
   {$ENDIF}
   property Images: TCustomImageList read GetImages;
  end;

  TdxNavBarLargeImageIndexProperty = class(TdxNavBarSmallImageIndexProperty)
  protected
    function GetImages: TCustomImageList; override;
  end;

  TdxNavBarCursorProperty = class(TCursorProperty{$IFDEF DELPHI6}, ICustomPropertyListDrawing{$ENDIF})
  public
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;

    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure ListMeasureWidth(const Value: string;
      ACanvas: TCanvas; var AWidth: Integer); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); {$IFNDEF DELPHI6} override;{$ENDIF}
  end;
{$ENDIF}

  TdxNavBarComponentEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{ TdxNavBarViewProperty }

function TdxNavBarViewProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList];
end;

function TdxNavBarViewProperty.GetValue: string;
var
  AValue: Integer;
begin
  AValue := GetOrdValue;
  if (0 <= AValue) and (AValue < dxNavBarViewsFactory.Count) then
    Result := dxNavBarViewsFactory.Names[AValue]
  else Result := '';
end;

procedure TdxNavBarViewProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to dxNavBarViewsFactory.Count - 1 do
    Proc(dxNavBarViewsFactory.Names[I]);
end;

procedure TdxNavBarViewProperty.SetValue(const Value: string);
var
  AValue: Integer;
begin
  AValue := dxNavBarViewsFactory.IndexOfName(Value);
  if AValue > -1 then SetOrdValue(AValue);
end;

{$IFDEF DELPHI5}

{ TdxNavBarImageIndexProperty }

function TdxNavBarSmallImageIndexProperty.GetCollectionItem: TdxNavBarComponentCollectionItem;
begin
  Result := GetComponent(0) as TdxNavBarComponentCollectionItem;
end;

function TdxNavBarSmallImageIndexProperty.GetImages: TCustomImageList;
begin
  if GetNavBar <> nil then
    Result := GetNavBar.SmallImages
  else Result := nil;
end;

function TdxNavBarSmallImageIndexProperty.GetNavBar: TdxCustomNavBar;
begin
  if GetCollectionItem.Collection <> nil then
    Result := GetCollectionItem.Collection.Owner as TdxCustomNavBar
  else Result := nil;
end;

function TdxNavBarSmallImageIndexProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TdxNavBarSmallImageIndexProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  if Images <> nil then
    for I := 0 to Images.Count - 1 do
      Proc(IntToStr(I));
end;

procedure TdxNavBarSmallImageIndexProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
begin
  if Images <> nil then
    AHeight := Images.Height + 2 + 2;
end;

procedure TdxNavBarSmallImageIndexProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
  if Images <> nil then
    AWidth := AWidth + Images.Width + 2 + 2;
end;

procedure TdxNavBarSmallImageIndexProperty.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  R: TRect;
  I: Integer;
begin
  R := ARect;
  ACanvas.FillRect(R);
  if Images <> nil then
  try
    I := StrToInt(Value);
    if (I > -1) and (I < Images.Count) then
    begin
      Images.Draw(ACanvas, R.Left + 2, R.Top + 2, I);
      Inc(R.Left, Images.Width + 2);
    end;
  except
  end;
 {$IFDEF DELPHI6}
  DefaultPropertyListDrawValue(Value, ACanvas, R, ASelected);
 {$ELSE}
  inherited ListDrawValue(Value, ACanvas, R, ASelected);
 {$ENDIF}
end;

procedure TdxNavBarSmallImageIndexProperty.PropDrawValue(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  S: string;
begin
  S := GetVisualValue;
  if (S <> '') and ASelected then
    ListDrawValue(S, ACanvas, ARect, ASelected)
  else
 {$IFDEF DELPHI6}
  DefaultPropertyDrawValue(Self, ACanvas, ARect);
 {$ELSE}
  inherited PropDrawValue(ACanvas, ARect, ASelected);
 {$ENDIF}
end;

{$IFDEF DELPHI6}
procedure TdxNavBarSmallImageIndexProperty.PropDrawName(ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;
{$ENDIF}

{ TdxNavBarLargeImageIndexProperty }

function TdxNavBarLargeImageIndexProperty.GetImages: TCustomImageList;
begin
  if GetNavBar <> nil then
    Result := GetNavBar.LargeImages
  else Result := nil;
end;

{ TdxNavBarCursorProperty }

function TdxNavBarCursorProperty.GetValue: string;
begin
  if not IntToIdent(TCursor(GetOrdValue), Result, dxNavBarCursors) then
    Result := inherited GetValue;
end;

procedure TdxNavBarCursorProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  inherited;
  for I := Low(dxNavBarCursors) to High(dxNavBarCursors) do
    Proc(dxNavBarCursors[I].Name);
end;

procedure TdxNavBarCursorProperty.SetValue(const Value: string);
var
  NewValue: Longint;
begin
  if IdentToInt(Value, NewValue, dxNavBarCursors) then
    SetOrdValue(NewValue)
  else inherited SetValue(Value);
end;

procedure TdxNavBarCursorProperty.ListMeasureHeight(const Value: string; ACanvas: TCanvas;
  var AHeight: Integer);
begin
  AHeight := Max(ACanvas.TextHeight('Wg'), GetSystemMetrics(SM_CYCURSOR) + 4);
end;

procedure TdxNavBarCursorProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
begin
  AWidth := AWidth + GetSystemMetrics(SM_CXCURSOR) + 4;
end;

procedure TdxNavBarCursorProperty.ListDrawValue(const Value: string; ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  Right: Integer;
  CursorIndex: Integer;
  CursorHandle: THandle;
{$IFNDEF DELPHI6}
  R: TRect;
{$ENDIF}
begin
  Right := ARect.Left + GetSystemMetrics(SM_CXCURSOR) + 4;
  with ACanvas do
  begin
    if not Classes.IdentToInt(Value, CursorIndex, dxNavBarCursors) then
      if not IdentToCursor(Value, CursorIndex) then
        CursorIndex := StrToInt(Value);
    ACanvas.FillRect(ARect);
    CursorHandle := Screen.Cursors[CursorIndex];
    if CursorHandle <> 0 then
      DrawIconEx(ACanvas.Handle, ARect.Left + 2, ARect.Top + 2, CursorHandle,
        0, 0, 0, 0, DI_NORMAL or DI_DEFAULTSIZE);
    {$IFDEF DELPHI6}
    DefaultPropertyListDrawValue(Value, ACanvas, Rect(Right, ARect.Top,
      ARect.Right, ARect.Bottom), ASelected);
    {$ELSE}
    R := ARect;
    R.Left := Right + 4;
    ACanvas.TextRect(R, R.Left + 1, R.Top + 1, Value);
    {$ENDIF}
  end;
end;

{$ENDIF}

{ TdxNavBarComponentEditor }

procedure TdxNavBarComponentEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    dxShowNavBarDesigner(TdxCustomNavBar(Component), Designer);
end;

function TdxNavBarComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sdxEditor;
    2: Result := sdxProductText;
    3: Result := sdxCompanyWebPage;
    4: Result := sdxCompanyName;
  else
    Result := '-';
  end;
end;

function TdxNavBarComponentEditor.GetVerbCount: Integer;
begin
  Result := 6;
end;

procedure Register;
begin
  RegisterComponents(sdxProductPage, [TdxNavBar]);
  RegisterNoIconProc([TdxNavBarGroup, TdxNavBarItem, TdxNavBarStyleItem]);
  RegisterPropertyEditor(TypeInfo(Integer), TdxNavBar, 'View', TdxNavBarViewProperty);
{$IFDEF DELPHI5}
  RegisterPropertyEditor(TypeInfo(Integer), TdxNavBarGroup, 'LargeImageIndex',  TdxNavBarLargeImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(Integer), TdxNavBarGroup, 'SmallImageIndex',  TdxNavBarSmallImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(Integer), TdxNavBarItem, 'LargeImageIndex',  TdxNavBarLargeImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(Integer), TdxNavBarItem, 'SmallImageIndex',  TdxNavBarSmallImageIndexProperty);
  RegisterPropertyEditor(TypeInfo(TCursor), TdxCustomNavBar, 'DragCursor',  TdxNavBarCursorProperty);
  RegisterPropertyEditor(TypeInfo(TCursor), TdxCustomNavBar, 'DragCopyCursor',  TdxNavBarCursorProperty);
  RegisterPropertyEditor(TypeInfo(TCursor), TdxCustomNavBar, 'HotTrackedGroupCursor',  TdxNavBarCursorProperty);
  RegisterPropertyEditor(TypeInfo(TCursor), TdxCustomNavBar, 'HotTrackedLinkCursor',  TdxNavBarCursorProperty);
{$ENDIF}
  RegisterComponentEditor(TdxNavBar, TdxNavBarComponentEditor);
end;

end.

