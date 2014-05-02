inherited NakladnaForm: TNakladnaForm
  Left = 259
  Top = 296
  Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1086#1090#1087#1091#1089#1082' '#1090#1086#1074#1072#1088#1072' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  ClientHeight = 474
  ClientWidth = 972
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 120
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 972
    Height = 149
    Color = clMoneyGreen
    object Label1: TLabel [0]
      Left = 620
      Top = 118
      Width = 46
      Height = 16
      Caption = #1057#1091#1084#1084#1072':'
    end
    object Label2: TLabel [1]
      Left = 679
      Top = 116
      Width = 60
      Height = 20
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 617
      Top = 89
      Width = 50
      Height = 16
      Caption = #1057#1082#1080#1076#1082#1072':'
    end
    object Label4: TLabel [3]
      Left = 745
      Top = 89
      Width = 12
      Height = 16
      Caption = '%'
    end
    inherited EditDate: TcxDateEdit
      Left = 118
      Top = 34
      Properties.OnChange = EditDatePropertiesChange
      EditValue = 38163d
    end
    inherited cxLabel1: TcxLabel
      Left = 59
      Caption = #1044#1072#1090#1072
    end
    inherited cxLabel2: TcxLabel
      Left = 49
      Caption = #1053#1086#1084#1077#1088
    end
    inherited LabelNomer: TcxLabel
      Left = 118
      Caption = #1053#1086#1084#1077#1088
    end
    object EditPartner: TcxButtonEdit
      Left = 118
      Top = 68
      Width = 188
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = ButtonEditPostachPropertiesButtonClick
      Style.ButtonTransparency = ebtNone
      TabOrder = 4
    end
    object cxLabel3: TcxLabel
      Left = 20
      Top = 70
      Width = 87
      Height = 20
      TabOrder = 5
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
    end
    object EditSuma: TcxCalcEdit
      Left = 118
      Top = 107
      Width = 188
      Height = 28
      EditValue = 0c
      ParentFont = False
      TabOrder = 6
    end
    object cxLabel4: TcxLabel
      Left = 20
      Top = 110
      Width = 57
      Height = 20
      TabOrder = 7
      Caption = #1054#1087#1083#1072#1090#1072
    end
    object cxButton4: TcxButton
      Left = 315
      Top = 108
      Width = 92
      Height = 27
      Caption = '<< '#1074#1089#1103' '#1089#1091#1084#1084#1072
      TabOrder = 8
      OnClick = cxButton4Click
      Colors.Normal = clMoneyGreen
      Margin = 1
    end
    object ButtonKlient: TcxButton
      Left = 315
      Top = 69
      Width = 80
      Height = 23
      Caption = '<< '#1082#1083#1080#1077#1085#1090#1091
      TabOrder = 9
      OnClick = ButtonKlientClick
      Colors.Normal = clMoneyGreen
      Margin = 1
    end
    object cxSpinEditProcent: TcxSpinEdit
      Left = 679
      Top = 82
      Width = 61
      Height = 24
      Properties.MaxValue = 99
      Properties.MinValue = -99
      Properties.ValueType = vtFloat
      TabOrder = 10
    end
    object cxButton5: TcxButton
      Left = 886
      Top = 6
      Width = 80
      Height = 27
      Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1072
      TabOrder = 11
      OnClick = cxButton5Click
      OnMouseDown = cxButton5MouseDown
      Colors.Normal = clMoneyGreen
      Margin = 1
    end
  end
  inherited Panel2: TPanel
    Top = 419
    Width = 972
    Color = clMoneyGreen
    inherited cxButton1: TcxButton
      Left = 660
      Width = 306
      Caption = #1042#1099#1087#1080#1089#1072#1090#1100
      Font.Color = clDefault
      Font.Height = -17
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
      Colors.Normal = clMoneyGreen
    end
    inherited cxButton3: TcxButton
      Left = 10
      Width = 119
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl+P)'
      Font.Style = [fsBold]
      ModalResult = 0
      ParentFont = False
      OnClick = cxButton3Click
      OnMouseDown = cxButton3MouseDown
      Colors.Normal = clMoneyGreen
    end
    object cxButton2: TcxButton
      Left = 138
      Top = 10
      Width = 119
      Height = 31
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1082#1080#1076#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cxButton2Click
      OnMouseDown = cxButton2MouseDown
      Colors.Normal = clMoneyGreen
    end
    object cxButton6: TcxButton
      Left = 266
      Top = 10
      Width = 129
      Height = 31
      Caption = #1055#1077#1095#1072#1090#1100' '#1085#1072#1094#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cxButton6Click
      OnMouseDown = cxButton6MouseDown
      Colors.Normal = clMoneyGreen
    end
  end
  inherited Panel3: TPanel
    Top = 149
    Width = 972
    Height = 270
    inline FrameList1: TFrameList
      Left = 0
      Top = 0
      Width = 970
      Height = 268
      Align = alClient
      TabOrder = 0
      inherited cxGrid1: TcxGrid
        Top = 31
        Width = 970
        Height = 237
        inherited GridView1: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
        end
      end
      inherited Panel1: TPanel
        Width = 970
        Height = 31
        Color = clMoneyGreen
        inherited ButtonInsert: TcxButton
          Left = 4
          Width = 29
          Height = 27
          OnClick = ButtonInsertClick
          Colors.Normal = clMoneyGreen
        end
        inherited ButtonModify: TcxButton
          Left = 38
          Width = 30
          Height = 27
          OnClick = ButtonModifyClick
          Colors.Normal = clMoneyGreen
        end
        inherited ButtonDelete: TcxButton
          Left = 73
          Width = 29
          Height = 27
          OnClick = ButtonDeleteClick
          Colors.Normal = clMoneyGreen
        end
      end
    end
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 152
    Top = 88
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = FrameList1.DataSource1
    Left = 184
    Top = 88
  end
end
