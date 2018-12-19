object dmCadProduto: TdmCadProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 478
  Top = 185
  Height = 270
  Width = 384
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object sdsProdutoCODSUBGRUPO: TIntegerField
      FieldName = 'CODSUBGRUPO'
    end
    object sdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object sdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object sdsProdutoCODCLASFISCAL: TStringField
      FieldName = 'CODCLASFISCAL'
      Size = 12
    end
    object sdsProdutoCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object sdsProdutoLANCAGRADE: TStringField
      FieldName = 'LANCAGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object sdsProdutoQPARTALAO: TFloatField
      FieldName = 'QPARTALAO'
    end
    object sdsProdutoPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object sdsProdutoPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object sdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoALIQICMS: TFloatField
      FieldName = 'ALIQICMS'
    end
    object sdsProdutoALIQIPI: TFloatField
      FieldName = 'ALIQIPI'
    end
    object sdsProdutoNOMEEXP: TStringField
      FieldName = 'NOMEEXP'
      Size = 45
    end
    object sdsProdutoCODMODELISTA: TIntegerField
      FieldName = 'CODMODELISTA'
    end
    object sdsProdutoCOMISSAOMOD: TFloatField
      FieldName = 'COMISSAOMOD'
    end
    object sdsProdutoDESCMATERIAL: TStringField
      FieldName = 'DESCMATERIAL'
      Size = 10
    end
    object sdsProdutoREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
      Size = 8
    end
    object sdsProdutoVLRATELIER: TFloatField
      FieldName = 'VLRATELIER'
    end
    object sdsProdutoCONSTRUCAO: TStringField
      FieldName = 'CONSTRUCAO'
    end
    object sdsProdutoNOMEMODELO: TStringField
      FieldName = 'NOMEMODELO'
      Size = 40
    end
    object sdsProdutoFOTOJPEG: TMemoField
      FieldName = 'FOTOJPEG'
      BlobType = ftMemo
      Size = 1
    end
    object sdsProdutoPALMINTERNA: TStringField
      FieldName = 'PALMINTERNA'
      Size = 30
    end
    object sdsProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsProdutoENDETIQ: TStringField
      FieldName = 'ENDETIQ'
      Size = 60
    end
    object sdsProdutoMERCADO: TStringField
      FieldName = 'MERCADO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCODFORMA: TIntegerField
      FieldName = 'CODFORMA'
    end
    object sdsProdutoTEMPOREAL: TFloatField
      FieldName = 'TEMPOREAL'
    end
    object sdsProdutoCODCONSTRUCAO: TIntegerField
      FieldName = 'CODCONSTRUCAO'
    end
    object sdsProdutoCODCONSTRUCAOGRUPO: TIntegerField
      FieldName = 'CODCONSTRUCAOGRUPO'
    end
    object sdsProdutoDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object sdsProdutoCADASTROCOMPLETO: TStringField
      FieldName = 'CADASTROCOMPLETO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object sdsProdutoPRODMAT: TStringField
      FieldName = 'PRODMAT'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoORIGEMPROD: TStringField
      FieldName = 'ORIGEMPROD'
      Size = 1
    end
    object sdsProdutoCODCSTIPI: TStringField
      FieldName = 'CODCSTIPI'
      Size = 2
    end
    object sdsProdutoLANCACOR: TStringField
      FieldName = 'LANCACOR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoENDFOTO: TStringField
      FieldName = 'ENDFOTO'
      Size = 250
    end
    object sdsProdutoTEMPOCALCULO: TFloatField
      FieldName = 'TEMPOCALCULO'
    end
    object sdsProdutoNUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object sdsProdutoPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object sdsProdutoID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 136
    Top = 24
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 224
    Top = 24
    object cdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object cdsProdutoCODSUBGRUPO: TIntegerField
      FieldName = 'CODSUBGRUPO'
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsProdutoCODCLASFISCAL: TStringField
      FieldName = 'CODCLASFISCAL'
      Size = 12
    end
    object cdsProdutoCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object cdsProdutoLANCAGRADE: TStringField
      FieldName = 'LANCAGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object cdsProdutoQPARTALAO: TFloatField
      FieldName = 'QPARTALAO'
    end
    object cdsProdutoPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object cdsProdutoPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object cdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCONSUMO: TStringField
      FieldName = 'CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoALIQICMS: TFloatField
      FieldName = 'ALIQICMS'
    end
    object cdsProdutoALIQIPI: TFloatField
      FieldName = 'ALIQIPI'
    end
    object cdsProdutoNOMEEXP: TStringField
      FieldName = 'NOMEEXP'
      Size = 45
    end
    object cdsProdutoCODMODELISTA: TIntegerField
      FieldName = 'CODMODELISTA'
    end
    object cdsProdutoCOMISSAOMOD: TFloatField
      FieldName = 'COMISSAOMOD'
    end
    object cdsProdutoDESCMATERIAL: TStringField
      FieldName = 'DESCMATERIAL'
      Size = 10
    end
    object cdsProdutoREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
      Size = 8
    end
    object cdsProdutoVLRATELIER: TFloatField
      FieldName = 'VLRATELIER'
    end
    object cdsProdutoCONSTRUCAO: TStringField
      FieldName = 'CONSTRUCAO'
    end
    object cdsProdutoNOMEMODELO: TStringField
      FieldName = 'NOMEMODELO'
      Size = 40
    end
    object cdsProdutoFOTOJPEG: TMemoField
      FieldName = 'FOTOJPEG'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoPALMINTERNA: TStringField
      FieldName = 'PALMINTERNA'
      Size = 30
    end
    object cdsProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoENDETIQ: TStringField
      FieldName = 'ENDETIQ'
      Size = 60
    end
    object cdsProdutoMERCADO: TStringField
      FieldName = 'MERCADO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCODFORMA: TIntegerField
      FieldName = 'CODFORMA'
    end
    object cdsProdutoTEMPOREAL: TFloatField
      FieldName = 'TEMPOREAL'
    end
    object cdsProdutoCODCONSTRUCAO: TIntegerField
      FieldName = 'CODCONSTRUCAO'
    end
    object cdsProdutoCODCONSTRUCAOGRUPO: TIntegerField
      FieldName = 'CODCONSTRUCAOGRUPO'
    end
    object cdsProdutoDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsProdutoCADASTROCOMPLETO: TStringField
      FieldName = 'CADASTROCOMPLETO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object cdsProdutoPRODMAT: TStringField
      FieldName = 'PRODMAT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoORIGEMPROD: TStringField
      FieldName = 'ORIGEMPROD'
      Size = 1
    end
    object cdsProdutoCODCSTIPI: TStringField
      FieldName = 'CODCSTIPI'
      Size = 2
    end
    object cdsProdutoLANCACOR: TStringField
      FieldName = 'LANCACOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoENDFOTO: TStringField
      FieldName = 'ENDFOTO'
      Size = 250
    end
    object cdsProdutoTEMPOCALCULO: TFloatField
      FieldName = 'TEMPOCALCULO'
    end
    object cdsProdutoNUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object cdsProdutoPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object cdsProdutoID_ENQIPI: TIntegerField
      FieldName = 'ID_ENQIPI'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 304
    Top = 24
  end
end
