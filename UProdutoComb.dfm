object fProdutoComb: TfProdutoComb
  Left = 145
  Top = 109
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Combina'#231#227'o'
  ClientHeight = 529
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    810
    529)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 80
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Cor:'
    end
    object DBText2: TDBText
      Left = 32
      Top = 11
      Width = 433
      Height = 17
      BiDiMode = bdLeftToRight
      Color = 10930928
      DataField = 'lkNomeCor'
      DataSource = DM1.dsProdutoCor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
    end
    object BitBtn14: TBitBtn
      Left = 32
      Top = 44
      Width = 130
      Height = 26
      Hint = 'Copia materiais da cor selecionada'
      Caption = 'Copiar mats. da cor:'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn14Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object RxDBLookupCombo12: TRxDBLookupCombo
      Left = 165
      Top = 48
      Width = 212
      Height = 21
      DropDownCount = 8
      LookupField = 'CodCor'
      LookupDisplay = 'lkNomeCor'
      LookupSource = dsProdutoCorCop
      TabOrder = 1
    end
    object BitBtn23: TBitBtn
      Left = 618
      Top = 52
      Width = 177
      Height = 25
      Hint = 'Copia materiais da constru'#231#227'o para esta cor'
      Caption = 'Copia Materiais da Constru'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn23Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFA0A0A040404040404040404040404040404040404040
        4040404040404040404040404040202020000000FFFFFFFFFFFFA0A0A0808080
        8080808080808080808080809090909090908080808080808080808080804040
        40000000FFFFFFFFFFFFA0A0A0808080808080808080808080808080808080A0
        A0A0808080808080808080808080404040202020202020000000A0A0A0808080
        8080808080808080808080808080808080808080808080808080808080804040
        40404040404040000000A0A0A0808080808080808080606060808080909090A0
        A0A0909090808080808080808080404040404040404040000000A0A0A0808080
        808080808080808080404040808080808080A0A0A08080808080808080804040
        40404040404040000000A0A0A080808080808080808080808040404080808080
        8080808080808080808080808080404040404040404040000000A0A0A0808080
        8080808080808080808080804040406060608080808080808080808080804040
        40404040404040000000A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF
        BFBF7F7F7F7F7F7FFFFFFFFFFFFF7F7F7F404040404040000000A0A0A0FFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7FBFBFBFFFFFFF7F7F7FBFBFBFFFFFFFFFFFFF7F7F
        7F404040404040000000A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBF
        BFBF7F7F7F7F7F7FFFFFFFFFFFFF7F7F7F5F5F5F5F5F5F000000909090A0A0A0
        A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A07070
        707F7F7F7F7F7F000000FFFFFFFFFFFFA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F000000FFFFFFFFFFFF
        909090A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
        A0A0A0A0707070000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 810
    Height = 449
    Align = alClient
    TabOrder = 1
    object SMDBGrid2: TSMDBGrid
      Left = 1
      Top = 33
      Width = 808
      Height = 415
      Align = alClient
      DataSource = DM1.dsProdutoMat
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = SMDBGrid2DblClick
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
      ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 14
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Item'
          Title.Alignment = taCenter
          Width = 32
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodMaterial'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Material'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeMaterial'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Material'
          Width = 294
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkPosicao'
          Title.Alignment = taCenter
          Title.Caption = 'Posi'#231#227'o'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeCor'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cor'
          Width = 154
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Unidade'
          Title.Alignment = taCenter
          Title.Caption = 'Unid.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Consumo'
          Width = 85
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
          FieldName = 'VlrTotal'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clQtdPr'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Por Unidade'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ImpTalao'
          Title.Alignment = taCenter
          Title.Caption = 'Imprimir no Tal'#227'o'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodCor'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Cor'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodGrade'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Grade'
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 808
      Height = 32
      Align = alTop
      TabOrder = 1
      object BitBtn12: TBitBtn
        Left = 227
        Top = 5
        Width = 112
        Height = 24
        Hint = 'Exclui o item selecionado'
        Caption = 'Exclui Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn12Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
          0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
          703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
          700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
          0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
          03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
          033333777777777773333333307770333333333337FFF7F33333333330000033
          3333333337777733333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BitBtn15: TBitBtn
        Left = 115
        Top = 5
        Width = 112
        Height = 24
        Caption = 'Alterar Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn15Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
      object BitBtn10: TBitBtn
        Left = 3
        Top = 5
        Width = 112
        Height = 24
        Caption = 'Digitar Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn10Click
        Glyph.Data = {
          36080000424D3608000000000000360000002800000020000000100000000100
          2000000000000008000000000000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          80000080800000808000FFFFFF00FFFFFF000080800000808000008080000080
          800000808000008080000080800000808000FFFFFF00FFFFFF00008080000080
          8000008080000000FF000000FF00008080000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080007F7F7F007F7F7F00FFFFFF000080800000808000008080000080
          80000080800000808000008080007F7F7F007F7F7F007F7F7F00008080000080
          8000008080000000FF000000FF00008080000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000FFFFFF007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00008080000080
          80000080800000808000008080007F7F7F007F7F7F007F7F7F00008080000000
          FF000000FF000000FF000000FF000000FF000000FF0000808000008080000080
          8000008080000080800000808000008080000080800000808000008080007F7F
          7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00008080000080
          80000080800000808000008080000080800000808000FFFFFF00008080000000
          FF000000FF000000FF000000FF000000FF000000FF0000808000008080000080
          8000008080000080800000808000008080000000000000000000008080007F7F
          7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000808000008080000080
          8000008080000080800000808000008080007F7F7F007F7F7F00008080000080
          8000008080000000FF000000FF00008080000080800000808000008080000080
          8000008080000080800000808000008080000000000000000000008080000080
          8000008080007F7F7F007F7F7F00FFFFFF000080800000808000008080000080
          8000008080000080800000808000008080007F7F7F007F7F7F00008080000080
          8000008080000000FF000000FF00008080000080800000808000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080007F7F7F007F7F7F00008080000080800000808000008080000080
          80000080800000808000008080000080800000808000FFFFFF00008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000008080000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000FFFFFF000080
          8000008080000080800000808000008080007F7F7F007F7F7F00008080000080
          80000080800000808000008080000080800000808000FF000000008080000080
          8000008080000080800000808000008080000000000000000000008080000080
          800000808000008080000080800000808000008080007F7F7F00FFFFFF00FFFF
          FF00008080000080800000808000008080007F7F7F007F7F7F00008080000080
          80000080800000808000008080000080800000808000FF000000FF0000000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00FFFF
          FF00FFFFFF00FFFFFF0000808000FFFFFF00FFFFFF000080800000808000FF00
          0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
          0000FF000000008080000000FF000000FF000080800000808000008080007F7F
          7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
          7F007F7F7F00FFFFFF007F7F7F007F7F7F00FFFFFF000080800000808000FF00
          0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
          0000FF000000008080000000FF000000FF000080800000808000008080007F7F
          7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
          7F007F7F7F00008080007F7F7F007F7F7F000080800000808000008080000080
          80000080800000808000008080000080800000808000FF000000FF0000000080
          8000008080000080800000808000008080000080800000808000008080000080
          800000808000008080000080800000808000008080007F7F7F007F7F7F000080
          800000808000008080000080800000808000FFFFFF00FFFFFF00008080000080
          80000080800000808000008080000080800000808000FF000000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          800000808000008080000080800000808000008080007F7F7F00008080000080
          80000080800000808000008080007F7F7F007F7F7F007F7F7F00008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000000000000000000000000000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          80000080800000808000008080007F7F7F007F7F7F007F7F7F00008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000008080000080800000808000008080000080
          8000008080000080800000808000008080000080800000808000}
        NumGlyphs = 2
      end
    end
  end
  object BitBtn4: TBitBtn
    Left = 724
    Top = 8
    Width = 75
    Height = 28
    Anchors = [akTop, akRight]
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn4Click
  end
  object tProdutoCorCop: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodProduto'
    MasterFields = 'Codigo'
    MasterSource = DM1.dsProduto
    TableName = 'dbProdutoCor.DB'
    Left = 468
    Top = 18
    object tProdutoCorCopCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProdutoCorCopCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tProdutoCorCoplkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 15
      Lookup = True
    end
  end
  object dsProdutoCorCop: TDataSource
    DataSet = tProdutoCorCop
    Left = 492
    Top = 18
  end
  object tAuxProdutoGrade: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 208
    Data = {
      880000009619E0BD010000001800000006000000000003000000880008436F64
      4772616465040001000000000007506F736963616F0400010000000000075461
      6D616E686F010049000000010005574944544802000200060003517464080004
      00000000000B566C72556E69746172696F080004000000000008566C72546F74
      616C08000400000000000000}
    object tAuxProdutoGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tAuxProdutoGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tAuxProdutoGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 6
    end
    object tAuxProdutoGradeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tAuxProdutoGradeVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tAuxProdutoGradeVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
  end
  object dsProdutoMatTamCop: TDataSource
    DataSet = tProdutoMatTamCop
    Left = 676
    Top = 178
  end
  object tProdutoMatTamCop: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodProduto;CodCorProd;ItemMat'
    MasterFields = 'CodProduto;CodCorProd;Item'
    MasterSource = dsProdutoMatCop
    TableName = 'dbProdutoMatTam.DB'
    Left = 660
    Top = 178
    object tProdutoMatTamCopCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProdutoMatTamCopCodCorProd: TIntegerField
      FieldName = 'CodCorProd'
    end
    object tProdutoMatTamCopItemMat: TIntegerField
      FieldName = 'ItemMat'
    end
    object tProdutoMatTamCopItem: TIntegerField
      FieldName = 'Item'
    end
    object tProdutoMatTamCopCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tProdutoMatTamCopPosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tProdutoMatTamCopQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tProdutoMatTamCopVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tProdutoMatTamCopVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
  end
  object dsProdutoMatCop: TDataSource
    DataSet = tProdutoMatCop
    Left = 644
    Top = 210
  end
  object tProdutoMatCop: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodProduto;CodCorProd'
    MasterFields = 'CodProduto;CodCor'
    MasterSource = dsProdutoCorCop
    TableName = 'dbProdutoMat.DB'
    Left = 620
    Top = 210
    object tProdutoMatCopCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProdutoMatCopCodCorProd: TIntegerField
      FieldName = 'CodCorProd'
    end
    object tProdutoMatCopItem: TIntegerField
      FieldName = 'Item'
    end
    object tProdutoMatCopCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tProdutoMatCopCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tProdutoMatCopCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tProdutoMatCopQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tProdutoMatCopVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tProdutoMatCopVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tProdutoMatCopCodPosicao: TIntegerField
      FieldName = 'CodPosicao'
    end
    object tProdutoMatCopImpTalao: TStringField
      FieldName = 'ImpTalao'
      Size = 1
    end
    object tProdutoMatCopUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
  end
  object tProdutoMatTamIns: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodProduto;CodCorProd;ItemMat'
    MasterFields = 'CodProduto;CodCorProd;Item'
    MasterSource = DM1.dsProdutoMat
    TableName = 'dbProdutoMatTam.db'
    Left = 558
    Top = 412
    object tProdutoMatTamInsCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProdutoMatTamInsCodCorProd: TIntegerField
      FieldName = 'CodCorProd'
    end
    object tProdutoMatTamInsItemMat: TIntegerField
      FieldName = 'ItemMat'
    end
    object tProdutoMatTamInsItem: TIntegerField
      FieldName = 'Item'
    end
    object tProdutoMatTamInsCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tProdutoMatTamInsPosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tProdutoMatTamInsQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tProdutoMatTamInsVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tProdutoMatTamInsVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
  end
  object tProdutoMatIns: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodProduto;CodCorProd'
    MasterFields = 'CodProduto;CodCor'
    MasterSource = DM1.dsProdutoCor
    TableName = 'dbProdutoMat.DB'
    Left = 590
    Top = 412
    object tProdutoMatInsCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProdutoMatInsCodCorProd: TIntegerField
      FieldName = 'CodCorProd'
    end
    object tProdutoMatInsItem: TIntegerField
      FieldName = 'Item'
    end
    object tProdutoMatInsCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tProdutoMatInsCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tProdutoMatInsCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tProdutoMatInsQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tProdutoMatInsVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tProdutoMatInsVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
  end
  object dsAuxProdutoGrade: TDataSource
    Left = 622
    Top = 412
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsMaterial
    Filter.Strings = (
      'MaterialOutros = '#39'M'#39' and Inativo = False')
    Left = 549
    Top = 454
  end
  object sdsMaterialFB: TSQLDataSet
    CommandText = 
      'SELECT CODIGO, NOME, NOMESEMACENTO'#13#10'FROM MATERIAL'#13#10'WHERE INATIVO' +
      ' = '#39'N'#39#13#10'ORDER BY NOMESEMACENTO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 384
    Top = 256
    object sdsMaterialFBCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsMaterialFBNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsMaterialFBNOMESEMACENTO: TStringField
      FieldName = 'NOMESEMACENTO'
      Size = 60
    end
  end
  object dspMaterialFB: TDataSetProvider
    DataSet = sdsMaterialFB
    Left = 424
    Top = 256
  end
  object cdsMaterialFB: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOMESEMACENTO'
    PacketRecords = 10
    Params = <>
    ProviderName = 'dspMaterialFB'
    Left = 464
    Top = 256
    object cdsMaterialFBCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsMaterialFBNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsMaterialFBNOMESEMACENTO: TStringField
      FieldName = 'NOMESEMACENTO'
      Size = 60
    end
  end
  object dsMaterialFB: TDataSource
    DataSet = cdsMaterialFB
    Left = 504
    Top = 256
  end
end
