inherited KassaPrihodForm: TKassaPrihodForm
  Left = 162
  Top = 130
  Caption = #1055#1088#1080#1093#1086#1076' '#1074' '#1082#1072#1089#1089#1091
  ClientHeight = 210
  ClientWidth = 643
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 643
    Height = 225
    Color = clMoneyGreen
    inherited EditDate: TcxDateEdit
      Left = 96
      Properties.OnCloseUp = EditDatePropertiesCloseUp
    end
    inherited cxLabel1: TcxLabel
      Left = 48
      Caption = #1044#1072#1090#1072
    end
    inherited cxLabel2: TcxLabel
      Left = 40
      Visible = False
      Caption = #1053#1086#1084#1077#1088
    end
    inherited LabelNomer: TcxLabel
      Left = 96
      Visible = False
      Caption = #1053#1086#1084#1077#1088
    end
    object EditPartner: TcxButtonEdit
      Left = 96
      Top = 55
      Width = 153
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditPartnerPropertiesButtonClick
      TabOrder = 4
    end
    object cxLabel3: TcxLabel
      Left = 32
      Top = 55
      Width = 51
      Height = 17
      TabOrder = 5
      Caption = #1055#1072#1088#1090#1085#1077#1088
    end
    object EditSuma: TcxCalcEdit
      Left = 96
      Top = 88
      Width = 153
      Height = 24
      EditValue = 0c
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
    object cxLabel4: TcxLabel
      Left = 41
      Top = 90
      Width = 42
      Height = 17
      TabOrder = 7
      Caption = #1057#1091#1084#1084#1072
    end
  end
  inherited Panel2: TPanel
    Top = 165
    Width = 643
    Color = clMoneyGreen
    inherited cxButton1: TcxButton
      Left = 524
      Width = 99
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Font.Height = -13
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
      Colors.Normal = clMoneyGreen
    end
    inherited cxButton3: TcxButton
      Colors.Normal = clMoneyGreen
    end
  end
  inherited Panel3: TPanel
    Top = 225
    Width = 643
    Height = 2
  end
  object Memo1: TcxMemo
    Left = 256
    Top = 56
    Width = 281
    Height = 67
    TabOrder = 3
  end
end
