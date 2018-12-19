object DMNavalha_Local: TDMNavalha_Local
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 316
  Top = 308
  Height = 180
  Width = 540
  object sdsNavalha_Local: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM NAVALHA_LOCAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 112
    Top = 48
    object sdsNavalha_LocalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsNavalha_LocalDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsNavalha_LocalLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 30
    end
    object sdsNavalha_LocalNAVALHA: TStringField
      FieldName = 'NAVALHA'
      Size = 30
    end
    object sdsNavalha_LocalREORDER: TStringField
      FieldName = 'REORDER'
      Size = 30
    end
    object sdsNavalha_LocalDTDESCARTE: TDateField
      FieldName = 'DTDESCARTE'
    end
    object sdsNavalha_LocalDTESTOQUE: TDateField
      FieldName = 'DTESTOQUE'
    end
  end
  object dspNavalha_Local: TDataSetProvider
    DataSet = sdsNavalha_Local
    Left = 224
    Top = 48
  end
  object cdsNavalha_Local: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspNavalha_Local'
    Left = 328
    Top = 48
    object cdsNavalha_LocalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNavalha_LocalDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsNavalha_LocalLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 30
    end
    object cdsNavalha_LocalNAVALHA: TStringField
      FieldName = 'NAVALHA'
      Size = 30
    end
    object cdsNavalha_LocalREORDER: TStringField
      FieldName = 'REORDER'
      Size = 30
    end
    object cdsNavalha_LocalDTDESCARTE: TDateField
      FieldName = 'DTDESCARTE'
    end
    object cdsNavalha_LocalDTESTOQUE: TDateField
      FieldName = 'DTESTOQUE'
    end
  end
  object dsNavalha_Local: TDataSource
    DataSet = cdsNavalha_Local
    Left = 424
    Top = 48
  end
end
