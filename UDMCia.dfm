object DMCia: TDMCia
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 353
  Top = 159
  Height = 556
  Width = 537
  object tCia: TTable
    AfterPost = tCiaAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Codigo'
    TableName = 'dbCia.db'
    Left = 104
    Top = 136
    object tCiaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCiaNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCiaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object tCiaDtCadastro: TDateField
      FieldName = 'DtCadastro'
    end
  end
  object tCiaItens: TTable
    AfterPost = tCiaItensAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Codigo;Item'
    MasterFields = 'Codigo'
    MasterSource = dsCia
    TableName = 'dbCiaItens.db'
    Left = 104
    Top = 224
    object tCiaItensCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCiaItensItem: TIntegerField
      FieldName = 'Item'
    end
    object tCiaItensCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tCiaItensPreco: TFloatField
      FieldName = 'Preco'
      DisplayFormat = '###,###,##0.00'
    end
    object tCiaItensProcesso: TStringField
      FieldName = 'Processo'
      Size = 30
    end
    object tCiaItensCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
    end
    object tCiaItenslkReferencia: TStringField
      FieldKind = fkLookup
      FieldName = 'lkReferencia'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Referencia'
      KeyFields = 'CodProduto'
      Lookup = True
    end
    object tCiaItenslkNomeConstrucao: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeConstrucao'
      LookupDataSet = tConstrucao2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodConstrucao'
      Size = 40
      Lookup = True
    end
  end
  object dsCia: TDataSource
    DataSet = tCia
    Left = 144
    Top = 136
  end
  object dsCiaItens: TDataSource
    DataSet = tCiaItens
    Left = 144
    Top = 224
  end
  object tConstrucao2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbConstrucao.db'
    Left = 244
    Top = 240
    object tConstrucao2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tConstrucao2Nome: TStringField
      FieldName = 'Nome'
    end
  end
end
