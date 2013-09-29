{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressFilterControl                                         }
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
unit cxFilterControlDialog;

{$I cxFilterControlVer.inc}

interface

uses
{$IFDEF WIN32}
  Windows, Messages,
{$ENDIF}
{$IFNDEF VCL}
  Types,
{$ENDIF}
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cxLookAndFeelPainters,
  cxButtons, cxControls, cxFilterControl, ExtCtrls, cxLookAndFeels,
  StdCtrls;

type
  TfmFilterControlDialog = class(TForm)
    pnlBottom: TPanel;
    btOpen: TcxButton;
    btSave: TcxButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    pnlBottomRight: TPanel;
    btApply: TcxButton;
    btCancel: TcxButton;
    btOk: TcxButton;
    procedure acApplyExecute(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
    procedure acOpenExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  {$IFDEF VCL}
    FParentWindow: HWND;
  {$ENDIF}
    FFilterControl: TcxCustomFilterControl;
    procedure Initialize(const AInitialDir: string);
    procedure SetLookAndFeel(ALookAndFeel: TcxLookAndFeel);
    procedure SetTitle(const ATitle: string);
  protected
  {$IFDEF VCL}
    procedure CreateParams(var Params: TCreateParams); override;
  {$ENDIF}
  {$IFDEF LINUX}
    procedure ReadState(Reader: TReader); override;
  {$ENDIF}
  public
  {$IFDEF VCL}
    constructor Create(AOwner: TComponent); override;
  {$ENDIF}
    property FilterControl: TcxCustomFilterControl read FFilterControl;
  end;

function cxInternalExecuteFilterControlDialog(AFilterControlClass: TcxCustomFilterControlClass;
  ALink: TComponent; ALookAndFeel: TcxLookAndFeel;
  AOnApplyProc: TNotifyEvent = nil; AOnShowDialog: TNotifyEvent = nil;
  AColor: TColor = clDefault; const AInitialDir: string = ''): Boolean;

function ExecuteFilterControlDialog(ALinkComponent: TComponent;
  ALookAndFeel: TcxLookAndFeel; AOnApplyProc: TNotifyEvent = nil;
  AOnShowDialog: TNotifyEvent = nil; AColor: TColor = clDefault;
  const AInitialDir: string = ''): Boolean;

const
  cxFilterDialogPosition: TRect =
    (Left: -1; Top: -1;           // screen center
     Right: -1; Bottom: -1);      // BottomRight as TSize

implementation

uses
  cxClasses, cxFilterControlStrs;

type
  TcxCustomFilterControlAccess = class(TcxCustomFilterControl);

{$R *.dfm}

function cxInternalExecuteFilterControlDialog(
  AFilterControlClass: TcxCustomFilterControlClass;
  ALink: TComponent; ALookAndFeel: TcxLookAndFeel;
  AOnApplyProc: TNotifyEvent = nil; AOnShowDialog: TNotifyEvent = nil;
  AColor: TColor = clDefault; const AInitialDir: string = ''): Boolean;
var
  AForm: TfmFilterControlDialog;
  AIntf: IcxFilterControlDialog;
begin
  AForm := TfmFilterControlDialog.Create(Application);
  with AForm do
  try
    FFilterControl := AFilterControlClass.Create(nil);
    SetLookAndFeel(ALookAndFeel);

    if Supports(TObject(FFilterControl), IcxFilterControlDialog, AIntf) then
      AIntf.SetDialogLinkComponent(ALink);
    AIntf := nil; //force to clear interface
    with TcxCustomFilterControlAccess(FilterControl) do
    begin
      if AColor <> clDefault then Color := AColor;
      OnApplyFilter := AOnApplyProc;
    end;
    Initialize(AInitialDir);
    OnShow := AOnShowDialog;
    Result := ShowModal = mrOk;
  finally
    FFilterControl.Free;
    Free;
  end;
end;

function ExecuteFilterControlDialog(ALinkComponent: TComponent;
  ALookAndFeel: TcxLookAndFeel; AOnApplyProc: TNotifyEvent = nil;
  AOnShowDialog: TNotifyEvent = nil; AColor: TColor = clDefault;
  const AInitialDir: string = ''): Boolean;
begin
  Result := cxInternalExecuteFilterControlDialog(TcxFilterControl,
    ALinkComponent, ALookAndFeel, AOnApplyProc, AOnShowDialog, AColor,
    AInitialDir);
end;

{ TfmFilterControlDialog }

{$IFDEF VCL}
constructor TfmFilterControlDialog.Create(AOwner: TComponent);
var
  AForm: TForm;
  I: Integer;
begin
  AForm := Screen.ActiveForm;
  if AForm <> nil then
  begin
    FParentWindow := AForm.Handle;
    for I := 0 to Screen.FormCount - 1 do
      if (Screen.Forms[I] <> AForm) and (Screen.Forms[I].FormStyle = fsStayOnTop) then
      begin
        FParentWindow := 0;
        break;
      end;
  end;
  inherited Create(AOwner);
{$IFDEF LINUX}
  Position := poDefault;
  QControlSetBounds(Self, Left, Top, Width, Height, Visible);
  Position := poScreenCenter;
{$ENDIF}
end;

procedure TfmFilterControlDialog.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if FParentWindow <> 0 then
    Params.WndParent := FParentWindow;
end;
{$ENDIF}

{$IFDEF LINUX}

procedure TfmFilterControlDialog.ReadState(Reader: TReader);
var
  AFont: TFont;
begin
  AFont := TFont.Create;
  try
    AFont.Assign(Font);
    PixelsPerInch := 0;
    inherited;
    Font := AFont;
  finally
    AFont.Free;
  end;
end;

{$ENDIF}

procedure TfmFilterControlDialog.Initialize(const AInitialDir: string);
begin
  SetTitle(cxGetResourceString(@cxSFilterControlDialogNewFile));
  OpenDialog.InitialDir := AInitialDir;
  OpenDialog.Title := cxGetResourceString(@cxSFilterControlDialogOpenDialogCaption);
  OpenDialog.DefaultExt := cxGetResourceString(@cxSFilterControlDialogFileExt);
  OpenDialog.Filter := cxGetResourceString(@cxSFilterControlDialogFileFilter);
  SaveDialog.InitialDir := AInitialDir;
  SaveDialog.Title := cxGetResourceString(@cxSFilterControlDialogSaveDialogCaption);
  SaveDialog.DefaultExt := OpenDialog.DefaultExt;
  SaveDialog.Filter := OpenDialog.Filter;
  btSave.Caption := cxGetResourceString(@cxSFilterControlDialogActionSaveCaption);
  btOpen.Caption := cxGetResourceString(@cxSFilterControlDialogActionOpenCaption);
  btApply.Caption := cxGetResourceString(@cxSFilterControlDialogActionApplyCaption);
  btOk.Caption := cxGetResourceString(@cxSFilterControlDialogActionOkCaption);
  btCancel.Caption := cxGetResourceString(@cxSFilterControlDialogActionCancelCaption);
  with TcxCustomFilterControlAccess(FilterControl) do
  begin
    Align := alClient;
    Parent := Self;
  end;
  with cxFilterDialogPosition do
  begin
    if (Left = -1) or (Top = -1) then
      Position := poScreenCenter
    else
    begin
      Self.Left := Left;
      Self.Top := Top;
    end;
    if Right > 0 then Width := Right;
    if Bottom > 0 then Height := Bottom;
  end;
end;

procedure TfmFilterControlDialog.SetLookAndFeel(
  ALookAndFeel: TcxLookAndFeel);
begin
  if ALookAndFeel <> nil then
  begin
    btOk.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
    btCancel.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
    btApply.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
    btOpen.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
    btSave.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
    TcxCustomFilterControlAccess(FilterControl).LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  end;
end;

procedure TfmFilterControlDialog.SetTitle(const ATitle: string);
begin
  SaveDialog.FileName := ATitle;
  Caption := Format('%s - [%s]', [cxGetResourceString(@cxSFilterControlDialogCaption), ATitle]);
end;

procedure TfmFilterControlDialog.acApplyExecute(Sender: TObject);
begin
  FilterControl.ApplyFilter;
end;

procedure TfmFilterControlDialog.acOkExecute(Sender: TObject);
begin
  FilterControl.ApplyFilter;
end;

procedure TfmFilterControlDialog.acOpenExecute(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
  begin
    FilterControl.LoadFromFile(OpenDialog.FileName);
    SetTitle(OpenDialog.FileName);
  end;
end;

procedure TfmFilterControlDialog.acSaveExecute(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    FilterControl.SaveToFile(SaveDialog.FileName);
    SetTitle(SaveDialog.FileName);
  end;
end;

procedure TfmFilterControlDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cxFilterDialogPosition := Rect(Left, Top, Width, Height);
end;

procedure TfmFilterControlDialog.btCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmFilterControlDialog.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel;
end;

end.
