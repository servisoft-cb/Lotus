object dmCadMaterial: TdmCadMaterial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 478
  Top = 185
  Height = 270
  Width = 384
  object sdsMaterial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM MATERIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsMaterialCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsMaterialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsMaterialGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object sdsMaterialSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
    end
    object sdsMaterialUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object sdsMaterialICMS: TFloatField
      FieldName = 'ICMS'
    end
    object sdsMaterialIPI: TFloatField
      FieldName = 'IPI'
    end
    object sdsMaterialPRCUSTO: TFloatField
      FieldName = 'PRCUSTO'
    end
    object sdsMaterialFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object sdsMaterialCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object sdsMaterialESTMINIMO: TFloatField
      FieldName = 'ESTMINIMO'
    end
    object sdsMaterialINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialLANCACOR: TStringField
      FieldName = 'LANCACOR'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialPRECOCOR: TStringField
      FieldName = 'PRECOCOR'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialLANCAGRADE: TStringField
      FieldName = 'LANCAGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialPRECOGRADE: TStringField
      FieldName = 'PRECOGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialTIPOMAT: TStringField
      FieldName = 'TIPOMAT'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialTIPOSOLADO: TStringField
      FieldName = 'TIPOSOLADO'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialMATERIALOUTROS: TStringField
      FieldName = 'MATERIALOUTROS'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialDTALTERACAO: TDateField
      FieldName = 'DTALTERACAO'
    end
    object sdsMaterialCALCMATERIAL: TStringField
      FieldName = 'CALCMATERIAL'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialPRE: TStringField
      FieldName = 'PRE'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialCODCLASFISCAL: TStringField
      FieldName = 'CODCLASFISCAL'
      Size = 12
    end
    object sdsMaterialIMPGRADETALAOAUXILIAR: TStringField
      FieldName = 'IMPGRADETALAOAUXILIAR'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialIMPTALAOAUXILIAR: TStringField
      FieldName = 'IMPTALAOAUXILIAR'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialIMPCALCMATERIAL: TStringField
      FieldName = 'IMPCALCMATERIAL'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialTIPOREG: TStringField
      FieldName = 'TIPOREG'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object sdsMaterialCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object sdsMaterialGERAOC: TStringField
      FieldName = 'GERAOC'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialORIGEMPROD: TStringField
      FieldName = 'ORIGEMPROD'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsMaterialCORRETO: TStringField
      FieldName = 'CORRETO'
      FixedChar = True
      Size = 1
    end
    object sdsMaterialNOMESEMACENTO: TStringField
      FieldName = 'NOMESEMACENTO'
      Size = 60
    end
    object sdsMaterialNUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object sdsMaterialPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object sdsMaterialID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
    object sdsMaterialDTALTERACAO_PRECO: TDateField
      FieldName = 'DTALTERACAO_PRECO'
    end
  end
  object dspMaterial: TDataSetProvider
    DataSet = sdsMaterial
    Left = 136
    Top = 24
  end
  object cdsMaterial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterial'
    Left = 224
    Top = 24
    object cdsMaterialCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsMaterialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsMaterialGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object cdsMaterialSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
    end
    object cdsMaterialUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsMaterialICMS: TFloatField
      FieldName = 'ICMS'
    end
    object cdsMaterialIPI: TFloatField
      FieldName = 'IPI'
    end
    object cdsMaterialPRCUSTO: TFloatField
      FieldName = 'PRCUSTO'
    end
    object cdsMaterialFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object cdsMaterialCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object cdsMaterialESTMINIMO: TFloatField
      FieldName = 'ESTMINIMO'
    end
    object cdsMaterialINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialLANCACOR: TStringField
      FieldName = 'LANCACOR'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialPRECOCOR: TStringField
      FieldName = 'PRECOCOR'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialLANCAGRADE: TStringField
      FieldName = 'LANCAGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialPRECOGRADE: TStringField
      FieldName = 'PRECOGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialTIPOMAT: TStringField
      FieldName = 'TIPOMAT'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialTIPOSOLADO: TStringField
      FieldName = 'TIPOSOLADO'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialMATERIALOUTROS: TStringField
      FieldName = 'MATERIALOUTROS'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialDTALTERACAO: TDateField
      FieldName = 'DTALTERACAO'
    end
    object cdsMaterialCALCMATERIAL: TStringField
      FieldName = 'CALCMATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialPRE: TStringField
      FieldName = 'PRE'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialCODCLASFISCAL: TStringField
      FieldName = 'CODCLASFISCAL'
      Size = 12
    end
    object cdsMaterialIMPGRADETALAOAUXILIAR: TStringField
      FieldName = 'IMPGRADETALAOAUXILIAR'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialIMPTALAOAUXILIAR: TStringField
      FieldName = 'IMPTALAOAUXILIAR'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialIMPCALCMATERIAL: TStringField
      FieldName = 'IMPCALCMATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialTIPOREG: TStringField
      FieldName = 'TIPOREG'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object cdsMaterialCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object cdsMaterialGERAOC: TStringField
      FieldName = 'GERAOC'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialORIGEMPROD: TStringField
      FieldName = 'ORIGEMPROD'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsMaterialCORRETO: TStringField
      FieldName = 'CORRETO'
      FixedChar = True
      Size = 1
    end
    object cdsMaterialNOMESEMACENTO: TStringField
      FieldName = 'NOMESEMACENTO'
      Size = 60
    end
    object cdsMaterialNUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object cdsMaterialPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object cdsMaterialID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
    object cdsMaterialDTALTERACAO_PRECO: TDateField
      FieldName = 'DTALTERACAO_PRECO'
    end
  end
  object dsMaterial: TDataSource
    DataSet = cdsMaterial
    Left = 304
    Top = 24
  end
end
