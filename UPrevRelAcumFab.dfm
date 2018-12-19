object fPrevRelAcumFab: TfPrevRelAcumFab
  Left = 134
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Acumulado por Fabrica '
  ClientHeight = 228
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 327
    Height = 228
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 7
      Top = 18
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label3: TLabel
      Left = 165
      Top = 18
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Label5: TLabel
      Left = 39
      Top = 52
      Width = 37
      Height = 13
      Caption = 'Setor 1:'
    end
    object Label6: TLabel
      Left = 39
      Top = 81
      Width = 37
      Height = 13
      Caption = 'Setor 2:'
    end
    object Label7: TLabel
      Left = 39
      Top = 111
      Width = 37
      Height = 13
      Caption = 'Setor 3:'
    end
    object Label8: TLabel
      Left = 39
      Top = 140
      Width = 37
      Height = 13
      Caption = 'Setor 4:'
    end
    object DateEdit1: TDateEdit
      Left = 64
      Top = 10
      Width = 96
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 217
      Top = 10
      Width = 96
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 79
      Top = 44
      Width = 185
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsSetor
      TabOrder = 2
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 79
      Top = 73
      Width = 185
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsSetor
      TabOrder = 3
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 79
      Top = 103
      Width = 185
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsSetor
      TabOrder = 4
    end
    object RxDBLookupCombo4: TRxDBLookupCombo
      Left = 79
      Top = 132
      Width = 185
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsSetor
      TabOrder = 5
    end
    object Panel2: TPanel
      Left = 12
      Top = 168
      Width = 303
      Height = 38
      TabOrder = 6
      object BitBtn6: TBitBtn
        Left = 7
        Top = 6
        Width = 95
        Height = 25
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
        Left = 199
        Top = 6
        Width = 95
        Height = 25
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
      object BitBtn2: TBitBtn
        Left = 103
        Top = 6
        Width = 95
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000C40E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080808080808080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080FFFFFF008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          800000808080800080800080800080800080800080800000FF80808000808000
          8080008080008080008080008080008080008080808080808080FFFFFF008080
          008080008080008080008080008080FFFFFF0080800080800080800080800080
          800080800080800000FF00008000008000008080808000808000808000808000
          00FF000080000080808080008080008080008080008080008080008080808080
          FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
          FF0080800080800080800080800080800080800000FF00008000008000008000
          00808080800080800000FF000080000080000080000080808080008080008080
          008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
          FF808080008080008080808080FFFFFF00808000808000808000808000808000
          80800000FF000080000080000080000080808080000080000080000080000080
          000080808080008080008080008080008080008080808080FFFFFF0080800080
          80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
          80800080800080800080800080800080800000FF000080000080000080000080
          0000800000800000800000808080800080800080800080800080800080800080
          80008080808080FFFFFF00808000808000808080808000808000808000808000
          8080FFFFFF808080008080008080008080008080008080008080008080008080
          0000FF0000800000800000800000800000800000808080800080800080800080
          80008080008080008080008080008080008080808080FFFFFF00808000808000
          8080008080008080008080FFFFFF808080008080008080008080008080008080
          0080800080800080800080800080800000800000800000800000800000808080
          8000808000808000808000808000808000808000808000808000808000808000
          8080808080FFFFFF008080008080008080008080008080808080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          8000008000008000008080808000808000808000808000808000808000808000
          8080008080008080008080008080008080808080FFFFFF008080008080008080
          8080800080800080800080800080800080800080800080800080800080800080
          800080800000FF00008000008000008000008000008080808000808000808000
          8080008080008080008080008080008080008080008080008080008080808080
          008080008080008080008080808080FFFFFF0080800080800080800080800080
          800080800080800080800080800000FF00008000008000008080808000008000
          0080000080808080008080008080008080008080008080008080008080008080
          008080008080808080008080008080008080008080008080808080FFFFFF0080
          800080800080800080800080800080800080800080800000FF00008000008000
          00808080800080800000FF000080000080000080808080008080008080008080
          008080008080008080008080008080808080008080008080008080808080FFFF
          FF008080008080808080FFFFFF00808000808000808000808000808000808000
          80800000FF0000800000808080800080800080800080800000FF000080000080
          000080808080008080008080008080008080008080008080808080FFFFFF0080
          80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
          80800080800080800080800080800080800000FF000080008080008080008080
          0080800080800000FF0000800000800000800080800080800080800080800080
          80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
          8080008080808080FFFFFF008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800000FF0000800000FF0080
          8000808000808000808000808000808000808080808080808000808000808000
          8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080808080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
    end
  end
  object qAcumuladoMes: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbproduto.Referencia, SUM( Dbpedidoitem.QtdPares ) QtdPar' +
        'es, Dbpedidoitem.QtdParesFat, Dbpedido.LoteExp, Dbpedidoitem.Ped' +
        'ido, Dbpedidoitem.Item, Dbpedido.CodFabrica, Dbpedido.Mercado'
      'FROM "dbPedido.DB" Dbpedido'
      '   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem'
      '   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)  '
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)  '
      'WHERE   Dbpedido.DtFinEmbarque BETWEEN :Data1 AND :Data2'
      
        '   AND  ((Dbpedido.Cancelado = FALSE)  OR (Dbpedido.Cancelado IS' +
        ' NULL))'
      
        '   AND  ((Dbpedidoitem.Cancelado = FALSE)  OR (Dbpedidoitem.Canc' +
        'elado IS NULL))'
      
        'GROUP BY Dbproduto.Referencia, Dbpedidoitem.QtdParesFat, Dbpedid' +
        'o.LoteExp, Dbpedidoitem.Pedido, Dbpedidoitem.Item, Dbpedido.CodF' +
        'abrica, Dbpedido.Mercado'
      'ORDER BY Dbproduto.Referencia, Dbpedido.CodFabrica')
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Data1'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'Data2'
        ParamType = ptUnknown
        Value = 0d
      end>
    object qAcumuladoMesReferencia: TStringField
      FieldName = 'Referencia'
    end
    object qAcumuladoMesQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object qAcumuladoMesQtdParesFat: TFloatField
      FieldName = 'QtdParesFat'
    end
    object qAcumuladoMesLoteExp: TBooleanField
      FieldName = 'LoteExp'
    end
    object qAcumuladoMesPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qAcumuladoMesItem: TIntegerField
      FieldName = 'Item'
    end
    object qAcumuladoMesCodFabrica: TIntegerField
      FieldName = 'CodFabrica'
    end
    object qAcumuladoMesMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
  end
  object qsAcumuladoMes: TDataSource
    DataSet = qAcumuladoMes
    Left = 16
    Top = 64
  end
  object mPares: TMemoryTable
    Top = 88
    object mParesReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mParesQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object mParesQtdSetor1: TFloatField
      FieldName = 'QtdSetor1'
    end
    object mParesQtdSetor2: TFloatField
      FieldName = 'QtdSetor2'
    end
    object mParesQtdSetor3: TFloatField
      FieldName = 'QtdSetor3'
    end
    object mParesQtdSetor4: TFloatField
      FieldName = 'QtdSetor4'
    end
    object mParesQtdEmbalagem: TFloatField
      FieldName = 'QtdEmbalagem'
    end
    object mParesFabrica: TIntegerField
      FieldName = 'Fabrica'
    end
    object mPareslkFabrica: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFabrica'
      LookupDataSet = DM1.tFabrica
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Fabrica'
      Size = 30
      Lookup = True
    end
  end
  object msPares: TDataSource
    DataSet = mPares
    Left = 16
    Top = 88
  end
  object tTalaoMI: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbTalaoMI.DB'
    Left = 256
    Top = 128
    object tTalaoMILote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMIItem: TIntegerField
      FieldName = 'Item'
    end
    object tTalaoMICodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tTalaoMICodCabedal1: TIntegerField
      FieldName = 'CodCabedal1'
    end
    object tTalaoMICodCabedal2: TIntegerField
      FieldName = 'CodCabedal2'
    end
    object tTalaoMICodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tTalaoMICodCorForro: TIntegerField
      FieldName = 'CodCorForro'
    end
    object tTalaoMICodCorPalmilha: TIntegerField
      FieldName = 'CodCorPalmilha'
    end
    object tTalaoMICodCorSolado: TIntegerField
      FieldName = 'CodCorSolado'
    end
    object tTalaoMIQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
    object tTalaoMICodForro: TIntegerField
      FieldName = 'CodForro'
    end
    object tTalaoMICodEtiqueta: TIntegerField
      FieldName = 'CodEtiqueta'
    end
    object tTalaoMICodSolado: TIntegerField
      FieldName = 'CodSolado'
    end
    object tTalaoMICodTaloneira: TIntegerField
      FieldName = 'CodTaloneira'
    end
    object tTalaoMICodCorTaloneira: TIntegerField
      FieldName = 'CodCorTaloneira'
    end
    object tTalaoMICodPalmilha: TIntegerField
      FieldName = 'CodPalmilha'
    end
    object tTalaoMICodForma: TIntegerField
      FieldName = 'CodForma'
    end
    object tTalaoMIItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object tTalaoMINumPedido: TIntegerField
      FieldName = 'NumPedido'
    end
  end
  object dsTalaoMI: TDataSource
    DataSet = tTalaoMI
    Left = 272
    Top = 128
  end
  object tTalaoMovMI: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Talao'
    MasterFields = 'Lote;Item'
    MasterSource = dsTalaoMI
    TableName = 'dbTalaoMovMI.DB'
    Left = 256
    Top = 144
    object tTalaoMovMILote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMovMITalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMovMISetor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMovMIDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMovMIHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMovMIDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMovMIHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMovMICodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
  end
  object dsTalaoMovMI: TDataSource
    DataSet = tTalaoMovMI
    Left = 272
    Top = 144
  end
end
