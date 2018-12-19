object DMPosicao_Ficha: TDMPosicao_Ficha
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 316
  Top = 308
  Height = 180
  Width = 540
  object sdsPosicao_Ficha: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM POSICAO_FICHA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 112
    Top = 48
    object sdsPosicao_FichaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPosicao_FichaNOMEPOSICAO: TStringField
      FieldName = 'NOMEPOSICAO'
      Size = 30
    end
    object sdsPosicao_FichaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object sdsPosicao_FichaSOMENTEMATERIAL: TStringField
      FieldName = 'SOMENTEMATERIAL'
      FixedChar = True
      Size = 1
    end
    object sdsPosicao_FichaINFORMARGRADE: TStringField
      FieldName = 'INFORMARGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsPosicao_FichaINFORMAROPCAOMAT: TStringField
      FieldName = 'INFORMAROPCAOMAT'
      FixedChar = True
      Size = 1
    end
  end
  object dspPosicao_Ficha: TDataSetProvider
    DataSet = sdsPosicao_Ficha
    Left = 224
    Top = 48
  end
  object cdsPosicao_Ficha: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPosicao_Ficha'
    Left = 328
    Top = 48
    object cdsPosicao_FichaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPosicao_FichaNOMEPOSICAO: TStringField
      FieldName = 'NOMEPOSICAO'
      Size = 30
    end
    object cdsPosicao_FichaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsPosicao_FichaSOMENTEMATERIAL: TStringField
      FieldName = 'SOMENTEMATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsPosicao_FichaINFORMARGRADE: TStringField
      FieldName = 'INFORMARGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsPosicao_FichaINFORMAROPCAOMAT: TStringField
      FieldName = 'INFORMAROPCAOMAT'
      FixedChar = True
      Size = 1
    end
  end
  object dsPosicao_Ficha: TDataSource
    DataSet = cdsPosicao_Ficha
    Left = 424
    Top = 48
  end
end
