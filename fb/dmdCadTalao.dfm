object dmCadTalao: TdmCadTalao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsTalao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
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
    Left = 136
    Top = 24
  end
  object cdsTalao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalao'
    Left = 224
    Top = 24
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
  object dsTalao: TDataSource
    DataSet = cdsTalao
    Left = 304
    Top = 24
  end
end
