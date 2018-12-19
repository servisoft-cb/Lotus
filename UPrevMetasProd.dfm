object fPrevMetasProd: TfPrevMetasProd
  Left = 290
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Metas/Produzidos'
  ClientHeight = 165
  ClientWidth = 528
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 165
    Align = alClient
    TabOrder = 0
    object Bevel1: TBevel
      Left = -1
      Top = 81
      Width = 514
      Height = 2
      Shape = bsTopLine
      Style = bsRaised
    end
    object Label4: TLabel
      Left = 138
      Top = 137
      Width = 280
      Height = 20
      Caption = '..... Aguarde, gerando registros .....'
      Color = 13882323
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object StaticText1: TStaticText
      Left = 94
      Top = 56
      Width = 60
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Data Inicial:'
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 275
      Top = 56
      Width = 55
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Data Final:'
      TabOrder = 1
    end
    object DateEdit1: TDateEdit
      Left = 156
      Top = 52
      Width = 104
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object DateEdit2: TDateEdit
      Left = 332
      Top = 52
      Width = 105
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 171
      Top = 87
      Width = 210
      Height = 41
      BevelInner = bvRaised
      TabOrder = 4
      object BitBtn6: TBitBtn
        Left = 5
        Top = 8
        Width = 100
        Height = 27
        Hint = 'Imprime o relat'#243'rio cfe. sele'#231#227'o acima'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn6Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777700000000000777707777777770707700000000000007070777777BBB77
          0007077777788877070700000000000007700777777777707070700000000007
          0700770FFFFFFFF070707770F00000F000077770FFFFFFFF077777770F00000F
          077777770FFFFFFFF07777777000000000777777777777777777}
      end
      object BitBtn1: TBitBtn
        Left = 105
        Top = 8
        Width = 100
        Height = 27
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
    end
    object RadioGroup1: TRadioGroup
      Left = 5
      Top = 3
      Width = 346
      Height = 40
      Caption = 'Op'#231#227'o'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Exporta'#231#227'o'
        'Mercado Interno'
        'Ambos')
      TabOrder = 5
    end
    object RadioGroup2: TRadioGroup
      Left = 353
      Top = 3
      Width = 165
      Height = 40
      Caption = 'Tipo de impress'#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'MSDOS'
        'Windows')
      TabOrder = 6
    end
  end
  object qMetasProd: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtalaomov.DataSaida, Dbtalaomov.Setor, SUM( Dbtalaograde' +
        '.QtdPar ) QtdPar, Dbsetor.MetaDia'
      'FROM "dbSetor.DB" Dbsetor'
      '   INNER JOIN "dbTalaoMov.db" Dbtalaomov'
      '   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)  '
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)  '
      '   AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)  '
      'GROUP BY Dbtalaomov.DataSaida, Dbtalaomov.Setor, Dbsetor.MetaDia'
      'ORDER BY Dbtalaomov.DataSaida, Dbtalaomov.Setor')
    Left = 440
    Top = 49
    object qMetasProdDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object qMetasProdSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qMetasProdQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
    object qMetasProdMetaDia: TIntegerField
      FieldName = 'MetaDia'
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsSetor
    Filter.Strings = (
      'ImpTalao = True')
    Left = 480
    Top = 49
  end
  object dsMetasProd: TDataSource
    DataSet = qMetasProd
    Left = 480
    Top = 80
  end
end
