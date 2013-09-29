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
unit cxEditMaskEditor;

{$I cxEdVer.inc}

interface

uses
  {$IFDEF VCL}
  Windows,
  {$ENDIF}
  {$IFDEF DELPHI6}
  Variants, 
  {$ENDIF}
  SysUtils, Classes, Graphics, Controls, Forms,
  cxControls, cxContainer, cxEdit, cxButtonEdit, StdCtrls,
  ExtCtrls, ComCtrls, cxMaskEdit, cxButtons, Dialogs, IniFiles, cxTextEdit,
  cxDropDownEdit, cxStandardMask, cxClasses, cxEditConsts, cxCheckBox;

type

  { EcxLoadMaskException }
  EcxLoadMaskException = class(Exception);

  { TcxSample }
  PcxSample = ^TcxSample;
  TcxSample = record
    ShortDescription: string;
    Description: string;
    Mask: string;
  end;

var
  RegExprSamples: TList;
  StandardSamples: TList;

const
  DefaultRegExprSamplesCount = 20;
  DefaultRegExprSamples: array[0..DefaultRegExprSamplesCount - 1] of TcxSample =
  (
    (
      ShortDescription: 'Time of day';
      Description: 'The 24 hour day time:'#13#10#13#10'15:25'#13#10'2:05'#13#10'03:57';
      Mask: '(0?\d | 1\d | 2[0-3]) : [0-5]\d';
    ),
    (
      ShortDescription: 'Time of day with seconds';
      Description: 'The 24 hour day time with seconds:'#13#10#13#10'12:45:10'#13#10'3:00:01';
      Mask: '(0?\d | 1\d | 2[0-3]) : [0-5]\d : [0-5]\d';
    ),
    (
      ShortDescription: 'Time of day (AM/PM)';
      Description: 'The 12 hour day time:'#13#10#13#10'1:35PM'#13#10'12:45AM';
      Mask: '(0?[1-9] | 1[012]) : [0-5]\d (AM | PM)';
    ),
    (
      ShortDescription: 'Time of day with seconds (AM/PM)';
      Description: 'The 12 hour day time with seconds:'#13#10#13#10'10:03:10AM'#13#10'03:00:01PM';
      Mask: '(0?[1-9] | 1[012]) : [0-5]\d : [0-5]\d (AM | PM)';
    ),
    (
      ShortDescription: 'Date';
      Description: 'The mm/dd/yy or mm/dd/yyyy date with year from 1000 to 3999:'#13#10#13#10 +
          '3/12/99'#13#10'06/25/1800';
      Mask: '(0?[1-9] | 1[012]) / ([012]?[1-9] | [123]0 |31) / ([123][0-9])? [0-9][0-9]';
    ),
    (
      ShortDescription: 'Telephone number';
      Description: 'The telephone number with or without city code:'#13#10#13#10 +
          '(345)234-12-07'#13#10'(210)7-17-81'#13#10'26-32-22';
      Mask: '(\(\d\d\d\))? \d(\d\d?)? - \d\d - \d\d';
    ),
    (
      ShortDescription: 'Extension';
      Description: 'For example 15450';
      Mask: '\d\d\d\d\d';
    ),
    (
      ShortDescription: 'Social security';
      Description: 'For example 555-55-5555';
      Mask: '\d\d\d - \d\d - \d\d\d\d';
    ),
    (
      ShortDescription: 'Short zip code';
      Description: 'For example 11200';
      Mask: '\d\d\d\d\d';
    ),
    (
      ShortDescription: 'Long zip code';
      Description: 'For example 11200-0000';
      Mask: '\d\d\d\d\d - \d\d\d\d';
    ),
    (
      ShortDescription: 'Decimal number';
      Description: 'Any decimal number';
      Mask: '\d+';
    ),
    (
      ShortDescription: 'Hexadecimal number';
      Description: 'Any Hexadecimal number';
      Mask: '(\d | [A-F] | [a-f])+';
    ),
    (
      ShortDescription: 'Octal number';
      Description: 'Any Octal number';
      Mask: '[0-7]+';
    ),
    (
      ShortDescription: 'Binary number';
      Description: 'Any Binary number';
      Mask: '[01]+';
    ),
    (
      ShortDescription: 'Yes/No';
      Description: 'Yes, No, yes, no, Y, N, y or n';
      Mask: '(Y | y)(es)? | (N | n)o?';
    ),
    (
      ShortDescription: 'True/False';
      Description: 'True, False, true or false';
      Mask: '(T | t)rue | (F | f)alse';
    ),
    (
      ShortDescription: 'Any symbols';
      Description: 'Any symbols';
      Mask: '.+';
    ),
    (
      ShortDescription: 'Letters only';
      Description: 'The any letters of the latin alphabet';
      Mask: '[a-zA-Z]+';
    ),
    (
      ShortDescription: 'Uppercase letters';
      Description: 'Any uppercase letters of the latin alphabet';
      Mask: '[A-Z]+';
    ),
    (
      ShortDescription: 'Lowercase letters';
      Description: 'Any lowercase letters of the latin alphabet';
      Mask: '[a-z]+';
    )
  );

  DefaultStandardSamplesCount = 8;
  DefaultStandardSamples: array[0..DefaultStandardSamplesCount - 1] of TcxSample =
  (
    (
      ShortDescription: 'Phone';
      Description: '(213)144-1756';
      Mask:  '!\(999\)000-0000;1;_';
    ),
    (
      ShortDescription: 'Extension';
      Description: '15023';
      Mask: '!99999;1;_';
    ),
    (
      ShortDescription: 'Social security';
      Description: '555-55-5555';
      Mask: '000\-00\-0000;1;_';
    ),
    (
      ShortDescription: 'Short zip code';
      Description: '90628';
      Mask: '00000;1;_';
    ),
    (
      ShortDescription: 'Long zip code';
      Description: '90628-0000';
      Mask: '00000\-9999;1;_';
    ),
    (
      ShortDescription: 'Date';
      Description: '03/24/99';
      Mask: '!99/99/00;1;_';
    ),
    (
      ShortDescription: 'Long Time';
      Description: '04:15:34PM';
      Mask: '!90:00:00>LL;1;_';
    ),
    (
      ShortDescription: 'Short Time';
      Description: '21:45';
      Mask: '!90:00;1;_';
    )
  );

type
  { TcxEditMaskEditorDlg }
  TcxEditMaskEditorDlg = class(TForm)
    cxMaskKindPickEdit1: TcxComboBox;
    Label1: TLabel;
    StandardMaskPanel: TPanel;
    RegExprMaskPanel: TPanel;
    cxEditMaskEdit: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    cxMaskEdit1: TcxMaskEdit;
    Bevel1: TBevel;
    ListBox1: TListBox;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    cxTextEdit1: TcxTextEdit;
    cxMaskEdit2: TcxMaskEdit;
    Bevel3: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxTextEdit2: TcxTextEdit;
    ListView1: TListView;
    ButtonCancel: TButton;
    ButtonOK: TButton;
    RegExprMasksButton: TButton;
    StandardCancelButton: TButton;
    StandardOKButton: TButton;
    StandardMasksButton: TButton;
    cxCheckBox1: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cxMaskKindPickEdit1PropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxEditMaskEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOKClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1Exit(Sender: TObject);
    procedure StandardOKButtonClick(Sender: TObject);
    procedure StandardCancelButtonClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEdit2Exit(Sender: TObject);
    procedure cxTextEdit2PropertiesChange(Sender: TObject);
    procedure StandardMasksButtonClick(Sender: TObject);
    procedure RegExprMasksButtonClick(Sender: TObject);
    procedure cxMaskEdit1Enter(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    FMaskEditProperties: TcxCustomMaskEditProperties;
    FLastItemIndex: Integer;

    procedure ConvertMaskBlank;
    procedure CorrectMaskBlank;
    procedure FormatStandardMask(var AMask: string; ANewMaskBlank: Char); overload;
    procedure FormatStandardMask(var AMask: string; ANewSaveLiteralChars: Boolean); overload;
    function GetCurrentMaskBlank: Char;
    function GetSaveLiteralChars(const AEditMask: string): Boolean;
    function GetSaveLiteralChartSymbol(const AValue: Boolean): string;
    procedure LoadMaskDem(AFileName: string);
    procedure LoadMaskDxm(AFileName: string);
    procedure OpenMask;
    procedure ShowRegExprSamples;
    procedure ShowStandardSamples;
  public
    property MaskEditProperties: TcxCustomMaskEditProperties read FMaskEditProperties write FMaskEditProperties;
  end;

var
  cxEditMaskEditorDlg: TcxEditMaskEditorDlg;

implementation

{$R *.dfm}

procedure FreeRegExprSamples;
var
  I: Integer;
begin
  if RegExprSamples <> nil then
  begin
    for I := 0 to RegExprSamples.Count - 1 do
      Dispose(PcxSample(RegExprSamples[I]));
    RegExprSamples.Free;
  end;
end;

procedure FreeStandardSamples;
var
  I: Integer;
begin
  if StandardSamples <> nil then
  begin
    for I := 0 to StandardSamples.Count - 1 do
      Dispose(PcxSample(StandardSamples[I]));
    StandardSamples.Free;
  end;
end;

type
  TcxMaskEditPropertiesAccessor = class(TcxMaskEditProperties);

procedure TcxEditMaskEditorDlg.FormShow(Sender: TObject);
begin
  with TcxMaskEditPropertiesAccessor(MaskEditProperties) do
  begin
    cxMaskKindPickEdit1.ItemIndex := Ord(MaskKind);
    RegExprMaskPanel.Visible := MaskKind <> emkStandard;
    ShowRegExprSamples;
    ShowStandardSamples;
    FLastItemIndex := -1;
    if MaskKind = emkStandard then
    begin
      cxTextEdit2.Text := MaskBlank(EditMask);
      cxTextEdit1.Text := EditMask;
      cxMaskEdit2.Properties.MaskKind := MaskKind;
      cxMaskEdit2.Properties.EditMask := EditMask;
      cxCheckBox1.Checked := GetSaveLiteralChars(EditMask);
    end
    else
    begin
      cxTextEdit2.Text := cxDefaultBlank;
      cxEditMaskEdit.Text := EditMask;
      cxMaskEdit1.Properties.MaskKind := MaskKind;
      cxMaskEdit1.Properties.EditMask := EditMask;
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.cxMaskKindPickEdit1PropertiesChange(
  Sender: TObject);
begin
  if Visible then
    with TcxMaskEditPropertiesAccessor(MaskEditProperties) do
    begin
      RegExprMaskPanel.Visible := cxMaskKindPickEdit1.ItemIndex <> Integer(emkStandard);
      if RegExprMaskPanel.Visible then
      begin
        cxMaskEdit1.Properties.MaskKind := TcxEditMaskKind(cxMaskKindPickEdit1.ItemIndex);
        if ListBox1.Items.Count = 0 then
          FLastItemIndex := -1;
      end;
    end;
end;

procedure TcxEditMaskEditorDlg.FormCreate(Sender: TObject);
begin
  cxMaskEdit2.Properties.MaskKind := emkStandard;
  cxMaskEdit2.Properties.AlwaysShowBlanksAndLiterals := True;
end;

procedure TcxEditMaskEditorDlg.cxEditMaskEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TranslateKey(Key) = VK_RETURN then
  begin
    try
      cxMaskEdit1.Properties.EditMask := cxEditMaskEdit.Text;
      cxMaskEdit1.Enabled := True;
    except
      on EcxMaskEditError do
      begin
        cxMaskEdit1.Properties.EditMask := '';
        cxMaskEdit1.Text := '';
        cxMaskEdit1.Enabled := False;
        raise;
      end;
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TcxEditMaskEditorDlg.ButtonOKClick(Sender: TObject);
begin
  try
    cxMaskEdit1.Properties.EditMask := cxEditMaskEdit.Text;
    cxMaskEdit1.Enabled := True;
    with TcxMaskEditPropertiesAccessor(MaskEditProperties) do
    begin
      MaskKind := TcxEditMaskKind(cxMaskKindPickEdit1.ItemIndex);
      EditMask := cxMaskEdit1.Properties.EditMask;
    end;
    Close;
  except
    on EcxMaskEditError do
    begin
      cxMaskEdit1.Properties.EditMask := '';
      cxMaskEdit1.Text := '';
      cxMaskEdit1.Enabled := False;
      cxEditMaskEdit.SetFocus;
      raise;
    end;
  end;
end;

function TcxEditMaskEditorDlg.GetCurrentMaskBlank: Char;
begin
  Result := Char(cxTextEdit2.Text[1]);
end;

function TcxEditMaskEditorDlg.GetSaveLiteralChars(const AEditMask: string): Boolean;
var
  ALen: Integer;
begin
  Result := True;
  ALen := Length(AEditMask);
  if ALen >= 2 then
  begin
    if ALen >= 4 then
    begin
      if AEditMask[ALen - 3] = ';' then
      begin
        if AEditMask[ALen - 1] = ';' then
          Result := not (AEditMask[ALen - 2] = '0');
      end
      else
      begin
        if AEditMask[ALen - 1] = ';' then
          Result := not (AEditMask[ALen] = '0');
      end;
    end
    else
    begin
      if AEditMask[ALen - 1] = ';' then
        Result := not (AEditMask[ALen] = '0');
    end;
  end;
end;

function TcxEditMaskEditorDlg.GetSaveLiteralChartSymbol(const AValue: Boolean): string;
begin
  if AValue then
    Result := '1'
  else
    Result := '0';
end;

procedure TcxEditMaskEditorDlg.LoadMaskDem(AFileName: string);
var
  AMemoryStream: TMemoryStream;

  function GetNextToken(AIndex: Integer): Char;
  begin
    Result := Char(PByteArray(AMemoryStream.Memory)^[AIndex]);
  end;

var
  ASamples: TList;
  AShortDescription: string;
  ADescription: string;
  AMask: string;

  procedure AddSample;
  var
    SampleP: PcxSample;
  begin
    New(SampleP);
    SampleP.ShortDescription := AShortDescription;
    SampleP.Description := ADescription;
    SampleP.Mask := AMask;
    ASamples.Add(SampleP);

    AShortDescription := '';
    ADescription := '';
    AMask := '';
  end;

  procedure FreeLocalSamples;
  var
    I: Integer;
  begin
    for I := 0 to ASamples.Count - 1 do
      Dispose(PcxSample(ASamples[I]));
    ASamples.Free;
  end;

var
  AStringNumber: Integer;
  AToken: Char;
  I: Integer;
begin
  AMemoryStream := TMemoryStream.Create;
  ASamples := TList.Create;

  AMemoryStream.LoadFromFile(AFileName);
  AStringNumber := 0;
  AShortDescription := '';
  ADescription := '';
  AMask := '';

  try
    for I := 0 to AMemoryStream.Size - 1 do
    begin
      AToken := GetNextToken(I);

      if (AToken = ' ') or (AToken = #9) then
      begin
        if ((AStringNumber = 0) and (AShortDescription = '')) or
            ((AStringNumber = 1) and (ADescription = '')) or
            ((AStringNumber = 2) and (AMask = '')) then
          Continue;
      end
      else if AToken = #10 then
      begin
        if (AStringNumber = 2) then
        begin
          ADescription := FormatText(ADescription, AMask, GetCurrentMaskBlank);
          AddSample;
          AStringNumber := 0;
        end
        else
        begin
          if not ((AStringNumber = 0) and (AShortDescription = '')) then
          begin
            FreeLocalSamples;
            raise EcxLoadMaskException.Create(cxGetResourceString(@scxMaskEditIllegalFileFormat));
          end;
        end;
      end
      else if AToken = '|' then
      begin
        if AStringNumber >= 2 then
        begin
          FreeLocalSamples;
          raise EcxLoadMaskException.Create(cxGetResourceString(@scxMaskEditIllegalFileFormat))
        end
        else
          Inc(AStringNumber);
      end
      else
      begin
        if AToken <> #13 then
        begin
          case AStringNumber of
            0: AShortDescription := AShortDescription + AToken;
            1: ADescription := ADescription + AToken;
            2: AMask := AMask + AToken;
          end;
        end;
      end;
    end;

    if (AShortDescription <> '') or (ADescription <> '') or (AMask <> '') then
      AddSample;

    if ASamples.Count > 0 then
    begin
      FreeStandardSamples;
      StandardSamples := ASamples;
      ShowStandardSamples;
      cxTextEdit1.Text := '';
      cxMaskEdit2.Properties.EditMask := '';
      cxCheckBox1.Checked := True;
    end
    else
    begin
      FreeLocalSamples;
      raise EcxLoadMaskException.Create(cxGetResourceString(@scxMaskEditEmptyMaskCollectionFile));
    end;
  finally
    AMemoryStream.Free;
  end;
end;

procedure TcxEditMaskEditorDlg.LoadMaskDxm(AFileName: string);
var
  AStandardSamples: TList;
  ARegExprSamples: TList;
  AShortDescription: string;
  ADescription: string;
  AMask: string;
  ASampleP: PcxSample;

  procedure NewSample;
  begin
    New(ASampleP);
    ASampleP.ShortDescription := AShortDescription;
    ASampleP.Description := ADescription;
    ASampleP.Mask := AMask;
  end;

  procedure ClearValues;
  begin
    AShortDescription := '';
    ADescription := '';
    AMask := '';
  end;

  procedure AddStandardSample;
  begin
    NewSample;
    AStandardSamples.Add(ASampleP);
    ClearValues;
  end;

  procedure AddRegExprSample;
  begin
    NewSample;
    ARegExprSamples.Add(ASampleP);
    ClearValues;
  end;

  procedure FreeLocalSamples;
  var
    I: Integer;
  begin
    for I := 0 to AStandardSamples.Count - 1 do
      Dispose(PcxSample(AStandardSamples[I]));
    AStandardSamples.Free;
    for I := 0 to ARegExprSamples.Count - 1 do
      Dispose(PcxSample(ARegExprSamples[I]));
    ARegExprSamples.Free;
  end;

var
  {$IFDEF VCL}
  AFile: TIniFile;
  {$ELSE}
  AFile: TMemIniFile;
  {$ENDIF}
  ASections: TStringList;
  AKeys: TStringList;
  I: Integer;
begin
  {$IFDEF VCL}
  AFile := TIniFile.Create(AFileName);
  {$ELSE}
  AFile := TMemIniFile.Create(AFileName);
  AFile.CaseSensitive := False;
  {$ENDIF}
  AStandardSamples := TList.Create;
  ARegExprSamples := TList.Create;
  ASections := TStringList.Create;
  AKeys := TStringList.Create;

  try
    AFile.ReadSections(ASections);
    for I := 0 to ASections.Count - 1 do
    begin
      AFile.ReadSection(ASections[I], AKeys);
      if AKeys.Count > 3 then
      begin
        FreeLocalSamples;
        raise EcxLoadMaskException.Create(cxGetResourceString(@scxMaskEditIllegalFileFormat));
      end
      else
      begin
        AShortDescription := AFile.ReadString(ASections[I], 'ShortDescription', '');
        ADescription := AFile.ReadString(ASections[I], 'Description', '');
        AMask := AFile.ReadString(ASections[I], 'Mask', '');
        if (AShortDescription = '') and (ADescription = '') and (AMask = '') then
          Continue;

        if Pos('Standard', ASections[I]) <> 0 then
          AddStandardSample
        else if Pos('RegExpr', ASections[I]) <> 0 then
          AddRegExprSample
        else
        begin
          FreeLocalSamples;
          raise EcxLoadMaskException.Create(cxGetResourceString(@scxMaskEditIllegalFileFormat));
        end;
      end;
    end;

    if (AStandardSamples.Count = 0) and (ARegExprSamples.Count = 0) then
    begin
      FreeLocalSamples;
      raise EcxLoadMaskException.Create(cxGetResourceString(@scxMaskEditEmptyMaskCollectionFile));
    end;

    FreeStandardSamples;
    StandardSamples := AStandardSamples;
    ShowStandardSamples;
    cxTextEdit1.Text := '';
    cxMaskEdit2.Properties.EditMask := '';
    cxCheckBox1.Checked := True;

    FreeRegExprSamples;
    RegExprSamples := ARegExprSamples;
    ShowRegExprSamples;
    cxEditMaskEdit.Text := '';
    cxMaskEdit1.Properties.EditMask := '';

  finally
    AFile.Free;
    AKeys.Free;
    ASections.Free;
  end;
end;

procedure TcxEditMaskEditorDlg.OpenMask;
var
  ADialog: TOpenDialog;
  AExt: string;
begin
  ADialog := TOpenDialog.Create(nil);
  ADialog.Options := [];
  {$IFDEF VCL}
  ADialog.Filter := cxGetResourceString(@scxMaskEditMaskCollectionFiles) + ' (*.dem, *.dxm )|*.dem;*.dxm';
  {$ELSE}
  ADialog.Filter := cxGetResourceString(@scxMaskEditMaskCollectionFiles) + ' (*.dem;*.dxm)';
  {$ENDIF}
  try
    if ADialog.Execute then
    begin
      AExt := ExtractFileExt(ADialog.Files[0]);
      if LowerCase(AExt) = '.dem' then
        LoadMaskDem(ADialog.Files[0])
      else if LowerCase(AExt) = '.dxm' then
        LoadMaskDxm(ADialog.Files[0]);
    end;
  finally
    ADialog.Free;
  end;
end;

procedure TcxEditMaskEditorDlg.ShowRegExprSamples;
var
  I: Integer;
begin
  ListBox1.Items.Clear;
  if RegExprSamples = nil then
  begin
    for I := 0 to DefaultRegExprSamplesCount - 1 do
      ListBox1.Items.Add(DefaultRegExprSamples[I].ShortDescription);
  end
  else
  begin
    for I := 0 to RegExprSamples.Count - 1 do
      ListBox1.Items.Add(PcxSample(RegExprSamples[I]).ShortDescription);
  end;
end;

procedure TcxEditMaskEditorDlg.ShowStandardSamples;
var
  I: Integer;
  AItem: TListItem;
begin
  ListView1.Items.Clear;
  if StandardSamples = nil then
  begin
    {$IFDEF VCL}
    for I := 0 to DefaultStandardSamplesCount - 1 do
    {$ELSE}
    for I := DefaultStandardSamplesCount - 1 downto 0 do
    {$ENDIF}
    begin
      AItem := ListView1.Items.Add;
      AItem.Caption := DefaultStandardSamples[I].ShortDescription;
      AItem.SubItems.Add(DefaultStandardSamples[I].Description);
    end;
  end
  else
  begin
    {$IFDEF VCL}
    for I := 0 to StandardSamples.Count - 1 do
    {$ELSE}
    for I := StandardSamples.Count - 1 downto 0 do
    {$ENDIF}
    begin
      AItem := ListView1.Items.Add;
      AItem.Caption := PcxSample(StandardSamples[I]).ShortDescription;
      AItem.SubItems.Add(PcxSample(StandardSamples[I]).Description);
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.ListBox1Click(Sender: TObject);
begin
  Memo1.Clear;
  if RegExprSamples = nil then
  begin
    Memo1.Lines.Add(DefaultRegExprSamples[ListBox1.ItemIndex].Description);
    cxEditMaskEdit.Text := DefaultRegExprSamples[ListBox1.ItemIndex].Mask;
  end
  else
  begin
    Memo1.Lines.Add(PcxSample(RegExprSamples[ListBox1.ItemIndex]).Description);
    cxEditMaskEdit.Text := PcxSample(RegExprSamples[ListBox1.ItemIndex]).Mask;
  end;

  try
    cxMaskEdit1.Properties.EditMask := cxEditMaskEdit.Text;
    cxMaskEdit1.Enabled := True;
  except
    on EcxMaskEditError do
    begin
      cxMaskEdit1.Properties.EditMask := '';
      cxMaskEdit1.Text := '';
      cxMaskEdit1.Enabled := False;
      raise;
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.ListBox1Exit(Sender: TObject);
begin
  if ListBox1.ItemIndex <> FLastItemIndex then
  begin
    cxMaskEdit1.Text := '';
    FLastItemIndex := ListBox1.ItemIndex;
  end;
end;

procedure TcxEditMaskEditorDlg.StandardOKButtonClick(Sender: TObject);
begin
  with TcxMaskEditPropertiesAccessor(MaskEditProperties) do
  begin
    CorrectMaskBlank;
    cxMaskEdit2.Properties.EditMask := '';
    cxMaskEdit2.Text := '';
    cxMaskEdit2.Properties.EditMask := cxTextEdit1.Text;
    MaskKind := emkStandard;
    EditMask := cxMaskEdit2.Properties.EditMask;
  end;
  Close;
end;

procedure TcxEditMaskEditorDlg.StandardCancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TcxEditMaskEditorDlg.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    if StandardSamples = nil then
      cxTextEdit1.Text := DefaultStandardSamples[ListView1.Selected.Index].Mask
    else
      cxTextEdit1.Text := PcxSample(StandardSamples[ListView1.Selected.Index]).Mask;

    CorrectMaskBlank;
    cxMaskEdit2.Properties.EditMask := '';
    cxMaskEdit2.Text := '';
    cxMaskEdit2.Properties.EditMask := cxTextEdit1.Text;
    cxCheckBox1.Checked := GetSaveLiteralChars(cxTextEdit1.Text);
  end;
end;

procedure TcxEditMaskEditorDlg.cxTextEdit1Exit(Sender: TObject);
begin
  begin
    CorrectMaskBlank;
    cxMaskEdit2.Properties.EditMask := '';
    cxMaskEdit2.Text := '';
    cxMaskEdit2.Properties.EditMask := cxTextEdit1.Text;
    cxCheckBox1.Checked := GetSaveLiteralChars(cxTextEdit1.Text);
  end;
end;

procedure TcxEditMaskEditorDlg.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TranslateKey(Key) = VK_RETURN then
  begin
    CorrectMaskBlank;
    cxMaskEdit2.Properties.EditMask := '';
    cxMaskEdit2.Text := '';
    cxMaskEdit2.Properties.EditMask := cxTextEdit1.Text;
    cxCheckBox1.Checked := GetSaveLiteralChars(cxTextEdit1.Text);
  end;
end;

procedure TcxEditMaskEditorDlg.FormatStandardMask(var AMask: string; ANewMaskBlank: Char);
var
  AOldMaskBlank: Char;
  ASaveLiteralChars: Boolean;
  AMaskLength: Integer;
begin
  AOldMaskBlank := MaskBlank(AMask);
  ASaveLiteralChars := SaveLiteralChars(AMask);
  if AOldMaskBlank <> ANewMaskBlank then
  begin
    AMaskLength := Length(AMask);

    if AMaskLength < 4 then
    begin
      if (AMaskLength = 2) and (AMask[1] = ';') and ((AMask[2] = '0') or (AMask[2] = '1')) then
        AMask := AMask + ';' + ANewMaskBlank
      else
        AMask := AMask + ';' + GetSaveLiteralChartSymbol(ASaveLiteralChars) + ';' + ANewMaskBlank;
    end
    else
    begin
      if (AMask[AMaskLength - 1] = ';') and (AMask[AMaskLength - 3] = ';') and
          ((AMask[AMaskLength - 2] = '0') or (AMask[AMaskLength - 2] = '1')) then
      begin
        Delete(AMask, AMaskLength,1);
        AMask := AMask + ANewMaskBlank;
      end
      else if (AMask[AMaskLength - 1] = ';') and ((AMask[AMaskLength] = '0') or (AMask[AMaskLength] = '1')) then
        AMask := AMask + ';' + ANewMaskBlank
      else
        AMask := AMask + ';' + GetSaveLiteralChartSymbol(ASaveLiteralChars) + ';' + ANewMaskBlank;
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.FormatStandardMask(var AMask: string; ANewSaveLiteralChars: Boolean);
var
  AMaskLength: Integer;
  AMaskBlank: Char;
begin
  AMaskLength := Length(AMask);
  AMaskBlank := MaskBlank(AMask);
  if ANewSaveLiteralChars <> SaveLiteralChars(AMask) then
  begin
    if AMaskLength < 4 then
    begin
      if (AMaskLength = 2) and (AMask[1] = ';') and ((AMask[2] = '0') or (AMask[2] = '1')) then
      begin
        Delete(AMask, AMaskLength, 1);
        AMask := AMask + GetSaveLiteralChartSymbol(ANewSaveLiteralChars);
      end
      else
        AMask := AMask + ';' + GetSaveLiteralChartSymbol(ANewSaveLiteralChars) + ';' + AMaskBlank;
    end
    else
    begin
      if (AMask[AMaskLength - 1] = ';') and (AMask[AMaskLength - 3] = ';') and
          ((AMask[AMaskLength - 2] = '0') or (AMask[AMaskLength - 2] = '1')) then
      begin
        Delete(AMask, AMaskLength - 2, 1);
        Insert(GetSaveLiteralChartSymbol(ANewSaveLiteralChars), AMask, AMaskLength - 2);
      end
      else if (AMask[AMaskLength - 1] = ';') and ((AMask[AMaskLength] = '0') or (AMask[AMaskLength] = '1')) then
      begin
        Delete(AMask, AMaskLength, 1);
        AMask := AMask + GetSaveLiteralChartSymbol(ANewSaveLiteralChars);
      end
      else
        AMask := AMask + ';' + GetSaveLiteralChartSymbol(ANewSaveLiteralChars) + ';' + AMaskBlank;
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.cxTextEdit2Exit(Sender: TObject);
begin
  ConvertMaskBlank;
end;

procedure TcxEditMaskEditorDlg.ConvertMaskBlank;
begin
  if Length(cxTextEdit2.Text) > 0 then
  begin
    if string(cxTextEdit2.Text)[1] < #32 then
      cxTextEdit2.Text := '_';
  end
  else
    cxTextEdit2.Text := '_';
end;

procedure TcxEditMaskEditorDlg.cxTextEdit2PropertiesChange(
  Sender: TObject);
var
  AMask: string;
begin
  ConvertMaskBlank;

  AMask := cxTextEdit1.Text;
  FormatStandardMask(AMask, string(cxTextEdit2.Text)[1]);
  cxTextEdit1.Text := AMask;
  cxMaskEdit2.Properties.EditMask := AMask;
  cxCheckBox1.Checked := GetSaveLiteralChars(AMask);
end;

procedure TcxEditMaskEditorDlg.CorrectMaskBlank;
var
  AMask: string;
begin
  AMask := cxTextEdit1.Text;
  cxTextEdit2.Text := MaskBlank(AMask);
  if Length(cxTextEdit2.Text) > 0 then
    FormatStandardMask(AMask, string(cxTextEdit2.Text)[1])
  else
  begin
    FormatStandardMask(AMask, '_');
    cxTextEdit2.Text := '_';
  end;
  cxTextEdit1.Text := AMask;
end;

procedure TcxEditMaskEditorDlg.StandardMasksButtonClick(Sender: TObject);
begin
  OpenMask;
end;

procedure TcxEditMaskEditorDlg.RegExprMasksButtonClick(Sender: TObject);
begin
  OpenMask;
end;

procedure TcxEditMaskEditorDlg.cxMaskEdit1Enter(Sender: TObject);
begin
  try
    cxMaskEdit1.Properties.EditMask := cxEditMaskEdit.Text;
    cxMaskEdit1.Enabled := True;
  except
    on EcxMaskEditError do
    begin
      cxMaskEdit1.Properties.EditMask := '';
      cxMaskEdit1.Text := '';
      cxMaskEdit1.Enabled := False;
      cxEditMaskEdit.SetFocus;
      raise;
    end;
  end;
end;

procedure TcxEditMaskEditorDlg.cxCheckBox1PropertiesChange(
  Sender: TObject);
var
  AMask: string;
begin
  AMask := cxTextEdit1.Text;
  if Length(cxTextEdit2.Text) > 0 then
    FormatStandardMask(AMask, Char(cxTextEdit2.Text[1]));
  FormatStandardMask(AMask, cxCheckBox1.Checked);
  cxTextEdit1.Text := AMask;
  cxMaskEdit2.Properties.EditMask := AMask;
end;

initialization
  RegExprSamples := nil;
  StandardSamples := nil;

finalization
  FreeRegExprSamples;
  FreeStandardSamples;

end.