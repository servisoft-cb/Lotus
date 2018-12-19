object fGeraFBMI_Exc: TfGeraFBMI_Exc
  Left = 230
  Top = 102
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fGeraFBMI_Exc'
  ClientHeight = 552
  ClientWidth = 987
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
  object Label1: TLabel
    Left = 56
    Top = 16
    Width = 81
    Height = 13
    Caption = 'Data Refer'#234'ncia:'
  end
  object DateEdit1: TDateEdit
    Left = 138
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DateEdit2: TDateEdit
    Left = 330
    Top = 8
    Width = 120
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
    Text = '31/12/2012'
    Visible = False
  end
  object BitBtn5: TBitBtn
    Left = 152
    Top = 56
    Width = 150
    Height = 25
    Caption = 'Gravar mLoteAux'
    TabOrder = 2
    OnClick = BitBtn5Click
  end
  object SMDBGrid1: TSMDBGrid
    Left = 376
    Top = 104
    Width = 377
    Height = 305
    DataSource = dsmLoteAux
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 2
    RowCount = 2
  end
  object BitBtn6: TBitBtn
    Left = 776
    Top = 128
    Width = 97
    Height = 25
    Caption = 'Total'
    TabOrder = 4
    OnClick = BitBtn6Click
  end
  object ProgressBar1: TProgressBar
    Left = 376
    Top = 80
    Width = 377
    Height = 17
    TabOrder = 5
  end
  object BitBtn7: TBitBtn
    Left = 152
    Top = 88
    Width = 150
    Height = 25
    Caption = 'Excluir Lotes M.Interno'
    TabOrder = 6
    OnClick = BitBtn7Click
  end
  object sdsTalaoGrade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'   FROM TALAOGRADEMI'#13#10'WHERE LOTE = :LOTE'#13#10'     AND ITE' +
      'M = :ITEM'#13#10'    AND TALAO = :TALAO   '#13#10'    AND CODGRADE = :CODGRA' +
      'DE'#13#10'    AND POSICAO = :POSICAO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TALAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODGRADE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POSICAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 125
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
    Left = 304
    Top = 125
  end
  object cdsTalaoGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoGrade'
    Left = 336
    Top = 125
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
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Item;Talao'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'DBTALAOGRADEMI.DB'
    Left = 384
    Top = 133
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
    CommandText = 
      'SELECT *'#13#10'   FROM TALAOMOVMI'#13#10'WHERE LOTE = :LOTE'#13#10'     AND TALAO' +
      ' = :TALAO'#13#10'     AND SETOR = :SETOR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TALAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SETOR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 156
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
    Left = 304
    Top = 156
  end
  object cdsTalaoMov: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoMov'
    Left = 336
    Top = 156
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
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Talao;Setor'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'DBTALAOMOVMI.DB'
    Left = 384
    Top = 164
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
    CommandText = 
      'SELECT *'#13#10'   FROM TALAOMI'#13#10'WHERE LOTE = :LOTE'#13#10'      AND ITEM = ' +
      ':ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 190
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
    object sdsTalaoCODFORMA: TIntegerField
      FieldName = 'CODFORMA'
    end
    object sdsTalaoITEMPEDIDO: TIntegerField
      FieldName = 'ITEMPEDIDO'
    end
    object sdsTalaoNUMPEDIDO: TIntegerField
      FieldName = 'NUMPEDIDO'
    end
    object sdsTalaoCODFABRICA: TIntegerField
      FieldName = 'CODFABRICA'
    end
  end
  object dspTalao: TDataSetProvider
    DataSet = sdsTalao
    Left = 304
    Top = 190
  end
  object cdsTalao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalao'
    Left = 336
    Top = 190
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
    object cdsTalaoCODFORMA: TIntegerField
      FieldName = 'CODFORMA'
    end
    object cdsTalaoITEMPEDIDO: TIntegerField
      FieldName = 'ITEMPEDIDO'
    end
    object cdsTalaoNUMPEDIDO: TIntegerField
      FieldName = 'NUMPEDIDO'
    end
    object cdsTalaoCODFABRICA: TIntegerField
      FieldName = 'CODFABRICA'
    end
  end
  object tTalao: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Item'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'dbTalaoMI.DB'
    Left = 384
    Top = 198
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
    object tTalaoCodForma: TIntegerField
      FieldName = 'CodForma'
    end
    object tTalaoItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object tTalaoNumPedido: TIntegerField
      FieldName = 'NumPedido'
    end
    object tTalaoCodFabrica: TIntegerField
      FieldName = 'CodFabrica'
    end
  end
  object sdsLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM LOTEMI'#13#10'WHERE LOTE = :LOTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 328
    Top = 55
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
    object sdsLoteNUMMAPACOMPRAS: TIntegerField
      FieldName = 'NUMMAPACOMPRAS'
    end
    object sdsLoteDTEMBARQUE: TDateField
      FieldName = 'DTEMBARQUE'
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
    Left = 392
    Top = 47
  end
  object cdsLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLote'
    Left = 440
    Top = 47
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
    object cdsLoteNUMMAPACOMPRAS: TIntegerField
      FieldName = 'NUMMAPACOMPRAS'
    end
    object cdsLoteDTEMBARQUE: TDateField
      FieldName = 'DTEMBARQUE'
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
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbLoteMI.DB'
    Left = 512
    Top = 55
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
    object tLoteImpresso: TBooleanField
      FieldName = 'Impresso'
    end
    object tLoteOCGerado: TBooleanField
      FieldName = 'OCGerado'
    end
    object tLoteNumMapaCompras: TIntegerField
      FieldName = 'NumMapaCompras'
    end
    object tLoteDtEmbarque: TDateField
      FieldName = 'DtEmbarque'
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
  object mLoteAux: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 8
    Data = {
      2A0000009619E0BD0100000018000000010000000000030000002A00074E756D
      4C6F746504000100000000000000}
    object mLoteAuxNumLote: TIntegerField
      FieldName = 'NumLote'
    end
  end
  object dsmLoteAux: TDataSource
    DataSet = mLoteAux
    Left = 520
    Top = 8
  end
  object dsLote: TDataSource
    DataSet = tLote
    Left = 552
    Top = 56
  end
  object dsTalaoGrade: TDataSource
    DataSet = tTalaoGrade
    Left = 416
    Top = 136
  end
  object dsTalaoMov: TDataSource
    DataSet = tTalaoMov
    Left = 416
    Top = 168
  end
  object dsTalao: TDataSource
    DataSet = tTalao
    Left = 416
    Top = 200
  end
  object tTalaoMov2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'DBTALAOMOVMI.DB'
    Left = 480
    Top = 188
    object tTalaoMov2Lote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMov2Talao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMov2Setor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMov2DataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMov2HoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMov2DataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMov2HoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMov2CodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
  end
end
