object FormReport: TFormReport
  Left = 143
  Top = 155
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1072' '#1086#1090#1095#1077#1090#1072
  ClientHeight = 376
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 691
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cxButton2: TcxButton
      Left = 480
      Top = 16
      Width = 89
      Height = 28
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl+P)'
      TabOrder = 0
      OnClick = cxButton2Click
      OnMouseDown = cxButton2MouseDown
    end
    object cxButton3: TcxButton
      Left = 584
      Top = 16
      Width = 89
      Height = 28
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      UseSystemPaint = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object DateStart: TcxDateEdit
      Left = 2
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      EditValue = 0d
    end
    object DateEnd: TcxDateEdit
      Left = 200
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 1
      EditValue = 0d
    end
    object cxButton1: TcxButton
      Left = 608
      Top = 6
      Width = 81
      Height = 22
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      TabOrder = 2
      OnClick = cxButton1Click
    end
  end
  inline FrameList1: TFrameList
    Left = 0
    Top = 33
    Width = 691
    Height = 287
    Align = alClient
    TabOrder = 2
    inherited cxGrid1: TcxGrid
      Width = 691
      Height = 262
      inherited GridView1: TcxGridDBTableView
        DataController.Filter.OnChanged = FrameList1GridView1DataControllerFilterChanged
        DataController.Filter.AutoDataSetFilter = True
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
      end
    end
    inherited Panel1: TPanel
      Width = 691
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
