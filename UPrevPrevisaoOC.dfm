object fPrevPrevisaoOC: TfPrevPrevisaoOC
  Left = 183
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Previs'#227'o OC'
  ClientHeight = 199
  ClientWidth = 333
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
    Width = 333
    Height = 199
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 114
      Top = 11
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Label3: TLabel
      Left = 11
      Top = 98
      Width = 32
      Height = 13
      Caption = 'Op'#231#227'o'
    end
    object Label4: TLabel
      Left = 10
      Top = 54
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object DateEdit1: TDateEdit
      Left = 12
      Top = 28
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 114
      Top = 28
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 12
      Top = 142
      Width = 306
      Height = 42
      TabOrder = 5
      object BitBtn6: TBitBtn
        Left = 17
        Top = 9
        Width = 90
        Height = 25
        Hint = 'Imprime o relat'#243'rio de c'#225'lculo de materiais p/ setor'
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
      object BitBtn1: TBitBtn
        Left = 107
        Top = 9
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
        Left = 198
        Top = 9
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
    end
    object CheckBox1: TCheckBox
      Left = 161
      Top = 118
      Width = 161
      Height = 17
      Caption = 'Acumular valores no domingo'
      TabOrder = 4
    end
    object ComboBox1: TComboBox
      Left = 12
      Top = 116
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Acumulado'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Acumulado'
        'Detalhado')
    end
    object ComboBox2: TComboBox
      Left = 11
      Top = 72
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Ambos'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Ambos'
        'Couro'
        'Outros')
    end
  end
  object tAuxiliar: TTable
    DatabaseName = 'C:\a\'
    TableName = 'dbAuxiliar.DB'
    Left = 440
    Top = 16
    object tAuxiliarData: TDateField
      FieldName = 'Data'
    end
    object tAuxiliarValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '0.00'
    end
  end
  object qAux: TQuery
    DatabaseName = 'C:\a\'
    Left = 472
    Top = 48
  end
  object tOCItens: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbOrdemCompraItem.DB'
    Left = 444
    Top = 52
    object tOCItensCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tOCItensItem: TIntegerField
      FieldName = 'Item'
    end
    object tOCItensCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tOCItensCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tOCItensQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tOCItensVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tOCItensAliqIPI: TFloatField
      FieldName = 'AliqIPI'
    end
    object tOCItensVlrIPI: TFloatField
      FieldName = 'VlrIPI'
    end
    object tOCItensDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object tOCItensVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tOCItensCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tOCItensQtdEntregue: TFloatField
      FieldName = 'QtdEntregue'
    end
    object tOCItensQtdRestante: TFloatField
      FieldName = 'QtdRestante'
    end
    object tOCItensUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = mSemana
    Left = 248
    Top = 24
  end
  object mSemana: TMemoryTable
    Active = True
    AutoRefresh = True
    DatabaseName = 'Tabelas'
    TableName = 'mSemana'
    Left = 216
    Top = 24
    object mSemanaData1: TDateField
      FieldName = 'Data1'
    end
    object mSemanaData2: TDateField
      FieldName = 'Data2'
    end
    object mSemanaData3: TDateField
      FieldName = 'Data3'
    end
    object mSemanaData4: TDateField
      FieldName = 'Data4'
    end
    object mSemanaData5: TDateField
      FieldName = 'Data5'
    end
    object mSemanaData6: TDateField
      FieldName = 'Data6'
    end
    object mSemanaData7: TDateField
      FieldName = 'Data7'
    end
    object mSemanaValor1: TFloatField
      FieldName = 'Valor1'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanaValor2: TFloatField
      FieldName = 'Valor2'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanaValor3: TFloatField
      FieldName = 'Valor3'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanaValor4: TFloatField
      FieldName = 'Valor4'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanaValor5: TFloatField
      FieldName = 'Valor5'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanaValor6: TFloatField
      FieldName = 'Valor6'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanaValor7: TFloatField
      FieldName = 'Valor7'
      DisplayFormat = '###,###,##0.00'
    end
    object mSemanatotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object DataSource2: TDataSource
    DataSet = tAuxiliar
    Left = 472
    Top = 16
  end
  object mAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 56
    object mAuxiliarNumOC: TIntegerField
      FieldName = 'NumOC'
    end
    object mAuxiliarDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mAuxiliarVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '0.00'
    end
    object mAuxiliarVlrEntregue: TFloatField
      FieldName = 'VlrEntregue'
      DisplayFormat = '0.00'
    end
    object mAuxiliarDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object mAuxiliarDtVencimento: TDateField
      FieldName = 'DtVencimento'
    end
    object mAuxiliarVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      DisplayFormat = '0.00'
    end
    object mAuxiliarCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object mAuxiliarCodCondPgto: TIntegerField
      FieldName = 'CodCondPgto'
    end
    object mAuxiliarNomeFornecedor: TStringField
      FieldName = 'NomeFornecedor'
      Size = 50
    end
    object mAuxiliarNomeCondPgto: TStringField
      FieldName = 'NomeCondPgto'
      Size = 50
    end
  end
  object qOrdemCompraSelecao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'select o.codigo'
      'from dbOrdemCompra o'
      '       ,dbOrdemCompraItem i'
      'where o.codigo = i.codigo'
      '   and i.QtdRestante > 0'
      '   and o.Couro = false'
      '')
    Left = 216
    Top = 88
    object qOrdemCompraSelecaocodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'TABELAS."dbOrdemCompra.DB".Codigo'
    end
  end
  object DataSource3: TDataSource
    DataSet = mAuxiliar
    Left = 248
    Top = 56
  end
end
