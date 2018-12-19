object DMNotaFiscal: TDMNotaFiscal
  OldCreateOrder = False
  Left = 353
  Top = 159
  Height = 556
  Width = 955
  object tNotaFiscalIns: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq'
    MasterFields = 'Codigo'
    MasterSource = DM1.dsFilial
    TableName = 'dbNotaFiscal.DB'
    Left = 72
    Top = 6
    object tNotaFiscalInsFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalInsNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalInsDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object tNotaFiscalInsImpressa: TBooleanField
      FieldName = 'Impressa'
    end
    object tNotaFiscalInsNFeRecibo: TStringField
      FieldName = 'NFeRecibo'
    end
    object tNotaFiscalInsNFeProtocolo: TStringField
      FieldName = 'NFeProtocolo'
    end
    object tNotaFiscalInsNFeChaveAcesso: TStringField
      FieldName = 'NFeChaveAcesso'
      Size = 44
    end
    object tNotaFiscalInsNFeProtocoloCancelada: TStringField
      FieldName = 'NFeProtocoloCancelada'
    end
    object tNotaFiscalInsSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tNotaFiscalInsTipoEnvioNF: TStringField
      FieldName = 'TipoEnvioNF'
      Size = 6
    end
    object tNotaFiscalInsNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tNotaFiscalInsCodNatOper: TSmallintField
      FieldName = 'CodNatOper'
    end
    object tNotaFiscalInsCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tNotaFiscalInsCondPgto: TStringField
      FieldName = 'CondPgto'
      Size = 1
    end
    object tNotaFiscalInsCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tNotaFiscalInsBaseIcms: TFloatField
      FieldName = 'BaseIcms'
    end
    object tNotaFiscalInsVlrIcms: TFloatField
      FieldName = 'VlrIcms'
    end
    object tNotaFiscalInsVlrIpi: TFloatField
      FieldName = 'VlrIpi'
    end
    object tNotaFiscalInsVlrTotalNota: TFloatField
      FieldName = 'VlrTotalNota'
    end
    object tNotaFiscalInsVlrTotalItens: TFloatField
      FieldName = 'VlrTotalItens'
    end
    object tNotaFiscalInsPercDesc: TFloatField
      FieldName = 'PercDesc'
    end
    object tNotaFiscalInsVlrTotalDesc: TFloatField
      FieldName = 'VlrTotalDesc'
    end
    object tNotaFiscalInsVlrFrete: TFloatField
      FieldName = 'VlrFrete'
    end
    object tNotaFiscalInsVlrSeguro: TFloatField
      FieldName = 'VlrSeguro'
    end
    object tNotaFiscalInsOutrasDesp: TFloatField
      FieldName = 'OutrasDesp'
    end
    object tNotaFiscalInsQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tNotaFiscalInsEspecie: TStringField
      FieldName = 'Especie'
      Size = 30
    end
    object tNotaFiscalInsMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object tNotaFiscalInsNumero: TStringField
      FieldName = 'Numero'
      Size = 30
    end
    object tNotaFiscalInsPesoBruto: TFloatField
      FieldName = 'PesoBruto'
    end
    object tNotaFiscalInsPesoLiquido: TFloatField
      FieldName = 'PesoLiquido'
    end
    object tNotaFiscalInsPlaca: TStringField
      FieldName = 'Placa'
      Size = 8
    end
    object tNotaFiscalInsUFPlaca: TStringField
      FieldName = 'UFPlaca'
      Size = 2
    end
    object tNotaFiscalInsEmitDest: TStringField
      FieldName = 'EmitDest'
      Size = 1
    end
    object tNotaFiscalInsCodTransp: TIntegerField
      FieldName = 'CodTransp'
    end
    object tNotaFiscalInsObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object tNotaFiscalInsSaidaEntrada: TStringField
      FieldName = 'SaidaEntrada'
      Size = 1
    end
    object tNotaFiscalInsCancelada: TBooleanField
      FieldName = 'Cancelada'
    end
    object tNotaFiscalInsDtSaidaEnt: TDateField
      FieldName = 'DtSaidaEnt'
    end
    object tNotaFiscalInsHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tNotaFiscalInsLocalEntrega: TBooleanField
      FieldName = 'LocalEntrega'
    end
    object tNotaFiscalInsInss: TBooleanField
      FieldName = 'Inss'
    end
    object tNotaFiscalInsIrf: TBooleanField
      FieldName = 'Irf'
    end
    object tNotaFiscalInsVlrInss: TFloatField
      FieldName = 'VlrInss'
    end
    object tNotaFiscalInsVlrIrf: TFloatField
      FieldName = 'VlrIrf'
    end
    object tNotaFiscalInsPrazoPgto: TIntegerField
      FieldName = 'PrazoPgto'
    end
    object tNotaFiscalInsEntrada: TFloatField
      FieldName = 'Entrada'
    end
    object tNotaFiscalInsPercComissao: TFloatField
      FieldName = 'PercComissao'
    end
    object tNotaFiscalInsDtEntr: TDateField
      FieldName = 'DtEntr'
    end
    object tNotaFiscalInsIcmsIpi: TBooleanField
      FieldName = 'IcmsIpi'
    end
    object tNotaFiscalInsPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tNotaFiscalInsSituacao: TIntegerField
      FieldName = 'Situacao'
    end
    object tNotaFiscalInsNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tNotaFiscalInsTipoNota: TStringField
      FieldName = 'TipoNota'
      Size = 1
    end
    object tNotaFiscalInsDescricaoDesc: TStringField
      FieldName = 'DescricaoDesc'
      Size = 70
    end
    object tNotaFiscalInsDescTransf: TMemoField
      FieldName = 'DescTransf'
      BlobType = ftMemo
      Size = 1
    end
    object tNotaFiscalInsExportacao: TBooleanField
      FieldName = 'Exportacao'
    end
    object tNotaFiscalInsObsAux: TMemoField
      FieldName = 'ObsAux'
      BlobType = ftMemo
      Size = 1
    end
    object tNotaFiscalInsPercIssqn: TFloatField
      FieldName = 'PercIssqn'
    end
    object tNotaFiscalInsVlrMObra: TFloatField
      FieldName = 'VlrMObra'
    end
    object tNotaFiscalInsVlrIssqn: TFloatField
      FieldName = 'VlrIssqn'
    end
    object tNotaFiscalInsDtCad: TDateField
      FieldName = 'DtCad'
    end
    object tNotaFiscalInsHrCad: TTimeField
      FieldName = 'HrCad'
    end
  end
  object dsNotaFiscalIns: TDataSource
    DataSet = tNotaFiscalIns
    Left = 100
    Top = 6
  end
  object tNotaFiscalItensIns: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq;Item'
    MasterFields = 'Filial;NumSeq'
    MasterSource = DM1.dsNotaFiscal
    TableName = 'dbNotaFiscalItens.db'
    Left = 72
    Top = 103
    object tNotaFiscalItensInsFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalItensInsNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalItensInsItem: TSmallintField
      FieldName = 'Item'
    end
    object tNotaFiscalItensInsCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tNotaFiscalItensInsCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tNotaFiscalItensInsClasFiscal: TStringField
      FieldName = 'ClasFiscal'
      Size = 3
    end
    object tNotaFiscalItensInsUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object tNotaFiscalItensInsQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tNotaFiscalItensInsIcms: TFloatField
      FieldName = 'Icms'
    end
    object tNotaFiscalItensInsIpi: TFloatField
      FieldName = 'Ipi'
    end
    object tNotaFiscalItensInsSitTrib: TSmallintField
      FieldName = 'SitTrib'
    end
    object tNotaFiscalItensInsVlrUnit: TFloatField
      FieldName = 'VlrUnit'
    end
    object tNotaFiscalItensInsVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tNotaFiscalItensInsDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tNotaFiscalItensInsVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tNotaFiscalItensInsBaseIcms: TFloatField
      FieldName = 'BaseIcms'
    end
    object tNotaFiscalItensInsVlrIcms: TFloatField
      FieldName = 'VlrIcms'
    end
    object tNotaFiscalItensInsVlrIpi: TFloatField
      FieldName = 'VlrIpi'
    end
    object tNotaFiscalItensInsNatOper: TSmallintField
      FieldName = 'NatOper'
    end
    object tNotaFiscalItensInsIcmsIpi: TBooleanField
      FieldName = 'IcmsIpi'
    end
    object tNotaFiscalItensInsNumNota: TIntegerField
      FieldName = 'NumNota'
    end
  end
  object dsNotaFiscalItensIns: TDataSource
    DataSet = tNotaFiscalItensIns
    Left = 100
    Top = 103
  end
  object qNatOper: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Distinct NatOper'
      'FROM "dbNotaFiscalItens.DB" Dbnotafiscalitens'
      'WHERE Filial = :F1 and NumSeq = :N1')
    Left = 304
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'N1'
        ParamType = ptUnknown
      end>
    object qNatOperNatOper: TSmallintField
      FieldName = 'NatOper'
      Origin = 'TABELAS."dbNotaFiscalItens.DB".NatOper'
    end
  end
  object tNotaFiscalImp: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq;Item'
    MasterFields = 'Filial;NumSeq'
    MasterSource = DM1.dsNotaFiscal
    TableName = 'dbNotaFiscalImp.DB'
    Left = 72
    Top = 160
    object tNotaFiscalImpFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalImpNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalImpItem: TIntegerField
      FieldName = 'Item'
    end
    object tNotaFiscalImpNumDI: TStringField
      FieldName = 'NumDI'
      Size = 12
    end
    object tNotaFiscalImpDataRegistro: TDateField
      FieldName = 'DataRegistro'
    end
    object tNotaFiscalImpDataDesembaraco: TDateField
      FieldName = 'DataDesembaraco'
    end
    object tNotaFiscalImpCodExportador: TStringField
      FieldName = 'CodExportador'
      Size = 60
    end
    object tNotaFiscalImpCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object tNotaFiscalImpNroFatura: TStringField
      FieldName = 'NroFatura'
      Size = 15
    end
    object tNotaFiscalImpLOCAL_DESEMBARACO: TStringField
      FieldName = 'LOCAL_DESEMBARACO'
      Size = 60
    end
    object tNotaFiscalImpUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tNotaFiscalImpTIPO_VIA_TRANSORTE: TIntegerField
      FieldName = 'TIPO_VIA_TRANSORTE'
    end
    object tNotaFiscalImpVLR_AFRMM: TFloatField
      FieldName = 'VLR_AFRMM'
    end
    object tNotaFiscalImpTIPO_INTERMEDIO: TIntegerField
      FieldName = 'TIPO_INTERMEDIO'
    end
    object tNotaFiscalImpCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object tNotaFiscalImpUF_TERCEIRO: TStringField
      FieldName = 'UF_TERCEIRO'
      Size = 2
    end
  end
  object dsNotaFiscalImp: TDataSource
    DataSet = tNotaFiscalImp
    Left = 100
    Top = 160
  end
  object tNotaFiscalImpAdicao: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq'
    MasterFields = 'Filial;NumSeq'
    MasterSource = dsNotaFiscalImp
    TableName = 'dbNotaFiscalImpAdicao.DB'
    Left = 72
    Top = 56
    object tNotaFiscalImpAdicaoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalImpAdicaoNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalImpAdicaoItemImp: TIntegerField
      FieldName = 'ItemImp'
    end
    object tNotaFiscalImpAdicaoItemAdicao: TIntegerField
      FieldName = 'ItemAdicao'
    end
    object tNotaFiscalImpAdicaoNumAdicao: TIntegerField
      FieldName = 'NumAdicao'
    end
    object tNotaFiscalImpAdicaoCodFabricante: TStringField
      FieldName = 'CodFabricante'
      Size = 60
    end
    object tNotaFiscalImpAdicaoValorDescontoDI: TFloatField
      FieldName = 'ValorDescontoDI'
    end
    object tNotaFiscalImpAdicaoNUM_DRAWBACK: TStringField
      FieldName = 'NUM_DRAWBACK'
      Size = 11
    end
  end
  object dsNotaFiscalImpAdicao: TDataSource
    DataSet = tNotaFiscalImpAdicao
    Left = 100
    Top = 56
  end
  object tUF2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbUF.DB'
    Left = 248
    Top = 136
    object tUF2Sigla: TStringField
      FieldName = 'Sigla'
      Size = 2
    end
    object tUF2Percentual: TFloatField
      FieldName = 'Percentual'
    end
    object tUF2CodSitTrib: TIntegerField
      FieldName = 'CodSitTrib'
    end
    object tUF2IDPais: TIntegerField
      FieldName = 'IDPais'
    end
    object tUF2CodUF: TStringField
      FieldName = 'CodUF'
      Size = 2
    end
    object tUF2IcmsInterno: TFloatField
      FieldName = 'IcmsInterno'
    end
  end
  object dsUF2: TDataSource
    DataSet = tUF2
    Left = 280
    Top = 136
  end
  object tNotaFiscalReboque: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq'
    MasterFields = 'Filial;NumSeq'
    MasterSource = DM1.dsNotaFiscal
    TableName = 'dbNotaFiscalReboque.DB'
    Left = 272
    Top = 208
    object tNotaFiscalReboqueFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalReboqueNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalReboqueItem: TIntegerField
      FieldName = 'Item'
    end
    object tNotaFiscalReboquePlaca: TStringField
      FieldName = 'Placa'
      Size = 8
    end
    object tNotaFiscalReboqueUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tNotaFiscalReboqueRNTC: TStringField
      FieldName = 'RNTC'
    end
  end
  object dsNotaFiscalReboque: TDataSource
    DataSet = tNotaFiscalReboque
    Left = 256
    Top = 216
  end
  object tNotaFiscalLacre: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq;Item'
    MasterFields = 'Filial;NumSeq'
    MasterSource = DM1.dsNotaFiscal
    TableName = 'dbNotaFiscalLacre.db'
    Left = 200
    Top = 360
    object tNotaFiscalLacreFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalLacreNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalLacreItem: TIntegerField
      FieldName = 'Item'
    end
    object tNotaFiscalLacreNumLacre: TStringField
      FieldName = 'NumLacre'
      Size = 60
    end
  end
  object dsNotaFiscalLacre: TDataSource
    DataSet = tNotaFiscalLacre
    Left = 240
    Top = 360
  end
  object tNotaFiscalTBDesconto: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumSeq;Item'
    MasterFields = 'Filial;NumSeq'
    MasterSource = DM1.dsNotaFiscal
    TableName = 'dbNotaFiscalTBDesconto.db'
    Left = 176
    Top = 272
    object tNotaFiscalTBDescontoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscalTBDescontoNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscalTBDescontoItem: TIntegerField
      FieldName = 'Item'
    end
    object tNotaFiscalTBDescontoPercDesconto: TFloatField
      FieldName = 'PercDesconto'
    end
  end
  object dsNotaFiscalTBDesconto: TDataSource
    DataSet = tNotaFiscalTBDesconto
    Left = 208
    Top = 272
  end
  object sdsNotaFiscal_DrawBack: TSQLDataSet
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
    Left = 608
    Top = 72
    object sdsNotaFiscal_DrawBackID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsNotaFiscal_DrawBackITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsNotaFiscal_DrawBackITEM_DRAWBACK: TIntegerField
      FieldName = 'ITEM_DRAWBACK'
      Required = True
    end
    object sdsNotaFiscal_DrawBackNUM_DRAWBACK: TStringField
      FieldName = 'NUM_DRAWBACK'
      Size = 11
    end
    object sdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO: TStringField
      FieldName = 'NUM_REG_EXPORTACAO'
      Size = 12
    end
    object sdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField
      FieldName = 'NUM_CHAVE_ACESSO_NFE'
      Size = 44
    end
    object sdsNotaFiscal_DrawBackQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dspNotaFiscal_DrawBack: TDataSetProvider
    DataSet = sdsNotaFiscal_DrawBack
    Left = 664
    Top = 72
  end
  object cdsNotaFiscal_DrawBack: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_DRAWBACK'
    Params = <>
    ProviderName = 'dspNotaFiscal_DrawBack'
    Left = 728
    Top = 72
    object cdsNotaFiscal_DrawBackID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNotaFiscal_DrawBackITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsNotaFiscal_DrawBackITEM_DRAWBACK: TIntegerField
      FieldName = 'ITEM_DRAWBACK'
      Required = True
    end
    object cdsNotaFiscal_DrawBackNUM_DRAWBACK: TStringField
      FieldName = 'NUM_DRAWBACK'
      Size = 11
    end
    object cdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO: TStringField
      FieldName = 'NUM_REG_EXPORTACAO'
      Size = 12
    end
    object cdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField
      FieldName = 'NUM_CHAVE_ACESSO_NFE'
      Size = 44
    end
    object cdsNotaFiscal_DrawBackQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dsNotaFiscal_DrawBack: TDataSource
    DataSet = cdsNotaFiscal_DrawBack
    Left = 792
    Top = 72
  end
  object qIcmsPartilha: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT T.ano, T.perc_destino'
      'FROM TAB_PARTILHA_ICMS T'
      'WHERE T.ANO = :ANO')
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 176
    object qIcmsPartilhaANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object qIcmsPartilhaPERC_DESTINO: TFloatField
      FieldName = 'PERC_DESTINO'
    end
  end
end
