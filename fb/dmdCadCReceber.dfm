object dmCadCReceber: TdmCadCReceber
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 538
  Top = 245
  Height = 376
  Width = 638
  object sdsCReceber: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM CRECEBER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 24
    object sdsCReceberNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
      Required = True
    end
    object sdsCReceberNUMSEQNOTA: TIntegerField
      FieldName = 'NUMSEQNOTA'
    end
    object sdsCReceberQUITADO: TStringField
      FieldName = 'QUITADO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object sdsCReceberTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 2
    end
    object sdsCReceberDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object sdsCReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object sdsCReceberCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberDUPLICATAIMP: TStringField
      FieldName = 'DUPLICATAIMP'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object sdsCReceberPERCBASECOMISSAO: TFloatField
      FieldName = 'PERCBASECOMISSAO'
    end
    object sdsCReceberMERCADO: TStringField
      FieldName = 'MERCADO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsCReceberSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object sdsCReceberNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object sdsCReceberBOLETOIMP: TStringField
      FieldName = 'BOLETOIMP'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
    end
  end
  object dspCReceber: TDataSetProvider
    DataSet = sdsCReceber
    Left = 216
    Top = 24
  end
  object cdsCReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCReceber'
    Left = 304
    Top = 24
    object cdsCReceberNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
      Required = True
    end
    object cdsCReceberNUMSEQNOTA: TIntegerField
      FieldName = 'NUMSEQNOTA'
    end
    object cdsCReceberQUITADO: TStringField
      FieldName = 'QUITADO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object cdsCReceberTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 2
    end
    object cdsCReceberDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object cdsCReceberHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object cdsCReceberCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberDUPLICATAIMP: TStringField
      FieldName = 'DUPLICATAIMP'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object cdsCReceberPERCBASECOMISSAO: TFloatField
      FieldName = 'PERCBASECOMISSAO'
    end
    object cdsCReceberMERCADO: TStringField
      FieldName = 'MERCADO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCReceberSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsCReceberNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsCReceberBOLETOIMP: TStringField
      FieldName = 'BOLETOIMP'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
    end
    object cdsCRecebersdsCReceberParc: TDataSetField
      FieldName = 'sdsCReceberParc'
    end
  end
  object dsCReceber: TDataSource
    DataSet = cdsCReceber
    Left = 384
    Top = 24
  end
  object dsCReceber_Mestre: TDataSource
    DataSet = sdsCReceber
    Left = 64
    Top = 64
  end
  object sdsCReceberParc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM CRECEBERPARC'#13#10'WHERE NUMCRECEBER = :NUMCRECEBER'#13#10' ' +
      ' '
    DataSource = dsCReceber_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMCRECEBER'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 152
    Top = 144
    object sdsCReceberParcNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
      Required = True
    end
    object sdsCReceberParcPARCCRECEBER: TIntegerField
      FieldName = 'PARCCRECEBER'
      Required = True
    end
    object sdsCReceberParcVLRPARCCRECEBER: TFloatField
      FieldName = 'VLRPARCCRECEBER'
    end
    object sdsCReceberParcDTVENCCRECEBER: TDateField
      FieldName = 'DTVENCCRECEBER'
    end
    object sdsCReceberParcQUITPARCCRECEBER: TStringField
      FieldName = 'QUITPARCCRECEBER'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcJUROSPARCCRECEBER: TFloatField
      FieldName = 'JUROSPARCCRECEBER'
    end
    object sdsCReceberParcDTPAGPARCCRECEBER: TDateField
      FieldName = 'DTPAGPARCCRECEBER'
    end
    object sdsCReceberParcCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object sdsCReceberParcNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
    end
    object sdsCReceberParcDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object sdsCReceberParcPGTOPARCIAL: TFloatField
      FieldName = 'PGTOPARCIAL'
    end
    object sdsCReceberParcRESTPARCELA: TFloatField
      FieldName = 'RESTPARCELA'
    end
    object sdsCReceberParcCONTADUPL: TIntegerField
      FieldName = 'CONTADUPL'
    end
    object sdsCReceberParcSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object sdsCReceberParcBAIXADA: TStringField
      FieldName = 'BAIXADA'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object sdsCReceberParcVLRCOMISSAO: TFloatField
      FieldName = 'VLRCOMISSAO'
    end
    object sdsCReceberParcPLANOCONTAS: TIntegerField
      FieldName = 'PLANOCONTAS'
    end
    object sdsCReceberParcAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 6
    end
    object sdsCReceberParcTITPORTADOR: TStringField
      FieldName = 'TITPORTADOR'
    end
    object sdsCReceberParcCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object sdsCReceberParcDESPESAS: TFloatField
      FieldName = 'DESPESAS'
    end
    object sdsCReceberParcABATIMENTOS: TFloatField
      FieldName = 'ABATIMENTOS'
    end
    object sdsCReceberParcCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
    end
    object sdsCReceberParcPGCARTORIO: TStringField
      FieldName = 'PGCARTORIO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcDIASATRASO: TFloatField
      FieldName = 'DIASATRASO'
    end
    object sdsCReceberParcLETRACAMBIO: TStringField
      FieldName = 'LETRACAMBIO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcNROLANCEXTCOMISSAO: TIntegerField
      FieldName = 'NROLANCEXTCOMISSAO'
    end
    object sdsCReceberParcJUROSPAGOS: TFloatField
      FieldName = 'JUROSPAGOS'
    end
    object sdsCReceberParcCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcTITPROTESTADO: TStringField
      FieldName = 'TITPROTESTADO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object sdsCReceberParcTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 2
    end
    object sdsCReceberParcVLRDEVOLUCAO: TFloatField
      FieldName = 'VLRDEVOLUCAO'
    end
    object sdsCReceberParcDUPLICATAIMP: TStringField
      FieldName = 'DUPLICATAIMP'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcPAGARPARTENANOTA: TStringField
      FieldName = 'PAGARPARTENANOTA'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcMERCADO: TStringField
      FieldName = 'MERCADO'
      FixedChar = True
      Size = 10
    end
    object sdsCReceberParcFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsCReceberParcPERCCOMISSAO2: TFloatField
      FieldName = 'PERCCOMISSAO2'
    end
    object sdsCReceberParcCODVENDEDOR2: TIntegerField
      FieldName = 'CODVENDEDOR2'
    end
    object sdsCReceberParcCODBANCOBOLETO: TIntegerField
      FieldName = 'CODBANCOBOLETO'
    end
    object sdsCReceberParcCOMISSAOITEM: TStringField
      FieldName = 'COMISSAOITEM'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcTRANSFERENCIA: TStringField
      FieldName = 'TRANSFERENCIA'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object sdsCReceberParcNUMSEQNOTA: TIntegerField
      FieldName = 'NUMSEQNOTA'
    end
    object sdsCReceberParcCODPLANOCONTASITENS: TIntegerField
      FieldName = 'CODPLANOCONTASITENS'
    end
    object sdsCReceberParcEXPORTACAO: TStringField
      FieldName = 'EXPORTACAO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
  end
  object cdsCReceberParc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCRecebersdsCReceberParc
    Params = <>
    Left = 256
    Top = 144
    object cdsCReceberParcNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
      Required = True
    end
    object cdsCReceberParcPARCCRECEBER: TIntegerField
      FieldName = 'PARCCRECEBER'
      Required = True
    end
    object cdsCReceberParcVLRPARCCRECEBER: TFloatField
      FieldName = 'VLRPARCCRECEBER'
    end
    object cdsCReceberParcDTVENCCRECEBER: TDateField
      FieldName = 'DTVENCCRECEBER'
    end
    object cdsCReceberParcQUITPARCCRECEBER: TStringField
      FieldName = 'QUITPARCCRECEBER'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcJUROSPARCCRECEBER: TFloatField
      FieldName = 'JUROSPARCCRECEBER'
    end
    object cdsCReceberParcDTPAGPARCCRECEBER: TDateField
      FieldName = 'DTPAGPARCCRECEBER'
    end
    object cdsCReceberParcCODCLI: TIntegerField
      FieldName = 'CODCLI'
    end
    object cdsCReceberParcNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
    end
    object cdsCReceberParcDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object cdsCReceberParcPGTOPARCIAL: TFloatField
      FieldName = 'PGTOPARCIAL'
    end
    object cdsCReceberParcRESTPARCELA: TFloatField
      FieldName = 'RESTPARCELA'
    end
    object cdsCReceberParcCONTADUPL: TIntegerField
      FieldName = 'CONTADUPL'
    end
    object cdsCReceberParcSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object cdsCReceberParcBAIXADA: TStringField
      FieldName = 'BAIXADA'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object cdsCReceberParcVLRCOMISSAO: TFloatField
      FieldName = 'VLRCOMISSAO'
    end
    object cdsCReceberParcPLANOCONTAS: TIntegerField
      FieldName = 'PLANOCONTAS'
    end
    object cdsCReceberParcAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 6
    end
    object cdsCReceberParcTITPORTADOR: TStringField
      FieldName = 'TITPORTADOR'
    end
    object cdsCReceberParcCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object cdsCReceberParcDESPESAS: TFloatField
      FieldName = 'DESPESAS'
    end
    object cdsCReceberParcABATIMENTOS: TFloatField
      FieldName = 'ABATIMENTOS'
    end
    object cdsCReceberParcCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
    end
    object cdsCReceberParcPGCARTORIO: TStringField
      FieldName = 'PGCARTORIO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcDIASATRASO: TFloatField
      FieldName = 'DIASATRASO'
    end
    object cdsCReceberParcLETRACAMBIO: TStringField
      FieldName = 'LETRACAMBIO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcNROLANCEXTCOMISSAO: TIntegerField
      FieldName = 'NROLANCEXTCOMISSAO'
    end
    object cdsCReceberParcJUROSPAGOS: TFloatField
      FieldName = 'JUROSPAGOS'
    end
    object cdsCReceberParcCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcTITPROTESTADO: TStringField
      FieldName = 'TITPROTESTADO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object cdsCReceberParcTIPODOC: TStringField
      FieldName = 'TIPODOC'
      Size = 2
    end
    object cdsCReceberParcVLRDEVOLUCAO: TFloatField
      FieldName = 'VLRDEVOLUCAO'
    end
    object cdsCReceberParcDUPLICATAIMP: TStringField
      FieldName = 'DUPLICATAIMP'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcPAGARPARTENANOTA: TStringField
      FieldName = 'PAGARPARTENANOTA'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcMERCADO: TStringField
      FieldName = 'MERCADO'
      FixedChar = True
      Size = 10
    end
    object cdsCReceberParcFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCReceberParcPERCCOMISSAO2: TFloatField
      FieldName = 'PERCCOMISSAO2'
    end
    object cdsCReceberParcCODVENDEDOR2: TIntegerField
      FieldName = 'CODVENDEDOR2'
    end
    object cdsCReceberParcCODBANCOBOLETO: TIntegerField
      FieldName = 'CODBANCOBOLETO'
    end
    object cdsCReceberParcCOMISSAOITEM: TStringField
      FieldName = 'COMISSAOITEM'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcTRANSFERENCIA: TStringField
      FieldName = 'TRANSFERENCIA'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsCReceberParcNUMSEQNOTA: TIntegerField
      FieldName = 'NUMSEQNOTA'
    end
    object cdsCReceberParcCODPLANOCONTASITENS: TIntegerField
      FieldName = 'CODPLANOCONTASITENS'
    end
    object cdsCReceberParcEXPORTACAO: TStringField
      FieldName = 'EXPORTACAO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsCReceberParcsdsCReceberParcHist: TDataSetField
      FieldName = 'sdsCReceberParcHist'
    end
  end
  object dsCReceberParc: TDataSource
    DataSet = cdsCReceberParc
    Left = 360
    Top = 144
  end
  object dsCReceberParc_Mestre: TDataSource
    DataSet = sdsCReceberParc
    Left = 96
    Top = 200
  end
  object sdsCReceberParcHist: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM CRECEBERPARCHIST'#13#10'WHERE NUMCRECEBER = :NUMCRECEBE' +
      'R'#13#10'  AND PARCCRECEBER = :PARCCRECEBER'
    DataSource = dsCReceberParc_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMCRECEBER'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'PARCCRECEBER'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 160
    Top = 256
    object sdsCReceberParcHistNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
      Required = True
    end
    object sdsCReceberParcHistPARCCRECEBER: TIntegerField
      FieldName = 'PARCCRECEBER'
      Required = True
    end
    object sdsCReceberParcHistITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsCReceberParcHistCODHISTORICO: TIntegerField
      FieldName = 'CODHISTORICO'
    end
    object sdsCReceberParcHistDTHISTORICO: TDateField
      FieldName = 'DTHISTORICO'
    end
    object sdsCReceberParcHistHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 70
    end
    object sdsCReceberParcHistDTULTPGTO: TDateField
      FieldName = 'DTULTPGTO'
    end
    object sdsCReceberParcHistVLRULTPGTO: TFloatField
      FieldName = 'VLRULTPGTO'
    end
    object sdsCReceberParcHistVLRULTJUROS: TFloatField
      FieldName = 'VLRULTJUROS'
    end
    object sdsCReceberParcHistVLRULTDESCONTOS: TFloatField
      FieldName = 'VLRULTDESCONTOS'
    end
    object sdsCReceberParcHistVLRULTDESPESAS: TFloatField
      FieldName = 'VLRULTDESPESAS'
    end
    object sdsCReceberParcHistVLRULTABATIMENTOS: TFloatField
      FieldName = 'VLRULTABATIMENTOS'
    end
    object sdsCReceberParcHistPGTO: TStringField
      FieldName = 'PGTO'
      FixedChar = True
      Size = 1
    end
    object sdsCReceberParcHistJUROSPAGOS: TFloatField
      FieldName = 'JUROSPAGOS'
    end
    object sdsCReceberParcHistNUMMOV: TIntegerField
      FieldName = 'NUMMOV'
    end
    object sdsCReceberParcHistNUMMOVJUROS: TIntegerField
      FieldName = 'NUMMOVJUROS'
    end
    object sdsCReceberParcHistJUROSCALC: TFloatField
      FieldName = 'JUROSCALC'
    end
    object sdsCReceberParcHistVLRDEVOLUCAO: TFloatField
      FieldName = 'VLRDEVOLUCAO'
    end
    object sdsCReceberParcHistDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 10
    end
    object sdsCReceberParcHistNROLANCEXTCOMISSAO: TIntegerField
      FieldName = 'NROLANCEXTCOMISSAO'
    end
    object sdsCReceberParcHistFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object cdsCReceberParcHist: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCReceberParcsdsCReceberParcHist
    Params = <>
    Left = 256
    Top = 256
    object cdsCReceberParcHistNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
      Required = True
    end
    object cdsCReceberParcHistPARCCRECEBER: TIntegerField
      FieldName = 'PARCCRECEBER'
      Required = True
    end
    object cdsCReceberParcHistITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsCReceberParcHistCODHISTORICO: TIntegerField
      FieldName = 'CODHISTORICO'
    end
    object cdsCReceberParcHistDTHISTORICO: TDateField
      FieldName = 'DTHISTORICO'
    end
    object cdsCReceberParcHistHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 70
    end
    object cdsCReceberParcHistDTULTPGTO: TDateField
      FieldName = 'DTULTPGTO'
    end
    object cdsCReceberParcHistVLRULTPGTO: TFloatField
      FieldName = 'VLRULTPGTO'
    end
    object cdsCReceberParcHistVLRULTJUROS: TFloatField
      FieldName = 'VLRULTJUROS'
    end
    object cdsCReceberParcHistVLRULTDESCONTOS: TFloatField
      FieldName = 'VLRULTDESCONTOS'
    end
    object cdsCReceberParcHistVLRULTDESPESAS: TFloatField
      FieldName = 'VLRULTDESPESAS'
    end
    object cdsCReceberParcHistVLRULTABATIMENTOS: TFloatField
      FieldName = 'VLRULTABATIMENTOS'
    end
    object cdsCReceberParcHistPGTO: TStringField
      FieldName = 'PGTO'
      FixedChar = True
      Size = 1
    end
    object cdsCReceberParcHistJUROSPAGOS: TFloatField
      FieldName = 'JUROSPAGOS'
    end
    object cdsCReceberParcHistNUMMOV: TIntegerField
      FieldName = 'NUMMOV'
    end
    object cdsCReceberParcHistNUMMOVJUROS: TIntegerField
      FieldName = 'NUMMOVJUROS'
    end
    object cdsCReceberParcHistJUROSCALC: TFloatField
      FieldName = 'JUROSCALC'
    end
    object cdsCReceberParcHistVLRDEVOLUCAO: TFloatField
      FieldName = 'VLRDEVOLUCAO'
    end
    object cdsCReceberParcHistDEVOLUCAO: TStringField
      FieldName = 'DEVOLUCAO'
      FixedChar = True
      Size = 10
    end
    object cdsCReceberParcHistNROLANCEXTCOMISSAO: TIntegerField
      FieldName = 'NROLANCEXTCOMISSAO'
    end
    object cdsCReceberParcHistFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsCReceberParcHist: TDataSource
    DataSet = cdsCReceberParcHist
    Left = 352
    Top = 256
  end
end
