object DMProg: TDMProg
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 223
  Top = 171
  Height = 285
  Width = 547
  object tProgramacao: TTable
    AfterPost = tProgramacaoAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'NumLancamento'
    TableName = 'dbProgramacao.db'
    Left = 112
    Top = 93
    object tProgramacaoNumLancamento: TIntegerField
      FieldName = 'NumLancamento'
    end
    object tProgramacaoQtdPedidos: TIntegerField
      FieldName = 'QtdPedidos'
    end
    object tProgramacaoDtInicial: TDateField
      FieldName = 'DtInicial'
    end
    object tProgramacaoCodFabrica: TIntegerField
      FieldName = 'CodFabrica'
    end
  end
  object dsProgramacao: TDataSource
    DataSet = tProgramacao
    Left = 135
    Top = 93
  end
  object tProgramacaoDatas: TTable
    AfterPost = tProgramacaoDatasAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'NumLancamento;CodSetor;Data'
    MasterFields = 'NumLancamento'
    MasterSource = dsProgramacao
    TableName = 'dbProgramacaoDatas.db'
    Left = 169
    Top = 24
    object tProgramacaoDatasNumLancamento: TIntegerField
      FieldName = 'NumLancamento'
    end
    object tProgramacaoDatasCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tProgramacaoDatasData: TDateField
      FieldName = 'Data'
    end
    object tProgramacaoDatasCapacidade: TIntegerField
      FieldName = 'Capacidade'
    end
    object tProgramacaoDatasQtdProducao: TIntegerField
      FieldName = 'QtdProducao'
    end
  end
  object dsProgramacaoDatas: TDataSource
    DataSet = tProgramacaoDatas
    Left = 193
    Top = 24
  end
  object tProgramacaoItens: TTable
    AfterPost = tProgramacaoItensAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'NumLancamento;Ordem'
    MasterFields = 'NumLancamento'
    MasterSource = dsProgramacao
    TableName = 'dbProgramacaoItens.db'
    Left = 344
    Top = 80
    object tProgramacaoItensNumLancamento: TIntegerField
      FieldName = 'NumLancamento'
    end
    object tProgramacaoItensOrdem: TIntegerField
      FieldName = 'Ordem'
    end
    object tProgramacaoItensPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tProgramacaoItensItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object tProgramacaoItensLote: TIntegerField
      FieldName = 'Lote'
    end
    object tProgramacaoItensCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object tProgramacaoItensCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProgramacaoItensCodCorProduto: TIntegerField
      FieldName = 'CodCorProduto'
    end
    object tProgramacaoItensQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object tProgramacaoItensDtEmbarque: TDateField
      FieldName = 'DtEmbarque'
    end
    object tProgramacaoItenslkPedidoCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkPedidoCliente'
      LookupDataSet = DM1.tPedido2
      LookupKeyFields = 'Pedido'
      LookupResultField = 'PedidoCliente'
      KeyFields = 'Pedido'
      Size = 30
      Lookup = True
    end
    object tProgramacaoItenslkNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCliente'
      LookupDataSet = DM1.tCliente2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object tProgramacaoItenslkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCorProduto'
      Size = 30
      Lookup = True
    end
    object tProgramacaoItenslkReferencia: TStringField
      FieldKind = fkLookup
      FieldName = 'lkReferencia'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Referencia'
      KeyFields = 'CodProduto'
      Lookup = True
    end
  end
  object dsProgramacaoItens: TDataSource
    DataSet = tProgramacaoItens
    Left = 360
    Top = 80
  end
  object tProgramacaoItensData: TTable
    AfterPost = tProgramacaoItensDataAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'NumLancamento;OrdemItem;ControleLinha;Item;CodSetor;DtInicio'
    MasterFields = 'NumLancamento;Ordem'
    MasterSource = dsProgramacaoItens
    TableName = 'dbProgramacaoItensDatas.db'
    Left = 288
    Top = 152
    object tProgramacaoItensDataNumLancamento: TIntegerField
      FieldName = 'NumLancamento'
    end
    object tProgramacaoItensDataOrdemItem: TIntegerField
      FieldName = 'OrdemItem'
    end
    object tProgramacaoItensDataItem: TIntegerField
      FieldName = 'Item'
    end
    object tProgramacaoItensDataControleLinha: TIntegerField
      FieldName = 'ControleLinha'
    end
    object tProgramacaoItensDataCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tProgramacaoItensDataDtInicio: TDateField
      FieldName = 'DtInicio'
    end
    object tProgramacaoItensDataQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tProgramacaoItensDataDtFinal: TDateField
      FieldName = 'DtFinal'
    end
    object tProgramacaoItensDatalkNomeSetor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeSetor'
      LookupDataSet = DM1.tSetor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodSetor'
      Size = 30
      Lookup = True
    end
  end
  object dsProgramacaoItensData: TDataSource
    DataSet = tProgramacaoItensData
    Left = 312
    Top = 152
  end
end
