object fSel_Produto: TfSel_Produto
  Left = 237
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Seleciona Produto'
  ClientHeight = 442
  ClientWidth = 955
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 56
    Width = 955
    Height = 386
    Align = alClient
    Ctl3D = False
    DataSource = dsqProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    OnKeyDown = SMDBGrid1KeyDown
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Color = 16765348
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Title.Color = 16765348
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Desc. Material'
        Title.Color = 16765348
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Title.Color = 16765348
        Width = 421
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeModelo'
        Title.Alignment = taCenter
        Title.Caption = 'Modelo'
        Title.Color = 16765348
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 955
    Height = 56
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 37
      Width = 71
      Height = 13
      Caption = 'Nome Produto:'
    end
    object Label2: TLabel
      Left = 49
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object Edit1: TEdit
      Left = 103
      Top = 30
      Width = 425
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 103
      Top = 9
      Width = 130
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = Edit2KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 530
      Top = 23
      Width = 119
      Height = 29
      Hint = 'Abre a consulta'
      Caption = '&Consultar  [F5]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
    end
  end
  object qProduto: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Codigo, Referencia, Nome, NomeModelo, DescMaterial'
      'FROM "DBPRODUTO.DB" Dbproduto')
    Left = 184
    Top = 152
    object qProdutoCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbProduto.DB".Codigo'
    end
    object qProdutoReferencia: TStringField
      FieldName = 'Referencia'
      Origin = 'TABELAS."dbProduto.DB".Referencia'
      Size = 8
    end
    object qProdutoNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbProduto.DB".Nome'
      Size = 40
    end
    object qProdutoNomeModelo: TStringField
      FieldName = 'NomeModelo'
      Origin = 'TABELAS."dbProduto.DB".NomeModelo'
      Size = 40
    end
    object qProdutoDescMaterial: TStringField
      FieldName = 'DescMaterial'
      Origin = 'TABELAS."dbProduto.DB".DescMaterial'
      Size = 10
    end
  end
  object dsqProduto: TDataSource
    DataSet = qProduto
    Left = 224
    Top = 152
  end
end
