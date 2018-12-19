object fArmazenamento_Ref: TfArmazenamento_Ref
  Left = 189
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Armazenamento Refer'#234'ncia'
  ClientHeight = 192
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 39
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 6
      Top = 9
      Width = 74
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 80
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 724
    Height = 153
    Align = alClient
    TabOrder = 1
    DesignSize = (
      724
      153)
    object Label1: TLabel
      Left = 579
      Top = 10
      Width = 39
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Mov:'
    end
    object Label2: TLabel
      Left = 83
      Top = 24
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Caixa:'
    end
    object Label3: TLabel
      Left = 56
      Top = 48
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Companhia:'
    end
    object Label4: TLabel
      Left = 57
      Top = 72
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
    end
    object Label5: TLabel
      Left = 86
      Top = 96
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data:'
    end
    object DBEdit1: TDBEdit
      Left = 619
      Top = 2
      Width = 102
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clScrollBar
      DataField = 'ID'
      DataSource = DMArmazenamento_Ref.dsArmazenamento_Ref
      ReadOnly = True
      TabOrder = 0
    end
    object DBDateEdit1: TDBDateEdit
      Left = 120
      Top = 88
      Width = 90
      Height = 21
      DataField = 'DATA'
      DataSource = DMArmazenamento_Ref.dsArmazenamento_Ref
      NumGlyphs = 2
      TabOrder = 1
      StartOfWeek = Sun
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 16
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CAIXA'
      DataSource = DMArmazenamento_Ref.dsArmazenamento_Ref
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 40
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CIA'
      DataSource = DMArmazenamento_Ref.dsArmazenamento_Ref
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 120
      Top = 64
      Width = 200
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REFERENCIA'
      DataSource = DMArmazenamento_Ref.dsArmazenamento_Ref
      TabOrder = 4
    end
  end
end
