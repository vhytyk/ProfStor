object fmFilterControlDialog: TfmFilterControlDialog
  Left = 360
  Top = 200
  Width = 526
  Height = 363
  BorderIcons = [biSystemMenu]
  Caption = 'fmFilterControlDialog'
  Color = clBtnFace
  Constraints.MinHeight = 165
  Constraints.MinWidth = 520
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000008
    8EEE8FFFF8FF000888888888888800088EEE8FFFF8FF00088888888888880008
    8E6677FFF8FF0007700007777777000780F607888788000770F6077777770008
    80F807888888000880F807888888000808886070000000706888660700000706
    8F88866070000068F88888660700068FFF88886660000000000000000000C000
    0000C0000000C0000000C0000000C0000000C0000000C0000000C0000000C000
    0000C0000000C0000000C00F000080070000800300000003000000030000}
  KeyPreview = True
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 291
    Width = 518
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btOpen: TcxButton
      Left = 6
      Top = 8
      Width = 74
      Height = 23
      Hint = 'Open|Opens an existing filter'
      Caption = '&Open...'
      TabOrder = 0
      OnClick = acOpenExecute
      UseSystemPaint = False
    end
    object btSave: TcxButton
      Left = 85
      Top = 8
      Width = 76
      Height = 23
      Hint = 'Save As|Saves the active filter with a new name'
      Caption = 'Save &As...'
      TabOrder = 1
      OnClick = acSaveExecute
      UseSystemPaint = False
    end
    object pnlBottomRight: TPanel
      Left = 270
      Top = 0
      Width = 248
      Height = 38
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btApply: TcxButton
        Left = 167
        Top = 8
        Width = 75
        Height = 23
        Caption = 'Apply'
        TabOrder = 2
        OnClick = acApplyExecute
        UseSystemPaint = False
      end
      object btCancel: TcxButton
        Left = 88
        Top = 8
        Width = 75
        Height = 23
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
        UseSystemPaint = False
      end
      object btOk: TcxButton
        Left = 7
        Top = 8
        Width = 74
        Height = 23
        Caption = 'Ok'
        ModalResult = 1
        TabOrder = 0
        OnClick = acOkExecute
        UseSystemPaint = False
      end
    end
  end
  object OpenDialog: TOpenDialog
    Left = 240
    Top = 8
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 272
    Top = 8
  end
end
