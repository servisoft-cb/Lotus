object fPrevTransfICMS: TfPrevTransfICMS
  Left = 211
  Top = 192
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Transfer'#234'ncia de ICMS'
  ClientHeight = 158
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 158
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 24
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 191
      Top = 24
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object DateEdit1: TDateEdit
      Left = 75
      Top = 16
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 245
      Top = 16
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object RadioGroup1: TRadioGroup
      Left = 47
      Top = 47
      Width = 265
      Height = 38
      Caption = 'Op'#231#245'es do Relat'#243'rio...'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Pendentes'
        'Quitados')
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 25
      Top = 100
      Width = 310
      Height = 41
      TabOrder = 3
      object RxSpeedButton1: TRxSpeedButton
        Left = 11
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Imprime o relat'#243'rio cfe. sele'#231#227'o acima'
        DropDownMenu = PopupMenu1
        Caption = 'Imprimir'
        Glyph.Data = {
          0E030000424D0E030000000000003600000028000000110000000E0000000100
          180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
          BFBFBF0000000000000000000000000000000000000000000000000000000000
          00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBFBFBF
          BF00BFBFBF000000000000000000000000000000000000000000000000000000
          000000000000000000000000BFBFBF000000BFBFBF00BFBFBF000000BFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF000000
          000000000000BFBFBF00BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000BFBFBF00BFBF
          BF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000BFBFBFBFBFBF00000000BFBFBF000000BFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
          BFBF00000000BFBFBFBFBFBF0000000000000000000000000000000000000000
          00000000000000000000BFBFBF000000BFBFBF00000000000000BFBFBFBFBFBF
          BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00BFBFBF000000BFBFBF00000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
          000000000000000000000000000000FFFFFF000000000000000000000000BFBF
          BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBF000000FFFFFF000000000000000000000000000000FFFFFF000000
          BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF00BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000000000000000
          0000000000000000000000BFBFBFBFBFBF00}
        Layout = blGlyphLeft
      end
      object BitBtn1: TBitBtn
        Left = 107
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Ca&ncela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
        Left = 203
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 8
    Top = 8
    object Imprimir1: TMenuItem
      Caption = '&Imprimir Normal'
      OnClick = Imprimir1Click
    end
    object Visualizar1: TMenuItem
      Caption = '&Visualizar Normal'
      OnClick = Visualizar1Click
    end
    object ImprimirporFornecedor1: TMenuItem
      Caption = 'I&mprimir p/ Fornecedor'
      OnClick = ImprimirporFornecedor1Click
    end
    object VisualizarpFornecedor1: TMenuItem
      Caption = 'Vi&sualizar p/ Fornecedor'
      OnClick = VisualizarpFornecedor1Click
    end
  end
  object qParcelas: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcpagar.CodForn, Dbcpagarparc.DtVencCPagar, Dbcpagarparc' +
        '.VlrParcCPagar, Dbcpagarparc.NumNotaEnt, Dbcpagarparc.ParcCPagar' +
        ', Dbcpagarparc.NroDuplicata, dbCPagar.VlrTotal, dbCPagar.DtGerad' +
        'o, dbCPagar.CodNatOper, dbCPagar.DtEmissaoNota'
      'FROM "dbCPagar.DB" Dbcpagar'
      '   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc'
      '   ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)'
      
        'WHERE Dbcpagar.DtGerado BETWEEN :D1 AND :D2 AND Dbcpagarparc.Cod' +
        'Conta = 10'
      
        'AND ((Dbcpagarparc.QuitParcCPagar = False) OR (Dbcpagarparc.Quit' +
        'ParcCPagar IS NULL))'
      
        'ORDER BY Dbcpagarparc.DtVencCPagar, Dbcpagarparc.NumNotaEnt, Dbc' +
        'pagarparc.ParcCPagar'
      ' '
      ' ')
    Left = 316
    Top = 48
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
    object qParcelasCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbCPagar.DB".CodForn'
    end
    object qParcelasDtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".DtVencCPagar'
    end
    object qParcelasVlrParcCPagar: TFloatField
      FieldName = 'VlrParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".VlrParcCPagar'
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qParcelasNumNotaEnt: TIntegerField
      FieldName = 'NumNotaEnt'
      Origin = 'TABELAS."dbCPagarParc.DB".NumNotaEnt'
    end
    object qParcelasParcCPagar: TIntegerField
      FieldName = 'ParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".ParcCPagar'
    end
    object qParcelasNroDuplicata: TIntegerField
      FieldName = 'NroDuplicata'
      Origin = 'TABELAS."dbCPagarParc.DB".NroDuplicata'
    end
    object qParcelaslkFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFornecedor'
      LookupDataSet = DM1.tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'NomeForn'
      KeyFields = 'CodForn'
      Size = 40
      Lookup = True
    end
    object qParcelasVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCPagar.DB".VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object qParcelasDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCPagar.DB".DtGerado'
    end
    object qParcelasCodNatOper: TIntegerField
      FieldName = 'CodNatOper'
      Origin = 'TABELAS."dbCPagar.DB".CodNatOper'
    end
    object qParcelasDtEmissaoNota: TDateField
      FieldName = 'DtEmissaoNota'
      Origin = 'TABELAS."DBCPAGAR.DB".DtEmissaoNota'
    end
  end
  object qFornecedores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT DISTINCT Dbcpagar.CodForn, Dbfornecedores.NomeForn'
      'FROM "dbCPagar.DB" Dbcpagar'
      '   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc'
      '   ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)  '
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbcpagar.CodForn = Dbfornecedores.CodForn)  '
      
        'WHERE Dbcpagar.DtGerado BETWEEN :D1 AND :D2 AND Dbcpagarparc.Cod' +
        'Conta = 10'
      
        'AND ((Dbcpagarparc.QuitParcCPagar = False) OR (Dbcpagarparc.Quit' +
        'ParcCPagar IS NULL))'
      'GROUP BY Dbcpagar.CodForn, Dbfornecedores.NomeForn'
      'ORDER BY Dbfornecedores.NomeForn')
    Top = 40
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
    object qFornecedoresCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qFornecedoresNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 40
    end
  end
  object qItensFornec: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcpagar.CodForn, Dbcpagarparc.DtVencCPagar, Dbcpagarparc' +
        '.VlrParcCPagar, Dbcpagarparc.NumNotaEnt, Dbcpagarparc.ParcCPagar' +
        ', Dbcpagarparc.NroDuplicata, dbCPagar.CodNatOper, dbCPagar.DtGer' +
        'ado, dbCPagar.VlrTotal, dbCPagar.DtEmissaoNota'
      'FROM "dbCPagar.DB" Dbcpagar'
      '   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc'
      '   ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)'
      
        'WHERE Dbcpagar.DtGerado BETWEEN :D1 AND :D2 AND Dbcpagarparc.Cod' +
        'Conta = 10'
      'AND Dbcpagarparc.CodForn = :C1'
      
        'AND ((Dbcpagarparc.QuitParcCPagar = False) OR (Dbcpagarparc.Quit' +
        'ParcCPagar IS NULL))'
      
        'ORDER BY Dbcpagarparc.DtVencCPagar, Dbcpagarparc.NumNotaEnt, Dbc' +
        'pagarparc.ParcCPagar'
      ' ')
    Left = 1
    Top = 71
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
      end
      item
        DataType = ftInteger
        Name = 'C1'
        ParamType = ptUnknown
      end>
    object qItensFornecCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbCPagar.DB".CodForn'
    end
    object qItensFornecDtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".DtVencCPagar'
    end
    object qItensFornecVlrParcCPagar: TFloatField
      FieldName = 'VlrParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".VlrParcCPagar'
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qItensFornecNumNotaEnt: TIntegerField
      FieldName = 'NumNotaEnt'
      Origin = 'TABELAS."dbCPagarParc.DB".NumNotaEnt'
    end
    object qItensFornecParcCPagar: TIntegerField
      FieldName = 'ParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".ParcCPagar'
    end
    object qItensFornecNroDuplicata: TIntegerField
      FieldName = 'NroDuplicata'
      Origin = 'TABELAS."dbCPagarParc.DB".NroDuplicata'
    end
    object qItensFornecCodNatOper: TIntegerField
      FieldName = 'CodNatOper'
      Origin = 'TABELAS."dbCPagar.DB".CodNatOper'
    end
    object qItensFornecDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCPagar.DB".DtGerado'
    end
    object qItensFornecVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCPagar.DB".VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object qItensFornecDtEmissaoNota: TDateField
      FieldName = 'DtEmissaoNota'
      Origin = 'TABELAS."DBCPAGAR.DB".DtEmissaoNota'
    end
  end
  object qsFornecedores: TDataSource
    DataSet = qFornecedores
    Left = 24
    Top = 40
  end
  object qsItensFornec: TDataSource
    DataSet = qItensFornec
    Left = 24
    Top = 72
  end
end
