object dmCadTalaoGrade: TdmCadTalaoGrade
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsTalaoGrade: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM TALAOGRADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
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
    Left = 136
    Top = 24
  end
  object cdsTalaoGrade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoGrade'
    Left = 224
    Top = 24
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
  object dsTalaoGrade: TDataSource
    DataSet = cdsTalaoGrade
    Left = 304
    Top = 24
  end
end
