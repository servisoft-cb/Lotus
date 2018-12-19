object fNavalha_LocalC: TfNavalha_LocalC
  Left = 185
  Top = 38
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Armazenamento Refer'#234'ncia'
  ClientHeight = 639
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 891
    Height = 33
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label5: TLabel
      Left = 10
      Top = 15
      Width = 43
      Height = 13
      Caption = 'Navalha:'
    end
    object BitBtn3: TBitBtn
      Left = 315
      Top = 5
      Width = 101
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object BitBtn1: TBitBtn
      Left = 416
      Top = 5
      Width = 101
      Height = 25
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 517
      Top = 5
      Width = 101
      Height = 25
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 55
      Top = 7
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 618
      Top = 5
      Width = 101
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = BitBtn4Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 33
    Width = 891
    Height = 589
    Align = alClient
    Ctl3D = False
    DataSource = DMNavalha_Local.dsNavalha_Local
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    OnTitleClick = SMDBGrid1TitleClick
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
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCALIZACAO'
        Title.Alignment = taCenter
        Title.Caption = 'Localiza'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAVALHA'
        Title.Alignment = taCenter
        Title.Caption = 'Navalha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REORDER'
        Title.Alignment = taCenter
        Title.Caption = 'Reorder'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'Data Entrada'
        Width = 91
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTDESCARTE'
        Title.Alignment = taCenter
        Title.Caption = 'Data Descarte'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTESTOQUE'
        Title.Alignment = taCenter
        Title.Caption = 'Data Estoque'
        Width = 85
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 622
    Width = 891
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo clique para Consultar/Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
end
