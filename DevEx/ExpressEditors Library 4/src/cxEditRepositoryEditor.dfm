inherited cxEditRepositoryEditor: TcxEditRepositoryEditor
  Left = 363
  Top = 194
  Width = 367
  Height = 417
  Caption = 'EditRepository editor'
  PopupMenu = PopupMenu1
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 13
  object LBItems: TListBox
    Left = 0
    Top = 0
    Width = 272
    Height = 389
    Align = alClient
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
    OnClick = LBItemsClick
  end
  object Panel1: TPanel
    Left = 272
    Top = 0
    Width = 87
    Height = 389
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object btAdd: TButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Add...'
      TabOrder = 0
      OnClick = btAddClick
    end
    object btDelete: TButton
      Left = 6
      Top = 40
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 1
      OnClick = btDeleteClick
    end
    object btClose: TButton
      Left = 6
      Top = 357
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btCloseClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 16
    object miAdd: TMenuItem
      Caption = 'Add'
      ShortCut = 45
      OnClick = miAddClick
    end
    object miDelete: TMenuItem
      Caption = 'Delete'
      Enabled = False
      ShortCut = 46
      OnClick = miDeleteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miSelectAll: TMenuItem
      Caption = 'Select all'
      Enabled = False
      ShortCut = 16449
      OnClick = miSelectAllClick
    end
  end
end
