object DMFichaConstrucao: TDMFichaConstrucao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 198
  Top = 48
  Height = 643
  Width = 585
  object sdsFichaConstrucao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FICHACONSTRUCAO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 152
    Top = 24
    object sdsFichaConstrucaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFichaConstrucaoNOMECONSTRUCAO: TStringField
      FieldName = 'NOMECONSTRUCAO'
      Size = 40
    end
    object sdsFichaConstrucaoNOMEFORMA: TStringField
      FieldName = 'NOMEFORMA'
      Size = 40
    end
    object sdsFichaConstrucaoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsFichaConstrucaoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsFichaConstrucaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsFichaConstrucaoHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsFichaConstrucaoDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsFichaConstrucaoENDFOTO: TStringField
      FieldName = 'ENDFOTO'
      Size = 150
    end
    object sdsFichaConstrucaoTIPO_MONTAGEM: TStringField
      FieldName = 'TIPO_MONTAGEM'
      Size = 1
    end
    object sdsFichaConstrucaoDESCNAVALHA: TStringField
      FieldName = 'DESCNAVALHA'
      Size = 30
    end
    object sdsFichaConstrucaoDESCGUIA: TStringField
      FieldName = 'DESCGUIA'
      Size = 30
    end
    object sdsFichaConstrucaoTIPO_NAVALHA: TStringField
      FieldName = 'TIPO_NAVALHA'
      Size = 1
    end
    object sdsFichaConstrucaoTIPO_NAVGUIASALTO: TStringField
      FieldName = 'TIPO_NAVGUIASALTO'
      Size = 2
    end
    object sdsFichaConstrucaoSALTO: TStringField
      FieldName = 'SALTO'
      Size = 30
    end
    object sdsFichaConstrucaoFACHETADO: TStringField
      FieldName = 'FACHETADO'
      Size = 30
    end
  end
  object dspFichaConstrucao: TDataSetProvider
    DataSet = sdsFichaConstrucao
    Left = 240
    Top = 24
  end
  object cdsFichaConstrucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichaConstrucao'
    OnNewRecord = cdsFichaConstrucaoNewRecord
    Left = 312
    Top = 24
    object cdsFichaConstrucaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFichaConstrucaoNOMECONSTRUCAO: TStringField
      FieldName = 'NOMECONSTRUCAO'
      Size = 40
    end
    object cdsFichaConstrucaoNOMEFORMA: TStringField
      FieldName = 'NOMEFORMA'
      Size = 40
    end
    object cdsFichaConstrucaoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFichaConstrucaoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsFichaConstrucaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsFichaConstrucaoDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsFichaConstrucaoHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsFichaConstrucaoENDFOTO: TStringField
      FieldName = 'ENDFOTO'
      Size = 150
    end
    object cdsFichaConstrucaoTIPO_MONTAGEM: TStringField
      FieldName = 'TIPO_MONTAGEM'
      Size = 1
    end
    object cdsFichaConstrucaoDESCNAVALHA: TStringField
      FieldName = 'DESCNAVALHA'
      Size = 30
    end
    object cdsFichaConstrucaoDESCGUIA: TStringField
      FieldName = 'DESCGUIA'
      Size = 30
    end
    object cdsFichaConstrucaoTIPO_NAVALHA: TStringField
      FieldName = 'TIPO_NAVALHA'
      Size = 1
    end
    object cdsFichaConstrucaoTIPO_NAVGUIASALTO: TStringField
      FieldName = 'TIPO_NAVGUIASALTO'
      Size = 2
    end
    object cdsFichaConstrucaosdsFichaConstrucao_Pos: TDataSetField
      FieldName = 'sdsFichaConstrucao_Pos'
    end
    object cdsFichaConstrucaosdsFichaConstrucao_Tam: TDataSetField
      FieldName = 'sdsFichaConstrucao_Tam'
    end
    object cdsFichaConstrucaoSALTO: TStringField
      FieldName = 'SALTO'
      Size = 30
    end
    object cdsFichaConstrucaoFACHETADO: TStringField
      FieldName = 'FACHETADO'
      Size = 30
    end
  end
  object dsFichaConstrucao: TDataSource
    DataSet = cdsFichaConstrucao
    Left = 408
    Top = 24
  end
  object dsFichaConstrucaoMestre: TDataSource
    DataSet = sdsFichaConstrucao
    Left = 72
    Top = 88
  end
  object sdsFichaConstrucao_Pos: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FICHACONSTRUCAO_POS'#13#10'WHERE ID = :ID'
    DataSource = dsFichaConstrucaoMestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 256
    object sdsFichaConstrucao_PosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFichaConstrucao_PosITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsFichaConstrucao_PosNOMEPOSICAO: TStringField
      FieldName = 'NOMEPOSICAO'
    end
    object sdsFichaConstrucao_PosSOMENTEMATERIAL: TStringField
      FieldName = 'SOMENTEMATERIAL'
      FixedChar = True
      Size = 1
    end
    object sdsFichaConstrucao_PosINFORMARGRADE: TStringField
      FieldName = 'INFORMARGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsFichaConstrucao_PosINFORMAROPCAOMAT: TStringField
      FieldName = 'INFORMAROPCAOMAT'
      FixedChar = True
      Size = 1
    end
  end
  object cdsFichaConstrucao_Pos: TClientDataSet
    Aggregates = <>
    DataSetField = cdsFichaConstrucaosdsFichaConstrucao_Pos
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 280
    Top = 256
    object cdsFichaConstrucao_PosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFichaConstrucao_PosITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsFichaConstrucao_PosNOMEPOSICAO: TStringField
      FieldName = 'NOMEPOSICAO'
    end
    object cdsFichaConstrucao_PosSOMENTEMATERIAL: TStringField
      FieldName = 'SOMENTEMATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsFichaConstrucao_PosINFORMARGRADE: TStringField
      FieldName = 'INFORMARGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsFichaConstrucao_PosINFORMAROPCAOMAT: TStringField
      FieldName = 'INFORMAROPCAOMAT'
      FixedChar = True
      Size = 1
    end
    object cdsFichaConstrucao_PossdsFichaConstrucao_Mat: TDataSetField
      FieldName = 'sdsFichaConstrucao_Mat'
    end
  end
  object dsFichaConstrucao_Pos: TDataSource
    DataSet = cdsFichaConstrucao_Pos
    Left = 416
    Top = 256
  end
  object dsFichaConstrucao_PosMestre: TDataSource
    DataSet = sdsFichaConstrucao_Pos
    Left = 56
    Top = 320
  end
  object sdsFichaConstrucao_Mat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM FICHACONSTRUCAO_MAT'#13#10'WHERE ID = :ID'#13#10'  AND ITEMPO' +
      'SICAO = :ITEM'
    DataSource = dsFichaConstrucao_PosMestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 384
    object sdsFichaConstrucao_MatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFichaConstrucao_MatITEMPOSICAO: TIntegerField
      FieldName = 'ITEMPOSICAO'
      Required = True
    end
    object sdsFichaConstrucao_MatITEMMATERIAL: TIntegerField
      FieldName = 'ITEMMATERIAL'
      Required = True
    end
    object sdsFichaConstrucao_MatTIPOMATERIAL: TStringField
      FieldName = 'TIPOMATERIAL'
    end
    object sdsFichaConstrucao_MatREFMATERIAL: TStringField
      FieldName = 'REFMATERIAL'
      Size = 10
    end
    object sdsFichaConstrucao_MatNOMEMATERIAL: TStringField
      FieldName = 'NOMEMATERIAL'
      Size = 40
    end
    object sdsFichaConstrucao_MatNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object sdsFichaConstrucao_MatNOMECOR: TStringField
      FieldName = 'NOMECOR'
    end
    object sdsFichaConstrucao_MatMEDIDAS: TStringField
      FieldName = 'MEDIDAS'
      Size = 15
    end
    object sdsFichaConstrucao_MatOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object sdsFichaConstrucao_MatREFORCO: TStringField
      FieldName = 'REFORCO'
      Size = 30
    end
    object sdsFichaConstrucao_MatPLANTA: TStringField
      FieldName = 'PLANTA'
      Size = 30
    end
    object sdsFichaConstrucao_MatCAIMENTO: TStringField
      FieldName = 'CAIMENTO'
      Size = 30
    end
    object sdsFichaConstrucao_MatALMA: TStringField
      FieldName = 'ALMA'
      Size = 30
    end
    object sdsFichaConstrucao_MatREBITE: TStringField
      FieldName = 'REBITE'
      Size = 10
    end
    object sdsFichaConstrucao_MatCAPA: TStringField
      FieldName = 'CAPA'
      Size = 10
    end
    object sdsFichaConstrucao_MatESQUELETO: TStringField
      FieldName = 'ESQUELETO'
      Size = 10
    end
    object sdsFichaConstrucao_MatPONTE: TStringField
      FieldName = 'PONTE'
      Size = 10
    end
    object sdsFichaConstrucao_MatLIXA: TStringField
      FieldName = 'LIXA'
      Size = 10
    end
  end
  object cdsFichaConstrucao_Mat: TClientDataSet
    Aggregates = <>
    DataSetField = cdsFichaConstrucao_PossdsFichaConstrucao_Mat
    Params = <>
    Left = 280
    Top = 384
    object cdsFichaConstrucao_MatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFichaConstrucao_MatITEMPOSICAO: TIntegerField
      FieldName = 'ITEMPOSICAO'
      Required = True
    end
    object cdsFichaConstrucao_MatITEMMATERIAL: TIntegerField
      FieldName = 'ITEMMATERIAL'
      Required = True
    end
    object cdsFichaConstrucao_MatTIPOMATERIAL: TStringField
      FieldName = 'TIPOMATERIAL'
    end
    object cdsFichaConstrucao_MatREFMATERIAL: TStringField
      FieldName = 'REFMATERIAL'
      Size = 10
    end
    object cdsFichaConstrucao_MatNOMEMATERIAL: TStringField
      FieldName = 'NOMEMATERIAL'
      Size = 40
    end
    object cdsFichaConstrucao_MatNOMEFORNECEDOR: TStringField
      FieldName = 'NOMEFORNECEDOR'
      Size = 40
    end
    object cdsFichaConstrucao_MatNOMECOR: TStringField
      FieldName = 'NOMECOR'
    end
    object cdsFichaConstrucao_MatMEDIDAS: TStringField
      FieldName = 'MEDIDAS'
      Size = 15
    end
    object cdsFichaConstrucao_MatOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object cdsFichaConstrucao_MatREFORCO: TStringField
      FieldName = 'REFORCO'
      Size = 30
    end
    object cdsFichaConstrucao_MatPLANTA: TStringField
      FieldName = 'PLANTA'
      Size = 30
    end
    object cdsFichaConstrucao_MatCAIMENTO: TStringField
      FieldName = 'CAIMENTO'
      Size = 30
    end
    object cdsFichaConstrucao_MatALMA: TStringField
      FieldName = 'ALMA'
      Size = 30
    end
    object cdsFichaConstrucao_MatREBITE: TStringField
      FieldName = 'REBITE'
      Size = 10
    end
    object cdsFichaConstrucao_MatCAPA: TStringField
      FieldName = 'CAPA'
      Size = 10
    end
    object cdsFichaConstrucao_MatESQUELETO: TStringField
      FieldName = 'ESQUELETO'
      Size = 10
    end
    object cdsFichaConstrucao_MatPONTE: TStringField
      FieldName = 'PONTE'
      Size = 10
    end
    object cdsFichaConstrucao_MatLIXA: TStringField
      FieldName = 'LIXA'
      Size = 10
    end
    object cdsFichaConstrucao_MatsdsFichaConstrucao_MatTam: TDataSetField
      FieldName = 'sdsFichaConstrucao_MatTam'
    end
  end
  object dsFichaConstrucao_Mat: TDataSource
    DataSet = cdsFichaConstrucao_Mat
    Left = 400
    Top = 384
  end
  object dsFichaConstrucao_MatMestre: TDataSource
    DataSet = sdsFichaConstrucao_Mat
    Left = 64
    Top = 448
  end
  object sdsFichaConstrucao_MatTam: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM FICHACONSTRUCAO_MATTAM'#13#10'WHERE ID = :ID'#13#10'  AND ITE' +
      'MPOSICAO = :ITEMPOSICAO'#13#10'  AND ITEMMATERIAL = :ITEMMATERIAL'
    DataSource = dsFichaConstrucao_MatMestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'ITEMPOSICAO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'ITEMMATERIAL'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 520
    object sdsFichaConstrucao_MatTamID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFichaConstrucao_MatTamITEMPOSICAO: TIntegerField
      FieldName = 'ITEMPOSICAO'
      Required = True
    end
    object sdsFichaConstrucao_MatTamITEMMATERIAL: TIntegerField
      FieldName = 'ITEMMATERIAL'
      Required = True
    end
    object sdsFichaConstrucao_MatTamITEMTAM: TIntegerField
      FieldName = 'ITEMTAM'
      Required = True
    end
    object sdsFichaConstrucao_MatTamTAMREF: TStringField
      FieldName = 'TAMREF'
      Size = 6
    end
    object sdsFichaConstrucao_MatTamTAMMAT: TStringField
      FieldName = 'TAMMAT'
      Size = 6
    end
  end
  object cdsFichaConstrucao_MatTam: TClientDataSet
    Aggregates = <>
    DataSetField = cdsFichaConstrucao_MatsdsFichaConstrucao_MatTam
    IndexFieldNames = 'ID;ITEMPOSICAO;ITEMMATERIAL;ITEMTAM'
    Params = <>
    Left = 280
    Top = 520
    object cdsFichaConstrucao_MatTamID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFichaConstrucao_MatTamITEMPOSICAO: TIntegerField
      FieldName = 'ITEMPOSICAO'
      Required = True
    end
    object cdsFichaConstrucao_MatTamITEMMATERIAL: TIntegerField
      FieldName = 'ITEMMATERIAL'
      Required = True
    end
    object cdsFichaConstrucao_MatTamITEMTAM: TIntegerField
      FieldName = 'ITEMTAM'
      Required = True
    end
    object cdsFichaConstrucao_MatTamTAMREF: TStringField
      FieldName = 'TAMREF'
      Size = 6
    end
    object cdsFichaConstrucao_MatTamTAMMAT: TStringField
      FieldName = 'TAMMAT'
      Size = 6
    end
  end
  object dsFichaConstrucao_MatTam: TDataSource
    DataSet = cdsFichaConstrucao_MatTam
    Left = 400
    Top = 520
  end
  object sdsFichaConstrucao_Tam: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FICHACONSTRUCAO_TAM'#13#10'WHERE ID = :ID'
    DataSource = dsFichaConstrucaoMestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 160
    object sdsFichaConstrucao_TamID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFichaConstrucao_TamITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsFichaConstrucao_TamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 6
    end
  end
  object cdsFichaConstrucao_Tam: TClientDataSet
    Aggregates = <>
    DataSetField = cdsFichaConstrucaosdsFichaConstrucao_Tam
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    Left = 264
    Top = 160
    object cdsFichaConstrucao_TamID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFichaConstrucao_TamITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsFichaConstrucao_TamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 6
    end
  end
  object dsFichaConstrucao_Tam: TDataSource
    DataSet = cdsFichaConstrucao_Tam
    Left = 392
    Top = 160
  end
end
