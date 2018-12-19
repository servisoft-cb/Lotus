object fZeraEstoque: TfZeraEstoque
  Left = 292
  Top = 155
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fZeraEstoque'
  ClientHeight = 449
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 41
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 392
      Top = 8
      Width = 361
      Height = 25
      Caption = 'Confirmar (Zerar Estoque) dos Materiais Selecionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 41
    Width = 920
    Height = 408
    Align = alClient
    Ctl3D = False
    DataSource = dsqEstoqueMatMov
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = True
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'codmaterial'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 391
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codcor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'icms'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ipi'
        Visible = True
      end>
  end
  object qEstoqueMatMovGrade: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'select e.codmaterial, e.codcor, sum(g.qtd2) qtd2, g.tamanho'
      'from dbestoquematmov.db e'
      'inner join dbestoquematmovgrade g'
      'on e.nummov = g.nummov'
      'group by e.codmaterial, e.codcor, g.tamanho')
    Left = 280
    Top = 128
    object qEstoqueMatMovGradecodmaterial: TIntegerField
      FieldName = 'codmaterial'
    end
    object qEstoqueMatMovGradecodcor: TIntegerField
      FieldName = 'codcor'
    end
    object qEstoqueMatMovGradeqtd2: TFloatField
      FieldName = 'qtd2'
    end
    object qEstoqueMatMovGradetamanho: TStringField
      FieldName = 'tamanho'
      Size = 3
    end
  end
  object qEstoqueMatMov: TQuery
    DatabaseName = 'Tabelas'
    Filter = 'qtd2 > 0'
    SQL.Strings = (
      
        'select e.codmaterial, e.codcor, sum(e.qtd2) qtd2, mat.unidade, m' +
        'at.icms, mat.ipi, MAT.NOME'
      'from dbestoquematmov.db e'
      'inner join dbmaterial.db mat'
      'on e.codmaterial = mat.codigo'
      
        'group by e.codmaterial, e.codcor, mat.unidade, mat.icms, mat.ipi' +
        ', MAT.NOME')
    Left = 168
    Top = 104
    object qEstoqueMatMovcodmaterial: TIntegerField
      FieldName = 'codmaterial'
    end
    object qEstoqueMatMovcodcor: TIntegerField
      FieldName = 'codcor'
    end
    object qEstoqueMatMovqtd2: TFloatField
      FieldName = 'qtd2'
      DisplayFormat = '0.000##'
    end
    object qEstoqueMatMovunidade: TStringField
      FieldName = 'unidade'
      Size = 3
    end
    object qEstoqueMatMovicms: TFloatField
      FieldName = 'icms'
    end
    object qEstoqueMatMovipi: TFloatField
      FieldName = 'ipi'
    end
    object qEstoqueMatMovNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsqEstoqueMatMov: TDataSource
    DataSet = qEstoqueMatMov
    Left = 200
    Top = 104
  end
end
