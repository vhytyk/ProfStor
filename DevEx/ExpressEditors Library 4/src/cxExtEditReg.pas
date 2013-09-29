
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

unit cxExtEditReg;

{$I cxExtEdVer.inc}

interface

uses
  Classes;

procedure Register;

implementation

uses
  SysUtils, cxEditRepositoryEditor, cxExtEditRepositoryItems, cxEditPropEditors,
  {$IFDEF DELPHI6}
  DesignIntf, DesignEditors,
  {$ELSE}
  DsgnIntf,
  {$ENDIF}
  TypInfo, Forms, Controls, Graphics, cxPropEditors, cxClasses, cxContainer,
  ImgList,
  cxProgressBar, cxCheckListBox, cxLabel, cxTrackBar, cxColorComboBox,
  cxFontNameComboBox, cxCheckComboBox, cxTreeView, cxSplitter, cxDBColorComboBox,
  cxDBLabel, cxDBProgressBar, cxGroupBox, cxSpinButton, cxDBTrackBar, cxHint,
  cxMCListBox, cxListView, cxDBCheckListBox, cxDBCheckComboBox, cxExtEditConsts,
  cxHeader, cxDBFontNameComboBox, cxScrollBar, cxSplitterEditor, cxHintEditor,
  cxLookAndFeels;

const
  cxEditorsRestoreStyleCaption = 'Restore style';
  cxEditorsRestoreLookAndFeelCaption = 'Restore LookAndFeel';
  cxEditComponentEditorVerbS: array[0..3] of string = (
    cxEditorsRestoreStyleCaption,
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  cxEditComponentEditorVerbL: array[0..3] of string = (
    cxEditorsRestoreLookAndFeelCaption,
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  cxEditComponentEditorVerbD: array[0..1] of string = (
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  TcxSplitterStyleControllerVerbA: array[0..3] of string = (
    'Splitter Editor...',
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  TcxHintStyleControllerVerbA: array[0..3] of string = (
    'Hints Editor...',
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );

type
  TcxContainerAccess = class(TcxContainer);
  TcxCustomGroupBoxAccess = class(TcxCustomGroupBox);

type
  { TcxHotZoneStyleProperty }
  TcxHotZoneStyleProperty = class(TClassProperty)
  protected
    function HasSubProperties: Boolean;
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  { TcxCustomHeaderComponentEditor }

  TcxCustomHeaderComponentEditor = class(TcxCustomEditControlComponentEditor)
  public
    procedure Edit; override;
  end;

  { TcxSplitterComponentEditor }
  TcxSplitterComponentEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxHintStyleComponentEditor }
  TcxHintStyleComponentEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxHotZoneStyleEventsProperty }
  TcxHotZoneStyleEventsProperty = class(TcxNestedEventProperty)
  protected
    function GetInstance: TPersistent; override;
  end;

{$IFDEF DELPHI5}
  { TcxHeaderSectionImageIndexProperty }
  TcxHeaderSectionImageIndexProperty = class(TImageIndexProperty)
  public
    function GetImages: TImageList; override;
  end;
{$ENDIF}

{ TcxHotZoneStyleProperty }
function TcxHotZoneStyleProperty.HasSubProperties: Boolean;
var
  I: Integer;
begin
  for I := 0 to PropCount - 1 do
  begin
    Result := TcxCustomSplitter(GetComponent(I)).HotZone <> nil;
    if not Result then Exit;
  end;
  Result := True;
end;

function TcxHotZoneStyleProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes;
  if not HasSubProperties then
    Exclude(Result, paSubProperties);
  Result := Result - [paReadOnly] +
    [paValueList, paSortList, paRevertable{$IFDEF DELPHI6}, paVolatileSubProperties{$ENDIF}];
end;

function TcxHotZoneStyleProperty.GetValue: string;
begin
  if HasSubProperties then
    Result := GetRegisteredHotZoneStyles.GetDescriptionByClass(TcxHotZoneStyle(GetOrdValue).ClassType)
  else
    Result := '';
end;

procedure TcxHotZoneStyleProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to GetRegisteredHotZoneStyles.Count - 1 do
    Proc(GetRegisteredHotZoneStyles.Descriptions[I]);
end;

procedure TcxHotZoneStyleProperty.SetValue(const Value: string);
var
  FHotZoneStyleClass: TcxHotZoneStyleClass;
  I: Integer;
begin
  FHotZoneStyleClass := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByClassName(Value));
  if FHotZoneStyleClass = nil then
    FHotZoneStyleClass := TcxHotZoneStyleClass(GetRegisteredHotZoneStyles.FindByDescription(Value));

  for I := 0 to PropCount - 1 do
    TcxCustomSplitter(GetComponent(I)).HotZoneStyleClass := FHotZoneStyleClass;
  Modified;
end;
{ TcxHotZoneStyleProperty }

{ TcxHotZoneStyleEventsProperty }
function TcxHotZoneStyleEventsProperty.GetInstance: TPersistent;
begin
  Result := TcxCustomSplitter(GetComponent(0)).HotZone;
end;
{ TcxHotZoneStyleEventsProperty }

{$IFDEF DELPHI5}
{ TcxHeaderSectionImageIndexProperty }
function TcxHeaderSectionImageIndexProperty.GetImages: TImageList;
begin
  Result := nil;
  if GetComponent(0) is TcxHeaderSection then
    Result := TImageList(TcxHeaderSection(GetComponent(0)).HeaderControl.Images);
end;
{ TcxHeaderSectionImageIndexProperty }
{$ENDIF}

{ TcxCustomHeaderComponentEditor }

procedure TcxCustomHeaderComponentEditor.Edit;
begin
end;

{ TcxSplitterComponentEditor }
procedure TcxSplitterComponentEditor.ExecuteVerb(Index: Integer);
var
  vDes: IDesigner;
  vOwner: string;
  vSplit: TcxSplitter;
begin
  vDes := Designer;
  case Index of
    0:
    begin
      with TcxSplitEditor.Create(Application) do
      try
        vSplit := Component as TcxSplitter;
        if Component.Owner <> nil then
          vOwner := Component.Owner.Name + '.'
        else
          vOwner := '';
        Caption := Format('%s%s - Splitter Control',[vOwner,Component.Name]);
        cxSplit.AllowHotZoneDrag := vSplit.AllowHotZoneDrag;
        cxSplit.AutoPosition := vSplit.AutoPosition;
        cxSplit.AutoSnap := vSplit.AutoSnap;
        cxSplit.PositionAfterOpen := vSplit.PositionAfterOpen;
        cxSplit.ResizeIgnoreSnap := vSplit.ResizeIgnoreSnap;
        cxSplit.MinSize := vSplit.MinSize;
        cxSplit.ResizeUpdate := vSplit.ResizeUpdate;
        if Assigned(vSplit.HotZone) then
        begin
          cxSplit.HotZoneClassName := vSplit.HotZoneClassName;
          cxSplit.HotZone.Assign(vSplit.Hotzone);
        end;
        SetSplitControls;
        if ShowModal = mrOK then
        begin
          vSplit.AllowHotZoneDrag := cxSplit.AllowHotZoneDrag;
          vSplit.AutoPosition := cxSplit.AutoPosition;
          vSplit.AutoSnap := cxSplit.AutoSnap;
          vSplit.PositionAfterOpen := cxSplit.PositionAfterOpen;
          vSplit.ResizeIgnoreSnap := cxSplit.ResizeIgnoreSnap;
          vSplit.MinSize := cxSplit.MinSize;
          vSplit.ResizeUpdate := cxSplit.ResizeUpdate;
          if Assigned(cxSplit.HotZone) then
          begin
            vSplit.HotZoneClassName := cxSplit.HotZoneClassName;
            vSplit.HotZone.Assign(cxSplit.HotZone);
          end;
          vDes.Modified;
        end;
      finally
        Free;
      end;
    end;
  end;
end;

function TcxSplitterComponentEditor.GetVerb(Index: Integer): string;
begin
  Result := TcxSplitterStyleControllerVerbA[Index];
end;

function TcxSplitterComponentEditor.GetVerbCount: Integer;
begin
  Result := Length(TcxSplitterStyleControllerVerbA);
end;
{ TcxSplitterComponentEditor }

{ TcxHintStyleComponentEditor }
procedure TcxHintStyleComponentEditor.ExecuteVerb(Index: Integer);
var
  FOwnerCaption: string;
  FSavedAppOnShowHint: TShowHintEvent;
begin
  case Index of
    0:
    begin
      FSavedAppOnShowHint := Application.OnShowHint;
      with TcxHintStyleEditor.Create(Application) do
      try
        HintController := Component as TcxHintStyleController;
        if Component.Owner <> nil then
          FOwnerCaption := Component.Owner.Name + '.'
        else
          FOwnerCaption := '';

        Caption := Format('%s%s - Hint Editor',[FOwnerCaption, Component.Name]);

        if ShowModal = mrOK then
        begin
          (Component as TcxHintStyleController).Assign(cxHsc);
          Self.Designer.Modified;
        end;

        HintController.HideHint;
      finally
        Application.OnShowHint := FSavedAppOnShowHint;
        Free;
      end;
    end;
  end;
end;

function TcxHintStyleComponentEditor.GetVerb(Index: Integer): string;
begin
  Result := TcxHintStyleControllerVerbA[Index];
end;

function TcxHintStyleComponentEditor.GetVerbCount: Integer;
begin
  Result := Length(TcxHintStyleControllerVerbA);
end;
{ TcxHintStyleComponentEditor }

procedure RegisterEditRepositoryItems;
begin
  RegisterEditRepositoryItem(TcxEditRepositoryLabel, scxSEditRepositoryLabelItem);
  RegisterEditRepositoryItem(TcxEditRepositoryFontNameComboBox, scxSEditRepositoryFontNameComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryColorComboBox, scxSEditRepositoryColorComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryProgressBar, scxSEditRepositoryProgressBarItem);
  RegisterEditRepositoryItem(TcxEditRepositoryTrackBar, scxSEditRepositoryTrackBarItem);
  RegisterEditRepositoryItem(TcxEditRepositorySpinButton, scxSEditRepositorySpinButtonItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCheckComboBox, scxSEditRepositoryCheckComboBox);
end;

procedure UnregisterEditRepositoryItems;
begin
  UnregisterEditRepositoryItem(TcxEditRepositoryLabel);
  UnregisterEditRepositoryItem(TcxEditRepositoryFontNameComboBox);
  UnregisterEditRepositoryItem(TcxEditRepositoryColorComboBox);
  UnregisterEditRepositoryItem(TcxEditRepositoryProgressBar);
  UnregisterEditRepositoryItem(TcxEditRepositoryTrackBar);
  UnregisterEditRepositoryItem(TcxEditRepositorySpinButton);
  UnregisterEditRepositoryItem(TcxEditRepositoryCheckComboBox);
end;

procedure Register;
begin
  RegisterComponents('Express Editors 4', [TcxLabel, TcxProgressBar, TcxTrackBar,
                     TcxCheckListBox, TcxColorComboBox, TcxFontNameComboBox,
                     TcxCheckComboBox]);

  RegisterComponents('Express DBEditors 4', [TcxDBColorComboBox, TcxDBLabel,
                     TcxDBProgressBar, TcxDBTrackBar, TcxDBCheckListBox,
                     TcxDBCheckComboBox, TcxDBFontNameComboBox]);

  RegisterComponents('Express Utilities', [TcxGroupBox, TcxSpinButton,
                     TcxHintStyleController, TcxMCListBox, TcxTreeView,
                     TcxSplitter, TcxListView, TcxHeader]);

  RegisterPropertyEditor(TypeInfo(string), TcxCustomSplitter, 'HotZoneClassName', nil);
  RegisterPropertyEditor(TypeInfo(TcxHotZoneStyle), TcxCustomSplitter, 'HotZone', TcxHotZoneStyleProperty);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomSplitter, 'HotZoneEvents', TcxHotZoneStyleEventsProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxCustomColorComboBoxProperties, 'PrepareInfo', nil);

{$IFDEF DELPHI5}
  RegisterPropertyEditor(TypeInfo(TImageIndex), TcxHeaderSection, 'ImageIndex', TcxHeaderSectionImageIndexProperty);
{$ENDIF}

  RegisterComponentEditor(TcxCheckListBox, TcxContainerComponentEditor);
  RegisterComponentEditor(TcxDBCheckListBox, TcxContainerComponentEditor);
  RegisterComponentEditor(TcxCustomGroupBox, TcxCustomEditControlComponentEditor);
  RegisterComponentEditor(TcxMCListBox, TcxContainerComponentEditor);
  RegisterComponentEditor(TcxTreeView, TcxContainerComponentEditor);
  RegisterComponentEditor(TcxListView, TcxContainerComponentEditor);
  RegisterComponentEditor(TcxCustomHeader, TcxCustomHeaderComponentEditor);
  RegisterComponentEditor(TcxSplitter, TcxSplitterComponentEditor);
  RegisterComponentEditor(TcxHintStyleController, TcxHintStyleComponentEditor);
end;

initialization
  RegisterEditRepositoryItems;

finalization
  UnregisterEditRepositoryItems;

end.
