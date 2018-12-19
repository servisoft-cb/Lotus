object DMConstrucao: TDMConstrucao
  OldCreateOrder = False
  Left = 340
  Top = 210
  Height = 326
  Width = 437
  object qConstrucao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT *'
      'FROM DBConstrucao.db'
      'WHERE CODIGO = :Codigo')
    Left = 120
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
      end>
    object qConstrucaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qConstrucaoNome: TStringField
      FieldName = 'Nome'
    end
    object qConstrucaoQtdPrevista: TIntegerField
      FieldName = 'QtdPrevista'
    end
  end
  object qConstrucao_Mat: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodConstrucao, CodConstrucaoGrupo, Item, CodMaterial, Cod' +
        'Grade, CodCor, Qtd, VlrUnitario, VlrTotal, CodPosicao, ImpTalao,' +
        ' Unidade'
      'FROM "dbConstrucaoMat.DB" Dbconstrucaomat'
      'WHERE   (CodConstrucao = :CodConstrucao)  '
      '   AND  (CodConstrucaoGrupo = 0)  ')
    Left = 120
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodConstrucao'
        ParamType = ptUnknown
      end>
    object qConstrucao_MatCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
      Origin = 'TABELAS."dbConstrucaoMat.DB".CodConstrucao'
    end
    object qConstrucao_MatCodConstrucaoGrupo: TIntegerField
      FieldName = 'CodConstrucaoGrupo'
      Origin = 'TABELAS."dbConstrucaoMat.DB".CodConstrucaoGrupo'
    end
    object qConstrucao_MatItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbConstrucaoMat.DB".Item'
    end
    object qConstrucao_MatCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbConstrucaoMat.DB".CodMaterial'
    end
    object qConstrucao_MatCodGrade: TIntegerField
      FieldName = 'CodGrade'
      Origin = 'TABELAS."dbConstrucaoMat.DB".CodGrade'
    end
    object qConstrucao_MatCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbConstrucaoMat.DB".CodCor'
    end
    object qConstrucao_MatQtd: TFloatField
      FieldName = 'Qtd'
      Origin = 'TABELAS."dbConstrucaoMat.DB".Qtd'
    end
    object qConstrucao_MatVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      Origin = 'TABELAS."dbConstrucaoMat.DB".VlrUnitario'
    end
    object qConstrucao_MatVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbConstrucaoMat.DB".VlrTotal'
    end
    object qConstrucao_MatCodPosicao: TIntegerField
      FieldName = 'CodPosicao'
      Origin = 'TABELAS."dbConstrucaoMat.DB".CodPosicao'
    end
    object qConstrucao_MatImpTalao: TStringField
      FieldName = 'ImpTalao'
      Origin = 'TABELAS."dbConstrucaoMat.DB".ImpTalao'
      Size = 1
    end
    object qConstrucao_MatUnidade: TStringField
      FieldName = 'Unidade'
      Origin = 'TABELAS."dbConstrucaoMat.DB".Unidade'
      Size = 3
    end
  end
end
