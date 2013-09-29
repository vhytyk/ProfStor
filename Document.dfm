object DocumentForm: TDocumentForm
  Left = 246
  Top = 162
  BorderStyle = bsDialog
  Caption = 'DocumentForm'
  ClientHeight = 461
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object EditDate: TcxDateEdit
      Left = 56
      Top = 26
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 30
      Width = 34
      Height = 17
      TabOrder = 1
      Caption = #1044#1072#1090#1072
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 8
      Width = 42
      Height = 17
      TabOrder = 2
      Caption = #1053#1086#1084#1077#1088
    end
    object LabelNomer: TcxLabel
      Left = 56
      Top = 8
      Width = 48
      Height = 17
      ParentFont = False
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfStandard
      Style.Shadow = False
      TabOrder = 3
      Caption = #1053#1086#1084#1077#1088
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 703
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    DesignSize = (
      701
      43)
    object cxButton1: TcxButton
      Left = 512
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
    end
    object cxButton3: TcxButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Print'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 703
    Height = 327
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
  end
end
