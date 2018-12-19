object fExcTalao: TfExcTalao
  Left = 214
  Top = 174
  Width = 284
  Height = 117
  Caption = 'Exclui talões'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 272
    Height = 88
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 40
      Width = 272
      Height = 2
      Shape = bsTopLine
    end
    object StaticText1: TStaticText
      Left = 23
      Top = 14
      Width = 28
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Lote:'
      TabOrder = 0
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 53
      Top = 10
      Width = 73
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 159
      Top = 14
      Width = 34
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Talão:'
      TabOrder = 2
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 195
      Top = 10
      Width = 73
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 30
      Top = 48
      Width = 213
      Height = 35
      BevelInner = bvRaised
      TabOrder = 4
      object BitBtn3: TBitBtn
        Left = 5
        Top = 5
        Width = 100
        Height = 25
        Hint = 'Exclui o talão dos movimentos'
        Caption = '&Exclui Talão'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object BitBtn6: TBitBtn
        Left = 107
        Top = 5
        Width = 100
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn6Click
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
    end
  end
  object tTalaoMov: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbTalaoMov.db'
    Left = 65529
    Top = 65529
    object tTalaoMovLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMovTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMovSetor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMovDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMovHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMovDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMovHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMovCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
  end
  object dsTalaoMov: TDataSource
    DataSet = tTalaoMov
    Left = 25
    Top = 65529
  end
end
