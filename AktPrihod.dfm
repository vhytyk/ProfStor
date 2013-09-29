inherited PrihodForm: TPrihodForm
  Left = 222
  Top = 157
  Caption = #1040#1082#1090' '#1087#1088#1080#1093#1086#1076#1072
  ClientHeight = 394
  ClientWidth = 778
  OldCreateOrder = True
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 778
    Height = 121
    Color = 16776176
    object Label2: TLabel [0]
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
    object Label1: TLabel [1]
      Left = 504
      Top = 96
      Width = 37
      Height = 13
      Caption = #1057#1091#1084#1084#1072':'
    end
    inherited EditDate: TcxDateEdit
      Left = 96
      Properties.OnChange = EditDatePropertiesChange
      OnKeyPress = EditDateKeyPress
    end
    inherited cxLabel1: TcxLabel
      Left = 56
      Caption = #1044#1072#1090#1072
    end
    inherited cxLabel2: TcxLabel
      Left = 48
      Caption = #1053#1086#1084#1077#1088
    end
    inherited LabelNomer: TcxLabel
      Left = 96
      Caption = #1053#1086#1084#1077#1088
    end
    object cxLabel3: TcxLabel
      Left = 24
      Top = 57
      Width = 67
      Height = 17
      TabOrder = 4
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
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
      TabOrder = 5
    end
    object cxButton4: TcxButton
      Left = 256
      Top = 88
      Width = 75
      Height = 22
      Caption = '<< '#1074#1089#1103' '#1089#1091#1084#1084#1072
      TabOrder = 6
      OnClick = cxButton4Click
      Colors.Normal = 16776176
      Margin = 1
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
      TabOrder = 7
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 89
      Width = 67
      Height = 17
      TabOrder = 8
      Caption = #1054#1087#1083#1072#1090#1072
    end
  end
  inherited Panel2: TPanel
    Top = 349
    Width = 778
    Color = 16776176
    inherited cxButton1: TcxButton
      Left = 552
      Width = 217
      Caption = #1042#1099#1087#1080#1089#1072#1090#1100
      Font.Height = -13
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
      Colors.Normal = 16776176
    end
    inherited cxButton3: TcxButton
      Width = 105
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl+P)'
      Font.Style = [fsBold]
      ModalResult = 0
      ParentFont = False
      OnClick = cxButton3Click
      OnMouseDown = cxButton3MouseDown
      Colors.Normal = 16776176
    end
  end
  inherited Panel3: TPanel
    Top = 121
    Width = 778
    Height = 228
    inline FrameList1: TFrameList
      Left = 0
      Top = 0
      Width = 776
      Height = 226
      Align = alClient
      TabOrder = 0
      inherited cxGrid1: TcxGrid
        Width = 776
        Height = 201
        inherited GridView1: TcxGridDBTableView
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
        end
      end
      inherited Panel1: TPanel
        Width = 776
        Color = 16776176
        inherited ButtonInsert: TcxButton
          OnClick = ButtonInsertClick
          Colors.Normal = 16776176
        end
        inherited ButtonModify: TcxButton
          OnClick = ButtonModifyClick
          Colors.Normal = 16776176
        end
        inherited ButtonDelete: TcxButton
          OnClick = ButtonDeleteClick
          Colors.Normal = 16776176
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
    Left = 224
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = FrameList1.DataSource1
    Left = 288
    Top = 48
  end
end
