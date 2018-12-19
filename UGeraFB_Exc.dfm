object fGeraFB_Exc: TfGeraFB_Exc
  Left = 225
  Top = 55
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fGeraFB_Exc'
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
    Width = 337
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
    Left = 728
    Top = 136
    Width = 75
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
    Caption = 'Excluir Lotes Exporta'#231#227'o'
    TabOrder = 6
    OnClick = BitBtn7Click
  end
  object sdsTalaoGrade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'   FROM TALAOGRADE'#13#10'WHERE LOTE = :LOTE'#13#10'     AND ITEM ' +
      '= :ITEM'#13#10'    AND TALAO = :TALAO   '
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
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Item;Talao'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'dbTalaoGrade.DB'
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
      'SELECT *'#13#10'   FROM TALAOMOV'#13#10'WHERE LOTE = :LOTE'#13#10'     AND TALAO =' +
      ' :TALAO'#13#10'     AND SETOR = :SETOR'
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
    TableName = 'DBTALAOMOV.DB'
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
      'SELECT *'#13#10'   FROM TALAO'#13#10'WHERE LOTE = :LOTE'#13#10'      AND ITEM = :I' +
      'TEM'
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
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Item'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'dbTalao.DB'
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
    CommandText = 'SELECT *'#13#10'   FROM LOTE'#13#10'WHERE LOTE = :LOTE'
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
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbLote.DB'
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
  object mLoteAux: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 16
    Data = {
      2A0000009619E0BD0100000018000000010000000000030000002A00074E756D
      4C6F746504000100000000000000}
    object mLoteAuxNumLote: TIntegerField
      FieldName = 'NumLote'
    end
  end
  object dsmLoteAux: TDataSource
    DataSet = mLoteAux
    Left = 488
    Top = 16
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
  object sdsTalaoAuxiliar: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM TALAOAUXILIAR'#13#10'WHERE LOTE = :LOTE'#13#10'      AND CODS' +
      'ETOR = :CODSETOR'#13#10'      AND ITEMTALAO = :ITEMTALAO'#13#10'      AND TA' +
      'LAO = :TALAO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODSETOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEMTALAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TALAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 264
    Top = 230
    object sdsTalaoAuxiliarLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object sdsTalaoAuxiliarCODSETOR: TIntegerField
      FieldName = 'CODSETOR'
      Required = True
    end
    object sdsTalaoAuxiliarITEMTALAO: TIntegerField
      FieldName = 'ITEMTALAO'
      Required = True
    end
    object sdsTalaoAuxiliarTALAO: TIntegerField
      FieldName = 'TALAO'
      Required = True
    end
    object sdsTalaoAuxiliarCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sdsTalaoAuxiliarCODCOR: TIntegerField
      FieldName = 'CODCOR'
    end
    object sdsTalaoAuxiliarQTDPARES: TIntegerField
      FieldName = 'QTDPARES'
    end
    object sdsTalaoAuxiliarCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object sdsTalaoAuxiliarPOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object sdsTalaoAuxiliarTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsTalaoAuxiliarCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sdsTalaoAuxiliarPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object sdsTalaoAuxiliarITEMPEDIDO: TIntegerField
      FieldName = 'ITEMPEDIDO'
    end
    object sdsTalaoAuxiliarCODATELIER: TIntegerField
      FieldName = 'CODATELIER'
    end
    object sdsTalaoAuxiliarDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsTalaoAuxiliarHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsTalaoAuxiliarDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object sdsTalaoAuxiliarHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object sdsTalaoAuxiliarOPCAOLOTETALAO: TStringField
      FieldName = 'OPCAOLOTETALAO'
      FixedChar = True
      Size = 1
    end
  end
  object dspTalaoAuxiliar: TDataSetProvider
    DataSet = sdsTalaoAuxiliar
    Left = 304
    Top = 230
  end
  object cdsTalaoAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoAuxiliar'
    Left = 336
    Top = 230
    object cdsTalaoAuxiliarLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object cdsTalaoAuxiliarCODSETOR: TIntegerField
      FieldName = 'CODSETOR'
      Required = True
    end
    object cdsTalaoAuxiliarITEMTALAO: TIntegerField
      FieldName = 'ITEMTALAO'
      Required = True
    end
    object cdsTalaoAuxiliarTALAO: TIntegerField
      FieldName = 'TALAO'
      Required = True
    end
    object cdsTalaoAuxiliarCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsTalaoAuxiliarCODCOR: TIntegerField
      FieldName = 'CODCOR'
    end
    object cdsTalaoAuxiliarQTDPARES: TIntegerField
      FieldName = 'QTDPARES'
    end
    object cdsTalaoAuxiliarCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object cdsTalaoAuxiliarPOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object cdsTalaoAuxiliarTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsTalaoAuxiliarCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsTalaoAuxiliarPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object cdsTalaoAuxiliarITEMPEDIDO: TIntegerField
      FieldName = 'ITEMPEDIDO'
    end
    object cdsTalaoAuxiliarCODATELIER: TIntegerField
      FieldName = 'CODATELIER'
    end
    object cdsTalaoAuxiliarDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalaoAuxiliarHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsTalaoAuxiliarDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsTalaoAuxiliarHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object cdsTalaoAuxiliarOPCAOLOTETALAO: TStringField
      FieldName = 'OPCAOLOTETALAO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsTalaoAuxiliarGrade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM TALAOAUXILIARGRADE'#13#10'WHERE LOTE = :LOTE'#13#10'      AND' +
      ' CODSETOR = :CODSETOR'#13#10'      AND CODGRADE = :CODGRADE'#13#10'      AND' +
      ' POSICAO = :POSICAO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODSETOR'
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
    Top = 270
    object sdsTalaoAuxiliarGradeLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object sdsTalaoAuxiliarGradeCODSETOR: TIntegerField
      FieldName = 'CODSETOR'
      Required = True
    end
    object sdsTalaoAuxiliarGradeCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
      Required = True
    end
    object sdsTalaoAuxiliarGradePOSICAO: TIntegerField
      FieldName = 'POSICAO'
      Required = True
    end
    object sdsTalaoAuxiliarGradeQTD: TIntegerField
      FieldName = 'QTD'
    end
    object sdsTalaoAuxiliarGradeTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dspTalaoAuxiliarGrade: TDataSetProvider
    DataSet = sdsTalaoAuxiliarGrade
    Left = 304
    Top = 270
  end
  object cdsTalaoAuxiliarGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoAuxiliarGrade'
    Left = 336
    Top = 270
    object cdsTalaoAuxiliarGradeLOTE: TIntegerField
      FieldName = 'LOTE'
      Required = True
    end
    object cdsTalaoAuxiliarGradeCODSETOR: TIntegerField
      FieldName = 'CODSETOR'
      Required = True
    end
    object cdsTalaoAuxiliarGradeCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
      Required = True
    end
    object cdsTalaoAuxiliarGradePOSICAO: TIntegerField
      FieldName = 'POSICAO'
      Required = True
    end
    object cdsTalaoAuxiliarGradeQTD: TIntegerField
      FieldName = 'QTD'
    end
    object cdsTalaoAuxiliarGradeTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object tTalaoAuxiliar: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;CodSetor;ItemTalao;Talao'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'dbTalaoAuxiliar.db'
    Left = 384
    Top = 246
    object tTalaoAuxiliarLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoAuxiliarCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tTalaoAuxiliarItemTalao: TIntegerField
      FieldName = 'ItemTalao'
    end
    object tTalaoAuxiliarTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoAuxiliarCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tTalaoAuxiliarCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tTalaoAuxiliarQtdPares: TIntegerField
      FieldName = 'QtdPares'
    end
    object tTalaoAuxiliarCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoAuxiliarPosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoAuxiliarTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object tTalaoAuxiliarCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object tTalaoAuxiliarPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tTalaoAuxiliarItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object tTalaoAuxiliarCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tTalaoAuxiliarDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object tTalaoAuxiliarHrEntrada: TTimeField
      FieldName = 'HrEntrada'
    end
    object tTalaoAuxiliarDtSaida: TDateField
      FieldName = 'DtSaida'
    end
    object tTalaoAuxiliarHrSaida: TTimeField
      FieldName = 'HrSaida'
    end
    object tTalaoAuxiliarOpcaoLoteTalao: TStringField
      FieldName = 'OpcaoLoteTalao'
      Size = 1
    end
  end
  object dsTalaoAuxiliar: TDataSource
    DataSet = tTalaoAuxiliar
    Left = 416
    Top = 248
  end
  object tTalaoAuxiliarGrade: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;CodSetor;CodGrade;Posicao'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'dbTalaoAuxiliarGrade.db'
    Left = 384
    Top = 286
    object tTalaoAuxiliarGradeLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoAuxiliarGradeCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tTalaoAuxiliarGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoAuxiliarGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoAuxiliarGradeQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tTalaoAuxiliarGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
  end
  object dsTalaoAuxiliarGrade: TDataSource
    DataSet = tTalaoAuxiliarGrade
    Left = 416
    Top = 288
  end
  object tTalaoMov2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'DBTALAOMOV.DB'
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
