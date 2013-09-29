object ModifyTovarForm: TModifyTovarForm
  Left = 325
  Top = 241
  BorderStyle = bsDialog
  Caption = #1052#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 212
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 29
    Top = 69
    Width = 58
    Height = 13
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
  end
  object Label4: TLabel
    Left = 17
    Top = 116
    Width = 73
    Height = 13
    Caption = #1062#1077#1085#1072' '#1079#1072#1082#1091#1087#1082#1080':'
  end
  object Label5: TLabel
    Left = 16
    Top = 139
    Width = 76
    Height = 13
    Caption = #1062#1077#1085#1072' '#1087#1088#1086#1076#1072#1078#1080':'
  end
  object Label6: TLabel
    Left = 37
    Top = 45
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 96
    Top = 15
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
  object Label1: TLabel
    Left = 64
    Top = 17
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
  object Label7: TLabel
    Left = 59
    Top = 93
    Width = 29
    Height = 13
    Caption = #1043#1088#1091#1087#1072
  end
  object EditPartner: TcxButtonEdit
    Left = 96
    Top = 64
    Width = 217
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditPartnerPropertiesButtonClick
    Style.ButtonStyle = btsDefault
    TabOrder = 2
    OnKeyDown = EditPartnerKeyDown
  end
  object ButtonSave: TcxButton
    Left = 136
    Top = 184
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = ButtonSaveClick
  end
  object ButtonCancel: TcxButton
    Left = 232
    Top = 184
    Width = 73
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = ButtonCancelClick
  end
  object EditCinaZakup: TcxCalcEdit
    Left = 96
    Top = 112
    Width = 121
    Height = 21
    EditValue = 0c
    TabOrder = 3
    OnKeyDown = EditCinaZakupKeyDown
  end
  object EditCinaProdazh: TcxCalcEdit
    Left = 96
    Top = 136
    Width = 121
    Height = 21
    EditValue = 0c
    TabOrder = 4
    OnKeyDown = EditCinaProdazhKeyDown
  end
  object EditNazva: TcxButtonEdit
    Left = 96
    Top = 40
    Width = 217
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
        Visible = False
      end>
    TabOrder = 1
    OnKeyDown = EditNazvaKeyDown
  end
  object EditKod: TcxButtonEdit
    Left = 96
    Top = 16
    Width = 49
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
        Visible = False
      end>
    TabOrder = 0
    OnKeyDown = EditKodKeyDown
  end
  object cxButton1: TcxButton
    Left = 160
    Top = 16
    Width = 65
    Height = 21
    Caption = '<< '#1085#1086#1074#1099#1081
    TabOrder = 7
    OnClick = cxButton1Click
  end
  object EditGroup: TcxButtonEdit
    Left = 96
    Top = 88
    Width = 217
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = EditGrupaPropertiesButtonClick
    Style.ButtonStyle = btsDefault
    TabOrder = 8
    OnKeyDown = EditGroupKeyDown
  end
end
