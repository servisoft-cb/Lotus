object fLeitorTalaoAuxiliar: TfLeitorTalaoAuxiliar
  Left = 404
  Top = 331
  Width = 335
  Height = 174
  Caption = 'Leitor de Tal'#227'o Auxiliar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel4: TRxLabel
    Left = 8
    Top = 25
    Width = 94
    Height = 20
    Caption = 'C'#243'd. Barra:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 104
    Top = 14
    Width = 217
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 12
    ParentFont = False
    TabOrder = 0
    OnKeyDown = Edit1KeyDown
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 56
    Width = 321
    Height = 59
    Caption = 'Status... '
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 306
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Aguardando Leitura...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 213
    Top = 117
    Width = 110
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = 'Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
      038383838383830E603800000000380E660033333330830E660333333330000E
      660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
      660300000E60330E660333330600330E660333330030330E6603333333303330
      E6033333333033330E0333333330000000033333333333333333}
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 56
    Top = 56
  end
end
