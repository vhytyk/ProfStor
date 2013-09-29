object cxEditMaskEditorDlg: TcxEditMaskEditorDlg
  Left = 353
  Top = 212
  BorderStyle = bsDialog
  Caption = 'Input Mask Editor'
  ClientHeight = 322
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Mask kind'
  end
  object Bevel1: TBevel
    Left = 7
    Top = 37
    Width = 266
    Height = 2
  end
  object cxMaskKindPickEdit1: TcxComboBox
    Tag = 4
    Left = 64
    Top = 4
    Width = 193
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'Standard'
      'Regular expression'
      'Extended regular expression')
    Properties.OnChange = cxMaskKindPickEdit1PropertiesChange
    TabOrder = 0
  end
  object StandardMaskPanel: TPanel
    Left = 0
    Top = 42
    Width = 543
    Height = 280
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel3: TBevel
      Left = 4
      Top = 188
      Width = 261
      Height = 2
    end
    object Label6: TLabel
      Left = 8
      Top = 4
      Width = 55
      Height = 13
      Caption = 'Input mask:'
    end
    object Label7: TLabel
      Left = 8
      Top = 196
      Width = 51
      Height = 13
      Caption = 'Test Input:'
    end
    object Label8: TLabel
      Left = 272
      Top = 4
      Width = 66
      Height = 13
      Caption = 'Sample mask:'
    end
    object Label9: TLabel
      Left = 140
      Top = 64
      Width = 98
      Height = 13
      Caption = 'Character for blanks:'
    end
    object cxTextEdit1: TcxTextEdit
      Tag = 21
      Left = 8
      Top = 20
      Width = 253
      Height = 21
      TabOrder = 0
      OnExit = cxTextEdit1Exit
      OnKeyDown = cxTextEdit1KeyDown
    end
    object cxMaskEdit2: TcxMaskEdit
      Tag = 22
      Left = 8
      Top = 212
      Width = 253
      Height = 21
      Properties.IgnoreMaskBlank = True
      TabOrder = 1
    end
    object cxTextEdit2: TcxTextEdit
      Tag = 23
      Left = 244
      Top = 60
      Width = 17
      Height = 21
      Properties.MaxLength = 1
      Properties.OnChange = cxTextEdit2PropertiesChange
      TabOrder = 2
      OnExit = cxTextEdit2Exit
    end
    object ListView1: TListView
      Left = 272
      Top = 20
      Width = 261
      Height = 213
      Columns = <
        item
          AutoSize = True
          Caption = 'Description'
        end
        item
          AutoSize = True
          Caption = 'Sample'
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 3
      ViewStyle = vsReport
      OnSelectItem = ListView1SelectItem
    end
    object StandardCancelButton: TButton
      Left = 440
      Top = 244
      Width = 93
      Height = 25
      Caption = 'Cancel'
      TabOrder = 4
      OnClick = StandardCancelButtonClick
    end
    object StandardOKButton: TButton
      Left = 336
      Top = 244
      Width = 93
      Height = 25
      Caption = 'OK'
      TabOrder = 5
      OnClick = StandardOKButtonClick
    end
    object StandardMasksButton: TButton
      Left = 8
      Top = 244
      Width = 93
      Height = 25
      Caption = 'Masks...'
      TabOrder = 6
      OnClick = StandardMasksButtonClick
    end
    object cxCheckBox1: TcxCheckBox
      Left = 4
      Top = 160
      Width = 153
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCheckBox1PropertiesChange
      Properties.Caption = 'Save literal characters'
      TabOrder = 7
    end
    object RegExprMaskPanel: TPanel
      Left = 0
      Top = 0
      Width = 543
      Height = 280
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object Label2: TLabel
        Left = 4
        Top = 12
        Width = 55
        Height = 13
        Caption = 'Input mask:'
      end
      object Label3: TLabel
        Left = 4
        Top = 48
        Width = 50
        Height = 13
        Caption = 'Test input:'
      end
      object Label4: TLabel
        Left = 12
        Top = 96
        Width = 38
        Height = 13
        Caption = 'Sample:'
      end
      object Label5: TLabel
        Left = 192
        Top = 96
        Width = 56
        Height = 13
        Caption = 'Description:'
      end
      object Bevel2: TBevel
        Left = 8
        Top = 80
        Width = 529
        Height = 2
      end
      object cxEditMaskEdit: TcxTextEdit
        Tag = 7
        Left = 64
        Top = 8
        Width = 473
        Height = 21
        TabOrder = 0
        OnKeyDown = cxEditMaskEditKeyDown
      end
      object cxMaskEdit1: TcxMaskEdit
        Tag = 4
        Left = 64
        Top = 44
        Width = 473
        Height = 21
        Properties.IgnoreMaskBlank = True
        Properties.MaskKind = emkRegExprEx
        Properties.MaxLength = 0
        TabOrder = 1
        OnEnter = cxMaskEdit1Enter
      end
      object ListBox1: TListBox
        Left = 8
        Top = 112
        Width = 177
        Height = 121
        ItemHeight = 13
        TabOrder = 2
        OnClick = ListBox1Click
        OnExit = ListBox1Exit
      end
      object Memo1: TMemo
        Left = 188
        Top = 112
        Width = 349
        Height = 121
        ReadOnly = True
        TabOrder = 3
      end
      object ButtonCancel: TButton
        Left = 440
        Top = 244
        Width = 93
        Height = 25
        Caption = 'Cancel'
        TabOrder = 4
        OnClick = ButtonCancelClick
      end
      object ButtonOK: TButton
        Left = 336
        Top = 244
        Width = 93
        Height = 25
        Caption = 'OK'
        TabOrder = 5
        OnClick = ButtonOKClick
      end
      object RegExprMasksButton: TButton
        Left = 8
        Top = 244
        Width = 93
        Height = 25
        Caption = 'Masks...'
        TabOrder = 6
        OnClick = RegExprMasksButtonClick
      end
    end
  end
end
