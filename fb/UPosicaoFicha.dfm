object fPosicaoFicha: TfPosicaoFicha
  Left = 88
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Posi'#231#227'o Ficha'
  ClientHeight = 154
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
    Height = 115
    Align = alClient
    TabOrder = 1
    DesignSize = (
      724
      115)
    object Label1: TLabel
      Left = 579
      Top = 10
      Width = 39
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'N'#186' Mov:'
    end
    object Label8: TLabel
      Left = 48
      Top = 11
      Width = 41
      Height = 13
      Caption = 'Posi'#231#227'o:'
    end
    object Label7: TLabel
      Left = 55
      Top = 36
      Width = 34
      Height = 13
      Caption = 'Ordem:'
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
      DataSource = DMPosicao_Ficha.dsPosicao_Ficha
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 90
      Top = 3
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEPOSICAO'
      DataSource = DMPosicao_Ficha.dsPosicao_Ficha
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 90
      Top = 28
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ORDEM'
      DataSource = DMPosicao_Ficha.dsPosicao_Ficha
      TabOrder = 1
    end
    object DBCheckBox1: TDBCheckBox
      Left = 96
      Top = 57
      Width = 313
      Height = 17
      Caption = 'Informar somente o nome do material'
      DataField = 'SOMENTEMATERIAL'
      DataSource = DMPosicao_Ficha.dsPosicao_Ficha
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 96
      Top = 73
      Width = 313
      Height = 17
      Caption = 'Informar tamanhos'
      DataField = 'INFORMARGRADE'
      DataSource = DMPosicao_Ficha.dsPosicao_Ficha
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 96
      Top = 89
      Width = 313
      Height = 17
      Caption = 'Informar tipos de materiais'
      DataField = 'INFORMAROPCAOMAT'
      DataSource = DMPosicao_Ficha.dsPosicao_Ficha
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
end
