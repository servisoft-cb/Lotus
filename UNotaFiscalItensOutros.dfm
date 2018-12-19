object fNotaFiscalItensOutros: TfNotaFiscalItensOutros
  Left = 153
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe o mercado'
  ClientHeight = 112
  ClientWidth = 248
  Color = 10930928
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 223
    Height = 26
    Caption = 
      'Este campo vai ser usado para classificar '#13#10'o estoque em (Export' +
      'a'#231#227'o ou Mercado Interno)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 53
    Width = 45
    Height = 13
    Caption = 'Mercado:'
  end
  object RxDBComboBox1: TRxDBComboBox
    Left = 72
    Top = 48
    Width = 129
    Height = 21
    Style = csDropDownList
    DataField = 'Mercado'
    DataSource = DM1.dsNotaFiscalItens
    EnableValues = True
    ItemHeight = 13
    Items.Strings = (
      'Exporta'#231#227'o'
      'Interno')
    TabOrder = 0
    Values.Strings = (
      'E'
      'I')
  end
  object BitBtn1: TBitBtn
    Left = 111
    Top = 74
    Width = 90
    Height = 30
    Caption = '&Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
