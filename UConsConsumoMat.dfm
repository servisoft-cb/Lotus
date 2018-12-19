object fConsConsumoMat: TfConsConsumoMat
  Left = 101
  Top = 54
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Materiais'
  ClientHeight = 587
  ClientWidth = 845
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
  DesignSize = (
    845
    587)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 9
    Width = 56
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label2: TLabel
    Left = 192
    Top = 9
    Width = 51
    Height = 13
    Caption = 'Data Final:'
  end
  object DateEdit1: TDateEdit
    Left = 85
    Top = 1
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DateEdit2: TDateEdit
    Left = 245
    Top = 1
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 77
    Width = 845
    Height = 510
    Align = alBottom
    DataSource = dsmEstoque
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecoCustoMedio'
        Title.Alignment = taCenter
        Title.Caption = 'Custo M'#233'dio'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdAnt'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Anterior'
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdEntradaNota'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Entrada Notas'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdEntradaOutros'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Outras Entradas'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdSaida'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Saidas'
        Width = 79
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Saldo'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 85
    Top = 48
    Width = 98
    Height = 25
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object ProgressBar1: TProgressBar
    Left = 517
    Top = 1
    Width = 328
    Height = 16
    Anchors = [akTop, akRight]
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 183
    Top = 48
    Width = 98
    Height = 25
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
    Left = 281
    Top = 48
    Width = 98
    Height = 25
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
  object ProgressBar2: TProgressBar
    Left = 517
    Top = 18
    Width = 328
    Height = 16
    Anchors = [akTop, akRight]
    TabOrder = 7
  end
  object CheckBox1: TCheckBox
    Left = 85
    Top = 27
    Width = 218
    Height = 17
    Caption = 'Mostrar s'#243' os materiais com movimento'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object qSaldoAnt: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodMaterial, CodCor, SUM( Qtd ) Qtd, VlrUnitario, PercIcm' +
        's, VlrDesconto, ES'
      'FROM "DBESTOQUEMATMOV.DB" Dbestoquematmov'
      'WHERE  (DtMov < :DtMov)  '
      
        'GROUP BY CodMaterial, CodCor, VlrUnitario, PercIcms, VlrDesconto' +
        ', ES')
    Left = 568
    Top = 184
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtMov'
        ParamType = ptUnknown
      end>
    object qSaldoAntCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".CodMaterial'
    end
    object qSaldoAntCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".CodCor'
    end
    object qSaldoAntlkNomeMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeMaterial'
      LookupDataSet = DM1.tMaterial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodMaterial'
      Size = 40
      Lookup = True
    end
    object qSaldoAntlkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Lookup = True
    end
    object qSaldoAntlkInativo: TBooleanField
      FieldKind = fkLookup
      FieldName = 'lkInativo'
      LookupDataSet = DM1.tMaterial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Inativo'
      KeyFields = 'CodMaterial'
      Lookup = True
    end
    object qSaldoAntVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".VlrUnitario'
    end
    object qSaldoAntPercIcms: TFloatField
      FieldName = 'PercIcms'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".PercIcms'
    end
    object qSaldoAntVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".VlrDesconto'
    end
    object qSaldoAntQtd: TFloatField
      FieldName = 'Qtd'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".Qtd'
    end
    object qSaldoAntES: TStringField
      FieldName = 'ES'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".ES'
      Size = 1
    end
  end
  object qMovimento: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodMaterial, CodCor, ES, TipoMov, NumNota, VlrUnitario, Q' +
        'td, VlrDesconto, PercIcms'
      'FROM "DBESTOQUEMATMOV.DB" Dbestoquematmov'
      'WHERE  DtMov BETWEEN :DtInicial AND :DtFinal')
    Left = 568
    Top = 216
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DtFinal'
        ParamType = ptUnknown
      end>
    object qMovimentoCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".CodMaterial'
    end
    object qMovimentoCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".CodCor'
    end
    object qMovimentoES: TStringField
      FieldName = 'ES'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".ES'
      Size = 1
    end
    object qMovimentoTipoMov: TStringField
      FieldName = 'TipoMov'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".TipoMov'
      Size = 3
    end
    object qMovimentoNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".NumNota'
    end
    object qMovimentoVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".VlrUnitario'
    end
    object qMovimentoQtd: TFloatField
      FieldName = 'Qtd'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".Qtd'
      DisplayFormat = '0.00000'
    end
    object qMovimentolkNomeMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeMaterial'
      LookupDataSet = DM1.tMaterial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodMaterial'
      Size = 40
      Lookup = True
    end
    object qMovimentolkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Lookup = True
    end
    object qMovimentolkInativo: TBooleanField
      FieldKind = fkLookup
      FieldName = 'lkInativo'
      LookupDataSet = DM1.tMaterial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Inativo'
      KeyFields = 'CodMaterial'
      Lookup = True
    end
    object qMovimentoVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".VlrDesconto'
    end
    object qMovimentoPercIcms: TFloatField
      FieldName = 'PercIcms'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".PercIcms'
    end
  end
  object mEstoque: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodMaterial'
        DataType = ftInteger
      end
      item
        Name = 'CodCor'
        DataType = ftInteger
      end
      item
        Name = 'NomeMaterial'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NomeCor'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QtdAnt'
        DataType = ftFloat
      end
      item
        Name = 'QtdEntradaNota'
        DataType = ftFloat
      end
      item
        Name = 'QtdEntradaOutros'
        DataType = ftFloat
      end
      item
        Name = 'QtdSaida'
        DataType = ftFloat
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'VlrAnt'
        DataType = ftFloat
      end
      item
        Name = 'VlrEntradaNotas'
        DataType = ftFloat
      end
      item
        Name = 'VlrSaida'
        DataType = ftFloat
      end
      item
        Name = 'VlrSaldo'
        DataType = ftFloat
      end
      item
        Name = 'PrecoCustoMedio'
        DataType = ftFloat
      end
      item
        Name = 'QtdEntradaAnt'
        DataType = ftFloat
      end
      item
        Name = 'QtdSaidaAnt'
        DataType = ftFloat
      end
      item
        Name = 'VlrAntEntrada'
        DataType = ftFloat
      end
      item
        Name = 'VlrEntradaTotal'
        DataType = ftFloat
      end
      item
        Name = 'VlrAntMedio'
        DataType = ftFloat
      end
      item
        Name = 'VlrMovimentoMedio'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mEstoqueNewRecord
    Left = 480
    Top = 184
    Data = {
      BF0100009619E0BD010000001800000014000000000003000000BF010B436F64
      4D6174657269616C040001000000000006436F64436F7204000100000000000C
      4E6F6D654D6174657269616C0100490000000100055749445448020002002800
      074E6F6D65436F72010049000000010005574944544802000200140006517464
      416E7408000400000000000E517464456E74726164614E6F7461080004000000
      000010517464456E74726164614F7574726F7308000400000000000851746453
      6169646108000400000000000553616C646F080004000000000006566C72416E
      7408000400000000000F566C72456E74726164614E6F74617308000400000000
      0008566C725361696461080004000000000008566C7253616C646F0800040000
      0000000F507265636F437573746F4D6564696F08000400000000000D51746445
      6E7472616461416E7408000400000000000B5174645361696461416E74080004
      00000000000D566C72416E74456E747261646108000400000000000F566C7245
      6E7472616461546F74616C08000400000000000B566C72416E744D6564696F08
      0004000000000011566C724D6F76696D656E746F4D6564696F08000400000000
      000000}
    object mEstoqueCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object mEstoqueCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object mEstoqueNomeMaterial: TStringField
      FieldName = 'NomeMaterial'
      Size = 40
    end
    object mEstoqueNomeCor: TStringField
      FieldName = 'NomeCor'
    end
    object mEstoqueQtdAnt: TFloatField
      FieldName = 'QtdAnt'
      DisplayFormat = '###,###,##0.000###'
    end
    object mEstoqueQtdEntradaNota: TFloatField
      FieldName = 'QtdEntradaNota'
      DisplayFormat = '###,###,##0.000###'
    end
    object mEstoqueQtdEntradaOutros: TFloatField
      FieldName = 'QtdEntradaOutros'
      DisplayFormat = '###,###,##0.000###'
    end
    object mEstoqueQtdSaida: TFloatField
      FieldName = 'QtdSaida'
      DisplayFormat = '###,###,##0.000###'
    end
    object mEstoqueSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,###,##0.000###'
    end
    object mEstoqueVlrAnt: TFloatField
      FieldName = 'VlrAnt'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrEntradaNotas: TFloatField
      FieldName = 'VlrEntradaNotas'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrSaida: TFloatField
      FieldName = 'VlrSaida'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrSaldo: TFloatField
      FieldName = 'VlrSaldo'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoquePrecoCustoMedio: TFloatField
      FieldName = 'PrecoCustoMedio'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueQtdEntradaAnt: TFloatField
      FieldName = 'QtdEntradaAnt'
    end
    object mEstoqueQtdSaidaAnt: TFloatField
      FieldName = 'QtdSaidaAnt'
    end
    object mEstoqueVlrAntEntrada: TFloatField
      FieldName = 'VlrAntEntrada'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrEntradaTotal: TFloatField
      FieldName = 'VlrEntradaTotal'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrAntMedio: TFloatField
      FieldName = 'VlrAntMedio'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrMovimentoMedio: TFloatField
      FieldName = 'VlrMovimentoMedio'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsmEstoque: TDataSource
    DataSet = mEstoque
    Left = 504
    Top = 184
  end
end
