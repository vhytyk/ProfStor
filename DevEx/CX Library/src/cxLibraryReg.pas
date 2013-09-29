
{********************************************************************}
{                                                                    }
{           Developer Express Visual Component Library               }
{           Express Cross Platform Library classes                   }
{                                                                    }
{           Copyright (c) 2000-2003 Developer Express Inc.           }
{           ALL RIGHTS RESERVED                                      }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSCROSSPLATFORMLIBRARY AND ALL   }
{   ACCOMPANYING VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM       }
{   ONLY.                                                            }
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

unit cxLibraryReg;

{$I cxVer.inc}

interface

uses
  Classes;

procedure Register;

implementation

uses
  SysUtils, 
{$IFDEF DELPHI6}
  DesignIntf, DesignEditors,
{$ELSE}
  DsgnIntf,
{$ENDIF}
  TypInfo, cxContainer, cxLookAndFeels, cxPropertiesStore, cxPropertiesStoreEditor,
  cxStyleRepositoryEditor, cxStyles, Controls;

const
  Version = '4.5';

type
  TcxContainerAccess = class(TcxContainer);

  { TcxLookAndFeelControllerEditor }

  TcxLookAndFeelControllerEditor = class(TComponentEditor)
  private
    function GetLookAndFeelController: TcxLookAndFeelController;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxStyleRepositoryComponentEditor }

  TcxStyleRepositoryComponentEditor = class(TComponentEditor)
  private
    function GetStyleRepository: TcxStyleRepository;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxPropertiesStoreComponentEditor }
  TcxPropertiesStoreComponentEditor = class(TComponentEditor)
  private
    function GetPropertiesStore: TcxPropertiesStore;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  { TcxContainerStyleProperty }

  TcxContainerStyleProperty = class(TClassProperty)
  private
    FProc: {$IFNDEF DELPHI6}TGetPropEditProc{$ELSE}TGetPropProc{$ENDIF};
    procedure GetPropProc({$IFNDEF DELPHI6}Prop: TPropertyEditor{$ELSE}const Prop: IProperty{$ENDIF});
  public
    procedure GetProperties(Proc: {$IFNDEF DELPHI6}TGetPropEditProc{$ELSE}TGetPropProc{$ENDIF}); override;
  end;

  { TcxContainerStyleAssignedValuesProperty }

  TcxContainerStyleAssignedValuesProperty = class(TSetProperty)
  public
    procedure GetProperties(Proc: {$IFNDEF DELPHI6}TGetPropEditProc{$ELSE}TGetPropProc{$ENDIF}); override;
    function GetValue: string; override;
  end;

  { TcxContainerStyleAssignedValuesElementProperty }

  TcxContainerStyleAssignedValuesElementProperty = class(TSetElementProperty)
{$IFNDEF DELPHI6}
  private
    FElement: Integer;
  protected
    constructor Create(Parent: TPropertyEditor; AElement: Integer);
    property Element: Integer read FElement;
{$ENDIF}
  public
    function GetName: string; override;
  end;

{ TcxLookAndFeelControllerEditor }

procedure TcxLookAndFeelControllerEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:
      begin
        with GetLookAndFeelController do
        begin
          Kind := cxDefaultLookAndFeelKind;
          NativeStyle := cxDefaultLookAndFeelNativeStyle;
        end;
        Designer.Modified;
      end;
  end;
end;

function TcxLookAndFeelControllerEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Reset';
    1: Result := '-';
    2: Result := 'ExpressCrossPlatform Library v' + Version;
    3: Result := 'www.devexpress.com';
  end;
end;

function TcxLookAndFeelControllerEditor.GetVerbCount: Integer;
begin
  Result := 1 + 3;
end;

function TcxLookAndFeelControllerEditor.GetLookAndFeelController: TcxLookAndFeelController;
begin
  Result := Component as TcxLookAndFeelController;
end;

{ TcxStyleRepositoryComponentEditor }

procedure TcxStyleRepositoryComponentEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowStyleRepositoryEditor(Designer, GetStyleRepository);
  end;
end;

function TcxStyleRepositoryComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Edit...';
    1: Result := '-';
    2: Result := 'ExpressCrossPlatform Library v' + Version;
    3: Result := 'www.devexpress.com';
  end;
end;

function TcxStyleRepositoryComponentEditor.GetVerbCount: Integer;
begin
  Result := 1 + 3;
end;

function TcxStyleRepositoryComponentEditor.GetStyleRepository: TcxStyleRepository;
begin
  Result := Component as TcxStyleRepository;
end;

type
  TcxStyleSheetComponentProperty = class(TComponentProperty)
  private
    FStrProc: TGetStrProc;
    procedure StrProc(const S: string);
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure TcxStyleSheetComponentProperty.StrProc(const S: string);
begin
  if TcxStyles(GetComponent(0)).IsValidStyleSheet(TcxCustomStyleSheet(Designer.GetComponent(S))) then
    FStrProc(S);
end;

procedure TcxStyleSheetComponentProperty.GetValues(Proc: TGetStrProc);
begin
  FStrProc := Proc;
  Designer.GetComponentNames(GetTypeData(GetPropType), StrProc);
end;

{ TcxPropertiesStoreComponentEditor }
procedure TcxPropertiesStoreComponentEditor.ExecuteVerb(Index: Integer);
var
  AActive: Boolean;
  APropertiesStore: TcxPropertiesStore;
  procedure DsgnStoreTo;
  begin
    APropertiesStore := TcxPropertiesStore(Component);
    AActive := APropertiesStore.Active;
    APropertiesStore.Active := True;
    APropertiesStore.StoreTo;
    APropertiesStore.Active := AActive;
  end;
  procedure DsgnRestoreFrom;
  begin
    APropertiesStore := TcxPropertiesStore(Component);
    AActive := APropertiesStore.Active;
    APropertiesStore.Active := True;
    APropertiesStore.RestoreFrom;
    APropertiesStore.Active := AActive;
  end;
begin
  case Index of
    0: ShowPropertiesStoreEditor(GetPropertiesStore,
         {$IFNDEF DELPHI6}Designer.GetRoot{$ELSE}Designer.Root{$ENDIF}, Designer);
    2: DsgnStoreTo;
    3: DsgnRestoreFrom;
  end;
end;

function TcxPropertiesStoreComponentEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Edit...';
    1: Result := '-';
    2: Result := 'Store';
    3: Result := 'Restore';
    4: Result := '-';
    5: Result := 'ExpressCrossPlatform Library v' + Version;
    6: Result := 'www.devexpress.com';
  end;
end;

function TcxPropertiesStoreComponentEditor.GetVerbCount: Integer;
begin
  Result := 1 + 3 + 3;
end;

function TcxPropertiesStoreComponentEditor.GetPropertiesStore: TcxPropertiesStore;
begin
  Result := Component as TcxPropertiesStore;
end;

{ TcxContainerStyleProperty }

procedure TcxContainerStyleProperty.GetProperties(Proc: {$IFNDEF DELPHI6}TGetPropEditProc{$ELSE}TGetPropProc{$ENDIF});
begin
  FProc := Proc;
  inherited GetProperties(GetPropProc);
end;

procedure TcxContainerStyleProperty.GetPropProc({$IFNDEF DELPHI6}Prop: TPropertyEditor{$ELSE}const Prop: IProperty{$ENDIF});
var
  AContainer: TcxContainerAccess;
  AStyleValue: TcxContainerStyleValue;
  I: Integer;
begin
  for I := 0 to PropCount - 1 do
  begin
    AContainer := TcxContainerAccess(GetComponent(I));
    if not AContainer.Style.GetStyleValue(Prop.GetName, AStyleValue) then
      Continue;
    if AStyleValue in AContainer.GetNotPublishedStyleValues then
      Exit;
  end;
  FProc(Prop);
end;

{ TcxContainerStyleAssignedValuesProperty }

procedure TcxContainerStyleAssignedValuesProperty.GetProperties(Proc: {$IFNDEF DELPHI6}TGetPropEditProc{$ELSE}TGetPropProc{$ENDIF});
var
  AContainer: TcxContainer;
  AIsStyleValuePublished: Boolean;
  AMinStyleValueCount, AStyleValueCount, I: Integer;
  AStyleValue: TcxContainerStyleValue;
  AStyleValueName: string;
  AStyleValueNameList: TStringList;
begin
  AMinStyleValueCount := TcxContainerStyle(GetComponent(0)).GetStyleValueCount;
  for I := 1 to PropCount - 1 do
  begin
    AStyleValueCount := TcxContainerStyle(GetComponent(I)).GetStyleValueCount;
    if AStyleValueCount < AMinStyleValueCount then
      AMinStyleValueCount := AStyleValueCount;
  end;

  AStyleValueNameList := TStringList.Create;
  try
    for AStyleValue := 0 to AMinStyleValueCount - 1 do
    begin
      AIsStyleValuePublished := True;
      for I := 0 to PropCount - 1 do
      begin
        AContainer := TcxContainerStyle(GetComponent(I)).Container;
        if (AContainer <> nil) and (AStyleValue in AContainer.GetNotPublishedStyleValues) then
        begin
          AIsStyleValuePublished := False;
          Break;
        end;
      end;
      if AIsStyleValuePublished then
      begin
        TcxContainerStyle(GetComponent(0)).GetStyleValueName(AStyleValue, AStyleValueName);
        AStyleValueNameList.AddObject(AStyleValueName, TObject(AStyleValue));
      end;
    end;
    AStyleValueNameList.Sort;
    for I := 0 to AStyleValueNameList.Count - 1 do
      Proc(TcxContainerStyleAssignedValuesElementProperty.Create(Self,
        TcxContainerStyleValue(AStyleValueNameList.Objects[I])));
  finally
    AStyleValueNameList.Free;
  end;
end;

function TcxContainerStyleAssignedValuesProperty.GetValue: string;
var
  AStyleValues: TcxContainerStyleValues;
begin
  Integer(AStyleValues) := GetOrdValue;
  Result := cxContainerStyleValuesToStr(AStyleValues, TcxContainerStyle(GetComponent(0)));
end;

{ TcxContainerStyleAssignedValuesElementProperty }

function TcxContainerStyleAssignedValuesElementProperty.GetName: string;
begin
  TcxContainerStyle(GetComponent(0)).GetStyleValueName(Element, Result);
end;

{$IFNDEF DELPHI6}
constructor TcxContainerStyleAssignedValuesElementProperty.Create(Parent: TPropertyEditor;
  AElement: Integer);
begin
  inherited Create(Parent, AElement);
  FElement := AElement;
end;
{$ENDIF}

procedure Register;
begin
  RegisterComponentEditor(TcxLookAndFeelController, TcxLookAndFeelControllerEditor);
  RegisterPropertyEditor(TypeInfo(TcxCustomStyleSheet), TcxStyles, 'StyleSheet', TcxStyleSheetComponentProperty);
  RegisterComponentEditor(TcxStyleRepository, TcxStyleRepositoryComponentEditor);
  RegisterComponentEditor(TcxPropertiesStore, TcxPropertiesStoreComponentEditor);
  RegisterComponents('Dev Express', [TcxLookAndFeelController, TcxStyleRepository, TcxPropertiesStore]);
  RegisterPropertyEditor(TypeInfo(TcxContainerStyle), TcxContainer, 'Style', TcxContainerStyleProperty);
  RegisterPropertyEditor(TypeInfo(TcxStyleController), TcxStyleController, 'FakedStyleController', nil);
  RegisterPropertyEditor(TypeInfo(TcxStyleController), TcxContainer, 'FakedStyleController', nil);

  RegisterClasses([TcxStyle]);
  RegisterNoIcon([TcxStyle]);

  RegisterPropertyEditor(TypeInfo(TcxContainerStyleValues), TcxContainerStyle,
    'AssignedValues', TcxContainerStyleAssignedValuesProperty);
end;

{$IFDEF DELPHI6}
initialization
  StartClassGroup(TControl);
  GroupDescendentsWith(TcxCustomPropertiesStore, TControl);
{$ENDIF}

end.
