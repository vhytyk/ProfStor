{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressDocking                                              }
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

unit dxDockReg;

{$I dxDockVer.inc}

interface

uses
  Windows, Classes, Forms, Graphics, Controls,
  {$IFDEF DELPHI6}
  DesignIntf, ComponentDesigner, DesignEditors, VCLEditors;
  {$ELSE}
  DsgnIntf;
  {$ENDIF}

procedure Register;

implementation

uses
  SysUtils,{$IFDEF DELPHI5}ImgList,{$ENDIF}
  dxDockControl, dxDockPanel;

const
  sdxCompanyName = 'Developer Express Inc.';
  sdxCompanyWebPage = 'http://www.devexpress.com';
  sdxProductName = 'ExpressDocking Library';
  sdxProductMajorVersion = '5';
  sdxProductMinorVersion = '1';
  sdxProductVersion = sdxProductMajorVersion + '.' + sdxProductMinorVersion;
  sdxProductText = sdxProductName + ' ' + sdxProductVersion;

type
  {$IFDEF DELPHI6}
  IDelphiDesigner = IDesigner;
 {$ELSE}
  IDelphiDesigner = IFormDesigner;
 {$ENDIF}

  TdxIDEDesigner = class(TdxAbstractIDEDesigner)
  protected
    procedure Modified(Root: TCustomForm); override;
    procedure NoSelection(Root: TCustomForm); override;
    procedure SelectComponent(Root: TCustomForm; Component: TPersistent); override;
    function UniqueName(Root: TCustomForm; const BaseName: string): string; override;
  end;

  TdxDockingComponentEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{$IFDEF DELPHI5}
  TdxImageIndexProperty = class(TIntegerProperty{$IFDEF DELPHI6}, ICustomPropertyListDrawing{$ENDIF})
  protected
    function Images: TCustomImageList; virtual;
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
      var AWidth: Integer); {$IFNDEF DELPHI6}override;{$ENDIF}
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer); {$IFNDEF DELPHI6}override;{$ENDIF}
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); {$IFNDEF DELPHI6}override;{$ENDIF}
  end;
{$ENDIF}

{ TdxIDEDesigner }

procedure TdxIDEDesigner.Modified(Root: TCustomForm);
begin
  if (Root <> nil) and (Root.Designer <> nil) then
    Root.Designer.Modified;
end;

procedure TdxIDEDesigner.NoSelection(Root: TCustomForm);
var
  ADesigner: IDelphiDesigner;
begin
  if (Root <> nil) and (Root.Designer <> nil) and (Root.Designer.QueryInterface(IDelphiDesigner, ADesigner) = S_OK) then
    ADesigner.SelectComponent(nil);
end;

procedure TdxIDEDesigner.SelectComponent(Root: TCustomForm; Component: TPersistent);
var
  ADesigner: IDelphiDesigner;
begin
  if (Root <> nil) and (Root.Designer <> nil) and (Root.Designer.QueryInterface(IDelphiDesigner, ADesigner) = S_OK) then
    ADesigner.SelectComponent(Component);
end;

function TdxIDEDesigner.UniqueName(Root: TCustomForm; const BaseName: string): string;
var
  ADesigner: IDelphiDesigner;
begin
  if (Root <> nil) and (Root.Designer <> nil) and (Root.Designer.QueryInterface(IDelphiDesigner, ADesigner) = S_OK) then
    Result := ADesigner.UniqueName(BaseName)
  else Result := '';
end;

procedure TdxDockingComponentEditor.ExecuteVerb(Index: Integer);
begin
end;

function TdxDockingComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sdxProductText;
    1: Result := sdxCompanyWebPage;
    2: Result := sdxCompanyName;
  else
    Result := '-';
  end;
end;

function TdxDockingComponentEditor.GetVerbCount: Integer;
begin
  Result := 4;
end;

{$IFDEF DELPHI5}

{ TdxImageIndexProperty  }

function TdxImageIndexProperty.Images: TCustomImageList;
begin
  Result := TdxCustomDockSite(GetComponent(0)).Images;
end;

function TdxImageIndexProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList];
end;

procedure TdxImageIndexProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  Proc('-1');
  if Images = nil then Exit;
  for I := 0 to Images.Count - 1 do
    Proc(IntToStr(I));
end;

procedure TdxImageIndexProperty.ListMeasureWidth(const Value: string; ACanvas: TCanvas;
  var AWidth: Integer);
begin
  inherited;
  if Images <> nil then Inc(AWidth, 1 + Images.Width + 1);
end;

procedure TdxImageIndexProperty.ListMeasureHeight(const Value: string; ACanvas: TCanvas;
  var AHeight: Integer);
begin
  inherited;
  if (Images <> nil) and (AHeight < 1 + Images.Height + 1) then
    AHeight := 1 + Images.Height + 1;
end;

procedure TdxImageIndexProperty.ListDrawValue(const Value: string; ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
var
  ATextRect: TRect;
  PrevBrushColor: TColor;
begin
  ATextRect := ARect;
  if Images <> nil then
  begin
    Inc(ATextRect.Left, 1 + Images.Width + 1);
    with ARect do
    begin
      PrevBrushColor := ACanvas.Brush.Color;
      ACanvas.Brush.Color := clWindow;
      ACanvas.FillRect(Rect(Left, Top, ATextRect.Left, Bottom));
      ACanvas.Brush.Color := PrevBrushColor;
    end;
    Images.Draw(ACanvas, ARect.Left + 1, ARect.Top + 1, StrToInt(Value));
  end;
  with ATextRect, ACanvas do
    ACanvas.TextRect(ATextRect, Left + 1, (Top + Bottom - TextHeight(Value)) div 2, Value);
end;
{$ENDIF}

procedure Register;
begin
  RegisterComponents('ExpressBars', [TdxDockingManager, TdxDockPanel, TdxDockSite]);
{$IFDEF DELPHI5}
  RegisterPropertyEditor(TypeInfo(Integer), TdxCustomDockControl, 'ImageIndex',
    TdxImageIndexProperty);
{$ENDIF}
  RegisterComponentEditor(TdxCustomDockControl, TdxDockingComponentEditor);
  RegisterComponentEditor(TdxDockingManager, TdxDockingComponentEditor);
end;

initialization
  IDEDesigner := TdxIDEDesigner.Create;

finalization
  IDEDesigner.Free;
  IDEDesigner := nil;

end.
