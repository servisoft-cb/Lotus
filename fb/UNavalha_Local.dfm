object fNavalha_Local: TfNavalha_Local
  Left = 189
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Armazenamento Refer'#234'ncia'
  ClientHeight = 236
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
    Height = 197
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 69
      Top = 17
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Navalha:'
    end
    object Label2: TLabel
      Left = 52
      Top = 41
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Localiza'#231#227'o:'
    end
    object Label3: TLabel
      Left = 71
      Top = 65
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Reorder:'
    end
    object Label4: TLabel
      Left = 47
      Top = 89
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data entrada:'
    end
    object Label6: TLabel
      Left = 45
      Top = 113
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data estoque:'
    end
    object Label7: TLabel
      Left = 42
      Top = 137
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data descarte:'
    end
    object Label5: TLabel
      Left = 419
      Top = 17
      Width = 39
      Height = 13
      Caption = 'N'#186' Mov:'
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 33
      Width = 250
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LOCALIZACAO'
      DataSource = DMNavalha_Local.dsNavalha_Local
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 57
      Width = 250
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REORDER'
      DataSource = DMNavalha_Local.dsNavalha_Local
      TabOrder = 2
    end
    object DBDateEdit1: TDBDateEdit
      Left = 120
      Top = 81
      Width = 90
      Height = 21
      DataField = 'DTENTRADA'
      DataSource = DMNavalha_Local.dsNavalha_Local
      NumGlyphs = 2
      TabOrder = 3
      StartOfWeek = Sun
    end
    object DBDateEdit2: TDBDateEdit
      Left = 120
      Top = 105
      Width = 90
      Height = 21
      DataField = 'DTESTOQUE'
      DataSource = DMNavalha_Local.dsNavalha_Local
      NumGlyphs = 2
      TabOrder = 4
      StartOfWeek = Sun
    end
    object DBDateEdit3: TDBDateEdit
      Left = 120
      Top = 129
      Width = 90
      Height = 21
      DataField = 'DTDESCARTE'
      DataSource = DMNavalha_Local.dsNavalha_Local
      NumGlyphs = 2
      TabOrder = 5
      StartOfWeek = Sun
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 9
      Width = 249
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NAVALHA'
      DataSource = DMNavalha_Local.dsNavalha_Local
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 464
      Top = 9
      Width = 81
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      DataField = 'ID'
      DataSource = DMNavalha_Local.dsNavalha_Local
      ReadOnly = True
      TabOrder = 6
    end
  end
end
