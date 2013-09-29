object KassaFormList: TKassaFormList
  Left = 200
  Top = 152
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1074#1080#1078#1077#1085#1080#1081' '#1087#1086' '#1082#1072#1089#1089#1077
  ClientHeight = 431
  ClientWidth = 755
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
  inline FrameList1: TFrameList
    Left = 0
    Top = 0
    Width = 755
    Height = 344
    Align = alClient
    TabOrder = 0
    inherited cxGrid1: TcxGrid
      Width = 755
      Height = 319
      inherited GridView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
      end
    end
    inherited Panel1: TPanel
      Width = 755
      inherited ButtonInsert: TcxButton
        Enabled = False
      end
      inherited ButtonModify: TcxButton
        Enabled = False
      end
      inherited ButtonDelete: TcxButton
        OnClick = ButtonDeleteClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 755
    Height = 87
    Align = alBottom
    TabOrder = 1
    object cxDBMemo1: TcxDBMemo
      Left = 1
      Top = 1
      Width = 753
      Height = 85
      Align = alClient
      DataBinding.DataField = 'comment'
      DataBinding.DataSource = FrameList1.DataSource1
      Properties.ScrollBars = ssVertical
      Style.Color = clInfoBk
      TabOrder = 0
    end
  end
end
