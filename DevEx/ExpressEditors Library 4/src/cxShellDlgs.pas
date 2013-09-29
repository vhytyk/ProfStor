
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

unit cxShellDlgs;

interface

uses
  Windows, Messages, SysUtils, Classes,
  cxShellCommon, cxLookAndFeels;

type
  TcxDlgShellOptions = class(TPersistent)
  private
    FShowFolders: boolean;
    FShowToolTip: boolean;
    FTrackShellChanges: boolean;
    FContextMenus: boolean;
    FShowNonFolders: boolean;
    FShowHidden: boolean;
    FAutoBrowseFolder: boolean;
  public
    constructor Create;
  published
    property ShowFolders: Boolean read FShowFolders write FShowFolders default True;
    property ShowNonFolders: boolean read FShowNonFolders write fShowNonFolders default False;
    property ShowHidden: boolean read FShowHidden write fShowHidden default False;
    property ContextMenus: boolean read FContextMenus write fContextMenus default True;
    property TrackShellChanges: Boolean read FTrackShellChanges write FTrackShellChanges default True;
    property ShowToolTip: boolean read FShowToolTip write FShowToolTip default False;
    property AutoBrowseFolder: boolean read FAutoBrowseFolder write FAutoBrowseFolder default True;
  end;

  TcxDlgShellRoot = class(TPersistent)
  private
    fCustomPath: string;
    fBroFold: TcxBrowseFolder;
  public
    constructor Create;
  published
    property BrowseFolder: TcxBrowseFolder read fBroFold write fBroFold default bfDesktop;
    property CustomPath: string read fCustomPath write fCustomPath;
  end;

  TcxShellDialog = class(TComponent)
  private
    fTitle: string;
    fOnFormShow: TNotifyEvent;
    fOnFormClose: TNotifyEvent;
    fExecuting: boolean;
  protected
    function DoExecute: boolean; dynamic; abstract;

    property Executing: boolean read fExecuting;
    property Title: string read fTitle write fTitle;
    property OnFormClose: TNotifyEvent read fOnFormClose write fOnFormClose;
    property OnFormShow: TNotifyEvent read fOnFormShow write fOnFormShow;
  public
    constructor Create(aOwner: TComponent); override;
    function Execute: boolean;
  end;

implementation

{ TcxShellDialog }

constructor TcxShellDialog.Create(aOwner: TComponent);
begin
  inherited;
end;

function TcxShellDialog.Execute: boolean;
begin
  if fExecuting then
    raise Exception.Create(ClassName + ' already executing');
  fExecuting := True;
  try
    Result := DoExecute;
  finally
    fExecuting := False;
  end;
end;

{ TcxDdlgShellOptions }

constructor TcxDlgShellOptions.Create;
begin
  inherited Create;
  FShowFolders := True;
  FTrackShellChanges := True;
  FContextMenus := True;
  FShowNonFolders := False;
  FShowHidden := False;
  FAutoBrowseFolder := True;
end;

{ TcxDlgShellRoot }

constructor TcxDlgShellRoot.Create;
begin
  inherited;
  fBroFold := bfDesktop;
end;

end.
