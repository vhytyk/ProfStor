inherited KassaRashodForm: TKassaRashodForm
  Left = 192
  Top = 172
  Caption = #1056#1072#1089#1093#1086#1076' '#1089' '#1082#1072#1089#1089#1099
  ClientHeight = 223
  ClientWidth = 683
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 683
    Height = 177
    Color = clMedGray
    inherited EditDate: TcxDateEdit
      Left = 96
      Properties.OnCloseUp = EditDatePropertiesCloseUp
    end
    inherited cxLabel1: TcxLabel
      Left = 48
      Caption = #1044#1072#1090#1072
    end
    inherited cxLabel2: TcxLabel
      Caption = #1053#1086#1084#1077#1088
    end
    inherited LabelNomer: TcxLabel
      Caption = #1053#1086#1084#1077#1088
    end
    object EditSuma: TcxCalcEdit
      Left = 96
      Top = 79
      Width = 153
      Height = 24
      EditValue = 0c
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxLabel4: TcxLabel
      Left = 49
      Top = 83
      Width = 42
      Height = 17
      TabOrder = 5
      Caption = #1057#1091#1084#1084#1072
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
      TabOrder = 6
    end
    object Memo1: TcxMemo
      Left = 256
      Top = 56
      Width = 281
      Height = 67
      TabOrder = 7
    end
    object cxLabel3: TcxLabel
      Left = 41
      Top = 59
      Width = 51
      Height = 17
      TabOrder = 8
      Caption = #1055#1072#1088#1090#1085#1077#1088
    end
  end
  inherited Panel2: TPanel
    Top = 178
    Width = 683
    Color = clMedGray
    inherited cxButton1: TcxButton
      Left = 528
      Width = 129
      Caption = #1054#1087#1083#1072#1090#1080#1090#1100
      Font.Color = clTeal
      Font.Height = -13
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
    end
    inherited cxButton3: TcxButton
      Caption = #1055#1077#1095#1072#1090#1100
      Visible = False
    end
  end
  inherited Panel3: TPanel
    Top = 177
    Width = 683
    Height = 1
  end
end
