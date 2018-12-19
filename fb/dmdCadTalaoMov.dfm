object dmCadTalaoMov: TdmCadTalaoMov
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsTalaoMov: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAOMOV'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsTalaoMovLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object sdsTalaoMovTALAO: TIntegerField
      FieldName = 'TALAO'
      Required = True
    end
    object sdsTalaoMovSETOR: TIntegerField
      FieldName = 'SETOR'
      Required = True
    end
    object sdsTalaoMovDATAENT: TDateField
      FieldName = 'DATAENT'
    end
    object sdsTalaoMovHORAENT: TTimeField
      FieldName = 'HORAENT'
    end
    object sdsTalaoMovDATASAIDA: TDateField
      FieldName = 'DATASAIDA'
    end
    object sdsTalaoMovHORASAIDA: TTimeField
      FieldName = 'HORASAIDA'
    end
    object sdsTalaoMovCODATELIER: TIntegerField
      FieldName = 'CODATELIER'
    end
  end
  object dspTalaoMov: TDataSetProvider
    DataSet = sdsTalaoMov
    Left = 136
    Top = 24
  end
  object cdsTalaoMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoMov'
    Left = 224
    Top = 24
    object cdsTalaoMovLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object cdsTalaoMovTALAO: TIntegerField
      FieldName = 'TALAO'
      Required = True
    end
    object cdsTalaoMovSETOR: TIntegerField
      FieldName = 'SETOR'
      Required = True
    end
    object cdsTalaoMovDATAENT: TDateField
      FieldName = 'DATAENT'
    end
    object cdsTalaoMovHORAENT: TTimeField
      FieldName = 'HORAENT'
    end
    object cdsTalaoMovDATASAIDA: TDateField
      FieldName = 'DATASAIDA'
    end
    object cdsTalaoMovHORASAIDA: TTimeField
      FieldName = 'HORASAIDA'
    end
    object cdsTalaoMovCODATELIER: TIntegerField
      FieldName = 'CODATELIER'
    end
  end
  object dsTalaoMov: TDataSource
    DataSet = cdsTalaoMov
    Left = 304
    Top = 24
  end
end
