object fPrevProjecao: TfPrevProjecao
  Left = 276
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Proje'#231#227'o'
  ClientHeight = 148
  ClientWidth = 355
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
    Width = 355
    Height = 148
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Dt.Inicial:'
    end
    object Label2: TLabel
      Left = 184
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Dt.Final:'
    end
    object Bevel1: TBevel
      Left = 1
      Top = 102
      Width = 353
      Height = 2
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 6
      Top = 113
      Width = 90
      Height = 13
      Caption = 'Lendo Constru'#231#227'o:'
    end
    object BitBtn3: TBitBtn
      Left = 169
      Top = 70
      Width = 90
      Height = 25
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn3Click
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
    object CheckBox1: TCheckBox
      Left = 55
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Detalhado'
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 79
      Top = 70
      Width = 90
      Height = 25
      Hint = 'Fecha a janela atual'
      Caption = '&Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000BDBDBD00BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
        0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD0000000000BDBDBD0000000000BDBDBD00BDBDBD00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000BDBDBD0000000000BDBDBD0000000000BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000FFFF0000FFFF0000FF
        FF00BDBDBD00BDBDBD00000000000000000000000000BDBDBD0000000000BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B
        7B00BDBDBD00BDBDBD0000000000BDBDBD0000000000BDBDBD00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000BDBDBD00BDBDBD000000000000000000BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000BDBDBD0000000000BDBDBD000000000000000000BDBDBD00BDBD
        BD0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000BDBDBD0000000000BDBDBD0000000000BDBDBD00BDBD
        BD00BDBDBD0000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFF0000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
        BD00BDBDBD0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD0000000000FFFFFF000000000000000000000000000000
        000000000000FFFFFF0000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00000000000000000000000000000000000000
        000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
        BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00}
    end
    object DateEdit1: TDateEdit
      Left = 56
      Top = 8
      Width = 113
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object DateEdit2: TDateEdit
      Left = 224
      Top = 8
      Width = 113
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object ProgressBar1: TProgressBar
      Left = 99
      Top = 111
      Width = 250
      Height = 16
      Smooth = True
      TabOrder = 5
    end
    object ProgressBar2: TProgressBar
      Left = 99
      Top = 128
      Width = 250
      Height = 16
      Smooth = True
      TabOrder = 6
    end
  end
  object qResumido: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT SUM( Dbpedidoitem.QtdPares ) QtdPares, Dbconstrucao.Nome,' +
        ' Dbconstrucao.QtdPrevista, Dbconstrucao.Codigo CodConstrucao'
      'FROM "dbPedido.DB" Dbpedido'
      '   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem'
      '   ON  (Dbpedidoitem.Pedido = Dbpedido.Pedido)'
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbproduto.Codigo = Dbpedidoitem.CodProduto)'
      '   INNER JOIN "dbConstrucao.db" Dbconstrucao'
      '   ON  (Dbconstrucao.Codigo = Dbproduto.CodConstrucao)'
      
        'WHERE   ((Dbpedido.Cancelado = FALSE) or (Dbpedido.Cancelado is ' +
        'Null))'
      
        '   AND  ((Dbpedidoitem.Cancelado = FALSE) or (Dbpedidoitem.Cance' +
        'lado is Null))'
      '   AND  (Dbpedido.DtEmissao BETWEEN :D1 AND :D2)'
      
        'GROUP BY Dbconstrucao.Nome, Dbconstrucao.QtdPrevista, Dbconstruc' +
        'ao.Codigo'
      'ORDER BY Dbconstrucao.Nome')
    Left = 137
    Top = 41
    ParamData = <
      item
        DataType = ftDate
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object qResumidoQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object qResumidoNome: TStringField
      FieldName = 'Nome'
    end
    object qResumidoQtdPrevista: TIntegerField
      FieldName = 'QtdPrevista'
    end
    object qResumidoCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
    end
  end
  object qsProjecao: TDataSource
    DataSet = qResumido
    Left = 161
    Top = 41
  end
  object qDetalhado: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Sum(Dbpedidoitem.QtdPares) QtdPares, Dbproduto.CodConstru' +
        'cao, Dbpedido.DtEmissao, Dbcliente.Nome, Dbpedido.PedidoCliente,' +
        ' dbproduto.Referencia'
      'FROM "dbPedidoItem.DB" Dbpedidoitem'
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)'
      '   INNER JOIN "dbPedido.DB" Dbpedido'
      '   ON  (Dbpedidoitem.Pedido = Dbpedido.Pedido)'
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)'
      
        'WHERE   ((Dbpedido.Cancelado = FALSE) or (Dbpedido.Cancelado is ' +
        'Null)) '
      
        '   AND  ((Dbpedidoitem.Cancelado = FALSE) or (Dbpedidoitem.Cance' +
        'lado is Null))'
      '   AND  (Dbpedido.DtEmissao BETWEEN  :D1 AND :D2)'
      
        'GROUP BY Dbproduto.CodConstrucao, Dbpedido.DtEmissao, Dbcliente.' +
        'Nome, Dbpedido.PedidoCliente, dbproduto.Referencia'
      'ORDER BY Dbpedido.DtEmissao, dbproduto.Referencia'
      ' ')
    Left = 225
    Top = 41
    ParamData = <
      item
        DataType = ftDate
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object qDetalhadoQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object qDetalhadoCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
    end
    object qDetalhadoDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object qDetalhadoNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qDetalhadoPedidoCliente: TIntegerField
      FieldName = 'PedidoCliente'
    end
    object qDetalhadoReferencia: TStringField
      FieldName = 'Referencia'
      Size = 8
    end
  end
  object qsResumido: TDataSource
    DataSet = qDetalhado
    Left = 249
    Top = 41
  end
  object mProjecao: TMemoryTable
    Active = True
    Left = 16
    Top = 40
    object mProjecaoNomeConstrucao: TStringField
      FieldName = 'NomeConstrucao'
    end
    object mProjecaoQtdPrevista: TIntegerField
      FieldName = 'QtdPrevista'
    end
    object mProjecaoQtdPedido: TIntegerField
      FieldName = 'QtdPedido'
    end
    object mProjecaoQtdDiferenca: TIntegerField
      FieldName = 'QtdDiferenca'
    end
    object mProjecaoCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
    end
  end
end
