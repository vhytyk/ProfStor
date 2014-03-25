object FormReport: TFormReport
  Left = 143
  Top = 155
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1072' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 463
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 394
    Width = 850
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cxButton2: TcxButton
      Left = 591
      Top = 20
      Width = 109
      Height = 34
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl+P)'
      TabOrder = 0
      OnClick = cxButton2Click
      OnMouseDown = cxButton2MouseDown
    end
    object cxButton3: TcxButton
      Left = 719
      Top = 20
      Width = 109
      Height = 34
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      UseSystemPaint = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 850
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object DateStart: TcxDateEdit
      Left = 2
      Top = 10
      Width = 149
      Height = 24
      TabOrder = 0
      EditValue = 0d
    end
    object DateEnd: TcxDateEdit
      Left = 246
      Top = 10
      Width = 149
      Height = 24
      TabOrder = 1
      EditValue = 0d
    end
    object cxButton1: TcxButton
      Left = 748
      Top = 7
      Width = 100
      Height = 27
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      TabOrder = 2
      OnClick = cxButton1Click
    end
    object cxLabel3: TcxLabel
      Left = 412
      Top = 10
      Width = 87
      Height = 20
      TabOrder = 3
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
    end
    object EditPartner: TcxButtonEdit
      Left = 510
      Top = 9
      Width = 188
      Height = 24
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = EditPartnerPropertiesButtonClick
      Style.ButtonTransparency = ebtNone
      TabOrder = 4
    end
  end
  inline FrameList1: TFrameList
    Left = 0
    Top = 41
    Width = 850
    Height = 353
    Align = alClient
    TabOrder = 2
    inherited cxGrid1: TcxGrid
      Top = 31
      Width = 850
      Height = 322
      inherited GridView1: TcxGridDBTableView
        DataController.Filter.OnChanged = FrameList1GridView1DataControllerFilterChanged
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
      end
    end
    inherited Panel1: TPanel
      Width = 850
      Height = 31
      inherited ButtonInsert: TcxButton
        Left = 4
        Width = 29
        Height = 27
      end
      inherited ButtonModify: TcxButton
        Left = 38
        Width = 30
        Height = 27
      end
      inherited ButtonDelete: TcxButton
        Left = 73
        Width = 29
        Height = 27
      end
    end
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 184
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = FrameList1.DataSource1
    Left = 152
    Top = 8
  end
end
