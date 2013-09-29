
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

unit cxEditReg;

{$I cxEdVer.inc}

interface

uses
  Classes, cxEdit;

procedure Register;

implementation

uses
  cxEditPropEditors,
{$IFDEF DELPHI6}
  DesignEditors, DesignIntf,
  {$IFDEF VCL}
    VCLEditors,
  {$ELSE}
    QTypes,
  {$ENDIF}
{$ELSE}
  DsgnIntf,
{$ENDIF}
{$IFDEF WIN32}
  DBReg, Windows,
{$ENDIF}
  ImgList, Controls, DB,
  cxBlobEdit, cxButtonEdit, cxButtons, cxCalc, cxCalendar, cxCheckBox, cxCurrencyEdit,
  cxDBEdit, cxDBEditRepository, cxDBLookupComboBox, cxDropDownEdit,
  cxEditConsts, cxEditRepositoryItems, cxEditRepositoryEditor, cxGraphics,
  cxHyperLinkEdit, cxImage, cxImageComboBox, cxLookupDBGrid, cxLookupGrid, cxMaskEdit,
  cxMemo, cxMRUEdit, cxListBox,
  cxPropEditors, cxRadioGroup, cxSpinEdit, cxTextEdit, cxTimeEdit, cxNavigator, cxDB,
  cxContainer, cxDBNavigator;

type
  TcxLookupComboBoxPropertiesFieldNameProperty = class(TFieldNameProperty)
    function GetDataSourcePropName: string; override;
  end;

function TcxLookupComboBoxPropertiesFieldNameProperty.GetDataSourcePropName: string;
begin
  Result := 'ListSource';
end;

type
  TcxLookupDBGridColumnAccess = class(TcxLookupDBGridColumn);

  TcxLookupDBGridColumnFieldNameProperty = class(TFieldNameProperty)
  public
    function GetDataSource: TDataSource; override;
  end;

function TcxLookupDBGridColumnFieldNameProperty.GetDataSource: TDataSource;
begin
  Result := TcxLookupDBGridColumnAccess(GetComponent(0) as TcxLookupDBGridColumn).DataController.DataSource;
end;

procedure RegisterEditRepositoryItems;
begin
  RegisterEditRepositoryItem(TcxEditRepositoryTextItem, scxSEditRepositoryTextItem);
  RegisterEditRepositoryItem(TcxEditRepositoryButtonItem, scxSEditRepositoryButtonItem);
  RegisterEditRepositoryItem(TcxEditRepositoryImageItem, scxSEditRepositoryImageItem);
  RegisterEditRepositoryItem(TcxEditRepositoryComboBoxItem, scxSEditRepositoryComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMaskItem, scxSEditRepositoryMaskItem);
  RegisterEditRepositoryItem(TcxEditRepositoryPopupItem, scxSEditRepositoryPopupItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCalcItem, scxSEditRepositoryCalcItem);
  RegisterEditRepositoryItem(TcxEditRepositoryDateItem, scxSEditRepositoryDateItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCurrencyItem, scxSEditRepositoryCurrencyItem);
  RegisterEditRepositoryItem(TcxEditRepositorySpinItem, scxSEditRepositorySpinItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMemoItem, scxSEditRepositoryMemoItem);
  RegisterEditRepositoryItem(TcxEditRepositoryImageComboBoxItem, scxSEditRepositoryImageComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryBlobItem, scxSEditRepositoryBlobItem);
  RegisterEditRepositoryItem(TcxEditRepositoryCheckBoxItem, scxSEditRepositoryCheckBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryTimeItem, scxSEditRepositoryTimeItem);
  RegisterEditRepositoryItem(TcxEditRepositoryMRUItem, scxSEditRepositoryMRUItem);
  RegisterEditRepositoryItem(TcxEditRepositoryHyperLinkItem, scxSEditRepositoryHyperLinkItem);
  RegisterEditRepositoryItem(TcxEditRepositoryLookupComboBoxItem, scxSEditRepositoryLookupComboBoxItem);
  RegisterEditRepositoryItem(TcxEditRepositoryRadioGroupItem, scxSEditRepositoryRadioGroupItem);
end;

procedure Register;
begin
  RegisterComponents('Express Editors 4', [TcxTextEdit, TcxMaskEdit, TcxMemo, TcxDateEdit,
    TcxButtonEdit, TcxCheckBox, TcxComboBox, TcxImageComboBox, TcxSpinEdit,
    TcxCalcEdit, TcxHyperLinkEdit, TcxTimeEdit, TcxCurrencyEdit, TcxImage, TcxBlobEdit,
    TcxMRUEdit, TcxPopupEdit, TcxLookupComboBox, TcxEditStyleController, TcxEditRepository,
    TcxButton, TcxRadioButton, TcxRadioGroup, TcxListBox, TcxNavigator]);
  RegisterComponents('Express DBEditors 4', [TcxDBTextEdit, TcxDBMaskEdit, TcxDBMemo, TcxDBDateEdit,
    TcxDBButtonEdit, TcxDBCheckBox, TcxDBComboBox, TcxDBImageComboBox, TcxDBSpinEdit,
    TcxDBCalcEdit, TcxDBHyperLinkEdit, TcxDBTimeEdit, TcxDBCurrencyEdit, TcxDBImage, TcxDBBlobEdit,
    TcxDBMRUEdit, TcxDBPopupEdit, TcxDBLookupComboBox, TcxDBRadioGroup, TcxDBListBox, TcxDBNavigator]);

  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomEdit, 'PropertiesEvents', TcxEditPropertiesEventEditor);
  RegisterPropertyEditor(TypeInfo(TcxEditRepositoryItem), TcxCustomEdit,
    'RepositoryItem', TcxEditRepositoryItemProperty);

{$IFDEF WIN32}
  RegisterPropertyEditor(TypeInfo(string), TcxEditDataBinding, 'DataField', TDataFieldProperty);
{$ELSE}
  RegisterPropertyEditor(TypeInfo(string), TcxEditDataBinding, 'DataField', TFieldNameProperty);
{$ENDIF}

{$IFDEF WIN32}
  RegisterPropertyEditor(TypeInfo(string), TcxCustomDBDataBinding, 'DataField',
    TDataFieldProperty);
{$ELSE}
  RegisterPropertyEditor(TypeInfo(string), TcxCustomDBDataBinding, 'DataField',
    TFieldNameProperty);
{$ENDIF}

  {$IFDEF VCL}
  RegisterPropertyEditor(TypeInfo(TShortCut), TcxCustomEditProperties, 'ClickKey', TShortCutProperty);
  RegisterPropertyEditor(TypeInfo(TShortCut), TcxCustomHyperLinkEditProperties, 'StartKey', TShortCutProperty);
  RegisterPropertyEditor(TypeInfo(TShortCut), TcxLookupComboBoxProperties, 'ClearKey', TShortCutProperty);
  {$ENDIF}

{$IFDEF DELPHI5}
  {$IFDEF VCL}
    RegisterPropertyEditor(TypeInfo(TImageIndex), TcxImageComboBoxProperties, 'DefaultImageIndex', TcxGEPropertiesImageIndexProperty);
    RegisterPropertyEditor(TypeInfo(TImageIndex), TcxImageComboBoxItem, 'ImageIndex', TcxGEItemImageIndexProperty);
  {$ENDIF}
{$ENDIF}
  RegisterPropertyEditor(TypeInfo(string), TcxImageProperties, 'GraphicClassName', TGraphicClassNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxImageProperties, 'Caption', TCaptionProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxBlobEditProperties, 'PictureGraphicClassName', TGraphicClassNameProperty);

  RegisterComponentEditor(TcxCustomEdit, TcxEditComponentEditor);
  RegisterComponentEditor(TcxEditStyleController, TcxEditStyleControllerEditor);
  RegisterComponentEditor(TcxButton, TcxButtonComponentEditor);

  RegisterComponentEditor(TcxEditRepository, TcxEditRepositoryComponentEditor);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxEditRepositoryItem, 'PropertiesEvents', TcxEditRepositoryItemPropertiesEventEditor);
  RegisterClasses([TcxEditRepositoryItem, TcxEditRepositoryTextItem, TcxEditRepositoryButtonItem]);
  RegisterNoIcon([TcxEditRepositoryItem, TcxEditRepositoryTextItem, TcxEditRepositoryButtonItem]);

  RegisterEditRepositoryItems;

  RegisterPropertyEditor(TypeInfo(TcxEditMask), TcxCustomMaskEditProperties, 'EditMask', TcxEditMaskProperty);
  RegisterPropertyEditor(TypeInfo(TCaption), TcxCustomMaskEdit, 'Text', TcxTextProperty);

  RegisterPropertyEditor(TypeInfo(TCaption), TcxBlobEdit, 'Text', TCaptionProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxLookupComboBoxProperties, 'KeyFieldNames', TcxLookupComboBoxPropertiesFieldNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TcxLookupComboBoxProperties, 'ListFieldNames', TcxLookupComboBoxPropertiesFieldNameProperty);

  RegisterPropertyEditor(TypeInfo(string), TcxLookupDBGridColumn, 'FieldName', TcxLookupDBGridColumnFieldNameProperty);
 {$IFDEF DELPHI6}
  RegisterSelectionEditor(TcxCustomButton, TcxButtonSelectionEditor);
 {$ENDIF}

  RegisterPropertyEditor(TypeInfo(TComponent), TcxCustomNavigatorControl,
    'Control', TcxNavigatorControlProperty);
  RegisterPropertyEditor(TypeInfo(TNotifyEvent), TcxCustomNavigator, 'ButtonsEvents', TcxNavigatorButtonsEventEditor);
  RegisterComponentEditor(TcxRadioButton, TcxRadioButtonComponentEditor);
  RegisterComponentEditor(TcxCustomNavigator, TcxCustomEditControlComponentEditor);
  RegisterComponentEditor(TcxContainer, TcxContainerComponentEditor);

//  RegisterPropertyEditor(TypeInfo(TcxEditStyleValues), TcxCustomEditStyle,
//    'AssignedValues', TcxEditStyleAssignedValuesProperty);
end;

end.
