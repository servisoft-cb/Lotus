object fConsMaterialFicha: TfConsMaterialFicha
  Left = 89
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta materiais dentro da ficha t'#233'cnica'
  ClientHeight = 483
  ClientWidth = 784
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
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 72
    Width = 784
    Height = 411
    Align = alClient
    DataSource = dsqConsulta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 137
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodProduto'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Produto'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProduto'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Produto'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCorProduto'
        Title.Alignment = taCenter
        Title.Caption = 'Cor do Produto'
        Width = 210
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCorProd'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cor Produto'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Consumo'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeCorMat'
        Title.Alignment = taCenter
        Title.Caption = 'Cor Material'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 72
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 33
      Width = 40
      Height = 13
      Caption = 'Material:'
    end
    object Label2: TLabel
      Left = 9
      Top = 11
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 26
      Top = 55
      Width = 19
      Height = 13
      Caption = 'Cor:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 46
      Top = 25
      Width = 342
      Height = 21
      DropDownCount = 8
      DropDownWidth = 500
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsMaterial
      TabOrder = 0
      OnEnter = RxDBLookupCombo1Enter
      OnExit = RxDBLookupCombo1Exit
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 46
      Top = 3
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 1
      OnExit = CurrencyEdit1Exit
    end
    object BitBtn1: TBitBtn
      Left = 390
      Top = 40
      Width = 80
      Height = 28
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 470
      Top = 40
      Width = 80
      Height = 28
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 46
      Top = 47
      Width = 342
      Height = 21
      DropDownCount = 8
      DropDownWidth = 500
      LookupField = 'CodCor'
      LookupDisplay = 'Nome'
      LookupSource = dsqCor
      TabOrder = 4
      OnEnter = RxDBLookupCombo2Enter
    end
    object CheckBox1: TCheckBox
      Left = 288
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Mostrar Inativos'
      TabOrder = 5
      OnClick = CheckBox1Click
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsMaterial
    Filter.Strings = (
      'Inativo <> True')
    Left = 652
    Top = 10
  end
  object qCor: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbcor.Nome, DbMaterialCor.CodCor'
      'FROM "DbMaterialCor.DB" DbMaterialCor'
      '   INNER JOIN "Dbcor.DB" Dbcor'
      '   ON  (DbMaterialCor.CodCor = Dbcor.Codigo)  '
      'WHERE  DbMaterialCor.CodMaterial = :CodMaterial'
      'ORDER BY Dbcor.Nome')
    Left = 504
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodMaterial'
        ParamType = ptUnknown
      end>
    object qCorNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCor.DB".Nome'
      Size = 15
    end
    object qCorCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."DbMaterialCor.DB".CodCor'
    end
  end
  object dsqCor: TDataSource
    DataSet = qCor
    Left = 520
    Top = 72
  end
  object dsqConsulta: TDataSource
    DataSet = qConsulta
    Left = 488
    Top = 184
  end
  object qConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbprodutomat.CodProduto, Dbproduto.Referencia, Dbprodutom' +
        'at.CodMaterial, Dbproduto.Nome NomeProduto, Dbprodutomat.CodCorP' +
        'rod, Dbcor.Nome NomeCorProduto, Dbprodutomat.Qtd, Dbprodutomat.C' +
        'odCor CodCorMaterial'
      'FROM "dbProdutoMat.DB" Dbprodutomat'
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbprodutomat.CodProduto = Dbproduto.Codigo)  '
      '   INNER JOIN "Dbcor.DB" Dbcor'
      '   ON  (Dbprodutomat.CodCorProd = Dbcor.Codigo)  ')
    Left = 464
    Top = 184
    object qConsultaCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object qConsultaReferencia: TStringField
      FieldName = 'Referencia'
      Size = 8
    end
    object qConsultaCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object qConsultaNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object qConsultaCodCorProd: TIntegerField
      FieldName = 'CodCorProd'
    end
    object qConsultaNomeCorProduto: TStringField
      FieldName = 'NomeCorProduto'
      Size = 15
    end
    object qConsultaQtd: TFloatField
      FieldName = 'Qtd'
    end
    object qConsultaCodCorMaterial: TIntegerField
      FieldName = 'CodCorMaterial'
    end
    object qConsultalkNomeCorMat: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCorMat'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCorMaterial'
      Size = 30
      Lookup = True
    end
  end
end
