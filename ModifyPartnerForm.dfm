object ModifyPartner: TModifyPartner
  Left = 372
  Top = 233
  BorderStyle = bsDialog
  Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
  ClientHeight = 306
  ClientWidth = 426
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
  object Label6: TLabel
    Left = 63
    Top = 109
    Width = 25
    Height = 13
    Caption = #1048#1084#1103':'
  end
  object Label3: TLabel
    Left = 21
    Top = 133
    Width = 69
    Height = 13
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
  end
  object ButtonSave: TcxButton
    Left = 216
    Top = 264
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = ButtonSaveClick
    LookAndFeel.NativeStyle = False
  end
  object ButtonCancel: TcxButton
    Left = 296
    Top = 264
    Width = 73
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clActiveBorder
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 7
      Width = 27
      Height = 16
      Caption = #1050#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 56
      Top = 7
      Width = 27
      Height = 16
      Caption = #1050#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object EditNazva: TcxButtonEdit
    Left = 96
    Top = 104
    Width = 217
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Style.BorderColor = clBlack
    Style.BorderStyle = ebsUltraFlat
    TabOrder = 3
  end
  object MemoInfo: TcxMemo
    Left = 96
    Top = 128
    Width = 313
    Height = 121
    Style.BorderColor = clBlack
    Style.BorderStyle = ebsUltraFlat
    TabOrder = 4
  end
  object cxRadioGroup1: TcxRadioGroup
    Left = 96
    Top = 36
    Width = 137
    Height = 66
    Properties.Items = <>
    Style.BorderColor = clBlack
    Style.BorderStyle = ebsUltraFlat
    TabOrder = 5
    Caption = #1058#1080#1087' '#1087#1072#1088#1090#1085#1077#1088#1072
  end
  object RadioButtonPostach: TcxRadioButton
    Left = 109
    Top = 48
    Width = 113
    Height = 17
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    Checked = True
    TabOrder = 6
    TabStop = True
  end
  object RadioButtonPokupec: TcxRadioButton
    Left = 109
    Top = 67
    Width = 113
    Height = 13
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
    TabOrder = 7
  end
  object RadioButtonRashod: TcxRadioButton
    Left = 109
    Top = 83
    Width = 113
    Height = 13
    Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1090#1086#1095#1082#1072
    TabOrder = 8
  end
end
