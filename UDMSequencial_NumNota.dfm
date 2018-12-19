object DMSequencial_NumNota: TDMSequencial_NumNota
  OldCreateOrder = False
  Left = 553
  Top = 223
  Height = 300
  Width = 456
  object sdsSequencia_NumNota: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM SEQUENCIAL_NUMNOTA'#13#10'WHERE FILIAL = :FILIAL'#13#10'  AND' +
      ' SERIE = :SERIE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 40
    object sdsSequencia_NumNotaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsSequencia_NumNotaSERIE: TStringField
      FieldName = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object sdsSequencia_NumNotaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
  end
  object cdsSequencia_NumNota: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSequencia_NumNota'
    Left = 224
    Top = 40
    object cdsSequencia_NumNotaFILIAL: TIntegerField
      FieldName = 'FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSequencia_NumNotaSERIE: TStringField
      FieldName = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsSequencia_NumNotaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
  end
  object dspSequencia_NumNota: TDataSetProvider
    DataSet = sdsSequencia_NumNota
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 40
  end
end
