object OptionsForm: TOptionsForm
  Left = 258
  Top = 177
  BorderStyle = bsDialog
  Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 467
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 479
    Height = 416
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1103#1079#1100
      object cxLabel1: TcxLabel
        Left = 8
        Top = 32
        Width = 111
        Height = 17
        TabOrder = 0
        Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093':'
      end
      object EditDBName: TcxButtonEdit
        Left = 8
        Top = 56
        Width = 457
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1083#1072#1074#1085#1086#1077' '#1086#1082#1085#1086
      ImageIndex = 1
      object Label1: TLabel
        Left = 168
        Top = 165
        Width = 106
        Height = 13
        Caption = #1062#1074#1077#1090' '#1086#1082#1085#1072' '#1080' '#1087#1072#1085#1077#1083#1077#1081
      end
      object Label2: TLabel
        Left = 168
        Top = 197
        Width = 86
        Height = 13
        Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072' '#1089#1077#1090#1082#1080
      end
      object CheckWindowState: TcxCheckBox
        Left = 8
        Top = 16
        Width = 233
        Height = 21
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1087#1088#1080' '#1079#1072#1075#1088#1091#1079#1082#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1088#1072#1079#1074#1077#1088#1085#1091#1090#1099#1084
        TabOrder = 0
      end
      object MainColor: TcxColorComboBox
        Left = 13
        Top = 161
        Width = 148
        Height = 21
        Properties.DefaultDescription = #1062#1074#1077#1090' '#1086#1082#1085#1072' '#1080' '#1087#1072#1085#1077#1083#1077#1081
        Properties.Items = <>
        Properties.PrepareInfo = ''
        TabOrder = 1
      end
      object CheckGroupPanel: TcxCheckBox
        Left = 8
        Top = 36
        Width = 193
        Height = 21
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1080#1088#1086#1074#1082#1080
        TabOrder = 2
      end
      object GridColor: TcxColorComboBox
        Left = 13
        Top = 193
        Width = 148
        Height = 21
        Properties.DefaultDescription = #1062#1074#1077#1090' '#1086#1082#1085#1072' '#1080' '#1087#1072#1085#1077#1083#1077#1081
        Properties.Items = <>
        Properties.PrepareInfo = ''
        TabOrder = 3
      end
      object CheckBoxRefresh: TcxCheckBox
        Left = 8
        Top = 56
        Width = 241
        Height = 21
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1073#1085#1086#1074#1083#1103#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089#1082#1083#1072#1076#1072
        TabOrder = 4
        OnClick = CheckBoxRefreshClick
      end
      object EditTimeRefresh: TcxTextEdit
        Left = 248
        Top = 56
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 5
        Text = '3'
      end
      object cxLabel2: TcxLabel
        Left = 280
        Top = 56
        Width = 29
        Height = 17
        TabOrder = 6
        Caption = #1089#1077#1082'.'
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 479
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 392
      Top = 16
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 192
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 280
      Top = 16
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ModalResult = 2
      TabOrder = 2
    end
  end
end
