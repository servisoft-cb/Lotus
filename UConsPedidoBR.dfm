object fConsPedidoBR: TfConsPedidoBR
  Left = 124
  Top = 79
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Situa'#231#227'o dos Pedidos'
  ClientHeight = 543
  ClientWidth = 787
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
  object Label1: TLabel
    Left = 9
    Top = 9
    Width = 35
    Height = 13
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 517
    Top = 30
    Width = 74
    Height = 13
    Caption = 'Parte do Nome:'
  end
  object Label3: TLabel
    Left = 522
    Top = 9
    Width = 69
    Height = 13
    Caption = 'P.Cliente (OC):'
  end
  object Label5: TLabel
    Left = 12
    Top = 30
    Width = 32
    Height = 13
    Caption = 'Refer.:'
  end
  object Label6: TLabel
    Left = 201
    Top = 30
    Width = 40
    Height = 13
    Caption = 'Produto:'
  end
  object Label7: TLabel
    Left = 184
    Top = 521
    Width = 218
    Height = 13
    Caption = 'Notas que foram baixadas por Item do Pedido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 4
    Top = 451
    Width = 21
    Height = 15
    Brush.Color = clTeal
  end
  object Label9: TLabel
    Left = 27
    Top = 453
    Width = 42
    Height = 13
    Caption = 'Faturado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Shape2: TShape
    Left = 84
    Top = 451
    Width = 21
    Height = 15
    Brush.Color = clAqua
  end
  object Label10: TLabel
    Left = 107
    Top = 453
    Width = 59
    Height = 13
    Caption = 'Lote Gerado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Shape3: TShape
    Left = 180
    Top = 451
    Width = 21
    Height = 15
  end
  object Label11: TLabel
    Left = 203
    Top = 453
    Width = 45
    Height = 13
    Caption = 'Sem Lote'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Shape4: TShape
    Left = 260
    Top = 451
    Width = 21
    Height = 15
    Brush.Color = clRed
  end
  object Label12: TLabel
    Left = 283
    Top = 453
    Width = 51
    Height = 13
    Caption = 'Cancelado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 520
    Top = 72
    Width = 62
    Height = 13
    Caption = 'Impr. a grade'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 45
    Top = 1
    Width = 467
    Height = 21
    DropDownCount = 8
    DropDownWidth = 500
    LookupField = 'Codigo'
    LookupDisplay = 'Nome;CgcCpf'
    LookupSource = DM1.dsCliente
    TabOrder = 1
    OnEnter = RxDBLookupCombo1Enter
  end
  object Edit1: TEdit
    Left = 592
    Top = 22
    Width = 192
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 592
    Top = 1
    Width = 192
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 242
    Top = 22
    Width = 270
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsProduto
    TabOrder = 4
    OnChange = RxDBLookupCombo2Change
    OnEnter = RxDBLookupCombo2Enter
  end
  object Panel1: TPanel
    Left = 0
    Top = 55
    Width = 497
    Height = 29
    TabOrder = 6
    object BitBtn1: TBitBtn
      Left = 105
      Top = 3
      Width = 93
      Height = 23
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 198
      Top = 3
      Width = 93
      Height = 23
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 291
      Top = 3
      Width = 93
      Height = 23
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object RxDBGrid2: TRxDBGrid
    Left = 409
    Top = 448
    Width = 377
    Height = 95
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ItemNota'
        Title.Alignment = taCenter
        Title.Caption = 'Item da Nota'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtNota'
        Title.Alignment = taCenter
        Title.Caption = 'Dt.Nota'
        Width = 72
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdPares'
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade Faturada'
        Width = 124
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 593
    Top = 47
    Width = 191
    Height = 46
    Caption = ' Op'#231#227'o '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Pendentes'
      'Faturados'
      'Ambos')
    TabOrder = 5
  end
  object VDBGrid1: TVDBGrid
    Left = 0
    Top = 354
    Width = 786
    Height = 79
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Vertical = True
    DefaultColWidth = 50
    TitlesWidth = 60
    OnCellClick = VDBGrid1CellClick
    OnColEnter = VDBGrid1ColEnter
    OnEnter = VDBGrid1ColEnter
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
        Alignment = taCenter
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.'
      end>
  end
  object RxDBLookupCombo4: TRxDBLookupCombo
    Left = 45
    Top = 22
    Width = 148
    Height = 21
    DropDownCount = 8
    DropDownWidth = 300
    LookupField = 'Codigo'
    LookupDisplay = 'Referencia;DescMaterial'
    LookupSource = DM1.dsProduto
    TabOrder = 3
    OnChange = RxDBLookupCombo4Change
    OnEnter = RxDBLookupCombo4Enter
  end
  object RadioGroup2: TRadioGroup
    Left = 6
    Top = 469
    Width = 397
    Height = 51
    Caption = ' Ordenar a consulta por '
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      'Dt.Emiss'#227'o'
      'OC (Ped.Cliente)'
      'Produto')
    TabOrder = 9
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 94
    Width = 785
    Height = 258
    DataSource = dsqConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 10
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
    Groupings = <
      item
        Expression = 'aaa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Color = 10930928
      end>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 18
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Data Emiss'#227'o'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PedidoCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Pedido Cliente'
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodProduto'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Produto'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdPares'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.'
        Width = 53
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdParesFat'
        Title.Alignment = taCenter
        Title.Caption = 'Q. Entregue'
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdParesRest'
        Title.Alignment = taCenter
        Title.Caption = 'Q. Pendente'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fantasia'
        Title.Alignment = taCenter
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProduto'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Produto'
        Width = 284
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Desc. Material'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Cor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdParesCanc'
        Title.Alignment = taCenter
        Title.Caption = 'Q. Cancelada'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pedido'
        Title.Alignment = taCenter
        Title.Caption = 'Ped. Interno'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cliente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtIniEmbarque'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Inicial Embarque'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtFinEmbarque'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Final Embarque'
        Width = 65
        Visible = True
      end>
  end
  object CheckBox1: TCheckBox
    Left = 503
    Top = 71
    Width = 17
    Height = 17
    TabOrder = 11
  end
  object qConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbpedido.Pedido, Dbpedido.PedidoCliente, Dbpedido.CodClie' +
        'nte, Dbcliente.Nome NomeCliente, Dbpedidoitem.Item, Dbpedidoitem' +
        '.CodProduto, Dbpedidoitem.CodCor, Dbpedidoitem.QtdPares, Dbpedid' +
        'oitem.QtdParesFat, Dbpedidoitem.QtdParesRest, Dbpedidoitem.QtdPa' +
        'resCanc, Dbpedidoitem.CodGrade, Dbpedido.DtEmissao, Dbcliente.Fa' +
        'ntasia, Dbproduto.Referencia, Dbproduto.Nome NomeProduto, Dbprod' +
        'uto.DescMaterial, Dbpedidoitem.LoteGer, Dbpedido.DtIniEmbarque, ' +
        'Dbpedido.DtFinEmbarque'
      'FROM "dbPedido.DB" Dbpedido'
      '   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem'
      '   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)  '
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)  '
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)  ')
    Left = 336
    Top = 208
    object qConsultaPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qConsultaPedidoCliente: TIntegerField
      FieldName = 'PedidoCliente'
    end
    object qConsultaCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object qConsultaNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object qConsultaItem: TIntegerField
      FieldName = 'Item'
    end
    object qConsultaCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object qConsultaCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qConsultaQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object qConsultaQtdParesFat: TFloatField
      FieldName = 'QtdParesFat'
    end
    object qConsultaQtdParesRest: TFloatField
      FieldName = 'QtdParesRest'
    end
    object qConsultaQtdParesCanc: TFloatField
      FieldName = 'QtdParesCanc'
    end
    object qConsultaCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object qConsultaDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object qConsultaFantasia: TStringField
      FieldName = 'Fantasia'
    end
    object qConsultaReferencia: TStringField
      FieldName = 'Referencia'
    end
    object qConsultaNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object qConsultaDescMaterial: TStringField
      FieldName = 'DescMaterial'
      Size = 10
    end
    object qConsultaLoteGer: TBooleanField
      FieldName = 'LoteGer'
    end
    object qConsultalkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 30
      Lookup = True
    end
    object qConsultaDtIniEmbarque: TDateField
      FieldName = 'DtIniEmbarque'
    end
    object qConsultaDtFinEmbarque: TDateField
      FieldName = 'DtFinEmbarque'
    end
  end
  object dsqConsulta: TDataSource
    DataSet = qConsulta
    Left = 352
    Top = 208
  end
  object tPedidoNota: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Pedido;Item'
    MasterFields = 'Pedido;Item'
    MasterSource = dsqConsulta
    TableName = 'dbPedidoNota.DB'
    Left = 448
    Top = 472
    object tPedidoNotaPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tPedidoNotaItem: TIntegerField
      FieldName = 'Item'
    end
    object tPedidoNotaNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
    end
    object tPedidoNotaItemNota: TIntegerField
      FieldName = 'ItemNota'
    end
    object tPedidoNotaDtNota: TDateField
      FieldName = 'DtNota'
    end
    object tPedidoNotaQtdPares: TIntegerField
      FieldName = 'QtdPares'
    end
    object tPedidoNotaNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tPedidoNotaNroLancExtComissaoMod: TIntegerField
      FieldName = 'NroLancExtComissaoMod'
    end
    object tPedidoNotaNumNota: TIntegerField
      FieldName = 'NumNota'
    end
  end
  object dsPedidoNota: TDataSource
    DataSet = tPedidoNota
    Left = 472
    Top = 472
  end
  object tPedidoGrade: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Pedido;ItemPed'
    MasterFields = 'Pedido;Item'
    MasterSource = dsqConsulta
    TableName = 'DBPEDIDOGRADE.DB'
    Left = 360
    Top = 392
    object tPedidoGradePedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tPedidoGradeItemPed: TIntegerField
      FieldName = 'ItemPed'
    end
    object tPedidoGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tPedidoGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tPedidoGradeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tPedidoGradelkTamanho: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTamanho'
      LookupDataSet = DM1.tGradeItemlk
      LookupKeyFields = 'CodGrade; Posicao'
      LookupResultField = 'Tamanho'
      KeyFields = 'CodGrade; Posicao'
      Size = 5
      Lookup = True
    end
  end
  object dsPedidoGrade: TDataSource
    DataSet = tPedidoGrade
    Left = 384
    Top = 392
  end
  object mResumo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodProduto'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NomeProduto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NumOS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'QtdTotal'
        DataType = ftFloat
      end
      item
        Name = 'QtdFaturada'
        DataType = ftFloat
      end
      item
        Name = 'PercRestante'
        DataType = ftFloat
      end
      item
        Name = 'QtdRestante'
        DataType = ftFloat
      end
      item
        Name = 'NomeCor'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CodCor'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'NumOS'
    Params = <>
    StoreDefs = True
    Left = 552
    Top = 352
    Data = {
      150100009619E0BD01000000180000000A00000000000300000015010A436F64
      50726F6475746F04000100000000000A5265666572656E636961010049000000
      01000557494454480200020014000B4E6F6D6550726F6475746F010049000000
      0100055749445448020002002800054E756D4F53010049000000010005574944
      5448020002001E0008517464546F74616C08000400000000000B517464466174
      757261646108000400000000000C5065726352657374616E7465080004000000
      00000B51746452657374616E74650800040000000000074E6F6D65436F720100
      49000000010005574944544802000200190006436F64436F7204000100000000
      0001000D44454641554C545F4F524445520200820000000000}
    object mResumoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object mResumoReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mResumoNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object mResumoNumOS: TStringField
      FieldName = 'NumOS'
      Size = 30
    end
    object mResumoQtdTotal: TFloatField
      FieldName = 'QtdTotal'
      DisplayFormat = '0.###'
    end
    object mResumoQtdFaturada: TFloatField
      FieldName = 'QtdFaturada'
      DisplayFormat = '0.###'
    end
    object mResumoPercRestante: TFloatField
      FieldName = 'PercRestante'
      DisplayFormat = '0.##'
    end
    object mResumoQtdRestante: TFloatField
      FieldName = 'QtdRestante'
      DisplayFormat = '0.###'
    end
    object mResumoNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 25
    end
    object mResumoCodCor: TIntegerField
      FieldName = 'CodCor'
    end
  end
  object dsmResumo: TDataSource
    DataSet = mResumo
    Left = 568
    Top = 352
  end
end
