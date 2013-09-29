object frmdxAddNewRegKey: TfrmdxAddNewRegKey
  Left = 195
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Add a new registry key'
  ClientHeight = 68
  ClientWidth = 227
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 2
    Top = 12
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Edit: TEdit
    Left = 54
    Top = 8
    Width = 170
    Height = 21
    TabOrder = 0
    OnChange = EditChange
  end
  object bOk: TButton
    Left = 73
    Top = 40
    Width = 72
    Height = 22
    Caption = '&OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 152
    Top = 40
    Width = 72
    Height = 22
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
