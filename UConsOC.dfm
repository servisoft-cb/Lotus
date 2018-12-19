object fConsOC: TfConsOC
  Left = 13
  Top = 10
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Ordens de Compra'
  ClientHeight = 533
  ClientWidth = 782
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
    Width = 782
    Height = 533
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 35
      Width = 86
      Height = 13
      Caption = 'Dt.Emiss'#227'o Inicial:'
    end
    object Label2: TLabel
      Left = 289
      Top = 35
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Label5: TLabel
      Left = 66
      Top = 14
      Width = 35
      Height = 13
      Caption = 'Op'#231#227'o:'
    end
    object Label6: TLabel
      Left = 5
      Top = 60
      Width = 96
      Height = 13
      Caption = 'Dt. Entregue  Inicial:'
    end
    object Label7: TLabel
      Left = 289
      Top = 57
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 418
      Top = 54
      Width = 59
      Height = 13
      Caption = 'Ordenar por:'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 75
      Width = 780
      Height = 2
      Shape = bsTopLine
    end
    object DateEdit1: TDateEdit
      Left = 104
      Top = 27
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 316
      Top = 27
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object RzPageControl1: TRzPageControl
      Left = 5
      Top = 92
      Width = 773
      Height = 436
      ActivePage = TabSheet1
      TabIndex = 0
      TabOrder = 2
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Caption = 'Ordens de Compra'
        object SMDBGrid1: TSMDBGrid
          Left = 2
          Top = 4
          Width = 763
          Height = 299
          DataSource = dsqOrdem
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = SMDBGrid1DblClick
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
          FixedCols = 3
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 15
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'DtEntrega'
              Title.Alignment = taCenter
              Title.Caption = 'Data Entrega'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumOC'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' OC'
              Width = 43
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Item'
              Title.Alignment = taCenter
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeForn'
              Title.Alignment = taCenter
              Title.Caption = 'Fornecedor'
              Width = 216
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CodMaterial'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Material'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeMaterial'
              Title.Alignment = taCenter
              Title.Caption = 'Nome do Material'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QtdRestante'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Pendente'
              Width = 81
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Qtd'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Width = 72
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QtdEntregue'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Entregue'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeCor'
              Title.Alignment = taCenter
              Title.Caption = 'Cor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrUnitario'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Unit'#225'rio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'clVlrRestante'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Pendente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrTotal'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Total'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdCancelada'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Cancelada'
              Visible = True
            end>
        end
        object VDBGrid1: TVDBGrid
          Left = 3
          Top = 331
          Width = 761
          Height = 77
          Color = 10930928
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Vertical = True
          TitlesWidth = 70
          Columns = <
            item
              Alignment = taCenter
              Color = clGray
              FieldName = 'lkTamanho'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'Tamanho'
              Title.Color = clGray
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
            end
            item
              FieldName = 'Qtd'
              Title.Alignment = taCenter
            end>
        end
        object StaticText1: TStaticText
          Left = 2
          Top = 304
          Width = 763
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Duplo clique chama o cadastro da OC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 6
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Pendentes'
      Items.Strings = (
        'Pendentes'
        'Entregues'
        'Ambas')
    end
    object DateEdit3: TDateEdit
      Left = 104
      Top = 49
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object DateEdit4: TDateEdit
      Left = 316
      Top = 49
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 5
    end
    object ComboBox2: TComboBox
      Left = 480
      Top = 46
      Width = 225
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = 'N'#186' Ordem Compra, Item'
      Items.Strings = (
        'N'#186' Ordem Compra, Item'
        'C'#243'd. Material,  Dt.Entrega'
        'C'#243'd. Material, Dt.Emiss'#227'o'
        'Nome Material, Dt. Entrega'
        'Nome Material, Dt. Emiss'#227'o'
        'Fornecedor, Dt.Entrega'
        'Fornecedor, Dt.Emiss'#227'o'
        'Dt.Entrega, Nome Material'
        'Dt.Entrega, Fornecedor')
    end
    object BitBtn4: TBitBtn
      Left = 160
      Top = 80
      Width = 95
      Height = 27
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn4Click
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
    object BitBtn1: TBitBtn
      Left = 256
      Top = 80
      Width = 95
      Height = 27
      Hint = 'Imprime relat'#243'rio cfe. sele'#231#227'o acima'
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BitBtn1Click
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
    end
    object BitBtn2: TBitBtn
      Left = 351
      Top = 80
      Width = 95
      Height = 27
      Hint = 'Cancela a sele'#231#227'o acima'
      Caption = 'Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 447
      Top = 80
      Width = 95
      Height = 27
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BitBtn3Click
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
  object mOC: TMemoryTable
    Active = True
    Left = 544
    Top = 344
    object mOCNumOC: TIntegerField
      FieldName = 'NumOC'
    end
    object mOCDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mOCCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object mOCVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object mOCVlrMercEntr: TFloatField
      FieldName = 'VlrMercEntr'
    end
    object mOCVlrMercAberto: TFloatField
      FieldName = 'VlrMercAberto'
    end
    object mOClkFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFornecedor'
      LookupDataSet = DM1.tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'NomeForn'
      KeyFields = 'CodForn'
      Size = 40
      Lookup = True
    end
    object mOCDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
  end
  object msOC: TDataSource
    DataSet = mOC
    Left = 575
    Top = 344
  end
  object qOrdem: TQuery
    OnCalcFields = qOrdemCalcFields
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbfornecedores.CodForn, Dbfornecedores.NomeForn, Dbordemc' +
        'ompra.Codigo NumOC, Dbcor.Nome NomeCor, Dbordemcompraitem.CodMat' +
        'erial, Dbproduto.Nome NomeMaterial, Dbordemcompraitem.CodCor, Db' +
        'ordemcompraitem.Item, Dbordemcompraitem.Qtd, Dbordemcompraitem.V' +
        'lrUnitario, Dbordemcompraitem.DtEntrega, Dbordemcompraitem.VlrTo' +
        'tal, Dbordemcompraitem.QtdEntregue, Dbordemcompraitem.QtdRestant' +
        'e, dbOrdemCompra.DtEmissao, Dbordemcompra.Filial'
      'FROM "dbOrdemCompra.DB" Dbordemcompra'
      '   INNER JOIN "dbOrdemCompraItem.DB" Dbordemcompraitem'
      '   ON  (Dbordemcompra.Codigo = Dbordemcompraitem.Codigo)'
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbordemcompra.CodFornecedor = Dbfornecedores.CodForn)'
      '   INNER JOIN "dbMaterial.DB" Dbproduto'
      '   ON  (Dbordemcompraitem.CodMaterial = Dbproduto.Codigo)'
      '   FULL OUTER JOIN "Dbcor.DB" Dbcor'
      '   ON  (Dbordemcompraitem.CodCor = Dbcor.Codigo)  '
      
        'WHERE   Dbordemcompra.DtEmissao BETWEEN '#39'01/01/2006'#39' AND '#39'01/01/' +
        '2008'#39
      
        '   AND  Dbordemcompraitem.DtEntrega BETWEEN '#39'01/01/2006'#39' AND '#39'01' +
        '/01/2008'#39'  '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 408
    Top = 212
    object qOrdemCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qOrdemNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 40
    end
    object qOrdemNumOC: TIntegerField
      FieldName = 'NumOC'
    end
    object qOrdemNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 35
    end
    object qOrdemCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object qOrdemNomeMaterial: TStringField
      FieldName = 'NomeMaterial'
      Size = 40
    end
    object qOrdemCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qOrdemItem: TIntegerField
      FieldName = 'Item'
    end
    object qOrdemQtd: TFloatField
      FieldName = 'Qtd'
      DisplayFormat = '###,###,##0.00000'
    end
    object qOrdemVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      DisplayFormat = '###,###,##0.0000'
    end
    object qOrdemDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object qOrdemVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object qOrdemQtdEntregue: TFloatField
      FieldName = 'QtdEntregue'
      DisplayFormat = '###,###,##0.00000'
    end
    object qOrdemQtdRestante: TFloatField
      FieldName = 'QtdRestante'
      DisplayFormat = '###,###,##0.00000'
    end
    object qOrdemclVlrRestante: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clVlrRestante'
      DisplayFormat = '###,###,##0.00'
      Calculated = True
    end
    object qOrdemDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object qOrdemFilial: TIntegerField
      FieldName = 'Filial'
    end
  end
  object dsqOrdem: TDataSource
    DataSet = qOrdem
    Left = 430
    Top = 212
  end
  object tOrdemCompraItemGrade: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;Codigo;Item;CodGrade;Posicao'
    MasterFields = 'Filial;NumOC;Item'
    MasterSource = dsqOrdem
    TableName = 'DBORDEMCOMPRAITEMGRADE.DB'
    Left = 582
    Top = 460
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
    object tOrdemCompraItemGradelkTamanho: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTamanho'
      LookupDataSet = DM1.tGradeItemlk
      LookupKeyFields = 'CodGrade;Posicao'
      LookupResultField = 'Tamanho'
      KeyFields = 'CodGrade;Posicao'
      Size = 6
      Lookup = True
    end
  end
  object dsOrdemCompraItemGrade: TDataSource
    DataSet = tOrdemCompraItemGrade
    Left = 598
    Top = 460
  end
end
