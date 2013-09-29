object AktPrihodListForm: TAktPrihodListForm
  Left = 478
  Top = 272
  Width = 823
  Height = 419
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1082#1090#1086#1074' '#1087#1088#1080#1093#1086#1076#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    807
    380)
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameList1: TFrameList
    Left = 0
    Top = 0
    Width = 807
    Height = 380
    Align = alClient
    TabOrder = 0
    inherited cxGrid1: TcxGrid
      Width = 807
      Height = 355
      inherited GridView1: TcxGridDBTableView
        OnDblClick = ButtonModifyClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
      end
    end
    inherited Panel1: TPanel
      Width = 807
      inherited ButtonInsert: TcxButton
        Enabled = False
      end
      inherited ButtonModify: TcxButton
        OnClick = ButtonModifyClick
      end
      inherited ButtonDelete: TcxButton
        OnClick = ButtonDeleteClick
      end
    end
  end
  object GroupBoxSearch: TGroupBox
    Left = 634
    Top = 1
    Width = 171
    Height = 57
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 22
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object editSearch: TEdit
      Left = 40
      Top = 21
      Width = 81
      Height = 21
      TabOrder = 0
      OnKeyUp = editSearchKeyUp
    end
  end
end
