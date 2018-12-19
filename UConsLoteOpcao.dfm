object fConsLoteOpcao: TfConsLoteOpcao
  Left = 252
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fConsLoteOpcao'
  ClientHeight = 454
  ClientWidth = 491
  Color = clMoneyGreen
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
    Left = 8
    Top = 152
    Width = 87
    Height = 13
    Caption = 'N'#186' Pedido Interno:'
  end
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 352
    Height = 13
    Caption = 'Pedidos que n'#227'o v'#227'o ser impressos na op'#231#227'o "Imprime Lotes"'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 176
    Width = 491
    Height = 278
    TabStop = False
    Align = alBottom
    DataSource = fConsLote.dsmPedidoAux
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
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
    ColCount = 2
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumPedido'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Pedido Interno'
        Width = 145
        Visible = True
      end>
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 96
    Top = 144
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 142
    Width = 75
    Height = 25
    Caption = 'Confirma'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 142
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 328
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
end
