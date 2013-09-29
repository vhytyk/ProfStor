
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

unit cxEditPropEditors;

{$I cxEdVer.inc}

interface

uses
{$IFDEF DELPHI6}
  DesignEditors, DesignIntf,
  {$IFDEF VCL}
    VCLEditors,
  {$ENDIF}
{$ELSE}
  DsgnIntf,
{$ENDIF}
{$IFDEF WIN32}
   DBReg, Windows,
{$ENDIF}
  {$IFDEF DELPHI6}
  Types,
  {$ENDIF}
  Classes, Controls, DB, Graphics, cxContainer, cxEditRepositoryItems, cxEdit,
  cxLookAndFeels, cxPropEditors;

const
  cxEditorsCaption1 = 'ExpressEditors Library v4.5';
  cxEditorsCaption2 = 'www.devexpress.com';

type
  { TDBStringProperty }
  
  TDBStringProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(AList: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  { TFieldNameProperty }
  
  TFieldNameProperty = class(TDBStringProperty)
  public
    function GetDataSource: TDataSource; virtual;
    function GetDataSourcePropName: string; virtual;
    procedure GetValueList(AList: TStrings); override;
  end;

  { TcxEditComponentEditor }

  TcxEditComponentEditor = class(TComponentEditor)
  private
    function GetEdit: TcxCustomEdit;
  public
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxEditStyleControllerEditor }

  TcxEditStyleControllerEditor = class(TComponentEditor)
  public
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxEditRepositoryItemProperty }

  TcxEditRepositoryItemProperty = class(TComponentProperty)
  private
    FStrProc: TGetStrProc;
    procedure StrProc(const S: string);
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

{$IFDEF WIN32}
  { TcxLookupEditListSourceProperty }

  TcxLookupEditListSourceProperty = class(TDataFieldProperty)
  public
    function GetDataSourcePropName: string; override;
  end;
{$ENDIF}

  { TcxEditPropertiesEventEditor }

  TcxEditPropertiesEventEditor = class(TcxNestedEventProperty)
  public
    function GetInstance: TPersistent; override;
    function GetName: string; override;
  end;

  { TcxEditRepositoryItemPropertiesEventEditor }

  TcxEditRepositoryItemPropertiesEventEditor = class(TcxNestedEventProperty)
  public
    function GetInstance: TPersistent; override;
    function GetName: string; override;
  end;

  { TcxNavigatorButtonsEventEditor }

  TcxNavigatorButtonsEventEditor = class(TcxNestedEventProperty)
  public
    function GetInstance: TPersistent; override;
    function GetName: string; override;
  end;

{$IFDEF DELPHI5}
  {$IFDEF VCL}
    { TCustomImageIndexProperty }

    TImageIndexProperty = class(TIntegerProperty{$IFDEF DELPHI6}, ICustomPropertyListDrawing{$ENDIF})
    public
      function GetImages: TImageList; virtual; abstract;
      function GetAttributes: TPropertyAttributes; override;
      function GetValue: string; override;
      procedure GetValues(Proc: TGetStrProc); override;
      procedure SetValue(const Value: string); override;
      procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
        var AHeight: Integer); {$IFDEF DELPHI6}virtual{$ELSE}override{$ENDIF};
      procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
        var AWidth: Integer); {$IFDEF DELPHI6}virtual{$ELSE}override{$ENDIF};
      procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
        const ARect: TRect; ASelected: Boolean); {$IFDEF DELPHI6}virtual{$ELSE}override{$ENDIF};
    end;

    { TcxGEPropertiesImageIndexProperty }

    TcxGEPropertiesImageIndexProperty = class(TImageIndexProperty)
    public
      function GetImages: TImageList; override;
    end;

    { TcxGEItemImageIndexProperty }

    TcxGEItemImageIndexProperty = class(TImageIndexProperty)
    public
      function GetImages: TImageList; override;
    end;
  {$ENDIF}
{$ENDIF}

  { TcxEditRepositoryComponentEditor }

  TcxEditRepositoryComponentEditor = class(TComponentEditor)
  private
    function GetEditRepository: TcxEditRepository;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxEditMaskProperty }

  TcxEditMaskProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  { TcxTextProperty }

  TcxTextProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  { TGraphicClassNameProperty }

  TGraphicClassNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

{$IFNDEF VCL}
  { TCaptionProperty }

  TCaptionProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
  end;
{$ENDIF}

{$IFDEF DELPHI6}
  TcxButtonSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;
{$ENDIF}

  { TcxFilterControlComponentEditor }

  TcxFilterControlComponentEditor = class(TDefaultEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxNavigatorControlProperty }

  TcxNavigatorControlProperty = class(TComponentProperty)
  private
    FStrProc: TGetStrProc;
    procedure StrProc(const S: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  { TcxCustomEditControlComponentEditor }

  TcxCustomEditControlComponentEditor = class(TComponentEditor)
  protected
    function GetLookAndFeel: TcxLookAndFeel; virtual;
    function GetStyle: TcxContainerStyle; virtual; abstract;
    function HasStyle: Boolean; virtual;
  public
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxButtonComponentEditor }

  TcxButtonComponentEditor = class(TcxCustomEditControlComponentEditor)
  protected
    function GetLookAndFeel: TcxLookAndFeel; override;
  end;

  { TcxRadioButtonComponentEditor }

  TcxRadioButtonComponentEditor = class(TcxCustomEditControlComponentEditor)
  protected
    function GetLookAndFeel: TcxLookAndFeel; override;
  end;

  { TcxContainerComponentEditor }

  TcxContainerComponentEditor = class(TcxCustomEditControlComponentEditor)
  protected
    function GetStyle: TcxContainerStyle; override;
    function HasStyle: Boolean; override;
  end;

implementation

uses
  SysUtils, cxEditRepositoryEditor, cxImage, cxMaskEdit, Forms, cxImageComboBox,
  cxEditMaskEditor, cxMaskEditTextEditor, TypInfo, 
  cxNavigator, cxRadioGroup, cxListBox, cxButtons, cxControls;

const
  cxEditComponentEditorVerbA: array[0..4] of string = (
    'Restore properties',
    'Restore style',
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  cxEditStyleControllerEditorVerbA: array[0..3] of string = (
    'Restore style',
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  cxEditRepositoryEditorVerbA: array[0..3] of string = (
    'Edit...',
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );
  cxButtonEditorVerbA: array[0..1] of string = (
    cxEditorsCaption1,
    cxEditorsCaption2
  );

  cxFilterControlEditorVerbA: array[0..1] of string = (
    cxEditorsCaption1,
    cxEditorsCaption2
  );

  cxCustomEditControlEditorVerbA: array[0..4] of string = (
    'Restore LookAndFeel',
    'Restore Style',
    '-',
    cxEditorsCaption1,
    cxEditorsCaption2
  );

type
  TcxContainerAccess = class(TcxContainer);
  TcxControlAccess = class(TcxControl);
  TcxCustomButtonAccess = class(TcxCustomButton);
  TcxCustomEditAccess = class(TcxCustomEdit);
  TcxCustomEditPropertiesAccess = class(TcxCustomEditProperties);
  TcxCustomNavigatorAccess = class(TcxCustomNavigator);

function TDBStringProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDBStringProperty.GetValueList(AList: TStrings);
begin
end;

procedure TDBStringProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for I := 0 to Values.Count - 1 do Proc(Values[I]);
  finally
    Values.Free;
  end;
end;

{$IFNDEF DELPHI5}

// TODO: cxDBData.pas (GetObjectProp already exist)
function GetObjectProp(Instance: TObject; const PropName: string): TObject;
var
  PropInfo: PPropInfo;
begin
  Result := nil;
  PropInfo := TypInfo.GetPropInfo(Instance.ClassInfo, PropName);
  if (PropInfo <> nil) and (PropInfo^.PropType^.Kind = tkClass) then
    Result := TObject(GetOrdProp(Instance, PropInfo));
end;

{$ENDIF}

function TFieldNameProperty.GetDataSource: TDataSource;
begin
  Result := GetObjectProp(GetComponent(0), GetDataSourcePropName) as TDataSource;
end;

function TFieldNameProperty.GetDataSourcePropName: string;
begin
  Result := 'DataSource';
end;

procedure TFieldNameProperty.GetValueList(AList: TStrings);
var
  ADataSource: TDataSource;
begin
  ADataSource := GetDataSource;
  if (ADataSource <> nil) and (ADataSource.DataSet <> nil) then
    ADataSource.DataSet.GetFieldNames(AList);
end;

{ TcxEditComponentEditor }

type
  TcxEditTypeInfo = record
    Kind: TTypeKind;
    Name: ShortString;
    TypeData: TTypeData;
  end;

procedure TcxEditComponentEditor.Edit;
var
  AEdit: TcxCustomEditAccess;
  AHasInnerEdit: Boolean;
  AMethod: TMethod;
  AMethodNamePrefix: string;
  AMethodParamFlags: TParamFlags;
  APTypeData: PTypeData;
  ATypeInfo: TcxEditTypeInfo;
  P: PChar;
  S: ShortString;
begin
  AEdit := TcxCustomEditAccess(Component);
  AMethodNamePrefix := Component.Name;
  AHasInnerEdit := AEdit.GetInnerEditClass <> nil;
  if AHasInnerEdit then
    AMethodNamePrefix := AMethodNamePrefix + 'PropertiesChange'
  else
    AMethodNamePrefix := AMethodNamePrefix + 'Click';

  if not Designer.MethodExists(AMethodNamePrefix) then
  begin
    ATypeInfo.Kind := tkMethod;
    ATypeInfo.Name := AMethodNamePrefix;

    APTypeData := @ATypeInfo.TypeData;
    APTypeData^.MethodKind := mkProcedure;
    APTypeData^.ParamCount := 1;

    AMethodParamFlags := [pfReference];
    P := @APTypeData^.ParamList;
    Move(AMethodParamFlags, P^, SizeOf(AMethodParamFlags));
    Inc(P, SizeOf(AMethodParamFlags));
    S := 'Sender';
    Move(S[0], P^, Length(S) + 1);
    Inc(P, Length(S) + 1);
    S := 'TObject';
    Move(S[0], P^, Length(S) + 1);

    AMethod := Designer.CreateMethod(AMethodNamePrefix, APTypeData);
    {$IFDEF DELPHI5}
    if AHasInnerEdit then
      SetMethodProp(AEdit.Properties, 'OnChange', AMethod)
    else
      SetMethodProp(AEdit, 'OnClick', AMethod);
    {$ELSE}
    if AHasInnerEdit then
      SetMethodProp(AEdit.Properties,
        GetPropInfo(PTypeInfo(AEdit.Properties.ClassInfo), 'OnChange'), AMethod)
    else
      SetMethodProp(AEdit, GetPropInfo(PTypeInfo(AEdit.ClassInfo),
        'OnClick'), AMethod);
    {$ENDIF}  
    Designer.Modified;
  end;
  Designer.ShowMethod(AMethodNamePrefix);
end;

procedure TcxEditComponentEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: TcxCustomEditAccess(GetEdit).Properties.RestoreDefaults;
    1: TcxCustomEditAccess(GetEdit).Style.RestoreDefaults;
  end;
  Designer.Modified;
end;

function TcxEditComponentEditor.GetVerb(Index: Integer): string;
begin
  Result := cxEditComponentEditorVerbA[Index];
end;

function TcxEditComponentEditor.GetVerbCount: Integer;
begin
  Result := Length(cxEditComponentEditorVerbA);
end;

function TcxEditComponentEditor.GetEdit: TcxCustomEdit;
begin
  Result := Component as TcxCustomEdit;
end;

{ TcxEditStyleControllerEditor }

procedure TcxEditStyleControllerEditor.Edit;
var
  AMethod: TMethod;
  AMethodName: string;
  AMethodParamFlags: TParamFlags;
  APTypeData: PTypeData;
  AStyleController: TcxStyleController;
  ATypeInfo: TcxEditTypeInfo;
  P: PChar;
  S: ShortString;
begin
  AMethodName := Component.Name + 'StyleChanged';
  if not Designer.MethodExists(AMethodName) then
  begin
    ATypeInfo.Kind := tkMethod;
    ATypeInfo.Name := AMethodName;

    APTypeData := @ATypeInfo.TypeData;
    APTypeData^.MethodKind := mkProcedure;
    APTypeData^.ParamCount := 2;

    P := @APTypeData^.ParamList;

    AMethodParamFlags := [pfReference];
    Move(AMethodParamFlags, P^, SizeOf(AMethodParamFlags));
    Inc(P, SizeOf(AMethodParamFlags));
    S := 'Sender';
    Move(S[0], P^, Length(S) + 1);
    Inc(P, Length(S) + 1);
    S := 'TObject';
    Move(S[0], P^, Length(S) + 1);
    Inc(P, Length(S) + 1);

    Move(AMethodParamFlags, P^, SizeOf(AMethodParamFlags));
    Inc(P, SizeOf(AMethodParamFlags));
    S := 'AStyle';
    Move(S[0], P^, Length(S) + 1);
    Inc(P, Length(S) + 1);
    S := 'TcxCustomContainerStyle';
    Move(S[0], P^, Length(S) + 1);

    AMethod := Designer.CreateMethod(AMethodName, APTypeData);
    AStyleController := TcxStyleController(Component);
    {$IFDEF DELPHI5}
    SetMethodProp(AStyleController, 'OnStyleChanged', AMethod);
    {$ELSE}
    SetMethodProp(AStyleController, GetPropInfo(PTypeInfo(AStyleController.ClassInfo),
      'OnStyleChanged'), AMethod);
    {$ENDIF}
    Designer.Modified;
  end;
  Designer.ShowMethod(AMethodName);
end;

procedure TcxEditStyleControllerEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then
    with TcxEditStyleController(Component).Style do
      if AssignedValues <> [] then
      begin
        RestoreDefaults;
        Designer.Modified;
      end;
end;

function TcxEditStyleControllerEditor.GetVerb(Index: Integer): string;
begin
  Result := cxEditStyleControllerEditorVerbA[Index];
end;

function TcxEditStyleControllerEditor.GetVerbCount: Integer;
begin
  Result := Length(cxEditStyleControllerEditorVerbA);
end;

{ TcxEditRepositoryItemProperty }

function TcxEditRepositoryItemProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes;
  {$IFDEF DELPHI6}
  if TcxCustomEditAccess(GetComponent(0)).RepositoryItem <> nil then
    Include(Result, paNotNestable);
  {$ENDIF}
end;

procedure TcxEditRepositoryItemProperty.GetValues(Proc: TGetStrProc);
begin
  FStrProc := Proc;
  Designer.GetComponentNames(GetTypeData(GetPropType), StrProc);
end;

procedure TcxEditRepositoryItemProperty.StrProc(const S: string);
var
  I: Integer;
  ARepositoryItemAcceptable: Boolean;
begin
  ARepositoryItemAcceptable := True;
  for I := 0 to PropCount - 1 do
  if not TcxCustomEditAccess(GetComponent(I)).IsRepositoryItemAcceptable(TcxEditRepositoryItem(Designer.GetComponent(S))) then
  begin
    ARepositoryItemAcceptable := False;
    Break;
  end;
  if ARepositoryItemAcceptable then
    FStrProc(S);
end;

{$IFDEF WIN32}
{ TcxLookupEditListSourceProperty }

function TcxLookupEditListSourceProperty.GetDataSourcePropName: string;
begin
  Result := 'ListSource';
end;
{$ENDIF}

{ TcxEditPropertiesEventEditor }

function TcxEditPropertiesEventEditor.GetInstance: TPersistent;
begin
  Result := TcxCustomEditAccess(GetComponent(0)).Properties;
end;

function TcxEditPropertiesEventEditor.GetName: string;
begin
  Result := 'Properties';
end;

{ TcxEditRepositoryItemPropertiesEventEditor }

function TcxEditRepositoryItemPropertiesEventEditor.GetInstance: TPersistent;
begin
  Result := TcxEditRepositoryItem(GetComponent(0)).Properties;
end;

function TcxEditRepositoryItemPropertiesEventEditor.GetName: string;
begin
  Result := 'Properties';
end;

  { TcxNavigatorButtonsEventEditor }

function TcxNavigatorButtonsEventEditor.GetInstance: TPersistent;
begin
  Result := TcxCustomNavigatorAccess(GetComponent(0)).CustomButtons;
end;

function TcxNavigatorButtonsEventEditor.GetName: string;
begin
  Result := 'Buttons';
end;

{$IFDEF DELPHI5}
{$IFDEF VCL}
function TImageIndexProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paRevertable];
end;

function TImageIndexProperty.GetValue: string;
begin
  Result := IntToStr(GetOrdValue);
end;

procedure TImageIndexProperty.GetValues(Proc: TGetStrProc);
var i: Integer;
begin
  if GetImages <> nil then
    for i := 0 to GetImages.Count-1 do Proc(IntToStr(i));
end;

procedure TImageIndexProperty.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  AImageWidth: Integer;
begin
  with ACanvas do
  begin
    Brush.Style := bsSolid;
    if ASelected then Brush.Color := clHighlight else Brush.Color := clWindow;
    FillRect(ARect);
    if ASelected then DrawFocusRect(ARect);
    if GetImages <> nil then
      AImageWidth := GetImages.Width
    else
      AImageWidth := 0;
    if GetImages <> nil then
      GetImages.Draw(ACanvas, ARect.Left, ARect.Top, StrToInt(value));
    TextOut(ARect.Left + AImageWidth + 2, ARect.Top, Value);
  end;
end;

procedure TImageIndexProperty.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
var
  AImageHeight, AStringHeight: Integer;
begin
  AStringHeight := ACanvas.Textheight(Value);
  if GetImages <> nil then
    AImageHeight := GetImages.Height
  else
    AImageheight := 0;
  if AStringHeight > AImageHeight then
    AHeight := AStringHeight
  else
    AHeight := AImageHeight;
end;

procedure TImageIndexProperty.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
var
  AImageWidth, AStringWidth: Integer;
begin
  AStringWidth := ACanvas.TextWidth(Value);
  if GetImages <> nil then
    AImageWidth  := GetImages.Width
  else
    AImageWidth := 0;
  AWidth := AStringWidth + AImageWidth + 4;
end;

procedure TImageIndexProperty.SetValue(const Value: string);
begin
  SetOrdValue(StrToInt(Value));
end;

{ TcxGEPropertiesImageIndexProperty }

function TcxGEPropertiesImageIndexProperty.GetImages: TImageList;
begin
  Result := nil;
  if GetComponent(0) is TcxImageComboBoxProperties then
    Result := TcxImageComboBoxProperties(GetComponent(0)).Images;
end;

{ TcxGEItemImageIndexProperty }

function TcxGEItemImageIndexProperty.GetImages: TImageList;
begin
  Result := nil;
  if GetComponent(0) is TcxImageComboBoxItem then
  begin
    Result := TcxImageComboBoxProperties(TcxImageComboBoxItems(
      TcxImageComboBoxItem(GetComponent(0)).Collection).Owner).LargeImages;
    if Result = nil then
      Result := TcxImageComboBoxProperties(TcxImageComboBoxItems(
        TcxImageComboBoxItem(GetComponent(0)).Collection).Owner).Images;
  end;
end;
{$ENDIF}
{$ENDIF}

{ TcxEditRepositoryComponentEditor }

procedure TcxEditRepositoryComponentEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowEditRepositoryEditor(Designer, GetEditRepository);
  end;
end;

function TcxEditRepositoryComponentEditor.GetVerb(Index: Integer): string;
begin
  Result := cxEditRepositoryEditorVerbA[Index];
end;

function TcxEditRepositoryComponentEditor.GetVerbCount: Integer;
begin
  Result := Length(cxEditRepositoryEditorVerbA);
end;

function TcxEditRepositoryComponentEditor.GetEditRepository: TcxEditRepository;
begin
  Result := Component as TcxEditRepository
end;

{ TcxEditMaskProperty }

function TcxEditMaskProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TcxEditMaskProperty.Edit;
var
  ADialog: TcxEditMaskEditorDlg;
begin
  ADialog := TcxEditMaskEditorDlg.Create(Application);
  try
    ADialog.MaskEditProperties := TcxCustomMaskEditProperties(GetComponent(0));
    ADialog.ShowModal;
  finally
    ADialog.Free;
  end;
end;

{ TcxTextProperty }

function TcxTextProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TcxTextProperty.Edit;
var
  ADialog: TcxMaskEditTextEditorDlg;
begin
  ADialog := TcxMaskEditTextEditorDlg.Create(Application);
  try
    ADialog.MaskEdit := TcxCustomMaskEdit(GetComponent(0));
    ADialog.ShowModal;
  finally
    ADialog.Free;
  end;
end;

{ TGraphicClassNameProperty }

function TGraphicClassNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paRevertable];
end;

procedure TGraphicClassNameProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for i := 0 to GetRegisteredGraphicClasses.Count - 1 do
    Proc(TClass(GetRegisteredGraphicClasses[I]).ClassName);
end;

{$IFNDEF VCL}
{ TCaptionProperty }

function TCaptionProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paAutoUpdate];
end;
{$ENDIF}

{$IFDEF DELPHI6}
{ TcxButtonSelectionEditor }

procedure TcxButtonSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
{$IFDEF VCL}
  Proc('cxLookAndFeelPainters');
{$ELSE}
  Proc('QcxLookAndFeelPainters');
{$ENDIF}
end;
{$ENDIF}

{ TcxFilterControlComponentEditor }

procedure TcxFilterControlComponentEditor.ExecuteVerb(Index: Integer);
begin
end;

function TcxFilterControlComponentEditor.GetVerb(Index: Integer): string;
begin
  Result := cxFilterControlEditorVerbA[Index];
end;

function TcxFilterControlComponentEditor.GetVerbCount: Integer;
begin
  Result := Length(cxFilterControlEditorVerbA);
end;

{ TcxNavigatorControlProperty }

procedure TcxNavigatorControlProperty.GetValues(Proc: TGetStrProc);
begin
  FStrProc := Proc;
  Designer.GetComponentNames(GetTypeData(GetPropType), StrProc);
end;

procedure TcxNavigatorControlProperty.StrProc(const S: string);
var
  AComponent: TComponent;
  ANavigator: IcxNavigator;
begin
  AComponent := Designer.GetComponent(S);
  if (AComponent <> nil) and AComponent.GetInterface(IcxNavigator, ANavigator) then
    FStrProc(S);
end;

{ TcxCustomEditControlComponentEditor }

procedure TcxCustomEditControlComponentEditor.Edit;
var
  AMethod: TMethod;
  AMethodName: string;
  AMethodParamFlags: TParamFlags;
  APTypeData: PTypeData;
  ATypeInfo: TcxEditTypeInfo;
  P: PChar;
  S: ShortString;
begin
  AMethodName := Component.Name + 'Click';
  if not Designer.MethodExists(AMethodName) then
  begin
    ATypeInfo.Kind := tkMethod;
    ATypeInfo.Name := AMethodName;

    APTypeData := @ATypeInfo.TypeData;
    APTypeData^.MethodKind := mkProcedure;
    APTypeData^.ParamCount := 1;

    AMethodParamFlags := [pfReference];
    P := @APTypeData^.ParamList;
    Move(AMethodParamFlags, P^, SizeOf(AMethodParamFlags));
    Inc(P, SizeOf(AMethodParamFlags));
    S := 'Sender';
    Move(S[0], P^, Length(S) + 1);
    Inc(P, Length(S) + 1);
    S := 'TObject';
    Move(S[0], P^, Length(S) + 1);

    AMethod := Designer.CreateMethod(AMethodName, APTypeData);
    {$IFDEF DELPHI5}
    SetMethodProp(Component, 'OnClick', AMethod);
    {$ELSE}
    SetMethodProp(Component, GetPropInfo(PTypeInfo(Component.ClassInfo),
        'OnClick'), AMethod);
    {$ENDIF}
    Designer.Modified;
  end;
  Designer.ShowMethod(AMethodName);
end;

procedure TcxCustomEditControlComponentEditor.ExecuteVerb(Index: Integer);
var
  ALookAndFeel: TcxLookAndFeel;
begin
  if Index = 0 then
    if HasStyle then
    begin
      GetStyle.RestoreDefaults;
      Designer.Modified;
    end
    else
    begin
      ALookAndFeel := GetLookAndFeel;
      if ALookAndFeel.AssignedValues <> [] then
      begin
        ALookAndFeel.Reset;
        Designer.Modified;
      end;
    end;
end;

function TcxCustomEditControlComponentEditor.GetVerb(Index: Integer): string;
begin
  if Index = 0 then
    Result := cxCustomEditControlEditorVerbA[Integer(HasStyle)]
  else
    Result := cxCustomEditControlEditorVerbA[Index + 1];
end;

function TcxCustomEditControlComponentEditor.GetVerbCount: Integer;
begin
  Result := Length(cxCustomEditControlEditorVerbA) - 1;
end;

function TcxCustomEditControlComponentEditor.GetLookAndFeel: TcxLookAndFeel;
begin
  if Component is TcxControl then
    Result := TcxControlAccess(Component).LookAndFeel
  else
    Result := nil;
end;

function TcxCustomEditControlComponentEditor.HasStyle: Boolean;
begin
  Result := False;
end;

{ TcxButtonComponentEditor }

function TcxButtonComponentEditor.GetLookAndFeel: TcxLookAndFeel;
begin
  Result := TcxCustomButtonAccess(Component).LookAndFeel;
end;

{ TcxRadioButtonComponentEditor }

function TcxRadioButtonComponentEditor.GetLookAndFeel: TcxLookAndFeel;
begin
  Result := TcxRadioButton(Component).LookAndFeel;
end;

{ TcxContainerComponentEditor }

function TcxContainerComponentEditor.GetStyle: TcxContainerStyle;
begin
  Result := TcxContainerAccess(Component).Style;
end;

function TcxContainerComponentEditor.HasStyle: Boolean;
begin
  Result := True;
end;

end.
