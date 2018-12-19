object dmTalaoAuxiliar: TdmTalaoAuxiliar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 528
  Top = 220
  Height = 376
  Width = 638
  object sdsTalaoAuxiliar: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAOAUXILIAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 24
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
    Left = 216
    Top = 24
  end
  object cdsTalaoAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoAuxiliar'
    Left = 304
    Top = 24
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
    object cdsTalaoAuxiliarsdsTalaoAuxiliarGrade: TDataSetField
      FieldName = 'sdsTalaoAuxiliarGrade'
    end
  end
  object dsTalaoAuxiliar: TDataSource
    DataSet = cdsTalaoAuxiliar
    Left = 384
    Top = 24
  end
  object dsTalaoAuxiliar_Mestre: TDataSource
    DataSet = sdsTalaoAuxiliar
    Left = 64
    Top = 64
  end
  object sdsTalaoAuxiliarGrade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM TALAOAUXILIARGRADE'#13#10'WHERE LOTE = :LOTE'#13#10'  AND COD' +
      'SETOR = :CODSETOR'#13#10'  '
    DataSource = dsTalaoAuxiliar_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'LOTE'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CODSETOR'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 152
    Top = 144
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
  object cdsTalaoAuxiliarGrade: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTalaoAuxiliarsdsTalaoAuxiliarGrade
    Params = <>
    Left = 256
    Top = 144
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
  object dsTalaoAuxiliarGrade: TDataSource
    DataSet = cdsTalaoAuxiliarGrade
    Left = 360
    Top = 144
  end
end
