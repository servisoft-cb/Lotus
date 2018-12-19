object fProdutosVendidos: TfProdutosVendidos
  Left = 192
  Top = 124
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'fProdutosVendidos'
  ClientHeight = 467
  ClientWidth = 804
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo de:'
    end
    object Label2: TLabel
      Left = 24
      Top = 40
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Material:'
    end
    object Label3: TLabel
      Left = 167
      Top = 16
      Width = 9
      Height = 13
      Alignment = taRightJustify
      Caption = 'a:'
    end
    object Label4: TLabel
      Left = 285
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ordenar por:'
    end
    object BitBtn1: TBitBtn
      Left = 354
      Top = 29
      Width = 75
      Height = 25
      Caption = '&Consultar'
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object DateEdit1: TDateEdit
      Left = 72
      Top = 8
      Width = 90
      Height = 21
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 184
      Top = 8
      Width = 90
      Height = 21
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 1
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 72
      Top = 32
      Width = 281
      Height = 21
      DropDownCount = 15
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = DM2.dsqMaterial
      TabOrder = 3
    end
    object BitBtn2: TBitBtn
      Left = 430
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Im&primir'
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object ComboBox1: TComboBox
      Left = 352
      Top = 8
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Data de emiss'#227'o'
      Items.Strings = (
        'Data de emiss'#227'o'
        'Descri'#231#227'o do material')
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 57
    Width = 804
    Height = 410
    Align = alClient
    DataSource = DM2.dsqProdutosVendidos
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
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Caption = 'Emiss'#227'o'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMNOTA'
        Title.Caption = 'Num. Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE'
        Title.Caption = 'S'#233'rie'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Material'
        Width = 354
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Caption = 'Qtd.'
        Visible = True
      end>
  end
end
