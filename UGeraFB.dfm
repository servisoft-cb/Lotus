object fGeraFB: TfGeraFB
  Left = 256
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fGeraFB'
  ClientHeight = 446
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 32
    Top = 24
    Width = 128
    Height = 26
    Caption = 'Tal'#227'o Grade'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 55
    Width = 128
    Height = 26
    Caption = 'Tal'#227'o Mov'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 32
    Top = 89
    Width = 128
    Height = 26
    Caption = 'Tal'#227'o'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 32
    Top = 122
    Width = 128
    Height = 26
    Caption = 'Lote'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 32
    Top = 163
    Width = 128
    Height = 26
    Caption = 'Produto'
    TabOrder = 4
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 33
    Top = 203
    Width = 128
    Height = 26
    Caption = 'Material'
    TabOrder = 5
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 33
    Top = 251
    Width = 128
    Height = 26
    Caption = 'Armazenamento Ref'
    TabOrder = 6
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 33
    Top = 294
    Width = 128
    Height = 26
    Caption = 'Navalha (Local)'
    TabOrder = 7
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 33
    Top = 334
    Width = 128
    Height = 26
    Caption = 'Cliente'
    TabOrder = 8
    OnClick = BitBtn9Click
  end
  object BitBtn10: TBitBtn
    Left = 33
    Top = 382
    Width = 128
    Height = 26
    Caption = 'Criar Campos'
    TabOrder = 9
    OnClick = BitBtn10Click
  end
  object sdsTalaoGrade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAOGRADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 21
    object sdsTalaoGradeLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object sdsTalaoGradeITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsTalaoGradeTALAO: TIntegerField
      FieldName = 'TALAO'
      Required = True
    end
    object sdsTalaoGradeCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object sdsTalaoGradePOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object sdsTalaoGradeQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
    end
  end
  object dspTalaoGrade: TDataSetProvider
    DataSet = sdsTalaoGrade
    Left = 288
    Top = 21
  end
  object cdsTalaoGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoGrade'
    Left = 376
    Top = 21
    object cdsTalaoGradeLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object cdsTalaoGradeITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsTalaoGradeTALAO: TIntegerField
      FieldName = 'TALAO'
      Required = True
    end
    object cdsTalaoGradeCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object cdsTalaoGradePOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object cdsTalaoGradeQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
    end
  end
  object tTalaoGrade: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbTalaoGrade.DB'
    Left = 528
    Top = 21
    object tTalaoGradeLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoGradeItem: TIntegerField
      FieldName = 'Item'
    end
    object tTalaoGradeTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoGradeQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
  end
  object sdsTalaoMov: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAOMOV'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 52
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
    Left = 288
    Top = 52
  end
  object cdsTalaoMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoMov'
    Left = 376
    Top = 52
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
  object tTalaoMov: TTable
    DatabaseName = 'Tabelas'
    TableName = 'DBTALAOMOV.DB'
    Left = 528
    Top = 52
    object tTalaoMovLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMovTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMovSetor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMovDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMovHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMovDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMovHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMovCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
  end
  object sdsTalao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 86
    object sdsTalaoLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object sdsTalaoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsTalaoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sdsTalaoCODCABEDAL1: TIntegerField
      FieldName = 'CODCABEDAL1'
    end
    object sdsTalaoCODCABEDAL2: TIntegerField
      FieldName = 'CODCABEDAL2'
    end
    object sdsTalaoCODCOR: TIntegerField
      FieldName = 'CODCOR'
    end
    object sdsTalaoCODCORFORRO: TIntegerField
      FieldName = 'CODCORFORRO'
    end
    object sdsTalaoCODCORPALMILHA: TIntegerField
      FieldName = 'CODCORPALMILHA'
    end
    object sdsTalaoCODCORSOLADO: TIntegerField
      FieldName = 'CODCORSOLADO'
    end
    object sdsTalaoQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
    end
    object sdsTalaoCODFORRO: TIntegerField
      FieldName = 'CODFORRO'
    end
    object sdsTalaoCODETIQUETA: TIntegerField
      FieldName = 'CODETIQUETA'
    end
    object sdsTalaoCODSOLADO: TIntegerField
      FieldName = 'CODSOLADO'
    end
    object sdsTalaoCODTALONEIRA: TIntegerField
      FieldName = 'CODTALONEIRA'
    end
    object sdsTalaoCODCORTALONEIRA: TIntegerField
      FieldName = 'CODCORTALONEIRA'
    end
    object sdsTalaoCODPALMILHA: TIntegerField
      FieldName = 'CODPALMILHA'
    end
    object sdsTalaoINVOICE: TStringField
      FieldName = 'INVOICE'
      Size = 8
    end
    object sdsTalaoCODFORMA: TIntegerField
      FieldName = 'CODFORMA'
    end
    object sdsTalaoCODFABRICA: TIntegerField
      FieldName = 'CODFABRICA'
    end
  end
  object dspTalao: TDataSetProvider
    DataSet = sdsTalao
    Left = 288
    Top = 86
  end
  object cdsTalao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalao'
    Left = 376
    Top = 86
    object cdsTalaoLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object cdsTalaoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsTalaoCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsTalaoCODCABEDAL1: TIntegerField
      FieldName = 'CODCABEDAL1'
    end
    object cdsTalaoCODCABEDAL2: TIntegerField
      FieldName = 'CODCABEDAL2'
    end
    object cdsTalaoCODCOR: TIntegerField
      FieldName = 'CODCOR'
    end
    object cdsTalaoCODCORFORRO: TIntegerField
      FieldName = 'CODCORFORRO'
    end
    object cdsTalaoCODCORPALMILHA: TIntegerField
      FieldName = 'CODCORPALMILHA'
    end
    object cdsTalaoCODCORSOLADO: TIntegerField
      FieldName = 'CODCORSOLADO'
    end
    object cdsTalaoQTDPAR: TIntegerField
      FieldName = 'QTDPAR'
    end
    object cdsTalaoCODFORRO: TIntegerField
      FieldName = 'CODFORRO'
    end
    object cdsTalaoCODETIQUETA: TIntegerField
      FieldName = 'CODETIQUETA'
    end
    object cdsTalaoCODSOLADO: TIntegerField
      FieldName = 'CODSOLADO'
    end
    object cdsTalaoCODTALONEIRA: TIntegerField
      FieldName = 'CODTALONEIRA'
    end
    object cdsTalaoCODCORTALONEIRA: TIntegerField
      FieldName = 'CODCORTALONEIRA'
    end
    object cdsTalaoCODPALMILHA: TIntegerField
      FieldName = 'CODPALMILHA'
    end
    object cdsTalaoINVOICE: TStringField
      FieldName = 'INVOICE'
      Size = 8
    end
    object cdsTalaoCODFORMA: TIntegerField
      FieldName = 'CODFORMA'
    end
    object cdsTalaoCODFABRICA: TIntegerField
      FieldName = 'CODFABRICA'
    end
  end
  object tTalao: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbTalao.DB'
    Left = 528
    Top = 86
    object tTalaoLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoItem: TIntegerField
      FieldName = 'Item'
    end
    object tTalaoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tTalaoCodCabedal1: TIntegerField
      FieldName = 'CodCabedal1'
    end
    object tTalaoCodCabedal2: TIntegerField
      FieldName = 'CodCabedal2'
    end
    object tTalaoCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tTalaoCodCorForro: TIntegerField
      FieldName = 'CodCorForro'
    end
    object tTalaoCodCorPalmilha: TIntegerField
      FieldName = 'CodCorPalmilha'
    end
    object tTalaoCodCorSolado: TIntegerField
      FieldName = 'CodCorSolado'
    end
    object tTalaoQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
    object tTalaoCodForro: TIntegerField
      FieldName = 'CodForro'
    end
    object tTalaoCodEtiqueta: TIntegerField
      FieldName = 'CodEtiqueta'
    end
    object tTalaoCodSolado: TIntegerField
      FieldName = 'CodSolado'
    end
    object tTalaoCodTaloneira: TIntegerField
      FieldName = 'CodTaloneira'
    end
    object tTalaoCodCorTaloneira: TIntegerField
      FieldName = 'CodCorTaloneira'
    end
    object tTalaoCodPalmilha: TIntegerField
      FieldName = 'CodPalmilha'
    end
    object tTalaoInvoice: TStringField
      FieldName = 'Invoice'
      Size = 8
    end
    object tTalaoCodForma: TIntegerField
      FieldName = 'CodForma'
    end
    object tTalaoCodFabrica: TIntegerField
      FieldName = 'CodFabrica'
    end
  end
  object sdsLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM LOTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 119
    object sdsLoteLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object sdsLoteQTDTALOES: TIntegerField
      FieldName = 'QTDTALOES'
    end
    object sdsLoteQTDPARES: TFloatField
      FieldName = 'QTDPARES'
    end
    object sdsLoteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsLoteIMPCALCMATERIAL: TStringField
      FieldName = 'IMPCALCMATERIAL'
      FixedChar = True
      Size = 1
    end
    object sdsLoteNROPEDIDO: TIntegerField
      FieldName = 'NROPEDIDO'
    end
    object sdsLoteIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object sdsLoteOCGERADO: TStringField
      FieldName = 'OCGERADO'
      FixedChar = True
      Size = 1
    end
    object sdsLoteITEMPED: TIntegerField
      FieldName = 'ITEMPED'
    end
    object sdsLoteNUMMAPACOMPRAS: TIntegerField
      FieldName = 'NUMMAPACOMPRAS'
    end
    object sdsLoteDTEMBARQUE: TDateField
      FieldName = 'DTEMBARQUE'
    end
    object sdsLoteTIPOTALAO: TStringField
      FieldName = 'TIPOTALAO'
      FixedChar = True
      Size = 1
    end
    object sdsLoteCODFABRICA: TIntegerField
      FieldName = 'CODFABRICA'
    end
    object sdsLoteNUMPROGRAMACAO: TIntegerField
      FieldName = 'NUMPROGRAMACAO'
    end
    object sdsLoteNUMOCINI: TIntegerField
      FieldName = 'NUMOCINI'
    end
    object sdsLoteNUMOCFIN: TIntegerField
      FieldName = 'NUMOCFIN'
    end
  end
  object dspLote: TDataSetProvider
    DataSet = sdsLote
    Left = 288
    Top = 119
  end
  object cdsLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLote'
    Left = 376
    Top = 119
    object cdsLoteLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object cdsLoteQTDTALOES: TIntegerField
      FieldName = 'QTDTALOES'
    end
    object cdsLoteQTDPARES: TFloatField
      FieldName = 'QTDPARES'
    end
    object cdsLoteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLoteIMPCALCMATERIAL: TStringField
      FieldName = 'IMPCALCMATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsLoteNROPEDIDO: TIntegerField
      FieldName = 'NROPEDIDO'
    end
    object cdsLoteIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsLoteOCGERADO: TStringField
      FieldName = 'OCGERADO'
      FixedChar = True
      Size = 1
    end
    object cdsLoteITEMPED: TIntegerField
      FieldName = 'ITEMPED'
    end
    object cdsLoteNUMMAPACOMPRAS: TIntegerField
      FieldName = 'NUMMAPACOMPRAS'
    end
    object cdsLoteDTEMBARQUE: TDateField
      FieldName = 'DTEMBARQUE'
    end
    object cdsLoteTIPOTALAO: TStringField
      FieldName = 'TIPOTALAO'
      FixedChar = True
      Size = 1
    end
    object cdsLoteCODFABRICA: TIntegerField
      FieldName = 'CODFABRICA'
    end
    object cdsLoteNUMPROGRAMACAO: TIntegerField
      FieldName = 'NUMPROGRAMACAO'
    end
    object cdsLoteNUMOCINI: TIntegerField
      FieldName = 'NUMOCINI'
    end
    object cdsLoteNUMOCFIN: TIntegerField
      FieldName = 'NUMOCFIN'
    end
  end
  object tLote: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbLote.DB'
    Left = 528
    Top = 119
    object tLoteLote: TIntegerField
      FieldName = 'Lote'
    end
    object tLoteQtdTaloes: TIntegerField
      FieldName = 'QtdTaloes'
    end
    object tLoteQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object tLoteObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 10
    end
    object tLoteImpCalcMaterial: TBooleanField
      FieldName = 'ImpCalcMaterial'
    end
    object tLoteNroPedido: TIntegerField
      FieldName = 'NroPedido'
    end
    object tLoteImpresso: TBooleanField
      FieldName = 'Impresso'
    end
    object tLoteOCGerado: TBooleanField
      FieldName = 'OCGerado'
    end
    object tLoteItemPed: TIntegerField
      FieldName = 'ItemPed'
    end
    object tLoteNumMapaCompras: TIntegerField
      FieldName = 'NumMapaCompras'
    end
    object tLoteDtEmbarque: TDateField
      FieldName = 'DtEmbarque'
    end
    object tLoteTipoTalao: TStringField
      FieldName = 'TipoTalao'
      Size = 1
    end
    object tLoteCodFabrica: TIntegerField
      FieldName = 'CodFabrica'
    end
    object tLoteNumProgramacao: TIntegerField
      FieldName = 'NumProgramacao'
    end
    object tLoteNumOCIni: TIntegerField
      FieldName = 'NumOCIni'
    end
    object tLoteNumOCFin: TIntegerField
      FieldName = 'NumOCFin'
    end
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10' FROM PRODUTO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 160
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
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 288
    Top = 160
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 376
    Top = 160
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
  end
  object tProduto: TTable
    DatabaseName = 'Tabelas'
    TableName = 'DBPRODUTO.DB'
    Left = 528
    Top = 160
    object tProdutoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tProdutoCodGrupo: TIntegerField
      FieldName = 'CodGrupo'
    end
    object tProdutoCodSubGrupo: TIntegerField
      FieldName = 'CodSubGrupo'
    end
    object tProdutoReferencia: TStringField
      FieldName = 'Referencia'
      Size = 8
    end
    object tProdutoNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tProdutoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object tProdutoCodClasFiscal: TStringField
      FieldName = 'CodClasFiscal'
      Size = 12
    end
    object tProdutoCodSitTrib: TIntegerField
      FieldName = 'CodSitTrib'
    end
    object tProdutoLancaGrade: TBooleanField
      FieldName = 'LancaGrade'
    end
    object tProdutoCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tProdutoQParTalao: TFloatField
      FieldName = 'QParTalao'
    end
    object tProdutoPesoLiquido: TFloatField
      FieldName = 'PesoLiquido'
    end
    object tProdutoPesoBruto: TFloatField
      FieldName = 'PesoBruto'
    end
    object tProdutoInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tProdutoConsumo: TStringField
      FieldName = 'Consumo'
      Size = 1
    end
    object tProdutoAliqIcms: TFloatField
      FieldName = 'AliqIcms'
    end
    object tProdutoAliqIPI: TFloatField
      FieldName = 'AliqIPI'
    end
    object tProdutoNomeExp: TStringField
      FieldName = 'NomeExp'
      Size = 45
    end
    object tProdutoCodModelista: TIntegerField
      FieldName = 'CodModelista'
    end
    object tProdutoComissaoMod: TFloatField
      FieldName = 'ComissaoMod'
    end
    object tProdutoDescMaterial: TStringField
      FieldName = 'DescMaterial'
      Size = 10
    end
    object tProdutoReferencia2: TStringField
      FieldName = 'Referencia2'
      Size = 8
    end
    object tProdutoVlrAtelier: TFloatField
      FieldName = 'VlrAtelier'
    end
    object tProdutoConstrucao: TStringField
      FieldName = 'Construcao'
    end
    object tProdutoNomeModelo: TStringField
      FieldName = 'NomeModelo'
      Size = 40
    end
    object tProdutoFotoJpeg: TBlobField
      FieldName = 'FotoJpeg'
      BlobType = ftParadoxOle
      Size = 1
    end
    object tProdutoPalmInterna: TStringField
      FieldName = 'PalmInterna'
      Size = 30
    end
    object tProdutoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object tProdutoEndEtiq: TStringField
      FieldName = 'EndEtiq'
      Size = 60
    end
    object tProdutoMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
    object tProdutoCodForma: TIntegerField
      FieldName = 'CodForma'
    end
    object tProdutoTempoCalculo: TFloatField
      FieldName = 'TempoCalculo'
    end
    object tProdutoTempoReal: TFloatField
      FieldName = 'TempoReal'
    end
    object tProdutoCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
    end
    object tProdutoCodConstrucaoGrupo: TIntegerField
      FieldName = 'CodConstrucaoGrupo'
    end
    object tProdutoDtCadastro: TDateField
      FieldName = 'DtCadastro'
    end
    object tProdutoCadastroCompleto: TBooleanField
      FieldName = 'CadastroCompleto'
    end
    object tProdutoComplemento: TStringField
      FieldName = 'Complemento'
      Size = 200
    end
    object tProdutoProdMat: TStringField
      FieldName = 'ProdMat'
      Size = 1
    end
    object tProdutoOrigemProd: TStringField
      FieldName = 'OrigemProd'
      Size = 1
    end
    object tProdutoCodCSTIPI: TStringField
      FieldName = 'CodCSTIPI'
      Size = 2
    end
    object tProdutoLancaCor: TBooleanField
      FieldName = 'LancaCor'
    end
    object tProdutoEndFoto: TStringField
      FieldName = 'EndFoto'
      Size = 250
    end
  end
  object sdsMaterial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10' FROM MATERIAL'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 200
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
  end
  object dspMaterial: TDataSetProvider
    DataSet = sdsMaterial
    Left = 288
    Top = 200
  end
  object cdsMaterial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterial'
    Left = 376
    Top = 200
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
  end
  object tMaterial: TTable
    DatabaseName = 'Tabelas'
    TableName = 'DBMATERIAL.DB'
    Left = 528
    Top = 200
    object tMaterialCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tMaterialNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object tMaterialGrupo: TIntegerField
      FieldName = 'Grupo'
    end
    object tMaterialSubGrupo: TIntegerField
      FieldName = 'SubGrupo'
    end
    object tMaterialUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object tMaterialICMS: TFloatField
      FieldName = 'ICMS'
    end
    object tMaterialIPI: TFloatField
      FieldName = 'IPI'
    end
    object tMaterialPrCusto: TFloatField
      FieldName = 'PrCusto'
    end
    object tMaterialFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tMaterialCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tMaterialEstMinimo: TFloatField
      FieldName = 'EstMinimo'
    end
    object tMaterialInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tMaterialLancaCor: TBooleanField
      FieldName = 'LancaCor'
    end
    object tMaterialPrecoCor: TBooleanField
      FieldName = 'PrecoCor'
    end
    object tMaterialLancaGrade: TBooleanField
      FieldName = 'LancaGrade'
    end
    object tMaterialPrecoGrade: TBooleanField
      FieldName = 'PrecoGrade'
    end
    object tMaterialTipoMat: TStringField
      FieldName = 'TipoMat'
      Size = 1
    end
    object tMaterialTipoSolado: TStringField
      FieldName = 'TipoSolado'
      Size = 1
    end
    object tMaterialMaterialOutros: TStringField
      FieldName = 'MaterialOutros'
      Size = 1
    end
    object tMaterialDtAlteracao: TDateField
      FieldName = 'DtAlteracao'
    end
    object tMaterialCalcMaterial: TBooleanField
      FieldName = 'CalcMaterial'
    end
    object tMaterialPre: TBooleanField
      FieldName = 'Pre'
    end
    object tMaterialCodClasFiscal: TStringField
      FieldName = 'CodClasFiscal'
      Size = 12
    end
    object tMaterialImpGradeTalaoAuxiliar: TBooleanField
      FieldName = 'ImpGradeTalaoAuxiliar'
    end
    object tMaterialImpTalaoAuxiliar: TBooleanField
      FieldName = 'ImpTalaoAuxiliar'
    end
    object tMaterialImpCalcMaterial: TBooleanField
      FieldName = 'ImpCalcMaterial'
    end
    object tMaterialTipoReg: TStringField
      FieldName = 'TipoReg'
      Size = 1
    end
    object tMaterialComplemento: TStringField
      FieldName = 'Complemento'
      Size = 200
    end
    object tMaterialCodSitTrib: TIntegerField
      FieldName = 'CodSitTrib'
    end
    object tMaterialGeraOC: TBooleanField
      FieldName = 'GeraOC'
    end
    object tMaterialOrigemProd: TStringField
      FieldName = 'OrigemProd'
      Size = 1
    end
    object tMaterialUsuario: TStringField
      FieldName = 'Usuario'
      Size = 15
    end
    object tMaterialCorreto: TBooleanField
      FieldName = 'Correto'
    end
    object tMaterialNomeSemAcento: TStringField
      FieldName = 'NomeSemAcento'
      Size = 60
    end
  end
  object sdsArmazenamento_Ref: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10' FROM ARMAZENAMENTO_REF'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 240
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
    Left = 288
    Top = 240
  end
  object cdsArmazenamento_Ref: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspArmazenamento_Ref'
    Left = 376
    Top = 240
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
  object tArmazReferencia: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbArmazReferencia.db'
    Left = 528
    Top = 240
    object tArmazReferenciaId: TIntegerField
      FieldName = 'Id'
    end
    object tArmazReferenciaCaixa: TStringField
      FieldName = 'Caixa'
    end
    object tArmazReferenciaReferencia: TStringField
      FieldName = 'Referencia'
      Size = 30
    end
    object tArmazReferenciaCia: TStringField
      FieldName = 'Cia'
      Size = 30
    end
    object tArmazReferenciaData: TDateField
      FieldName = 'Data'
    end
  end
  object sdsNavalha_Local: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10' FROM NAVALHA_LOCAL'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 292
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
    Left = 288
    Top = 292
  end
  object cdsNavalha_Local: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNavalha_Local'
    Left = 376
    Top = 292
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
  object tNavalha_Local: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbNavalhaLocal.db'
    Left = 528
    Top = 292
    object tNavalha_LocalId: TIntegerField
      FieldName = 'Id'
    end
    object tNavalha_LocalDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object tNavalha_LocalLocalizacao: TStringField
      FieldName = 'Localizacao'
      Size = 30
    end
    object tNavalha_LocalNavalha: TStringField
      FieldName = 'Navalha'
      Size = 30
    end
    object tNavalha_LocalReorder: TStringField
      FieldName = 'Reorder'
      Size = 30
    end
    object tNavalha_LocalDtDescarte: TDateField
      FieldName = 'DtDescarte'
    end
    object tNavalha_LocalDtEstoque: TDateField
      FieldName = 'DtEstoque'
    end
  end
  object sdsCliente: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10' FROM CLIENTE'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 200
    Top = 332
    object sdsClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object sdsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object sdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object sdsClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object sdsClienteTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object sdsClienteFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object sdsClientePESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object sdsClienteCGCCPF: TStringField
      FieldName = 'CGCCPF'
      Size = 18
    end
    object sdsClienteINSCREST: TStringField
      FieldName = 'INSCREST'
      Size = 18
    end
    object sdsClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object sdsClienteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsClienteAPROVCREDITO: TStringField
      FieldName = 'APROVCREDITO'
      Size = 1
    end
    object sdsClienteTIPOAPROV: TStringField
      FieldName = 'TIPOAPROV'
      Size = 1
    end
    object sdsClienteENDENTREGA: TStringField
      FieldName = 'ENDENTREGA'
      Size = 40
    end
    object sdsClienteBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Size = 30
    end
    object sdsClienteCIDENTREGA: TStringField
      FieldName = 'CIDENTREGA'
      Size = 30
    end
    object sdsClienteCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      Size = 10
    end
    object sdsClienteUFENTREGA: TStringField
      FieldName = 'UFENTREGA'
      Size = 2
    end
    object sdsClienteCGCCPFENTREGA: TStringField
      FieldName = 'CGCCPFENTREGA'
      Size = 18
    end
    object sdsClienteINSCENTREGA: TStringField
      FieldName = 'INSCENTREGA'
      Size = 18
    end
    object sdsClienteENDPGTO: TStringField
      FieldName = 'ENDPGTO'
      Size = 40
    end
    object sdsClienteBAIRROPGTO: TStringField
      FieldName = 'BAIRROPGTO'
      Size = 30
    end
    object sdsClienteCIDPGTO: TStringField
      FieldName = 'CIDPGTO'
      Size = 30
    end
    object sdsClienteCEPPGTO: TStringField
      FieldName = 'CEPPGTO'
      Size = 10
    end
    object sdsClienteUFPGTO: TStringField
      FieldName = 'UFPGTO'
      Size = 2
    end
    object sdsClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
    end
    object sdsClienteDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object sdsClienteCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object sdsClienteOBSCTAS: TMemoField
      FieldName = 'OBSCTAS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsClienteLOJAS: TIntegerField
      FieldName = 'LOJAS'
    end
    object sdsClienteSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object sdsClienteCAIXAPOSTAL: TStringField
      FieldName = 'CAIXAPOSTAL'
      Size = 10
    end
    object sdsClienteRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object sdsClienteCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object sdsClienteCODCIDADEE: TIntegerField
      FieldName = 'CODCIDADEE'
    end
    object sdsClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object sdsClienteMERCADO: TStringField
      FieldName = 'MERCADO'
      Size = 1
    end
    object sdsClienteNUMEND: TStringField
      FieldName = 'NUMEND'
      Size = 15
    end
    object sdsClienteNUMENDENTREGA: TStringField
      FieldName = 'NUMENDENTREGA'
      Size = 15
    end
    object sdsClienteEMAILNFE: TStringField
      FieldName = 'EMAILNFE'
      Size = 150
    end
    object sdsClienteCOMPLENDERECO: TStringField
      FieldName = 'COMPLENDERECO'
      Size = 50
    end
    object sdsClienteDTVALIDADEIPI: TDateField
      FieldName = 'DTVALIDADEIPI'
    end
    object sdsClienteCODOBSIPI: TIntegerField
      FieldName = 'CODOBSIPI'
    end
    object sdsClienteHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 200
    end
    object sdsClienteCOMPLENDERECOENTREGA: TStringField
      FieldName = 'COMPLENDERECOENTREGA'
      Size = 50
    end
    object sdsClienteCODSITTRIBSIMPLES: TIntegerField
      FieldName = 'CODSITTRIBSIMPLES'
    end
    object sdsClienteUSAICMSSIMPLES: TStringField
      FieldName = 'USAICMSSIMPLES'
      FixedChar = True
      Size = 1
    end
    object sdsClienteDDDFONE1: TIntegerField
      FieldName = 'DDDFONE1'
    end
    object sdsClienteDDDFONE2: TIntegerField
      FieldName = 'DDDFONE2'
    end
    object sdsClienteDDDFAX: TIntegerField
      FieldName = 'DDDFAX'
    end
    object sdsClienteIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
    end
    object sdsClienteEMAILNFE2: TStringField
      FieldName = 'EMAILNFE2'
      Size = 150
    end
    object sdsClienteNOMESEMACENTO: TStringField
      FieldName = 'NOMESEMACENTO'
      Size = 40
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = sdsCliente
    Left = 288
    Top = 332
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 376
    Top = 332
    object cdsClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object cdsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object cdsClienteTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
      Size = 15
    end
    object cdsClienteFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object cdsClientePESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object cdsClienteCGCCPF: TStringField
      FieldName = 'CGCCPF'
      Size = 18
    end
    object cdsClienteINSCREST: TStringField
      FieldName = 'INSCREST'
      Size = 18
    end
    object cdsClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 30
    end
    object cdsClienteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsClienteAPROVCREDITO: TStringField
      FieldName = 'APROVCREDITO'
      Size = 1
    end
    object cdsClienteTIPOAPROV: TStringField
      FieldName = 'TIPOAPROV'
      Size = 1
    end
    object cdsClienteENDENTREGA: TStringField
      FieldName = 'ENDENTREGA'
      Size = 40
    end
    object cdsClienteBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Size = 30
    end
    object cdsClienteCIDENTREGA: TStringField
      FieldName = 'CIDENTREGA'
      Size = 30
    end
    object cdsClienteCEPENTREGA: TStringField
      FieldName = 'CEPENTREGA'
      Size = 10
    end
    object cdsClienteUFENTREGA: TStringField
      FieldName = 'UFENTREGA'
      Size = 2
    end
    object cdsClienteCGCCPFENTREGA: TStringField
      FieldName = 'CGCCPFENTREGA'
      Size = 18
    end
    object cdsClienteINSCENTREGA: TStringField
      FieldName = 'INSCENTREGA'
      Size = 18
    end
    object cdsClienteENDPGTO: TStringField
      FieldName = 'ENDPGTO'
      Size = 40
    end
    object cdsClienteBAIRROPGTO: TStringField
      FieldName = 'BAIRROPGTO'
      Size = 30
    end
    object cdsClienteCIDPGTO: TStringField
      FieldName = 'CIDPGTO'
      Size = 30
    end
    object cdsClienteCEPPGTO: TStringField
      FieldName = 'CEPPGTO'
      Size = 10
    end
    object cdsClienteUFPGTO: TStringField
      FieldName = 'UFPGTO'
      Size = 2
    end
    object cdsClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
    end
    object cdsClienteDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsClienteCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object cdsClienteOBSCTAS: TMemoField
      FieldName = 'OBSCTAS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsClienteLOJAS: TIntegerField
      FieldName = 'LOJAS'
    end
    object cdsClienteSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsClienteCAIXAPOSTAL: TStringField
      FieldName = 'CAIXAPOSTAL'
      Size = 10
    end
    object cdsClienteRG: TStringField
      FieldName = 'RG'
      Size = 10
    end
    object cdsClienteCODCIDADE: TIntegerField
      FieldName = 'CODCIDADE'
    end
    object cdsClienteCODCIDADEE: TIntegerField
      FieldName = 'CODCIDADEE'
    end
    object cdsClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsClienteMERCADO: TStringField
      FieldName = 'MERCADO'
      Size = 1
    end
    object cdsClienteNUMEND: TStringField
      FieldName = 'NUMEND'
      Size = 15
    end
    object cdsClienteNUMENDENTREGA: TStringField
      FieldName = 'NUMENDENTREGA'
      Size = 15
    end
    object cdsClienteEMAILNFE: TStringField
      FieldName = 'EMAILNFE'
      Size = 150
    end
    object cdsClienteCOMPLENDERECO: TStringField
      FieldName = 'COMPLENDERECO'
      Size = 50
    end
    object cdsClienteDTVALIDADEIPI: TDateField
      FieldName = 'DTVALIDADEIPI'
    end
    object cdsClienteCODOBSIPI: TIntegerField
      FieldName = 'CODOBSIPI'
    end
    object cdsClienteHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 200
    end
    object cdsClienteCOMPLENDERECOENTREGA: TStringField
      FieldName = 'COMPLENDERECOENTREGA'
      Size = 50
    end
    object cdsClienteCODSITTRIBSIMPLES: TIntegerField
      FieldName = 'CODSITTRIBSIMPLES'
    end
    object cdsClienteUSAICMSSIMPLES: TStringField
      FieldName = 'USAICMSSIMPLES'
      FixedChar = True
      Size = 1
    end
    object cdsClienteDDDFONE1: TIntegerField
      FieldName = 'DDDFONE1'
    end
    object cdsClienteDDDFONE2: TIntegerField
      FieldName = 'DDDFONE2'
    end
    object cdsClienteDDDFAX: TIntegerField
      FieldName = 'DDDFAX'
    end
    object cdsClienteIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
    end
    object cdsClienteEMAILNFE2: TStringField
      FieldName = 'EMAILNFE2'
      Size = 150
    end
    object cdsClienteNOMESEMACENTO: TStringField
      FieldName = 'NOMESEMACENTO'
      Size = 40
    end
  end
  object tCliente: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbCliente.DB'
    Left = 528
    Top = 332
    object tClienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tClienteNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tClienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object tClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 25
    end
    object tClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 26
    end
    object tClienteUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object tClienteCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
    object tClienteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tClienteTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 15
    end
    object tClienteFax: TStringField
      FieldName = 'Fax'
      Size = 15
    end
    object tClientePessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
    object tClienteCgcCpf: TStringField
      FieldName = 'CgcCpf'
      Size = 18
    end
    object tClienteInscrEst: TStringField
      FieldName = 'InscrEst'
      Size = 18
    end
    object tClienteContato: TStringField
      FieldName = 'Contato'
      Size = 30
    end
    object tClienteObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object tClienteAprovCredito: TStringField
      FieldName = 'AprovCredito'
      Size = 1
    end
    object tClienteTipoAprov: TStringField
      FieldName = 'TipoAprov'
      Size = 1
    end
    object tClienteEndEntrega: TStringField
      FieldName = 'EndEntrega'
      Size = 40
    end
    object tClienteBairroEntrega: TStringField
      FieldName = 'BairroEntrega'
      Size = 26
    end
    object tClienteCidEntrega: TStringField
      FieldName = 'CidEntrega'
      Size = 26
    end
    object tClienteCepEntrega: TStringField
      FieldName = 'CepEntrega'
      Size = 10
    end
    object tClienteUfEntrega: TStringField
      FieldName = 'UfEntrega'
      Size = 2
    end
    object tClienteCgcCpfEntrega: TStringField
      FieldName = 'CgcCpfEntrega'
      Size = 18
    end
    object tClienteInscEntrega: TStringField
      FieldName = 'InscEntrega'
      Size = 18
    end
    object tClienteEndPgto: TStringField
      FieldName = 'EndPgto'
      Size = 40
    end
    object tClienteBairroPgto: TStringField
      FieldName = 'BairroPgto'
      Size = 26
    end
    object tClienteCidPgto: TStringField
      FieldName = 'CidPgto'
      Size = 26
    end
    object tClienteCepPgto: TStringField
      FieldName = 'CepPgto'
      Size = 10
    end
    object tClienteUfPgto: TStringField
      FieldName = 'UfPgto'
      Size = 2
    end
    object tClienteFantasia: TStringField
      FieldName = 'Fantasia'
    end
    object tClienteDtCadastro: TDateField
      FieldName = 'DtCadastro'
    end
    object tClienteCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tClienteObsCtas: TMemoField
      FieldName = 'ObsCtas'
      BlobType = ftMemo
      Size = 1
    end
    object tClienteLojas: TIntegerField
      FieldName = 'Lojas'
    end
    object tClienteSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tClienteCaixaPostal: TStringField
      FieldName = 'CaixaPostal'
      Size = 10
    end
    object tClienteRg: TStringField
      FieldName = 'Rg'
      Size = 10
    end
    object tClienteCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object tClienteCodCidadeE: TIntegerField
      FieldName = 'CodCidadeE'
    end
    object tClienteCodCidadeP: TIntegerField
      FieldName = 'CodCidadeP'
    end
    object tClienteEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object tClienteMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
    object tClienteNumEnd: TStringField
      FieldName = 'NumEnd'
      Size = 15
    end
    object tClienteNumEndEntrega: TStringField
      FieldName = 'NumEndEntrega'
      Size = 15
    end
    object tClienteEmailNfe: TStringField
      FieldName = 'EmailNfe'
      Size = 50
    end
    object tClienteComplEndereco: TStringField
      FieldName = 'ComplEndereco'
      Size = 50
    end
    object tClienteDtValidadeIPI: TDateField
      FieldName = 'DtValidadeIPI'
    end
    object tClienteCodObsIPI: TIntegerField
      FieldName = 'CodObsIPI'
    end
    object tClienteHomePage: TStringField
      FieldName = 'HomePage'
      Size = 200
    end
    object tClienteComplEnderecoEntrega: TStringField
      FieldName = 'ComplEnderecoEntrega'
      Size = 50
    end
    object tClienteCodSitTribSimples: TIntegerField
      FieldName = 'CodSitTribSimples'
    end
    object tClienteUsaIcmsSimples: TBooleanField
      FieldName = 'UsaIcmsSimples'
    end
    object tClienteDDDFone1: TIntegerField
      FieldName = 'DDDFone1'
    end
    object tClienteDDDFone2: TIntegerField
      FieldName = 'DDDFone2'
    end
    object tClienteDDDFax: TIntegerField
      FieldName = 'DDDFax'
    end
    object tClienteIDPais: TIntegerField
      FieldName = 'IDPais'
    end
    object tClienteEmailNFe2: TStringField
      FieldName = 'EmailNFe2'
      Size = 150
    end
    object tClienteNomeSemAcento: TStringField
      FieldName = 'NomeSemAcento'
      Size = 40
    end
  end
  object qCriaCampos: TQuery
    DatabaseName = 'Tabelas'
    Left = 200
    Top = 376
  end
end
