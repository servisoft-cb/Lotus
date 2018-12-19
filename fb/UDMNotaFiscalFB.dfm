object DMNotaFiscalFB: TDMNotaFiscalFB
  OldCreateOrder = False
  Left = 331
  Top = 264
  Height = 326
  Width = 783
  object sdsNotaFiscal_Itens_DrawBack: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM NOTAFISCAL_ITENS_DRAWBACK'#13#10'WHERE ID = :ID'#13#10'  AND ' +
      'ITEM = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 72
    object sdsNotaFiscal_Itens_DrawBackID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsNotaFiscal_Itens_DrawBackITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsNotaFiscal_Itens_DrawBackITEM_DRAWBACK: TIntegerField
      FieldName = 'ITEM_DRAWBACK'
      Required = True
    end
    object sdsNotaFiscal_Itens_DrawBackNUM_DRAWBACK: TStringField
      FieldName = 'NUM_DRAWBACK'
      Size = 11
    end
    object sdsNotaFiscal_Itens_DrawBackNUM_REG_EXPORTACAO: TStringField
      FieldName = 'NUM_REG_EXPORTACAO'
      Size = 12
    end
    object sdsNotaFiscal_Itens_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField
      FieldName = 'NUM_CHAVE_ACESSO_NFE'
      Size = 44
    end
    object sdsNotaFiscal_Itens_DrawBackQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dspNotaFiscal_Itens_DrawBack: TDataSetProvider
    DataSet = sdsNotaFiscal_Itens_DrawBack
    Left = 136
    Top = 72
  end
  object cdsNotaFiscal_Itens_DrawBack: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_DRAWBACK'
    Params = <>
    ProviderName = 'dspNotaFiscal_Itens_DrawBack'
    Left = 200
    Top = 72
    object cdsNotaFiscal_Itens_DrawBackID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNotaFiscal_Itens_DrawBackITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsNotaFiscal_Itens_DrawBackITEM_DRAWBACK: TIntegerField
      FieldName = 'ITEM_DRAWBACK'
      Required = True
    end
    object cdsNotaFiscal_Itens_DrawBackNUM_DRAWBACK: TStringField
      FieldName = 'NUM_DRAWBACK'
      Size = 11
    end
    object cdsNotaFiscal_Itens_DrawBackNUM_REG_EXPORTACAO: TStringField
      FieldName = 'NUM_REG_EXPORTACAO'
      Size = 12
    end
    object cdsNotaFiscal_Itens_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField
      FieldName = 'NUM_CHAVE_ACESSO_NFE'
      Size = 44
    end
    object cdsNotaFiscal_Itens_DrawBackQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dsNotaFiscal_Itens_DrawBack: TDataSource
    DataSet = cdsNotaFiscal_Itens_DrawBack
    Left = 264
    Top = 72
  end
end
