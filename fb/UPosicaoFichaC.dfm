object fPosicaoFichaC: TfPosicaoFichaC
  Left = 7
  Top = 40
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Posi'#231#227'o Para a Ficha'
  ClientHeight = 639
  ClientWidth = 989
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
    Width = 989
    Height = 56
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 22
      Top = 16
      Width = 39
      Height = 13
      Caption = 'N'#186' Mov:'
    end
    object Label5: TLabel
      Left = 20
      Top = 38
      Width = 41
      Height = 13
      Caption = 'Posi'#231#227'o:'
    end
    object BitBtn3: TBitBtn
      Left = 468
      Top = 28
      Width = 101
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn5: TBitBtn
      Left = 912
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn5Click
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 63
      Top = 8
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 568
      Top = 28
      Width = 101
      Height = 25
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 668
      Top = 28
      Width = 101
      Height = 25
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 63
      Top = 30
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 56
    Width = 989
    Height = 566
    Align = alClient
    DataSource = DMPosicao_Ficha.dsPosicao_Ficha
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
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
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPOSICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOMENTEMATERIAL'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INFORMARGRADE'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INFORMAROPCAOMAT'
        Width = 64
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 622
    Width = 989
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
