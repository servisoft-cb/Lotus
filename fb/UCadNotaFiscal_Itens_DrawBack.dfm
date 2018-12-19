object frmCadNotaFiscal_Itens_DrawBack: TfrmCadNotaFiscal_Itens_DrawBack
  Left = 310
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados de Importa'#231#227'o'
  ClientHeight = 372
  ClientWidth = 797
  Color = clMoneyGreen
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
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 797
    Height = 135
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 14
      Width = 175
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' do ato concess'#243'rio de Drawback:'
    end
    object Label2: TLabel
      Left = 72
      Top = 32
      Width = 114
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Registro Exporta'#231#227'o:'
    end
    object Label3: TLabel
      Left = 114
      Top = 68
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Chave Acesso:'
    end
    object Label4: TLabel
      Left = 128
      Top = 50
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantidade:'
    end
    object Label5: TLabel
      Left = 192
      Top = 85
      Width = 486
      Height = 13
      Caption = 
        'No caso de opera'#231#227'o com CFOP 3503, informar a chave de acesso da' +
        ' NFe que efetivou a exporta'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 189
      Top = 8
      Width = 121
      Height = 19
      Ctl3D = False
      MaxLength = 11
      ParentCtl3D = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 189
      Top = 26
      Width = 121
      Height = 19
      Ctl3D = False
      MaxLength = 12
      ParentCtl3D = False
      TabOrder = 1
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 189
      Top = 44
      Width = 121
      Height = 19
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      ParentCtl3D = False
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 189
      Top = 62
      Width = 452
      Height = 19
      Ctl3D = False
      MaxLength = 44
      ParentCtl3D = False
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 192
      Top = 103
      Width = 96
      Height = 30
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 481
      Top = 103
      Width = 96
      Height = 30
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 288
      Top = 103
      Width = 96
      Height = 30
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 384
      Top = 103
      Width = 96
      Height = 30
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 176
    Width = 797
    Height = 196
    Align = alClient
    TabOrder = 1
    object SMDBGrid3: TSMDBGrid
      Left = 1
      Top = 1
      Width = 795
      Height = 194
      Align = alClient
      Ctl3D = False
      DataSource = DMNotaFiscalFB.dsNotaFiscal_Itens_DrawBack
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
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
      ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
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
          FieldName = 'ITEM_DRAWBACK'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Width = 33
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_DRAWBACK'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' DrawBack'
          Width = 121
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_REG_EXPORTACAO'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Reg. Exporta'#231#227'o'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_CHAVE_ACESSO_NFE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Chave Acesso'
          Width = 334
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd.'
          Width = 103
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label6: TLabel
      Left = 16
      Top = 13
      Width = 64
      Height = 13
      Caption = 'Item da Nota:'
    end
    object Label7: TLabel
      Left = 84
      Top = 13
      Width = 6
      Height = 13
      Caption = '0'
    end
  end
end
