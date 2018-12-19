object fConsMaterial: TfConsMaterial
  Left = 237
  Top = 173
  Width = 971
  Height = 480
  Caption = 'Seleciona Material'
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
    DataSource = dsqMaterial
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
    OnGetCellParams = SMDBGrid1GetCellParams
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
        Width = 58
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'Unidade'
        Title.Alignment = taCenter
        Title.Color = 16765348
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OrigemProd'
        Title.Alignment = taCenter
        Title.Caption = 'Origem'
        Title.Color = 16765348
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodClasFiscal'
        Title.Alignment = taCenter
        Title.Caption = 'NCM'
        Title.Color = 16765348
        Width = 138
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
      Alignment = taRightJustify
      Caption = 'Nome Material:'
    end
    object Label2: TLabel
      Left = 65
      Top = 16
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Shape1: TShape
      Left = 656
      Top = 37
      Width = 27
      Height = 15
      Brush.Color = clRed
    end
    object Label4: TLabel
      Left = 688
      Top = 37
      Width = 32
      Height = 13
      Caption = 'Inativo'
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
    object BitBtn1: TBitBtn
      Left = 810
      Top = 15
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
      TabOrder = 3
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
    object CheckBox1: TCheckBox
      Left = 424
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Mostrar Inativos'
      TabOrder = 2
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 104
      Top = 8
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 0
      OnKeyDown = CurrencyEdit1KeyDown
    end
  end
  object qMaterial: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Codigo, Nome, CodClasFiscal, Unidade, OrigemProd, Inativo'
      'FROM "DBMaterial.DB" DBMaterial')
    Left = 184
    Top = 152
    object qMaterialCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbMaterial.DB".Codigo'
    end
    object qMaterialNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbMaterial.DB".Nome'
      Size = 60
    end
    object qMaterialCodClasFiscal: TStringField
      FieldName = 'CodClasFiscal'
      Origin = 'TABELAS."dbMaterial.DB".CodClasFiscal'
      Size = 12
    end
    object qMaterialUnidade: TStringField
      FieldName = 'Unidade'
      Origin = 'TABELAS."dbMaterial.DB".Unidade'
      Size = 3
    end
    object qMaterialOrigemProd: TStringField
      FieldName = 'OrigemProd'
      Origin = 'TABELAS."dbMaterial.DB".OrigemProd'
      Size = 1
    end
    object qMaterialInativo: TBooleanField
      FieldName = 'Inativo'
      Origin = 'TABELAS."dbMaterial.DB".Inativo'
    end
  end
  object dsqMaterial: TDataSource
    DataSet = qMaterial
    Left = 224
    Top = 152
  end
end
