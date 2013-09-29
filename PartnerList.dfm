object PartnerListForm: TPartnerListForm
  Left = 287
  Top = 213
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1090#1085#1077#1088#1099
  ClientHeight = 260
  ClientWidth = 557
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
    Width = 557
    Height = 208
    Align = alClient
    TabOrder = 0
    inherited cxGrid1: TcxGrid
      Top = 41
      Width = 557
      Height = 167
      OnDblClick = ButtonModifyClick
      inherited GridView1: TcxGridDBTableView
        OnDblClick = FrameList1GridView1DblClick
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
      end
    end
    inherited Panel1: TPanel
      Width = 557
      Height = 41
      inherited ButtonInsert: TcxButton
        Top = 17
        OnClick = ButtonInsertClick
      end
      inherited ButtonModify: TcxButton
        Top = 17
        OnClick = ButtonModifyClick
      end
      inherited ButtonDelete: TcxButton
        Top = 17
        OnClick = ButtonDeleteClick
      end
    end
  end
  object cxDBMemo1: TcxDBMemo
    Left = 0
    Top = 208
    Width = 557
    Height = 52
    Align = alBottom
    DataBinding.DataField = 'info'
    DataBinding.DataSource = FrameList1.DataSource1
    Properties.ScrollBars = ssVertical
    Style.Color = clInfoBk
    TabOrder = 1
  end
  object RadioButtonPostach: TcxRadioButton
    Left = 93
    Top = -2
    Width = 113
    Height = 17
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
    Checked = True
    TabOrder = 2
    TabStop = True
    OnClick = RadioButtonPostachClick
  end
  object RadioButtonPokupec: TcxRadioButton
    Left = 93
    Top = 13
    Width = 113
    Height = 13
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1080
    TabOrder = 3
    OnClick = RadioButtonPokupecClick
  end
  object RadioButtonRashod: TcxRadioButton
    Left = 93
    Top = 26
    Width = 113
    Height = 13
    Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1090#1086#1095#1082#1080
    TabOrder = 4
    OnClick = RadioButtonRashodClick
  end
end
