inherited NakladnaForm: TNakladnaForm
  Left = 259
  Top = 296
  Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1086#1090#1087#1091#1089#1082' '#1090#1086#1074#1072#1088#1072' '#1089#1086' '#1089#1082#1083#1072#1076#1072
  ClientHeight = 385
  ClientWidth = 790
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 790
    Height = 121
    Color = clMoneyGreen
    object Label1: TLabel [0]
      Left = 504
      Top = 96
      Width = 37
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    object Label2: TLabel [1]
      Left = 552
      Top = 94
      Width = 53
      Height = 16
      Caption = #1057#1091#1084#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 501
      Top = 72
      Width = 40
      Height = 13
      Caption = #1057#1082#1080#1076#1082#1072':'
    end
    object Label4: TLabel [3]
      Left = 605
      Top = 72
      Width = 8
      Height = 13
      Caption = '%'
    end
    inherited EditDate: TcxDateEdit
      Left = 96
      Top = 28
      Properties.OnChange = EditDatePropertiesChange
      EditValue = 38163d
    end
    inherited cxLabel1: TcxLabel
      Left = 48
      Caption = #1044#1072#1090#1072
    end
    inherited cxLabel2: TcxLabel
      Left = 40
      Caption = #1053#1086#1084#1077#1088
    end
    inherited LabelNomer: TcxLabel
      Left = 96
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
      Properties.OnButtonClick = ButtonEditPostachPropertiesButtonClick
      Style.ButtonTransparency = ebtNone
      TabOrder = 4
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 57
      Width = 67
      Height = 17
      TabOrder = 5
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
    end
    object EditSuma: TcxCalcEdit
      Left = 96
      Top = 87
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
      Left = 16
      Top = 89
      Width = 67
      Height = 17
      TabOrder = 7
      Caption = #1054#1087#1083#1072#1090#1072
    end
    object cxButton4: TcxButton
      Left = 256
      Top = 88
      Width = 75
      Height = 22
      Caption = '<< '#1074#1089#1103' '#1089#1091#1084#1084#1072
      TabOrder = 8
      OnClick = cxButton4Click
      Colors.Normal = clMoneyGreen
      Margin = 1
    end
    object ButtonKlient: TcxButton
      Left = 256
      Top = 56
      Width = 65
      Height = 19
      Caption = '<< '#1082#1083#1080#1077#1085#1090#1091
      TabOrder = 9
      OnClick = ButtonKlientClick
      Colors.Normal = clMoneyGreen
      Margin = 1
    end
    object cxSpinEditProcent: TcxSpinEdit
      Left = 552
      Top = 67
      Width = 49
      Height = 21
      Properties.MaxValue = 99
      Properties.MinValue = -99
      Properties.ValueType = vtFloat
      TabOrder = 10
    end
    object cxButton5: TcxButton
      Left = 720
      Top = 5
      Width = 65
      Height = 22
      Caption = #1055#1086#1076#1072#1090#1082#1086#1074#1072
      TabOrder = 11
      OnClick = cxButton5Click
      OnMouseDown = cxButton5MouseDown
      Colors.Normal = clMoneyGreen
      Margin = 1
    end
  end
  inherited Panel2: TPanel
    Top = 340
    Width = 790
    Color = clMoneyGreen
    inherited cxButton1: TcxButton
      Left = 536
      Width = 249
      Caption = #1042#1099#1087#1080#1089#1072#1090#1100
      Font.Color = clDefault
      Font.Height = -13
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
      Colors.Normal = clMoneyGreen
    end
    inherited cxButton3: TcxButton
      Left = 8
      Width = 97
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl+P)'
      Font.Style = [fsBold]
      ModalResult = 0
      ParentFont = False
      OnClick = cxButton3Click
      OnMouseDown = cxButton3MouseDown
      Colors.Normal = clMoneyGreen
    end
    object cxButton2: TcxButton
      Left = 112
      Top = 8
      Width = 97
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1089#1082#1080#1076#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cxButton2Click
      OnMouseDown = cxButton2MouseDown
      Colors.Normal = clMoneyGreen
    end
    object cxButton6: TcxButton
      Left = 216
      Top = 8
      Width = 105
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100' '#1085#1072#1094#1077#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
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
    Top = 121
    Width = 790
    Height = 219
    inline FrameList1: TFrameList
      Left = 0
      Top = 0
      Width = 788
      Height = 217
      Align = alClient
      TabOrder = 0
      inherited cxGrid1: TcxGrid
        Width = 788
        Height = 192
        inherited GridView1: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
        end
      end
      inherited Panel1: TPanel
        Width = 788
        Color = clMoneyGreen
        inherited ButtonInsert: TcxButton
          OnClick = ButtonInsertClick
          Colors.Normal = clMoneyGreen
        end
        inherited ButtonModify: TcxButton
          OnClick = ButtonModifyClick
          Colors.Normal = clMoneyGreen
        end
        inherited ButtonDelete: TcxButton
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
