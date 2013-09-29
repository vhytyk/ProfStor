object cxShellBrowserDlg: TcxShellBrowserDlg
  Left = 496
  Top = 173
  Width = 316
  Height = 392
  ActiveControl = cxStv
  BorderIcons = [biSystemMenu]
  Caption = 'Browse for Folder'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object lblFolder: TLabel
    Left = 12
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Current Folder'
  end
  object cxStv: TcxShellTreeView
    Left = 12
    Top = 56
    Width = 284
    Height = 261
    Anchors = [akLeft, akTop, akRight, akBottom]
    DragDropSettings.AllowDragObjects = True
    DragDropSettings.DropEffect = [deCopy, deMove, deLink]
    DragDropSettings.Scroll = True
    DragDropSettings.DefaultDropEffect = deMove
    HideSelection = False
    Indent = 19
    Options.ShowNonFolders = False
    ParentColor = False
    Root.BrowseFolder = bfDesktop
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 0
    OnChange = cxStvChange
  end
  object cxTeFolder: TcxTextEdit
    Left = 12
    Top = 24
    Width = 284
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    Properties.ReadOnly = True
    Style.Color = clWindow
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 139
    Top = 323
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 219
    Top = 323
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    UseSystemPaint = False
  end
end
