object fConsMaterialPeriodo: TfConsMaterialPeriodo
  Left = 90
  Top = 59
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Materiais'
  ClientHeight = 587
  ClientWidth = 1147
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
    1147
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
    Top = 55
    Width = 1147
    Height = 532
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
    ColCount = 9
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
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Width = 182
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdEntrada'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Entrada'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdSaida'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Saidas'
        Width = 94
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Saldo'
        Title.Alignment = taCenter
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrEntrada'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Entrada'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrSaida'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Sa'#237'da'
        Width = 93
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 85
    Top = 25
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
    Left = 779
    Top = 1
    Width = 338
    Height = 16
    Anchors = [akTop, akRight]
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 183
    Top = 25
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
    Top = 25
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
  object qMovimento: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodMaterial, CodCor, ES, TipoMov, NumNota, VlrUnitario, Q' +
        'td, VlrDesconto, PercIcms'
      'FROM "DBESTOQUEMATMOV.DB" Dbestoquematmov'
      'WHERE  DtMov BETWEEN :DtInicial AND :DtFinal')
    Left = 560
    Top = 184
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
        Name = 'QtdEntrada'
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
        Name = 'VlrSaida'
        DataType = ftFloat
      end
      item
        Name = 'VlrEntrada'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mEstoqueNewRecord
    Left = 480
    Top = 184
    Data = {
      D00000009619E0BD010000001800000009000000000003000000D0000B436F64
      4D6174657269616C040001000000000006436F64436F7204000100000000000C
      4E6F6D654D6174657269616C0100490000000100055749445448020002002800
      074E6F6D65436F7201004900000001000557494454480200020014000A517464
      456E747261646108000400000000000851746453616964610800040000000000
      0553616C646F080004000000000008566C72536169646108000400000000000A
      566C72456E747261646108000400000000000000}
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
    object mEstoqueQtdEntrada: TFloatField
      FieldName = 'QtdEntrada'
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
    object mEstoqueVlrSaida: TFloatField
      FieldName = 'VlrSaida'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mEstoqueVlrEntrada: TFloatField
      FieldName = 'VlrEntrada'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsmEstoque: TDataSource
    DataSet = mEstoque
    Left = 504
    Top = 184
  end
end
