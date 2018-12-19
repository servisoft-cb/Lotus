object fFichaConstrucao_Pos: TfFichaConstrucao_Pos
  Left = 252
  Top = 189
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fFichaConstrucao_Pos'
  ClientHeight = 153
  ClientWidth = 418
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 41
    Height = 13
    Caption = 'Posi'#231#227'o:'
  end
  object DBEdit1: TDBEdit
    Left = 75
    Top = 16
    Width = 318
    Height = 21
    DataField = 'NOMEPOSICAO'
    DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
    TabOrder = 0
  end
  object DBCheckBox1: TDBCheckBox
    Left = 80
    Top = 48
    Width = 321
    Height = 17
    Caption = 'Informar somente o nome do material'
    DataField = 'SOMENTEMATERIAL'
    DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
    TabOrder = 1
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 80
    Top = 65
    Width = 321
    Height = 17
    Caption = 'Informar tamanhos'
    DataField = 'InformarGrade'
    DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
    TabOrder = 2
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBCheckBox3: TDBCheckBox
    Left = 80
    Top = 83
    Width = 321
    Height = 17
    Caption = 'Informar tipos de materiais'
    DataField = 'InformarOpcaoMat'
    DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
    TabOrder = 3
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object Panel1: TPanel
    Left = 0
    Top = 112
    Width = 418
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 128
      Top = 8
      Width = 100
      Height = 28
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 227
      Top = 8
      Width = 100
      Height = 28
      Caption = 'Cancelar'
      TabOrder = 1
    end
  end
end
