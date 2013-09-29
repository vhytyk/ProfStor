
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

unit cxSplitterEditor;

interface

uses
  Windows, Messages, SysUtils,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxEdit, cxCheckBox, cxSplitter, cxContainer,
  cxListBox, ExtCtrls, cxControls, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxLookAndFeels, cxRadioGroup, cxTrackBar,
  cxLookAndFeelPainters, cxButtons;

type
  TcxSplitEditor = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    cxListBox1: TcxListBox;
    cxSplit: TcxSplitter;
    cxListBox2: TcxListBox;
    cxGroupBox2: TcxGroupBox;
    cxCbAhd: TcxCheckBox;
    cxCbAp: TcxCheckBox;
    cxCbSnap: TcxCheckBox;
    cxCbRis: TcxCheckBox;
    cxCbRu: TcxCheckBox;
    Label1: TLabel;
    cxSeMs: TcxSpinEdit;
    Label2: TLabel;
    cxSePao: TcxSpinEdit;
    cxGroupBox3: TcxGroupBox;
    cxRbHzNone: TcxRadioButton;
    cxRbHzMp8: TcxRadioButton;
    cxRbHzMp9: TcxRadioButton;
    cxRbHzSimple: TcxRadioButton;
    cxRbHzXp: TcxRadioButton;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxCbHzVisible: TcxCheckBox;
    cxTbHzWidth: TcxTrackBar;
    Label3: TLabel;
    cxBtnOK: TcxButton;
    cxBtnCancel: TcxButton;
    procedure cxCbAhdClick(Sender: TObject);
    procedure cxCbApClick(Sender: TObject);
    procedure cxCbSnapClick(Sender: TObject);
    procedure cxCbRisClick(Sender: TObject);
    procedure cxCbRuClick(Sender: TObject);
    procedure cxSeMsPropertiesChange(Sender: TObject);
    procedure cxSePaoPropertiesChange(Sender: TObject);
    procedure cxCbHzVisiblePropertiesChange(Sender: TObject);
    procedure cxRbHzNoneClick(Sender: TObject);
    procedure cxRbHzMp8Click(Sender: TObject);
    procedure cxTbHzWidthPropertiesChange(Sender: TObject);
  private
    //
  public
    procedure SetSplitControls;
  end;

implementation

{$R *.dfm}

procedure TcxSplitEditor.cxCbAhdClick(Sender: TObject);
begin
  cxSplit.AllowHotZoneDrag := cxCbAhd.Checked;
end;

procedure TcxSplitEditor.cxCbApClick(Sender: TObject);
begin
  cxSplit.AutoPosition := cxCbAp.Checked;
end;

procedure TcxSplitEditor.cxCbSnapClick(Sender: TObject);
begin
  cxSplit.AutoSnap := cxCbSnap.Checked;
end;

procedure TcxSplitEditor.cxCbRisClick(Sender: TObject);
begin
  cxSplit.ResizeIgnoreSnap := cxCbRis.Checked;
end;

procedure TcxSplitEditor.cxCbRuClick(Sender: TObject);
begin
  cxSplit.ResizeUpdate := cxCbRu.Checked;
end;

procedure TcxSplitEditor.cxSeMsPropertiesChange(Sender: TObject);
begin
  cxSplit.MinSize := cxSeMs.Value;
end;

procedure TcxSplitEditor.cxSePaoPropertiesChange(Sender: TObject);
begin
  cxSplit.PositionAfterOpen := cxSePao.Value;
end;

procedure TcxSplitEditor.cxCbHzVisiblePropertiesChange(Sender: TObject);
begin
  if Assigned(cxSplit.Hotzone) then
    cxSplit.HotZone.Visible := cxCbHzVisible.Checked;
end;

procedure TcxSplitEditor.cxRbHzNoneClick(Sender: TObject);
begin
  cxCbHzVisible.Checked := False;
  cxSplit.HotZoneClassName := '';
  cxCbHzVisible.Enabled := False;
  cxTbHzWidth.Enabled := False;
end;

procedure TcxSplitEditor.cxRbHzMp8Click(Sender: TObject);
var
  vText: string;
  vHzcl: TcxHotZoneStyleClass;
begin
  vText := TcxRadioButton(Sender).Hint;
  vHzCl := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByClassName(vText));
  if vHzCl = nil then
    vHzCl := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByDescription(vText));
  cxSplit.HotZoneStyleClass := vHzCl;
  cxCbHzVisible.Enabled := True;
  cxCbHzVisible.Checked := True;
  cxTbHzWidth.Enabled := True;
end;

procedure TcxSplitEditor.cxTbHzWidthPropertiesChange(Sender: TObject);
begin
  if Assigned(cxSplit.HotZone) then
    cxSplit.HotZone.SizePercent := cxTbHzWidth.EditValue;
end;

Procedure TcxSplitEditor.SetSplitControls;
Var
  vHzt: Integer;
Begin
  cxCbAhd.Checked := cxSplit.AllowHotZoneDrag;
  cxCbAp.Checked := cxSplit.AutoPosition;
  cxSePao.Value := cxSplit.PositionAfterOpen;
  cxCbSnap.Checked := cxSplit.AutoSnap;
  cxSeMs.Value := cxSplit.MinSize;
  cxCbRis.Checked := cxSplit.ResizeIgnoreSnap;
  cxCbRu.Checked := cxSplit.ResizeUpdate;
  if Assigned(cxSplit.HotZone) then
  begin
    cxTbHzWidth.EditValue := cxSplit.HotZone.SizePercent;
    cxCbHzVisible.Checked := cxSplit.HotZone.Visible;
    vHzt := GetRegisteredHotZoneStyles.GetIndexByClass(cxSplit.HotZone.ClassType);
    case vHzt of
      0: cxRbHzMp8.Checked := True;
      1: cxRbHzMp9.Checked := True;
      2: cxRbHzSimple.Checked := True;
      3: cxRbHzXp.Checked := True;
    end;
  end
  else
  begin
    cxRbHzNone.Checked := True;
  end;
  cxTbHzWidth.Enabled := Assigned(cxSplit.HotZone);
end;

end.
