object fConstrucaoGrupo: TfConstrucaoGrupo
  Left = 241
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Grupos da Constru'#231#227'o'
  ClientHeight = 466
  ClientWidth = 785
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
  object Label1: TLabel
    Left = 6
    Top = 16
    Width = 63
    Height = 13
    Caption = 'Nome Grupo:'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 432
    Top = 0
    Width = 353
    Height = 129
    DataSource = DM1.dsConstrucaoGrupo
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodGrupoConstr'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Grupo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 236
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 70
    Top = 8
    Width = 257
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 71
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 147
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 222
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object Panel6: TPanel
    Left = 0
    Top = 131
    Width = 785
    Height = 335
    Align = alBottom
    Color = clSilver
    TabOrder = 5
    object SpeedButton8: TSpeedButton
      Left = 759
      Top = 142
      Width = 25
      Height = 23
      Hint = 'Abre o formul'#225'rio de cadastro de materiais'
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
        000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
        00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
        8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
        8888880BB088888888888800008888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton8Click
    end
    object SpeedButton16: TSpeedButton
      Left = 760
      Top = 165
      Width = 24
      Height = 22
      Hint = 'Abre o cadastro de posi'#231#245'es'
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000008000
        0000008000008080000000008000800080000080800080808000C0C0C000FF00
        000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
        8888888800008888888888889998888800008888888899998889888800008888
        8889888888889888000088888898888888888988000088888898888888888988
        0000888888988888888889880000888888898888888098880000888888898888
        880F088800008888888988888CC088880000888888988888CC88888800008888
        9988888CC888888800008889888888CC888888880000888988880CC888888888
        000088898880F088888888880000888899880888888888880000888888998888
        8888888800008888888888888888888800008888888888888888888800008888
        88888888888888880000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton16Click
    end
    object RadioGroup1: TRadioGroup
      Left = 2
      Top = 2
      Width = 59
      Height = 45
      Caption = 'Imp.Tal'#227'o'
      Color = clSilver
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'N'#227'o')
      ParentColor = False
      TabOrder = 0
    end
    object StaticText3: TStaticText
      Left = 61
      Top = 6
      Width = 219
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Nome do material'
      Color = clSilver
      ParentColor = False
      TabOrder = 12
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 61
      Top = 25
      Width = 219
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      Color = clInfoBk
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsMaterial
      TabOrder = 1
      OnEnter = RxDBLookupCombo2Enter
      OnExit = RxDBLookupCombo2Exit
    end
    object RxDBLookupCombo15: TRxDBLookupCombo
      Left = 280
      Top = 25
      Width = 132
      Height = 21
      DropDownCount = 8
      DropDownWidth = 250
      Color = clInfoBk
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsPosicao
      TabOrder = 2
      OnEnter = RxDBLookupCombo15Enter
    end
    object StaticText11: TStaticText
      Left = 280
      Top = 6
      Width = 132
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Posi'#231#227'o'
      Color = clSilver
      ParentColor = False
      TabOrder = 13
    end
    object StaticText2: TStaticText
      Left = 412
      Top = 6
      Width = 145
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Nome da cor'
      Color = clSilver
      ParentColor = False
      TabOrder = 14
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 412
      Top = 25
      Width = 145
      Height = 21
      DropDownCount = 8
      DropDownWidth = 250
      Color = clInfoBk
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = fConstrucao.dsqCor
      TabOrder = 3
      OnEnter = RxDBLookupCombo3Enter
      OnExit = RxDBLookupCombo3Exit
    end
    object Edit2: TEdit
      Left = 557
      Top = 25
      Width = 47
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      MaxLength = 3
      TabOrder = 4
    end
    object StaticText12: TStaticText
      Left = 557
      Top = 6
      Width = 47
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Unidade'
      Color = clSilver
      ParentColor = False
      TabOrder = 15
    end
    object StaticText4: TStaticText
      Left = 604
      Top = 6
      Width = 64
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Qtd.'
      Color = clSilver
      ParentColor = False
      TabOrder = 16
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 604
      Top = 25
      Width = 64
      Height = 21
      AutoSize = False
      Color = clInfoBk
      DecimalPlaces = 5
      DisplayFormat = '0.00000'
      TabOrder = 5
      OnExit = CurrencyEdit1Exit
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 668
      Top = 25
      Width = 59
      Height = 21
      AutoSize = False
      Color = clInfoBk
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      TabOrder = 6
      OnExit = CurrencyEdit2Exit
    end
    object StaticText5: TStaticText
      Left = 668
      Top = 6
      Width = 59
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Vlr.Unit'#225'rio'
      Color = clSilver
      ParentColor = False
      TabOrder = 17
    end
    object StaticText6: TStaticText
      Left = 727
      Top = 6
      Width = 58
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Vlr.Total'
      Color = clSilver
      ParentColor = False
      TabOrder = 18
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 727
      Top = 25
      Width = 58
      Height = 21
      AutoSize = False
      Color = clInfoBk
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      TabOrder = 7
    end
    object BitBtn10: TBitBtn
      Left = 759
      Top = 50
      Width = 25
      Height = 23
      Hint = 'Confirma o material'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BitBtn10Click
      Glyph.Data = {
        A6020000424DA602000000000000420000002800000011000000110000000100
        1000030000006402000000000000000000000000000000000000007C0000E003
        00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EC202F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EC202F75EF75EF75EF75EF75EF75EF75EF75EF75E
        1700FF7FF75EF75EF75EF75EF75EF75EDD01F75EF75EF75EF75EF75EF75EF75E
        F75E170017001700FF7FF75EF75EF75EF75EF75EC202F75EF75EF75EF75EF75E
        F75EF75E1700170017001700FF7FF75EF75EF75EF75EF75E4301F75E00000000
        000000000000170017001700FF7F17001700FF7FF75EF75EF75EF75E9901F75E
        0000FF7FFF7FFF7F170017001700FF7F0000F75E17001700FF7FF75EF75EF75E
        C202F75E0000FF7FEF3DEF3DEF3D1700FF7FFF7F0000F75EF75E1700FF7FF75E
        F75EF75E1D03F75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000F75EF75EF75E
        1700FF7FF75EF75E0200F75E0000FF7FEF3DEF3DEF3DEF3DEF3DFF7F0000F75E
        F75EF75EF75E1700FF7FF75E1903F75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
        0000F75EF75EF75EF75EF75E1700FF7FDA00F75E0000FF7FEF3DEF3DF75EF75E
        F75EFF7F0000F75EF75EF75EF75EF75EF75E1700D300F75E0000FF7FFF7FFF7F
        FF7F0000000000000000F75EF75EF75EF75EF75EF75EF75E1901F75E0000FF7F
        EF3DEF3DF75E0000F75E0000F75EF75EF75EF75EF75EF75EF75EF75E9000F75E
        0000FF7FFF7FFF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75EF75EF75E
        5802F75E000000000000000000000000F75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75E3501F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EB781}
    end
    object BitBtn11: TBitBtn
      Left = 759
      Top = 73
      Width = 25
      Height = 23
      Hint = 'Cancela o material selecionado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = BitBtn11Click
      Glyph.Data = {
        EE020000424DEE02000000000000420000002800000012000000130000000100
        100003000000AC02000000000000000000000000000000000000007C0000E003
        00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75E007CF75E007CF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75E007CF75EF75E007C007CF75EF75EEE39EE39EE39EE39
        EE39EE39EE39EE39EE39EE39007CF75EF75EF75E007C007C007C000000000000
        0000000000000000000000000000007C007CF75EF75EF75EF75E007C007C0000
        E07FFF7FFF7FFF7FE07FFF7FFF7FFF7F007C007CF75EF75EF75EF75EF75EF75E
        007C007CFF7F1F001F001F001F001F001F00FF7F007CEE39F75EF75EF75EF75E
        F75EF75E007C007C007CFF7FE07FFF7FFF7FFF7FE07F007C007CEE39F75EF75E
        F75EF75EF75EF75EF75E007C007C007C1F001F001F00007C007C007C0000EE39
        F75EF75EF75EF75EF75EF75EF75E0000007C007C007CFF7FE07F007C007CFF7F
        0000EE39F75EF75EF75EF75EF75EF75EF75E0000FF7F1F00007C007C007C007C
        1F00FF7F0000EE39F75EF75EF75EF75EF75EF75EF75E0000FF7FFF7F007C007C
        007C007CE07FFF7F0000EE39F75EF75EF75EF75EF75EF75EF75E0000FF7F1F00
        007C007C007C007C000000000000EE39F75EF75EF75EF75EF75EF75EF75E0000
        E07F007C007CFF7F0000007C007CFF7F0000EE39F75EF75EF75EF75EF75EF75E
        F75E0000007C007C007CFF7F0000007C007C007C007CF75EF75EF75EF75EF75E
        F75EF75E007C007C007CFF7FE07FFF7F0000FF7F0000F75E007C007CF75EF75E
        F75EF75E007C007C007C007C000000000000000000000000F75EF75EF75E007C
        007CF75EF75EF75E007C007C007CF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75E007CF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75E007CF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75E}
    end
    object BitBtn12: TBitBtn
      Left = 759
      Top = 96
      Width = 25
      Height = 23
      Hint = 'Exclui o material selecionado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BitBtn12Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
        0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
        703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
        700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
        0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
        03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
        033333777777777773333333307770333333333337FFF7F33333333330000033
        3333333337777733333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn15: TBitBtn
      Left = 759
      Top = 119
      Width = 25
      Height = 23
      Hint = 'Edita o material selecionado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BitBtn15Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object SMDBGrid1: TSMDBGrid
      Left = 2
      Top = 49
      Width = 756
      Height = 283
      DataSource = dsConstrucaoMat
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 19
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
      ColCount = 13
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodMaterial'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Material'
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeMaterial'
          Title.Alignment = taCenter
          Title.Caption = 'Material'
          Width = 247
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomePosicao'
          Title.Alignment = taCenter
          Title.Caption = 'Nome da Posi'#231#227'o'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeCor'
          Title.Alignment = taCenter
          Title.Caption = 'Cor'
          Width = 155
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Unidade'
          Title.Alignment = taCenter
          Title.Caption = 'UN'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrUnitario'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Unit'#225'rio'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrTotal'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Total'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ImpTalao'
          Title.Alignment = taCenter
          Title.Caption = 'Imp. Tal'#227'o'
          Width = 32
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodGrade'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Grade'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodPosicao'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Posi'#231#227'o'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodCor'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Cor'
          Visible = True
        end>
    end
  end
  object tConstrucaoMat: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodConstrucao;CodConstrucaoGrupo'
    MasterFields = 'CodConstrucao;CodGrupoConstr'
    MasterSource = DM1.dsConstrucaoGrupo
    TableName = 'dbConstrucaoMat.DB'
    Left = 384
    Top = 296
    object tConstrucaoMatCodConstrucao: TIntegerField
      FieldName = 'CodConstrucao'
    end
    object tConstrucaoMatCodConstrucaoGrupo: TIntegerField
      FieldName = 'CodConstrucaoGrupo'
    end
    object tConstrucaoMatItem: TIntegerField
      FieldName = 'Item'
    end
    object tConstrucaoMatCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tConstrucaoMatCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tConstrucaoMatCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tConstrucaoMatQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tConstrucaoMatVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object tConstrucaoMatVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tConstrucaoMatCodPosicao: TIntegerField
      FieldName = 'CodPosicao'
    end
    object tConstrucaoMatImpTalao: TStringField
      FieldName = 'ImpTalao'
      Size = 1
    end
    object tConstrucaoMatUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object tConstrucaoMatlkNomeMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeMaterial'
      LookupDataSet = DM1.tMaterial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodMaterial'
      Size = 40
      Lookup = True
    end
    object tConstrucaoMatlkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 30
      Lookup = True
    end
    object tConstrucaoMatlkNomePosicao: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomePosicao'
      LookupDataSet = DM1.tPosicao2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodPosicao'
      Size = 30
      Lookup = True
    end
  end
  object dsConstrucaoMat: TDataSource
    DataSet = tConstrucaoMat
    Left = 400
    Top = 296
  end
end
