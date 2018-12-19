object dmCadLote: TdmCadLote
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM LOTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
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
    Left = 136
    Top = 24
  end
  object cdsLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLote'
    Left = 224
    Top = 24
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
  object dsLote: TDataSource
    DataSet = cdsLote
    Left = 304
    Top = 24
  end
end
