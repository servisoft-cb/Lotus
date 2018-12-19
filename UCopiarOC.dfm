object fCopiarOC: TfCopiarOC
  Left = 2
  Top = 12
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Copiar OC'
  ClientHeight = 534
  ClientWidth = 788
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
  object Label1: TLabel
    Left = 20
    Top = 10
    Width = 57
    Height = 13
    Caption = 'Fornecedor:'
  end
  object Label2: TLabel
    Left = 436
    Top = 10
    Width = 74
    Height = 13
    Caption = 'Parte do Nome:'
  end
  object Label3: TLabel
    Left = 44
    Top = 32
    Width = 33
    Height = 13
    Caption = 'N'#186' OC:'
  end
  object RxLabel1: TRxLabel
    Left = 0
    Top = 337
    Width = 242
    Height = 13
    Caption = 'Itens da ordem de compra.......................'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 78
    Top = 2
    Width = 323
    Height = 21
    DropDownCount = 8
    LookupField = 'CodForn'
    LookupDisplay = 'NomeForn'
    LookupSource = DM1.dsFornecedores
    TabOrder = 0
    OnEnter = RxDBLookupCombo1Enter
  end
  object Edit1: TEdit
    Left = 512
    Top = 2
    Width = 209
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 78
    Top = 24
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    TabOrder = 2
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 55
    Width = 785
    Height = 279
    Color = clInfoBk
    DataSource = dsqOC
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 9
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' OC'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodFornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Fornecedor'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeForn'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Fornecedor'
        Width = 267
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Data Emiss'#227'o'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Couro'
        Title.Alignment = taCenter
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tel1Forn'
        Title.Alignment = taCenter
        Title.Caption = 'Fone'
        Width = 102
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 292
    Top = 25
    Width = 109
    Height = 29
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888000000080000000008888888000000080FFFFFFF08888800000000080F8
      8888F08888000000000080F88888F08880008000000080F88870007800088000
      000080F8800FFF0000888000000080F807FFFF0708888000000080F70E000F08
      07888000000080F0EFEFEF0880888000000080F0F0000F088088800000008000
      EFEFFF0880888000000088870000000807888000000088880088888708888000
      0000888880088800888880000000888888700078888880000000888888888888
      888880000000}
  end
  object BitBtn2: TBitBtn
    Left = 696
    Top = 26
    Width = 87
    Height = 27
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0037373737370E
      037373737373730E603700000000370E660033333330730E660333333330000E
      660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
      660300000E60330E660333330600330E660333330030330E6603333333303330
      E6033333333033330E0333333330000000033333333333333333}
  end
  object SMDBGrid2: TSMDBGrid
    Left = 0
    Top = 352
    Width = 788
    Height = 179
    Color = clInfoBk
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 6
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
    ColCount = 15
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Width = 26
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Material'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cor'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrUnitario'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AliqIPI'
        Title.Alignment = taCenter
        Title.Caption = '% IPI'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtEntrega'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Entrega'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIPI'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdEntregue'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Entregue'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdRestante'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Restante'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Unidade'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 403
    Top = 25
    Width = 109
    Height = 29
    Hint = 'Confirma lan'#231'amento'
    Caption = 'Copiar OC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtn3Click
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      18000000000098070000CE0E0000D80E00000000000000000000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080FFFFFF008080008080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8080000080000000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080808080808080FFFFFF
      FFFFFF0080800080800080800080800080800080800080800080800080800080
      8000808000808000808080000000800000800080000000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      808080808080808080808080FFFFFFFFFFFF0080800080800080800080800080
      8000808000808000808000808000808000808080000000800000800000800000
      8000800000008080008080008080008080008080008080008080008080008080
      008080008080008080808080808080808080808080808080808080FFFFFFFFFF
      FF00808000808000808000808000808000808000808000808000808080000000
      8000008000008000008000008000008000800000008080008080008080008080
      0080800080800080800080800080800080808080808080808080808080808080
      80808080808080808080808080FFFFFF00808000808000808000808000808000
      808000808080000000800000800000800000FF00008000008000008000008000
      8000000080800080800080800080800080800080800080800080808080808080
      80808080808080FFFFFF808080808080808080808080808080FFFFFF00808000
      808000808000808000808000808000808000800000800000800000FF00008080
      00FF000080000080000080008000000080800080800080800080800080800080
      80008080008080808080808080808080FFFFFF008080FFFFFF80808080808080
      8080808080FFFFFFFFFFFF00808000808000808000808000808000808000FF00
      00800000FF0000808000808000808000FF000080000080000080008000000080
      80008080008080008080008080008080008080808080808080FFFFFF00808000
      8080008080FFFFFF808080808080808080808080FFFFFFFFFFFF008080008080
      00808000808000808000808000FF0000808000808000808000808000808000FF
      0000800000800000800080000000808000808000808000808000808000808000
      8080FFFFFF008080008080008080008080008080FFFFFF808080808080808080
      808080FFFFFFFFFFFF0080800080800080800080800080800080800080800080
      8000808000808000808000808000FF0000800000800000800080000000808000
      8080008080008080008080008080008080008080008080008080008080008080
      008080FFFFFF808080808080808080808080FFFFFFFFFFFF0080800080800080
      8000808000808000808000808000808000808000808000808000808000FF0000
      8000008000008000800000008080008080008080008080008080008080008080
      008080008080008080008080008080008080FFFFFF8080808080808080808080
      80FFFFFF00808000808000808000808000808000808000808000808000808000
      808000808000808000808000FF00008000008000008000800000008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      80FFFFFF808080808080808080808080FFFFFF00808000808000808000808000
      808000808000808000808000808000808000808000808000808000FF00008000
      0080000080008000000080800080800080800080800080800080800080800080
      80008080008080008080008080008080FFFFFF808080808080808080808080FF
      FFFF008080008080008080008080008080008080008080008080008080008080
      00808000808000808000FF000080000080008000000080800080800080800080
      80008080008080008080008080008080008080008080008080008080008080FF
      FFFF808080808080808080008080008080008080008080008080008080008080
      00808000808000808000808000808000808000808000808000FF000080000080
      0000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080FFFFFF808080808080008080008080008080
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000FF0000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080FFFFFF
      0080800080800080800080800080800080800080800080800080800080800080
      8000808000808000808000808000808000808000808000808000808000808000
      8080008080008080008080008080008080008080008080008080008080008080
      008080008080008080008080008080008080}
    NumGlyphs = 2
  end
  object qOC: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbordemcompra.Codigo, Dbordemcompra.CodFornecedor, Dborde' +
        'mcompra.DtEmissao, Dbordemcompra.VlrTotal, Dbordemcompra.Referen' +
        'cia, Dbordemcompra.Couro, Dbfornecedores.NomeForn, Dbfornecedore' +
        's.Tel1Forn, Dbordemcompra.CodCondPgto, Dbordemcompra.CodTransp, ' +
        'Dbordemcompra.Obs, Dbordemcompra.CodProd, dbOrdemCompra.Filial'
      'FROM "dbOrdemCompra.DB" Dbordemcompra'
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbordemcompra.CodFornecedor = Dbfornecedores.CodForn)  '
      'ORDER BY Dbfornecedores.NomeForn, Dbordemcompra.Codigo'
      ' ')
    Left = 440
    Top = 128
    object qOCFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbOrdemCompra.DB".Filial'
    end
    object qOCCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbOrdemCompra.DB".Codigo'
    end
    object qOCCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
      Origin = 'TABELAS."dbOrdemCompra.DB".CodFornecedor'
    end
    object qOCDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbOrdemCompra.DB".DtEmissao'
    end
    object qOCVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbOrdemCompra.DB".VlrTotal'
    end
    object qOCReferencia: TStringField
      FieldName = 'Referencia'
      Origin = 'TABELAS."dbOrdemCompra.DB".Referencia'
      Size = 8
    end
    object qOCCouro: TBooleanField
      FieldName = 'Couro'
      Origin = 'TABELAS."dbOrdemCompra.DB".Couro'
      DisplayValues = 'Sim'
    end
    object qOCNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object qOCTel1Forn: TStringField
      FieldName = 'Tel1Forn'
      Origin = 'TABELAS."dbFornecedores.DB".Tel1Forn'
      Size = 15
    end
    object qOCCodCondPgto: TIntegerField
      FieldName = 'CodCondPgto'
      Origin = 'TABELAS."dbOrdemCompra.DB".CodCondPgto'
    end
    object qOCCodTransp: TIntegerField
      FieldName = 'CodTransp'
      Origin = 'TABELAS."dbOrdemCompra.DB".CodTransp'
    end
    object qOCObs: TMemoField
      FieldName = 'Obs'
      Origin = 'TABELAS."dbOrdemCompra.DB".Obs'
      BlobType = ftMemo
      Size = 20
    end
    object qOCCodProd: TIntegerField
      FieldName = 'CodProd'
      Origin = 'TABELAS."dbOrdemCompra.DB".CodProd'
    end
  end
  object dsqOC: TDataSource
    DataSet = qOC
    Left = 456
    Top = 128
  end
  object tOrdemCompraItem: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;Codigo;Item'
    MasterFields = 'Filial;Codigo'
    MasterSource = dsqOC
    TableName = 'dbOrdemCompraItem.DB'
    Left = 416
    Top = 368
    object tOrdemCompraItemFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tOrdemCompraItemCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tOrdemCompraItemItem: TIntegerField
      FieldName = 'Item'
    end
    object tOrdemCompraItemCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tOrdemCompraItemCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tOrdemCompraItemQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tOrdemCompraItemVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tOrdemCompraItemAliqIPI: TFloatField
      FieldName = 'AliqIPI'
    end
    object tOrdemCompraItemVlrIPI: TFloatField
      FieldName = 'VlrIPI'
    end
    object tOrdemCompraItemDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object tOrdemCompraItemVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tOrdemCompraItemCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tOrdemCompraItemQtdEntregue: TFloatField
      FieldName = 'QtdEntregue'
    end
    object tOrdemCompraItemQtdRestante: TFloatField
      FieldName = 'QtdRestante'
    end
    object tOrdemCompraItemUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object tOrdemCompraItemlkNomeMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeMaterial'
      LookupDataSet = tMaterial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodMaterial'
      Size = 40
      Lookup = True
    end
    object tOrdemCompraItemlkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 30
      Lookup = True
    end
  end
  object dsOrdemCompraItem: TDataSource
    DataSet = tOrdemCompraItem
    Left = 440
    Top = 368
  end
  object tOrdemCompraItemGrade: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;Codigo;Item;CodGrade;Posicao'
    MasterFields = 'Filial;Codigo;Item'
    MasterSource = dsOrdemCompraItem
    TableName = 'dbOrdemCompraItemGrade.DB'
    Left = 544
    Top = 424
    object tOrdemCompraItemGradeFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tOrdemCompraItemGradeCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tOrdemCompraItemGradeItem: TIntegerField
      FieldName = 'Item'
    end
    object tOrdemCompraItemGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tOrdemCompraItemGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tOrdemCompraItemGradeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tOrdemCompraItemGradeVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tOrdemCompraItemGradeVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tOrdemCompraItemGradeQtdEntregue: TFloatField
      FieldName = 'QtdEntregue'
    end
    object tOrdemCompraItemGradeQtdRestante: TFloatField
      FieldName = 'QtdRestante'
    end
  end
  object tMaterial2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbMaterial.DB'
    Left = 560
    Top = 168
    object tMaterial2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tMaterial2Nome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
  end
  object tCor2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'Dbcor.DB'
    Left = 560
    Top = 216
    object tCor2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCor2Nome: TStringField
      FieldName = 'Nome'
      Size = 15
    end
  end
end
