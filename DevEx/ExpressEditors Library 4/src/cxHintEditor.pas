
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

unit cxHintEditor;

interface

uses
  Windows, Messages, SysUtils, 
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, ComCtrls, cxSplitter, cxControls, cxTextEdit,
  cxMemo, ExtCtrls, StdCtrls, cxMaskEdit, cxDropDownEdit, cxFontNameComboBox,
  cxGroupBox, cxCheckBox, cxColorComboBox,cxExtEditConsts, cxTrackBar, cxListView,
  cxRadioGroup, cxButtons, cxLookandFeels, cxHint, cxSpinEdit, cxLabel,
  cxLookAndFeelPainters, cxCheckListBox, cxListBox, cxSpinButton;

type
  TcxHintStyleEditor = class(TForm)
    cxBtnOk: TcxButton;
    cxBtnCancel: TcxButton;
    cxCbStandard: TcxCheckBox;
    cxGbHintFont: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxFnHint: TcxFontNameComboBox;
    cxClbHintFontStyles: TcxCheckListBox;
    cxLbHfSize: TcxListBox;
    cxCcbHintFontColour: TcxColorComboBox;
    cxgbHintCapFont: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxFnHinCap: TcxFontNameComboBox;
    cxClbHintCapFontStyles: TcxCheckListBox;
    cxLbHcfSize: TcxListBox;
    cxCcbHintCapColor: TcxColorComboBox;
    cxGbHintShape: TcxGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    cxCbHintCalloutPos: TcxComboBox;
    cxcbHintRounded: TcxCheckBox;
    cxSeHintRadius: TcxSpinEdit;
    cxGbHintIcons: TcxGroupBox;
    Label11: TLabel;
    cxCbHintIconType: TcxComboBox;
    cxRbHIDef: TcxRadioButton;
    cxRbHILarge: TcxRadioButton;
    cxRbHISmall: TcxRadioButton;
    cxGbHintPause: TcxGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cxSeHintHidePause: TcxSpinEdit;
    cxSeHintPause: TcxSpinEdit;
    cxSeShortHintPause: TcxSpinEdit;
    lblHintColour: TLabel;
    cxCcbHintColour: TcxColorComboBox;
    cxGbHintAnimation: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    cxCbHintAniStyle: TcxComboBox;
    cxSeHintDelay: TcxSpinEdit;
    cxGbPreview: TcxGroupBox;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxHsc: TcxHintStyleController;
    pnlPreview: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxFnHintClick(Sender: TObject);
    procedure cxCcbHintColourClick(Sender: TObject);
    procedure cxCbHintCalloutPosClick(Sender: TObject);
    procedure cxSeHintRadiusPropertiesChange(Sender: TObject);
    procedure cxcbHintRoundedPropertiesChange(Sender: TObject);
    procedure cxCbHintAniStylePropertiesChange(Sender: TObject);
    procedure cxSeHintDelayPropertiesChange(Sender: TObject);
    procedure cxCbHintIconTypeClick(Sender: TObject);
    procedure cxRbHIDefClick(Sender: TObject);
    procedure cxSeHintHidePausePropertiesChange(Sender: TObject);
    procedure cxSeHintPausePropertiesChange(Sender: TObject);
    procedure cxSeShortHintPausePropertiesEditValueChanged(Sender: TObject);
    procedure cxClbHintFontStylesClick(Sender: TObject);
    procedure cxCcbHintFontColourClick(Sender: TObject);
    procedure cxCcbHintCapColorClick(Sender: TObject);
    procedure cxFnHintPropertiesChange(Sender: TObject);
    procedure cxLbHfSizeClick(Sender: TObject);
    procedure cxLbHcfSizeClick(Sender: TObject);
    procedure cxFnHinCapPropertiesChange(Sender: TObject);
    procedure cxCbStandardClick(Sender: TObject);
    procedure cxFnHinCapClick(Sender: TObject);
  private
    fViewerFontSizes: TStringList;
    fHintHorz: Integer;
    fHintVert: Integer;
    fFormLoaded: Boolean;
    procedure SetHsc(const Value: TcxHintStyleController);
    procedure RefreshHint;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
  public
    procedure SetHintController(aDest: TcxHintStyleController);
    procedure LoadHintCtrls;
    property HintController: TCxHintStyleController read cxHsc write SetHsc;
  end;

var
  cxHintStyleEditor: TcxHintStyleEditor;

implementation

{$R *.dfm}

resourcestring
  SHintCaption = 'Example';
  SHintText    = 'Preview Hint';

procedure TcxHintStyleEditor.FormCreate(Sender: TObject);
begin
  fViewerFontSizes :=TStringList.Create;
end;

procedure TcxHintStyleEditor.FormDestroy(Sender: TObject);
begin
  cxHsc.HideHint;
  fViewerFontSizes.Free;
end;

procedure TcxHintStyleEditor.cxCbStandardClick(Sender: TObject);
begin
  cxHsc.HintStyle.Standard := cxCbStandard.Checked;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxFnHintClick(Sender: TObject);
begin
  cxHsc.HintStyle.Font.Name := cxFnHint.FontName;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxFnHinCapClick(Sender: TObject);
begin
  cxHsc.HintStyle.CaptionFont.Name := cxFnHinCap.FontName;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxCcbHintColourClick(Sender: TObject);
begin
  cxHsc.HintStyle.Color := cxCcbHintColour.ColorValue;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxCbHintCalloutPosClick(Sender: TObject);
begin
  cxHsc.HintStyle.CallOutPosition := TcxCallOutPosition(cxCbHintCalloutPos.ItemIndex);
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxSeHintRadiusPropertiesChange(Sender: TObject);
begin
  cxHsc.HintStyle.RoundRadius := cxSeHintRadius.Value;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxcbHintRoundedPropertiesChange(Sender: TObject);
begin
  cxHsc.HintStyle.Rounded := cxcbHintRounded.Checked;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxCbHintAniStylePropertiesChange(Sender: TObject);
begin
  cxHsc.HintStyle.Animate := TcxHintAnimate(cxCbHintAniStyle.ItemIndex);
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxSeHintDelayPropertiesChange(Sender: TObject);
begin
  cxHsc.HintStyle.AnimationDelay := cxSeHintDelay.Value;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxCbHintIconTypeClick(Sender: TObject);
begin
  cxHsc.HintStyle.IconType := tCxHintIconType(cxCbHintIconType.ItemIndex);
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxRbHIDefClick(Sender: TObject);
begin
  cxHsc.HintStyle.IconSize := tCxHintIconSize(TcxRadioButton(Sender).Tag );
  RefreshHint;
end;

procedure TcxHintStyleEditor.SetHsc(const Value: TCxHintStyleController);
begin
  cxHsc.Assign(Value);
end;

procedure TcxHintStyleEditor.SetHintController(aDest: TCxHintStyleController);
begin
  aDest.HintStyle.Assign(cxHsc.HintStyle);
  aDest.HintShortPause := cxHsc.HintShortPause;
  aDest.HintPause := cxHsc.HintPause;
  aDest.HintHidePause := cxHsc.HintHidePause;
end;

procedure TcxHintStyleEditor.LoadHintCtrls;

  function StyleToEditValue(aFontStyle : TFontStyles) : Integer;
  begin
    Result := 0;
    if fsBold in aFontStyle then
      Result := 1;
    if fsItalic in aFontStyle then
      Inc(Result,2);
    if fsUnderline in aFontStyle then
      Inc(Result,4);
    if fsStrikeOut in aFontStyle then
      Inc(Result,8);
  end;

begin
  cxCbStandard.Checked := cxHsc.HintStyle.Standard;
  cxFnHint.FontName := cxHsc.HintStyle.Font.Name;
  while not cxFnHint.Properties.LoadFontComplete do
    Application.ProcessMessages;
  cxCcbHintFontColour.ColorValue := cxHsc.HintStyle.Font.Color;
  cxClbHintFontStyles.EditValue := StyleToEditValue(cxHsc.HintStyle.Font.Style);
  cxFnHinCap.FontName := cxHsc.HintStyle.CaptionFont.Name;
  while not cxFnHinCap.Properties.LoadFontComplete do
    Application.ProcessMessages;
  cxCcbHintCapColor.ColorValue := cxHsc.HintStyle.CaptionFont.Color;
  cxClbHintCapFontStyles.EditValue := StyleToEditValue(cxHsc.HintStyle.CaptionFont.Style);
  cxCcbHintColour.ColorValue := cxHsc.HintStyle.Color;
  cxCbHintRounded.Checked := cxHsc.HintStyle.Rounded;
  cxCbHintCalloutPos.ItemIndex := Ord(cxHsc.HintStyle.CallOutPosition);
  cxSeHintRadius.Value := cxHsc.HintStyle.RoundRadius;
  cxCbHintAniStyle.ItemIndex := Ord(cxHsc.HintStyle.Animate);
  cxSeHintDelay.Value := cxHsc.HintStyle.AnimationDelay;
  cxCbHintIconType.ItemIndex := Ord(cxHsc.HintStyle.IconType);
  cxSeHintHidePause.Value := cxHsc.HintHidePause;
  cxSeHintPause.Value := cxHsc.HintPause;
  cxSeShortHintPause.Value := cxHsc.HintShortPause;
  case Ord(cxHsc.HintStyle.IconSize) of
    0: cxRbHiDef.Checked := True;
    1: cxRbHiLarge.Checked := True;
    2: cxRbHiSmall.Checked := True;
  end;
  cxLbhfSize.ItemIndex := cxLbhFSize.Items.IndexOf(IntToStr(cxHsc.HintStyle.Font.Size));
  cxLbhcfSize.ItemIndex := cxLbhcFSize.Items.IndexOf(IntToStr(cxHsc.HintStyle.CaptionFont.Size));
End;

procedure TcxHintStyleEditor.cxSeHintHidePausePropertiesChange(
  Sender: TObject);
begin
  cxHsc.HintHidePause := cxSeHintHidePause.Value;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxSeHintPausePropertiesChange(
  Sender: TObject);
begin
  cxHsc.HintPause := cxSeHintPause.Value;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxSeShortHintPausePropertiesEditValueChanged(
  Sender: TObject);
begin
  cxHsc.HintShortPause := cxSeShortHintPause.Value;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxClbHintFontStylesClick(Sender: TObject);
  function ValueToStyle(aValue : Integer) : TFontStyles;
  begin
    Result := [];
    if aValue and 1 = 1 then
      Result := [fsBold];
    if aValue and 2 = 2 then
      Result := Result + [fsItalic];
    if aValue and 4 = 4 then
      Result := Result + [fsUnderline];
    if aValue and 8 = 8 then
      Result := Result + [fsStrikeOut];
  end;
begin
  if TcxCheckListBox(Sender).Tag = 0 then
    cxHsc.HintStyle.Font.Style := ValueToStyle(cxClbHintFontStyles.EditValue)
  else
    cxHsc.HintStyle.CaptionFont.Style := ValueToStyle(cxClbHintCapFontStyles.EditValue);
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxCcbHintFontColourClick(Sender: TObject);
begin
  cxHsc.HintStyle.Font.Color := cxCcbHintFontColour.ColorValue;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxCcbHintCapColorClick(Sender: TObject);
begin
  cxHsc.HintStyle.CaptionFont.Color := cxCcbHintCapColor.ColorValue;
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxLbHfSizeClick(Sender: TObject);
begin
  with cxLbHfSize do
    cxHsc.HintStyle.Font.Size := StrToInt(Items[ItemIndex]);
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxLbHcfSizeClick(Sender: TObject);
begin
  with cxLbHcfSize do
    cxHsc.HintStyle.CaptionFont.Size := StrToInt(Items[ItemIndex]);
  RefreshHint;
end;

procedure TcxHintStyleEditor.cxFnHinCapPropertiesChange(
  Sender: TObject);
begin
  GetFontSizes(cxFnHinCap.FontName,cxLbHcfSize.Items);
end;

procedure TcxHintStyleEditor.cxFnHintPropertiesChange(Sender: TObject);
begin
  GetFontSizes(cxFnHint.FontName,cxLbHfSize.Items);
end;

procedure TcxHintStyleEditor.RefreshHint;
begin
  cxHsc.ShowHint(fHintHorz, fHintVert, SHintCaption, SHintText);
end;

procedure TcxHintStyleEditor.WMMove(var Message: TWMMove);
begin
  inherited;
  if fFormLoaded then
  begin
    fHintHorz := pnlPreview.ClientOrigin.X + (pnlPreview.Width div 2 - cxHsc.GetHintWidth(SHintText) div 2);
    fHintVert := pnlPreview.ClientOrigin.Y + (pnlPreview.Height div 2 - cxHsc.GetHintHeight(SHintText) div 2);
    RefreshHint;
  end;
end;

procedure TcxHintStyleEditor.WMActivate(var Message: TWMActivate);
begin
  if TWMActivate(Message).Active = 0 then
    cxHsc.HideHint
  else
    begin
      fHintHorz := pnlPreview.ClientOrigin.X + (pnlPreview.Width div 2 - cxHsc.GetHintWidth(SHintText) div 2);
      fHintVert := pnlPreview.ClientOrigin.Y + (pnlPreview.Height div 2 - cxHsc.GetHintHeight(SHintText) div 2);

      fFormLoaded := True;
      LoadHintCtrls;
    end;
end;

end.
