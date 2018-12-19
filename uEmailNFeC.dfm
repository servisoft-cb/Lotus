object fEmailNFeC: TfEmailNFeC
  Left = 183
  Top = 95
  Width = 710
  Height = 563
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fEmailNFeC'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 31
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 216
      Top = 3
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 291
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Ex&cel'
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Ordenar por UF'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 31
    Width = 702
    Height = 498
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 4
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAILNFE'
        Title.Caption = 'Email NFe'
        Width = 400
        Visible = True
      end>
  end
  object Query1: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT UF, NOME, EMAILNFE'
      'FROM DBCLIENTE'
      'WHERE EMAILNFE IS NOT NULL')
    Left = 368
    object Query1UF: TStringField
      FieldName = 'UF'
      Origin = 'TABELAS."DBCLIENTE.DB".Uf'
      Size = 2
    end
    object Query1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'TABELAS."DBCLIENTE.DB".Nome'
      Size = 40
    end
    object Query1EMAILNFE: TStringField
      FieldName = 'EMAILNFE'
      Origin = 'TABELAS."DBCLIENTE.DB".EmailNfe'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 392
  end
end
