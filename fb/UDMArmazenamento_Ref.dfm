object DMArmazenamento_Ref: TDMArmazenamento_Ref
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 316
  Top = 308
  Height = 180
  Width = 540
  object sdsArmazenamento_Ref: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM ARMAZENAMENTO_REF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 112
    Top = 48
    object sdsArmazenamento_RefID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsArmazenamento_RefCAIXA: TStringField
      FieldName = 'CAIXA'
    end
    object sdsArmazenamento_RefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object sdsArmazenamento_RefCIA: TStringField
      FieldName = 'CIA'
      Size = 30
    end
    object sdsArmazenamento_RefDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dspArmazenamento_Ref: TDataSetProvider
    DataSet = sdsArmazenamento_Ref
    Left = 224
    Top = 48
  end
  object cdsArmazenamento_Ref: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspArmazenamento_Ref'
    Left = 328
    Top = 48
    object cdsArmazenamento_RefID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsArmazenamento_RefCAIXA: TStringField
      FieldName = 'CAIXA'
    end
    object cdsArmazenamento_RefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object cdsArmazenamento_RefCIA: TStringField
      FieldName = 'CIA'
      Size = 30
    end
    object cdsArmazenamento_RefDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dsArmazenamento_Ref: TDataSource
    DataSet = cdsArmazenamento_Ref
    Left = 424
    Top = 48
  end
end
