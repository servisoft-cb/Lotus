object fPrevMetasProdRef: TfPrevMetasProdRef
  Left = 337
  Top = 224
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Metas/Produzidos por Refer'#234'ncia'
  ClientHeight = 181
  ClientWidth = 362
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
    Width = 362
    Height = 181
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 26
      Top = 91
      Width = 38
      Height = 13
      Caption = 'F'#225'brica:'
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label3: TLabel
      Left = 185
      Top = 60
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Label4: TLabel
      Left = 58
      Top = 155
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
    object DateEdit1: TDateEdit
      Left = 68
      Top = 52
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 240
      Top = 52
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 89
      Top = 107
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
      TabOrder = 0
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 68
      Top = 83
      Width = 267
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsFabrica
      TabOrder = 3
      OnDropDown = RxDBLookupCombo1Enter
      OnEnter = RxDBLookupCombo1Enter
      OnExit = RxDBLookupCombo1Exit
    end
  end
  object qMetasProd: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtalaomov.DataSaida, Dbtalaomov.Setor, SUM( Dbtalaograde' +
        '.QtdPar ) QtdPar, Dbproduto.Referencia, Dbtalao.CodProduto, Dbta' +
        'lao.CodCor, Dbproduto.DescMaterial, Dbcor.Nome NomeCor, DbSetor.' +
        'Nome NomeSetor'
      'FROM "dbSetor.DB" Dbsetor'
      ' INNER JOIN "dbTalaoMov.db" Dbtalaomov'
      ' ON  (Dbsetor.Codigo = Dbtalaomov.Setor)'
      ' INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      ' ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)'
      ' AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)'
      ' INNER JOIN "dbTalao.DB" Dbtalao'
      ' ON  (Dbtalaograde.Lote = Dbtalao.Lote)'
      ' AND  (Dbtalaograde.Item = Dbtalao.Item)'
      ' INNER JOIN "dbLotePedido.DB" Dblotepedido'
      ' ON  (Dblotepedido.Lote = Dbtalao.Lote)'
      ' INNER JOIN "dbPedido.DB" Dbpedido'
      ' ON  (Dbpedido.Pedido = Dblotepedido.Pedido)'
      ' INNER JOIN "dbProduto.DB" Dbproduto'
      ' ON  (Dbtalao.CodProduto = Dbproduto.Codigo)'
      ' INNER JOIN "Dbcor.DB" Dbcor'
      ' ON  (Dbtalao.CodCor = Dbcor.Codigo)'
      
        'WHERE DbTalaomov.DataSaida BETWEEN :Data1 AND :Data2 AND Dbpedid' +
        'o.CodFabrica = :F1'
      
        'GROUP BY Dbtalaomov.DataSaida, Dbtalaomov.Setor, Dbproduto.Refer' +
        'encia, Dbtalao.CodProduto, Dbtalao.CodCor, Dbproduto.DescMateria' +
        'l, Dbcor.Nome, Dbcor.Nome,dbSetor.Nome'
      
        'ORDER BY Dbtalaomov.Setor, Dbtalaomov.DataSaida, Dbproduto.Refer' +
        'encia, Dbproduto.DescMaterial, NomeCor')
    Left = 288
    Top = 97
    ParamData = <
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'F1'
        ParamType = ptUnknown
      end>
    object qMetasProdDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object qMetasProdSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qMetasProdQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
    object qMetasProdReferencia: TStringField
      FieldName = 'Referencia'
    end
    object qMetasProdCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object qMetasProdCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qMetasProdDescMaterial: TStringField
      FieldName = 'DescMaterial'
      Size = 10
    end
    object qMetasProdNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 15
    end
    object qMetasProdNomeSetor: TStringField
      FieldName = 'NomeSetor'
      Size = 15
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsSetor
    Filter.Strings = (
      'ImpTalao = True')
    Left = 328
    Top = 97
  end
end
