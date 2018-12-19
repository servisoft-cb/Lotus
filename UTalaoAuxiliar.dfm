object fTalaoAuxiliar: TfTalaoAuxiliar
  Left = 123
  Top = 12
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tal'#227'o Auxiliar'
  ClientHeight = 663
  ClientWidth = 968
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 571
    Top = 192
    Width = 25
    Height = 19
    Brush.Color = clYellow
  end
  object Label1: TLabel
    Left = 598
    Top = 196
    Width = 119
    Height = 13
    Caption = 'N'#227'o imprime tal'#227'o auxiliar'
  end
  object SMDBGrid1: TSMDBGrid
    Left = 584
    Top = 0
    Width = 364
    Height = 169
    DataSource = fConsLoteExp.dsLote
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 0
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    RowCount = 9
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Lote'
        Title.Alignment = taCenter
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdTaloes'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Taloes'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdPares'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pares'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmbarque'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Embarque'
        Width = 93
        Visible = True
      end>
  end
  object SMDBGrid2: TSMDBGrid
    Left = 0
    Top = 0
    Width = 569
    Height = 169
    DataSource = DM1.dsPedidoItem
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    OnChangeSelection = SMDBGrid2ChangeSelection
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Title.Caption = 'Item Pedido'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkReferencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkDescMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Desc. Material'
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdPares'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pares'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da Cor'
        Width = 199
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 3
    Top = 184
    Width = 109
    Height = 29
    Caption = 'Gerar Tal'#227'o Auxiliar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 111
    Top = 184
    Width = 109
    Height = 29
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 219
    Top = 184
    Width = 109
    Height = 29
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object SMDBGrid3: TSMDBGrid
    Left = 0
    Top = 216
    Width = 968
    Height = 355
    Align = alBottom
    DataSource = dsTalaoAuxiliar
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
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
    OnGetCellParams = SMDBGrid3GetCellParams
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
        FieldName = 'Lote'
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodSetor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Setor'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeSetor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Setor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ItemTalao'
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Width = 29
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Talao'
        Title.Alignment = taCenter
        Title.Caption = 'Tal'#227'o'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'lkMarcarTam'
        Title.Alignment = taCenter
        Title.Caption = 'Marcar Tamanho'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdPares'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pares'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tamanho'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEntrada'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Entrada Setor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrEntrada'
        Title.Alignment = taCenter
        Title.Caption = 'Hr. Entrada'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtSaida'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Saida Setor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrSaida'
        Title.Alignment = taCenter
        Title.Caption = 'Hr. Saida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeAtelier'
        Title.Alignment = taCenter
        Title.Caption = 'Atelier'
        Visible = True
      end>
  end
  object VDBGrid1: TVDBGrid
    Left = 0
    Top = 571
    Width = 968
    Height = 92
    Align = alBottom
    DataSource = dsTalaoAuxiliarGrade
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Vertical = True
    DefaultColWidth = 52
    TitlesWidth = 57
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'Tamanho'
        Title.Alignment = taCenter
        Title.Caption = 'Tam.'
        Title.Color = clMenu
      end
      item
        Alignment = taCenter
        FieldName = 'lkMarcarTam'
        Title.Alignment = taCenter
        Title.Caption = 'Marcar'
      end
      item
        Alignment = taCenter
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde.'
        Title.Color = clMenu
      end>
  end
  object BitBtn4: TBitBtn
    Left = 722
    Top = 184
    Width = 121
    Height = 29
    Caption = 'Excluir Auxiliar do Lote'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 842
    Top = 184
    Width = 121
    Height = 29
    Caption = 'Excluir Auxiliar Geral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn5Click
  end
  object tTalaoAuxiliar: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;CodSetor;ItemTalao;Talao'
    MasterFields = 'Lote'
    MasterSource = fConsLoteExp.dsLote
    TableName = 'dbTalaoAuxiliar.db'
    Left = 192
    Top = 352
    object tTalaoAuxiliarLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoAuxiliarCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tTalaoAuxiliarItemTalao: TIntegerField
      FieldName = 'ItemTalao'
    end
    object tTalaoAuxiliarTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoAuxiliarCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tTalaoAuxiliarCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tTalaoAuxiliarQtdPares: TIntegerField
      FieldName = 'QtdPares'
    end
    object tTalaoAuxiliarCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoAuxiliarPosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoAuxiliarTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object tTalaoAuxiliarCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object tTalaoAuxiliarPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tTalaoAuxiliarItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object tTalaoAuxiliarCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tTalaoAuxiliarDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object tTalaoAuxiliarHrEntrada: TTimeField
      FieldName = 'HrEntrada'
    end
    object tTalaoAuxiliarDtSaida: TDateField
      FieldName = 'DtSaida'
    end
    object tTalaoAuxiliarHrSaida: TTimeField
      FieldName = 'HrSaida'
    end
    object tTalaoAuxiliarOpcaoLoteTalao: TStringField
      FieldName = 'OpcaoLoteTalao'
      Size = 1
    end
    object tTalaoAuxiliarlkNomeSetor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeSetor'
      LookupDataSet = DM1.tSetor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodSetor'
      Size = 30
      Lookup = True
    end
    object tTalaoAuxiliarlkNomeAtelier: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeAtelier'
      LookupDataSet = DM1.tAtelier2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Atelier'
      KeyFields = 'CodAtelier'
      Size = 30
      Lookup = True
    end
    object tTalaoAuxiliarlkMarcarTam: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMarcarTam'
      LookupDataSet = DM1.tGradeItemlk
      LookupKeyFields = 'CodGrade;Posicao'
      LookupResultField = 'MarcarTam'
      KeyFields = 'CodGrade;Posicao'
      Size = 3
      Lookup = True
    end
    object tTalaoAuxiliarlkCodPosicaoMat: TIntegerField
      FieldKind = fkLookup
      FieldName = 'lkCodPosicaoMat'
      LookupDataSet = DM1.tSetor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CodPosicaoMat'
      KeyFields = 'CodSetor'
      Lookup = True
    end
    object tTalaoAuxiliarlkImpTalao: TBooleanField
      FieldKind = fkLookup
      FieldName = 'lkImpTalao'
      LookupDataSet = DM1.tSetor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'ImpTalao'
      KeyFields = 'CodSetor'
      Lookup = True
    end
    object tTalaoAuxiliarlkImpFotoTalaoAux: TBooleanField
      FieldKind = fkLookup
      FieldName = 'lkImpFotoTalaoAux'
      LookupDataSet = DM1.tSetor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'ImpFotoTalaoAux'
      KeyFields = 'CodSetor'
      Lookup = True
    end
  end
  object dsTalaoAuxiliar: TDataSource
    DataSet = tTalaoAuxiliar
    Left = 216
    Top = 352
  end
  object tTalaoAuxiliarGrade: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;CodSetor;CodGrade;Posicao'
    MasterFields = 'Lote;CodSetor'
    MasterSource = dsTalaoAuxiliar
    TableName = 'dbTalaoAuxiliarGrade.db'
    Left = 256
    Top = 352
    object tTalaoAuxiliarGradeLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoAuxiliarGradeCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tTalaoAuxiliarGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoAuxiliarGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoAuxiliarGradeQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tTalaoAuxiliarGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object tTalaoAuxiliarGradelkMarcarTam: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMarcarTam'
      LookupDataSet = DM1.tGradeItemlk
      LookupKeyFields = 'CodGrade;Posicao'
      LookupResultField = 'MarcarTam'
      KeyFields = 'CodGrade;Posicao'
      Size = 3
      Lookup = True
    end
  end
  object dsTalaoAuxiliarGrade: TDataSource
    DataSet = tTalaoAuxiliarGrade
    Left = 288
    Top = 352
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsSetor
    Filter.Strings = (
      'ImpTalaoAuxiliar = True')
    Left = 504
    Top = 88
  end
  object tProdutoSetorAux: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodProduto;Item'
    MasterFields = 'CodProduto'
    MasterSource = DM1.dsPedidoItem
    TableName = 'dbProdutoSetorAux.DB'
    Left = 480
    Top = 328
    object tProdutoSetorAuxCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tProdutoSetorAuxItem: TIntegerField
      FieldName = 'Item'
    end
    object tProdutoSetorAuxCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tProdutoSetorAuxCapacidadeDia: TIntegerField
      FieldName = 'CapacidadeDia'
    end
    object tProdutoSetorAuxlkOpcaoTalaoAuxiliar: TStringField
      FieldKind = fkLookup
      FieldName = 'lkOpcaoTalaoAuxiliar'
      LookupDataSet = DM1.tSetor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'OpcaoTalaoAuxiliar'
      KeyFields = 'CodSetor'
      Size = 1
      Lookup = True
    end
  end
end
