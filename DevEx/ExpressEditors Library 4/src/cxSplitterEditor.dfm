object cxSplitEditor: TcxSplitEditor
  Left = 224
  Top = 210
  ActiveControl = cxCbAhd
  BorderStyle = bsDialog
  ClientHeight = 392
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 208
    Width = 473
    Height = 145
    Alignment = alTopLeft
    Caption = ' Preview '
    TabOrder = 0
    object Panel1: TPanel
      Left = 8
      Top = 16
      Width = 457
      Height = 121
      BevelOuter = bvNone
      TabOrder = 0
      object cxListBox1: TcxListBox
        Left = 0
        Top = 0
        Width = 145
        Height = 121
        TabStop = False
        Align = alLeft
        ItemHeight = 13
        ParentColor = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 0
      end
      object cxSplit: TcxSplitter
        Left = 145
        Top = 0
        Width = 8
        Height = 121
        AutoPosition = False
        AutoSnap = True
        Control = cxListBox1
      end
      object cxListBox2: TcxListBox
        Left = 153
        Top = 0
        Width = 304
        Height = 121
        TabStop = False
        Align = alClient
        ItemHeight = 13
        ParentColor = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        TabOrder = 2
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 8
    Width = 153
    Height = 193
    Alignment = alTopLeft
    Caption = ' Operation '
    TabOrder = 1
    object Label1: TLabel
      Left = 27
      Top = 112
      Width = 40
      Height = 13
      Caption = 'Min Size'
    end
    object Label2: TLabel
      Left = 28
      Top = 56
      Width = 88
      Height = 13
      Caption = 'Position after open'
    end
    object cxCbAhd: TcxCheckBox
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Allow HotZone Drag'
      TabOrder = 0
      OnClick = cxCbAhdClick
    end
    object cxCbAp: TcxCheckBox
      Left = 8
      Top = 34
      Width = 105
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Auto Position'
      TabOrder = 1
      OnClick = cxCbApClick
    end
    object cxCbSnap: TcxCheckBox
      Left = 8
      Top = 92
      Width = 105
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Auto Snap'
      TabOrder = 3
      OnClick = cxCbSnapClick
    end
    object cxCbRis: TcxCheckBox
      Left = 8
      Top = 152
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Resize Ignore Snap'
      TabOrder = 5
      OnClick = cxCbRisClick
    end
    object cxCbRu: TcxCheckBox
      Left = 8
      Top = 170
      Width = 105
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Resize Update'
      TabOrder = 6
      OnClick = cxCbRuClick
    end
    object cxSeMs: TcxSpinEdit
      Left = 27
      Top = 126
      Width = 89
      Height = 21
      Properties.MaxValue = 145.000000000000000000
      Properties.SpinButtons.ShowFastButtons = True
      Properties.OnChange = cxSeMsPropertiesChange
      TabOrder = 4
      Value = 30
    end
    object cxSePao: TcxSpinEdit
      Left = 28
      Top = 70
      Width = 89
      Height = 21
      Properties.MaxValue = 200.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.SpinButtons.ShowFastButtons = True
      Properties.OnChange = cxSePaoPropertiesChange
      TabOrder = 2
      Value = 200
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 168
    Top = 8
    Width = 313
    Height = 193
    Alignment = alTopLeft
    Caption = ' Hot Zone '
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 120
      Width = 73
      Height = 13
      Caption = 'HotZone Width'
    end
    object cxRbHzNone: TcxRadioButton
      Left = 10
      Top = 40
      Width = 113
      Height = 17
      Caption = 'None'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = cxRbHzNoneClick
    end
    object cxRbHzMp8: TcxRadioButton
      Left = 10
      Top = 64
      Width = 113
      Height = 17
      Hint = 'MediaPlayer8'
      Caption = 'Media Player 8'
      TabOrder = 2
      OnClick = cxRbHzMp8Click
    end
    object cxRbHzMp9: TcxRadioButton
      Left = 146
      Top = 64
      Width = 113
      Height = 17
      Hint = 'MediaPlayer9'
      Caption = 'Media Player 9'
      TabOrder = 3
      OnClick = cxRbHzMp8Click
    end
    object cxRbHzSimple: TcxRadioButton
      Left = 146
      Top = 90
      Width = 113
      Height = 17
      Hint = 'Simple'
      Caption = 'Simple'
      TabOrder = 4
      OnClick = cxRbHzMp8Click
    end
    object cxRbHzXp: TcxRadioButton
      Left = 10
      Top = 90
      Width = 113
      Height = 17
      Hint = 'XPTaskBar'
      Caption = 'XP Task Bar'
      TabOrder = 5
      OnClick = cxRbHzMp8Click
    end
    object cxCbHzVisible: TcxCheckBox
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      Enabled = False
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = cxCbHzVisiblePropertiesChange
      Properties.Caption = 'Visible'
      TabOrder = 0
    end
    object cxTbHzWidth: TcxTrackBar
      Left = 8
      Top = 136
      Width = 297
      Height = 49
      Properties.Frequency = 5
      Properties.Min = 10
      Properties.Max = 100
      Properties.SelectionStart = 30
      Properties.SelectionEnd = 60
      Properties.SelectionColor = clGreen
      Properties.OnChange = cxTbHzWidthPropertiesChange
      TabOrder = 6
    end
  end
  object cxBtnOK: TcxButton
    Left = 328
    Top = 360
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object cxBtnCancel: TcxButton
    Left = 408
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    Kind = lfFlat
    NativeStyle = True
    Left = 200
    Top = 360
  end
end
