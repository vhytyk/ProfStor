object frmcxStyleSheetsLoad: TfrmcxStyleSheetsLoad
  Left = 245
  Top = 137
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Predefined StyleSheets'
  ClientHeight = 267
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 232
    Width = 620
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel: TBevel
      Left = 0
      Top = 0
      Width = 620
      Height = 2
      Align = alTop
    end
    object pnlBottomButtons: TPanel
      Left = 448
      Top = 2
      Width = 172
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnLoad: TButton
        Left = 12
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Load'
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
      object btnClose: TButton
        Left = 93
        Top = 4
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Close'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 232
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object pnlStyles: TPanel
      Left = 4
      Top = 4
      Width = 297
      Height = 224
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object pnlStyleSheetClasses: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbStyleSheetClass: TLabel
          Left = 0
          Top = 0
          Width = 101
          Height = 21
          AutoSize = False
          Caption = 'Style Sheet Class:'
          Layout = tlCenter
        end
        object cbStyleSheetClasses: TComboBox
          Left = 106
          Top = 0
          Width = 191
          Height = 21
          Style = csDropDownList
          Anchors = [akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object lbStyleSheets: TListBox
        Left = 0
        Top = 25
        Width = 297
        Height = 199
        Align = alClient
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 1
      end
    end
    object pnlPreview: TPanel
      Left = 305
      Top = 4
      Width = 311
      Height = 224
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 311
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        object lbPreview: TLabel
          Left = 0
          Top = 0
          Width = 61
          Height = 21
          AutoSize = False
          Caption = 'Preview'
          Layout = tlCenter
        end
      end
      object pnlPreviewClient: TPanel
        Left = 0
        Top = 25
        Width = 311
        Height = 199
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
end
