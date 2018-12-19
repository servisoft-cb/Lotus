object fFichaConstrucaoC: TfFichaConstrucaoC
  Left = 7
  Top = 40
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ficha T'#233'cnica Constru'#231#227'o'
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
    Height = 78
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 204
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Dt. Inicial:'
    end
    object Label2: TLabel
      Left = 353
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Dt. Final:'
    end
    object Label4: TLabel
      Left = 22
      Top = 16
      Width = 39
      Height = 13
      Caption = 'N'#186' Mov:'
    end
    object Label5: TLabel
      Left = 4
      Top = 38
      Width = 57
      Height = 13
      Caption = 'Constru'#231#227'o:'
    end
    object Label3: TLabel
      Left = 29
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Forma:'
    end
    object BitBtn3: TBitBtn
      Left = 548
      Top = 4
      Width = 101
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn3Click
    end
    object DateEdit1: TDateEdit
      Left = 252
      Top = 8
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 397
      Top = 8
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object BitBtn5: TBitBtn
      Left = 912
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
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
      Left = 648
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 722
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      TabStop = False
      OnClick = BitBtn2Click
    end
    object Edit1: TEdit
      Left = 63
      Top = 30
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 63
      Top = 52
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 110
    Width = 989
    Height = 512
    Align = alClient
    DataSource = dsFichaConstrucao
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
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Movimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECONSTRUCAO'
        Title.Alignment = taCenter
        Title.Caption = 'Constru'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEFORMA'
        Title.Alignment = taCenter
        Title.Caption = 'Forma'
        Width = 219
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data Movimento'
        Width = 109
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'USUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Width = 113
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTCADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Data Cadastro'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HRCADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Cadastro'
        Width = 70
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
  object Panel2: TPanel
    Left = 0
    Top = 78
    Width = 989
    Height = 32
    Align = alTop
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 910
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn4Click
    end
  end
  object sdsPosicao_Ficha: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM POSICAO_FICHA'#13#10'ORDER BY ORDEM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 352
    Top = 264
    object sdsPosicao_FichaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPosicao_FichaNOMEPOSICAO: TStringField
      FieldName = 'NOMEPOSICAO'
      Size = 30
    end
    object sdsPosicao_FichaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object sdsPosicao_FichaSOMENTEMATERIAL: TStringField
      FieldName = 'SOMENTEMATERIAL'
      FixedChar = True
      Size = 1
    end
    object sdsPosicao_FichaINFORMARGRADE: TStringField
      FieldName = 'INFORMARGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsPosicao_FichaINFORMAROPCAOMAT: TStringField
      FieldName = 'INFORMAROPCAOMAT'
      FixedChar = True
      Size = 1
    end
  end
  object dspPosicao_Ficha: TDataSetProvider
    DataSet = sdsPosicao_Ficha
    Left = 392
    Top = 264
  end
  object cdsPosicao_Ficha: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPosicao_Ficha'
    Left = 440
    Top = 264
    object cdsPosicao_FichaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPosicao_FichaNOMEPOSICAO: TStringField
      FieldName = 'NOMEPOSICAO'
      Size = 30
    end
    object cdsPosicao_FichaORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsPosicao_FichaSOMENTEMATERIAL: TStringField
      FieldName = 'SOMENTEMATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsPosicao_FichaINFORMARGRADE: TStringField
      FieldName = 'INFORMARGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsPosicao_FichaINFORMAROPCAOMAT: TStringField
      FieldName = 'INFORMAROPCAOMAT'
      FixedChar = True
      Size = 1
    end
  end
  object dsPosicao_Ficha: TDataSource
    DataSet = cdsPosicao_Ficha
    Left = 488
    Top = 264
  end
  object sdsFichaConstrucao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FICHACONSTRUCAO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 352
    Top = 344
    object sdsFichaConstrucaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFichaConstrucaoNOMECONSTRUCAO: TStringField
      FieldName = 'NOMECONSTRUCAO'
      Size = 40
    end
    object sdsFichaConstrucaoNOMEFORMA: TStringField
      FieldName = 'NOMEFORMA'
      Size = 40
    end
    object sdsFichaConstrucaoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsFichaConstrucaoDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsFichaConstrucaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsFichaConstrucaoHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsFichaConstrucaoDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
  end
  object dspFichaConstrucao: TDataSetProvider
    DataSet = sdsFichaConstrucao
    Left = 440
    Top = 344
  end
  object cdsFichaConstrucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFichaConstrucao'
    Left = 512
    Top = 344
    object cdsFichaConstrucaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFichaConstrucaoNOMECONSTRUCAO: TStringField
      FieldName = 'NOMECONSTRUCAO'
      Size = 40
    end
    object cdsFichaConstrucaoNOMEFORMA: TStringField
      FieldName = 'NOMEFORMA'
      Size = 40
    end
    object cdsFichaConstrucaoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFichaConstrucaoDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsFichaConstrucaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsFichaConstrucaoHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsFichaConstrucaoDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
  end
  object dsFichaConstrucao: TDataSource
    DataSet = cdsFichaConstrucao
    Left = 576
    Top = 344
  end
end
