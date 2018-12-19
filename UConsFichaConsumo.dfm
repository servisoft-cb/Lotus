object fConsFichaConsumo: TfConsFichaConsumo
  Left = 197
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Ficha Consumo'
  ClientHeight = 499
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 147
    Top = 16
    Width = 55
    Height = 13
    Caption = 'Refer'#234'ncia:'
  end
  object Label3: TLabel
    Left = 22
    Top = 40
    Width = 38
    Height = 13
    Caption = 'Modelo:'
  end
  object Label4: TLabel
    Left = 3
    Top = 64
    Width = 57
    Height = 13
    Caption = 'Constru'#231#227'o:'
  end
  object Label9: TLabel
    Left = 291
    Top = 64
    Width = 59
    Height = 13
    Caption = 'Ordenar por:'
  end
  object Label6: TLabel
    Left = 332
    Top = 16
    Width = 18
    Height = 13
    Caption = 'Cia:'
  end
  object Label8: TLabel
    Left = 306
    Top = 40
    Width = 44
    Height = 13
    Caption = 'Dt. Mov.:'
  end
  object Label7: TLabel
    Left = 5
    Top = 16
    Width = 55
    Height = 13
    Caption = 'Num. Mov.:'
  end
  object Edit1: TEdit
    Left = 205
    Top = 8
    Width = 77
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 61
    Top = 32
    Width = 221
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 61
    Top = 56
    Width = 221
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 616
    Top = 0
    Width = 169
    Height = 42
    TabOrder = 8
    object BitBtn1: TBitBtn
      Left = 9
      Top = 7
      Width = 75
      Height = 28
      Caption = 'Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 84
      Top = 7
      Width = 75
      Height = 28
      Caption = 'Fechar'
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
  object StaticText1: TStaticText
    Left = 0
    Top = 482
    Width = 785
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 
      'Duplo clique ou Enter no registro para fazer a consulta do cadas' +
      'tro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object ComboBox2: TComboBox
    Left = 352
    Top = 56
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = 'Num. Mov.'
    OnExit = ComboBox2Exit
    Items.Strings = (
      'Num. Mov.'
      'Refer'#234'ncia'
      'Modelo'
      'Constru'#231#227'o'
      'Cia'
      'Dt. Mov')
  end
  object SMDBGrid2: TSMDBGrid
    Left = 0
    Top = 88
    Width = 785
    Height = 394
    Align = alBottom
    DataSource = dsqFichaConsumo
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid2DblClick
    OnKeyPress = SMDBGrid2KeyPress
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
    ColCount = 7
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumMov'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Mov.'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Title.Alignment = taCenter
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Construcao'
        Title.Alignment = taCenter
        Title.Caption = 'Constru'#231#227'o'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cia'
        Title.Alignment = taCenter
        Title.Caption = 'CIA'
        Width = 199
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtMov'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Mov.'
        Visible = True
      end>
  end
  object Edit4: TEdit
    Left = 352
    Top = 8
    Width = 244
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object DateEdit1: TDateEdit
    Left = 352
    Top = 32
    Width = 89
    Height = 21
    NumGlyphs = 2
    StartOfWeek = Sun
    TabOrder = 5
  end
  object Edit6: TEdit
    Left = 61
    Top = 8
    Width = 77
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object qFichaConsumo: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT NumMov, Referencia, Modelo, Construcao, Cia, DtMov'
      'FROM "dbFichaConsumo.db" Dbfichaconsumo'
      '')
    Left = 512
    Top = 32
    object qFichaConsumoNumMov: TIntegerField
      FieldName = 'NumMov'
      Origin = 'TABELAS."dbFichaConsumo.DB".NumMov'
    end
    object qFichaConsumoReferencia: TStringField
      FieldName = 'Referencia'
      Origin = 'TABELAS."dbFichaConsumo.DB".Referencia'
      Size = 10
    end
    object qFichaConsumoModelo: TStringField
      FieldName = 'Modelo'
      Origin = 'TABELAS."dbFichaConsumo.DB".Modelo'
    end
    object qFichaConsumoConstrucao: TStringField
      FieldName = 'Construcao'
      Origin = 'TABELAS."dbFichaConsumo.DB".Construcao'
    end
    object qFichaConsumoCia: TStringField
      FieldName = 'Cia'
      Origin = 'TABELAS."dbFichaConsumo.DB".Cia'
      Size = 40
    end
    object qFichaConsumoDtMov: TDateField
      FieldName = 'DtMov'
      Origin = 'TABELAS."dbFichaConsumo.DB".DtMov'
    end
  end
  object dsqFichaConsumo: TDataSource
    DataSet = qFichaConsumo
    Left = 536
    Top = 32
  end
end
