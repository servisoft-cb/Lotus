object fPrevNotaEntrada: TfPrevNotaEntrada
  Left = 207
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nota Entrada'
  ClientHeight = 88
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 88
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label3: TLabel
      Left = 181
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 40
      Width = 346
      Height = 2
      Style = bsRaised
    end
    object DateEdit1: TDateEdit
      Left = 69
      Top = 8
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 236
      Top = 8
      Width = 89
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 38
      Top = 49
      Width = 279
      Height = 36
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 94
        Top = 5
        Width = 90
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000C40E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080808080808080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080FFFFFF008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          800000808080800080800080800080800080800080800000FF80808000808000
          8080008080008080008080008080008080008080808080808080FFFFFF008080
          008080008080008080008080008080FFFFFF0080800080800080800080800080
          800080800080800000FF00008000008000008080808000808000808000808000
          00FF000080000080808080008080008080008080008080008080008080808080
          FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
          FF0080800080800080800080800080800080800000FF00008000008000008000
          00808080800080800000FF000080000080000080000080808080008080008080
          008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
          FF808080008080008080808080FFFFFF00808000808000808000808000808000
          80800000FF000080000080000080000080808080000080000080000080000080
          000080808080008080008080008080008080008080808080FFFFFF0080800080
          80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
          80800080800080800080800080800080800000FF000080000080000080000080
          0000800000800000800000808080800080800080800080800080800080800080
          80008080808080FFFFFF00808000808000808080808000808000808000808000
          8080FFFFFF808080008080008080008080008080008080008080008080008080
          0000FF0000800000800000800000800000800000808080800080800080800080
          80008080008080008080008080008080008080808080FFFFFF00808000808000
          8080008080008080008080FFFFFF808080008080008080008080008080008080
          0080800080800080800080800080800000800000800000800000800000808080
          8000808000808000808000808000808000808000808000808000808000808000
          8080808080FFFFFF008080008080008080008080008080808080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          8000008000008000008080808000808000808000808000808000808000808000
          8080008080008080008080008080008080808080FFFFFF008080008080008080
          8080800080800080800080800080800080800080800080800080800080800080
          800080800000FF00008000008000008000008000008080808000808000808000
          8080008080008080008080008080008080008080008080008080008080808080
          008080008080008080008080808080FFFFFF0080800080800080800080800080
          800080800080800080800080800000FF00008000008000008080808000008000
          0080000080808080008080008080008080008080008080008080008080008080
          008080008080808080008080008080008080008080008080808080FFFFFF0080
          800080800080800080800080800080800080800080800000FF00008000008000
          00808080800080800000FF000080000080000080808080008080008080008080
          008080008080008080008080008080808080008080008080008080808080FFFF
          FF008080008080808080FFFFFF00808000808000808000808000808000808000
          80800000FF0000800000808080800080800080800080800000FF000080000080
          000080808080008080008080008080008080008080008080808080FFFFFF0080
          80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
          80800080800080800080800080800080800000FF000080008080008080008080
          0080800080800000FF0000800000800000800080800080800080800080800080
          80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
          8080008080808080FFFFFF008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800000FF0000800000FF0080
          8000808000808000808000808000808000808080808080808000808000808000
          8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080808080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 185
        Top = 5
        Width = 90
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
          038383838383830E603800000000380E660033333330830E660333333330000E
          660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
          660300000E60330E660333330600330E660333330030330E6603333333303330
          E6033333333033330E0333333330000000033333333333333333}
      end
      object BitBtn6: TBitBtn
        Left = 4
        Top = 5
        Width = 90
        Height = 25
        Hint = 'Imprime o relat'#243'rio cfe. sele'#231#227'o acima'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn6Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777700000000000777707777777770707700000000000007070777777BBB77
          0007077777788877070700000000000007700777777777707070700000000007
          0700770FFFFFFFF070707770F00000F000077770FFFFFFFF077777770F00000F
          077777770FFFFFFFF07777777000000000777777777777777777}
      end
    end
  end
  object qNotaEntrada: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnentrada.NumNEntr, Dbnentradaitens.CodMaterial, Dbmater' +
        'ial.Nome Material, Dbcor.Nome Cor, Dbnentradaitens.Qtd, Dbnentra' +
        'daitens.VlrUnit, Dbnentrada.VlrTotalNEntr, Dbnentrada.CodForn, D' +
        'bnentrada.DtEntrada, Dbfornecedores.NomeForn, DbNEntradaItens.It' +
        'em, DbNEntradaItens.VlrTotalItens'
      'FROM "dbNEntrada.DB" Dbnentrada'
      '   INNER JOIN "dbNEntradaItens.DB" Dbnentradaitens'
      '   ON  (Dbnentrada.CodForn = Dbnentradaitens.CodForn)  '
      '   AND  (Dbnentrada.NumNEntr = Dbnentradaitens.NumNEntr)  '
      '   FULL OUTER JOIN "dbMaterial.DB" Dbmaterial'
      '   ON  (Dbnentradaitens.CodMaterial = Dbmaterial.Codigo)  '
      '   FULL OUTER JOIN "Dbcor.db" Dbcor'
      '   ON  (Dbnentradaitens.CodCor = Dbcor.Codigo)  '
      '   FULL OUTER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbnentradaitens.CodForn = Dbfornecedores.CodForn)  '
      
        'WHERE  (Dbnentrada.DtEntrada BETWEEN :D1 AND :D2) AND (Dbnentrad' +
        'a.Serie <> '#39'PD'#39')'
      
        'ORDER BY Dbnentrada.DtEntrada, Dbnentrada.CodForn, Dbnentrada.Nu' +
        'mNEntr, DbnentradaItens.Item'
      ' ')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'D2'
        ParamType = ptUnknown
      end>
    object qNotaEntradaNumNEntr: TIntegerField
      FieldName = 'NumNEntr'
    end
    object qNotaEntradaMaterial: TStringField
      FieldName = 'Material'
      Size = 60
    end
    object qNotaEntradaQtd: TFloatField
      FieldName = 'Qtd'
    end
    object qNotaEntradaVlrUnit: TFloatField
      FieldName = 'VlrUnit'
    end
    object qNotaEntradaVlrTotalNEntr: TFloatField
      FieldName = 'VlrTotalNEntr'
    end
    object qNotaEntradaCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object qNotaEntradaCor: TStringField
      FieldName = 'Cor'
      Size = 15
    end
    object qNotaEntradaCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qNotaEntradaNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 40
    end
    object qNotaEntradaItem: TSmallintField
      FieldName = 'Item'
    end
    object qNotaEntradaVlrTotalItens: TFloatField
      FieldName = 'VlrTotalItens'
    end
    object qNotaEntradaDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
  end
  object qNotaEntradaGrade: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnentradaitensgrade.Qtd, Dbgradeitem.Tamanho, Dbnentrada' +
        'itensgrade.NumNEntr, Dbnentradaitensgrade.CodForn, Dbnentradaite' +
        'nsgrade.Item'
      'FROM "dbNEntradaItens.DB" Dbnentradaitens'
      '   INNER JOIN "dbNEntradaItensGrade.db" Dbnentradaitensgrade'
      
        '   ON  (Dbnentradaitens.CodForn = Dbnentradaitensgrade.CodForn) ' +
        ' '
      
        '   AND  (Dbnentradaitens.NumNEntr = Dbnentradaitensgrade.NumNEnt' +
        'r)  '
      '   AND  (Dbnentradaitens.Item = Dbnentradaitensgrade.Item)  '
      '   INNER JOIN "dbGradeItem.DB" Dbgradeitem'
      '   ON  (Dbnentradaitensgrade.CodGrade = Dbgradeitem.CodGrade)  '
      '   AND  (Dbnentradaitensgrade.Posicao = Dbgradeitem.Posicao)  '
      'WHERE   (Dbnentradaitensgrade.CodForn = :CodForn)  '
      '   AND  (Dbnentradaitensgrade.NumNEntr = :NumNota)  '
      '   AND  (Dbnentradaitensgrade.Item = :Item)  '
      'ORDER BY Dbgradeitem.Tamanho')
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodForn'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumNota'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Item'
        ParamType = ptUnknown
      end>
    object qNotaEntradaGradeNumNEntr: TIntegerField
      FieldName = 'NumNEntr'
    end
    object qNotaEntradaGradeCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qNotaEntradaGradeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object qNotaEntradaGradeItem: TIntegerField
      FieldName = 'Item'
    end
    object qNotaEntradaGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 3
    end
  end
end
