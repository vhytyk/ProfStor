
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

unit cxShellBrowserDialog;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  cxShellCommon, cxSHellControls,
  cxShellDlgs, cxShellBrowser, cxLookAndFeels;

type
  { TcxCustomShellBrowserDialog }

  TcxCustomShellBrowserDialog = class(TcxShellDialog)
  private
    FDlg: TcxShellBrowserDlg;
    FFolderCaption: string;
    FShShowRoot: boolean;
    FShButtons: boolean;
    FShInfoTips: boolean;
    fShShowLines: boolean;
    fPath: string;
    FLookAndFeel: TcxLookAndFeel;
    fShellOptions: TcxDlgShellOptions;
    fRoot: TcxDlgShellRoot;
    procedure SetLookAndFeel(Value: TcxLookAndFeel);
  protected
    function CreateForm: TcxShellBrowserDlg; dynamic;
    function DoExecute: boolean; override;

    procedure AssertDlgActive;
    procedure AssertDlgNotActive;
    property FolderLabelCaption: string read FFolderCaption write FFolderCaption;
    property Options: TcxDlgShellOptions read fShellOptions write fShellOptions;
    property ShowButtons: boolean read FShButtons write FShButtons default True;
    property ShowInfoTips: boolean read FShInfoTips write FShInfoTips default True;
    property ShowLines: boolean read fShShowLines write fShShowLines default True;
    property ShowRoot: boolean read FShShowRoot write FShShowRoot default True;
    property Root: TcxDlgShellRoot read fRoot write fRoot;
    property Path: string read fPath write fPath;
    property LookAndFeel: TcxLookAndFeel read FLookAndFeel write SetLookAndFeel;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  end;

  { TcxShellBrowserDialog } 

  TcxShellBrowserDialog = class(TcxCustomShellBrowserDialog)
  published
    property FolderLabelCaption;
    property LookAndFeel;
    property Options;
    property Path;
    property Root;
    property ShowButtons;
    property ShowInfoTips;
    property ShowLines;
    property ShowRoot;
    property Title;
    property OnFormClose;
    property OnFormShow;
  end;

implementation

procedure RaiseDlgNotActive;
begin
  raise Exception.Create('cxShellBrowserDlg not active');
end;

procedure RaiseDlgActive;
begin
  raise Exception.Create('cxShellBrowserDlg already active');
end;

{ TcxCustomShellBrowser }

procedure TcxCustomShellBrowserDialog.AssertDlgActive;
begin
  if not Assigned(FDlg) then
    RaiseDlgNotActive;
end;

procedure TcxCustomShellBrowserDialog.AssertDlgNotActive;
begin
  if Assigned(FDlg) then
    RaiseDlgActive;
end;

constructor TcxCustomShellBrowserDialog.Create(aOwner: TComponent);
begin
  inherited;
  fShellOptions := TcxDlgShellOptions.Create;
  fRoot := TcxDlgShellRoot.Create;
  Title := '';
  FShShowRoot := True;
  FShButtons := True;
  FShInfoTips := True;
  fShShowLines := True;

  FLookAndFeel := TcxLookAndFeel.Create(Self);
end;

destructor TcxCustomShellBrowserDialog.Destroy;
begin
  FreeAndNil(FLookAndFeel);
  fLookAndFeel.Free;
  fRoot.Free;
  fShellOptions.Free;
  inherited;
end;

function TcxCustomShellBrowserDialog.CreateForm: TcxShellBrowserDlg;
begin
  Result := TcxShellBrowserDlg.Create(Application);
end;

function TcxCustomShellBrowserDialog.DoExecute: boolean;
var
  vOc: TCursor;
begin
  vOc := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    FDlg := CreateForm;
    with FDlg do
    begin
      if Length(Title) > 0 then
        DlgCaption := Title;
      if Length(FFolderCaption) > 0 then
        DlgFolderLabelCaption := FFolderCaption;
      DlgOptions.ShowFolders := fShellOptions.ShowFolders;
      DlgOptions.ShowToolTip := fShellOptions.ShowToolTip;
      DlgOptions.TrackShellChanges := fShellOptions.TrackShellChanges;
      DlgOptions.ContextMenus := fShellOptions.ContextMenus;
      DlgOptions.ShowNonFolders := fShellOptions.ShowNonFolders;
      DlgOptions.ShowHidden := fShellOptions.ShowHidden;
      DlgOptions.AutoBrowseFolder := fShellOptions.AutoBrowseFolder;
      DlgRoot.BrowseFolder := fRoot.BrowseFolder;
      DlgRoot.CustomPath := fRoot.CustomPath;
      DlgShowButtons := ShowButtons;
      DlgShowInfoTips := ShowInfoTips;
      DlgShowLines := ShowLines;
      DlgShowRoot := ShowRoot;
      DlgFolder := fPath;
      FDlg.LookAndFeel.MasterLookAndFeel := Self.LookAndFeel;
      Result := ShowModal = idOk;
      if Result then
        fPath := FDlg.DlgFolder;
    end;
  finally
    FreeAndNil(FDlg);
    Screen.Cursor := vOc;
  end;
end;

procedure TcxCustomShellBrowserDialog.SetLookAndFeel(Value: TcxLookAndFeel);
begin
  FLookAndFeel.Assign(Value);
end;

end.
