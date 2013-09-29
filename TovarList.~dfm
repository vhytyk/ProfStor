object TovarListForm: TTovarListForm
  Left = 270
  Top = 219
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 264
  ClientWidth = 584
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameList1: TFrameList
    Left = 0
    Top = 0
    Width = 584
    Height = 264
    Align = alClient
    TabOrder = 0
    inherited cxGrid1: TcxGrid
      Top = 57
      Width = 584
      Height = 207
      inherited GridView1: TcxGridDBTableView
        OnDblClick = FrameList1GridView1DblClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
      end
    end
    inherited Panel1: TPanel
      Width = 584
      Height = 57
      inherited ButtonInsert: TcxButton
        OnClick = ButtonInsertClick
      end
      inherited ButtonModify: TcxButton
        OnClick = ButtonModifyClick
      end
      inherited ButtonDelete: TcxButton
        Enabled = False
        OnClick = ButtonDeleteClick
      end
    end
    inherited cxHintStyleController1: TcxHintStyleController
      Left = 184
      Top = 80
    end
  end
  object cxTextEdit1: TcxTextEdit
    Left = 32
    Top = 33
    Width = 65
    Height = 21
    Properties.OnChange = cxTextEdit1PropertiesChange
    TabOrder = 1
  end
  object cxLabel1: TcxLabel
    Left = 4
    Top = 34
    Width = 27
    Height = 17
    TabOrder = 2
    Caption = #1050#1086#1076
  end
  object cxTextEdit2: TcxTextEdit
    Left = 160
    Top = 33
    Width = 153
    Height = 21
    Properties.OnChange = cxTextEdit2PropertiesChange
    TabOrder = 3
  end
  object cxLabel2: TcxLabel
    Left = 100
    Top = 34
    Width = 58
    Height = 17
    TabOrder = 4
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
end
