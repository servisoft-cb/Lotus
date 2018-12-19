object fConsHistMat: TfConsHistMat
  Left = 314
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Hist'#243'rico do Material'
  ClientHeight = 480
  ClientWidth = 787
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 480
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 6
      Top = 460
      Width = 91
      Height = 16
      Caption = 'Qtd. Entrada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 100
      Top = 460
      Width = 134
      Height = 16
      AutoSize = False
      Caption = '0,00000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 251
      Top = 460
      Width = 78
      Height = 16
      Caption = 'Qtd. Sa'#237'da:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 332
      Top = 460
      Width = 134
      Height = 16
      AutoSize = False
      Caption = '0,00000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 471
      Top = 460
      Width = 46
      Height = 16
      Caption = 'Saldo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 521
      Top = 460
      Width = 164
      Height = 16
      AutoSize = False
      Caption = '0,00000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 781
      Height = 89
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 34
        Width = 60
        Height = 20
        Caption = 'Material:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 464
        Top = 31
        Width = 113
        Height = 28
        Hint = 'Desativa a consulta'
        Caption = 'Cancela'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 39
        Top = 58
        Width = 29
        Height = 20
        Caption = 'Cor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 14
        Top = 10
        Width = 54
        Height = 20
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = BitBtn1Click
      end
      object Label10: TLabel
        Left = 314
        Top = 16
        Width = 45
        Height = 13
        Caption = 'Mercado:'
      end
      object Label11: TLabel
        Left = 625
        Top = 7
        Width = 146
        Height = 78
        Caption = 
          '     ..... TIPO .....'#13#10'NTE = Nota Entrada'#13#10'NTS = Nota Fiscal Sa'#237 +
          'da'#13#10'DOC = Documento do estoque'#13#10'REQ = Requisi'#231#227'o'#13#10'ACE = Acerto d' +
          'o estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 464
        Top = 3
        Width = 113
        Height = 28
        Hint = 'Executa a consulta p/ material selecionado ao lado'
        Caption = 'Consulta'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BitBtn1Click
        Glyph.Data = {
          46050000424D460500000000000036040000280000000D000000110000000100
          08000000000010010000C30E0000C30E00000001000000000000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF00C0DCC000F0CAA60060208000C0FFFF00E0E0A0008000
          60008080FF00C0800000FFC0C000FFCF0000FFFF6900E0FFE000B39CDD00EE8F
          B300F96F2A00CDB83F0036844800418C9500425E8E007A62A000AC4F6200BE2F
          1D007666280000450000013E450013286A006A39850085324A00040404000808
          08000C0C0C0011111100161616001C1C1C002222220029292900303030005F5F
          5F00555555004D4D4D0042424200393939000007000000000D008199B700B499
          840090BDBD00607F7F007F606000000E000000001B00000028002B090800001D
          0000000039009B00000000250000000049003B111100002F000000005D004517
          1700003A000011114900531C1C00FF160000FF002B006C212100141459000051
          00006A1A47006732190000610000FF310000FF0061007B20530067431600E22E
          2E001659260004465100492E68008F520700B8186A0015239000FF530000FF00
          A300124A6A006C3375009A414A000B653700152CA400B11F8300FF2C4E00B651
          2000926408000B566F00AD435900127236001733B00000A100001F5F77007147
          89001C43B0007D2DB70095860000236E7A00009F260001A9730000CA0000015B
          AC00C21D2000705294004CAA240089940A007B6E360090754400A800FF00FF71
          0000FF00DF004A915600F84834008232CC007041E40001CA680042BC3600FF9A
          0000B7229600337D85008CB72500ED5A360000FF5C000048FF00A29B22004DCF
          42005258C20095D32000E024A500B556730000A9A9003C6FD000589F67000BCF
          890000ACFF00FE2EA7007F59E20067DC4C00FF18FF00FF7D3A0018D0B10000FF
          C70000E2FF003D9ADF009F815600BA43C6008B71AF00C9A23800CE53D100659A
          FF00DBCA4600FF4DFF006AE9C800E0DE4C00FF98FF0082C0DF00A5ECE900CDF6
          F500FFD0FF005AACB100AE916300654C22003F4E8D0070705000FFFFD000FFE7
          FF00696969007777770086868600969696009D9D9D00A4A4A400B2B2B200CBCB
          CB00D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F80066C1B20078BF
          8000F0F0C600FFA4B200FFB3FF00A38ED10037DCC300549EA00070AE7600C19E
          7800BF648300D383A400323FD100007DFF0023784400605F24002C0E0E000000
          BE00001FFF00003931003E85D9008577020081D8B0001D21560030000000B3C8
          88000079A0008170EA0069F15100CD749100FF7CFF00FFFFA200F0FBFF00A4A0
          A000537F200029798A00326932007F05EC00AC112F00423FEE000F0F0F0F0001
          0F0F0F0F0F0F0F0000000F0F0F0F0000010F0F0F0F0F0F0000000F0F0F0F0F00
          00010F0F0F0F0F0000000F0F0F0F0F001100010F0F0F0F0000000F0F0F000000
          001100010F0F0F0000000F0F0F0011110E111100010F0F0000000F0F0F0F000E
          11000000000F0F0000000F0F0F0F00110E1100010F0F0F0000000F0000000000
          110E1100010F0F0000000F000E110E110E110E1100010F0000000F0F000E110E
          11000000000F0F0000000F0F00110E110E1100010F0F0F0000000F0F0F00110E
          110E1100010F0F0000000F0F0F000E0E0E110E0E00010F0000000F0F0F0F000E
          110E0E110E00010000000F0F0F0F0000000000000000000000000F0F0F0F0F0F
          0F0F0F0F0F0F0F000000}
      end
      object BitBtn2: TBitBtn
        Left = 464
        Top = 59
        Width = 113
        Height = 28
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BitBtn2Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
          038383838383830E603800000000380E660033333330830E660333333330000E
          660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
          660300000E60330E660333330600330E660333330030330E6603333333303330
          E6033333333033330E0333333330000000033333333333333333}
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 74
        Top = 57
        Width = 309
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = qsCor
        TabOrder = 3
        OnEnter = RxDBLookupCombo2Enter
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 75
        Top = 8
        Width = 116
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 0
        OnExit = CurrencyEdit1Exit
      end
      object ComboBox1: TComboBox
        Left = 361
        Top = 9
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Exporta'#231#227'o'
        Items.Strings = (
          'Exporta'#231#227'o'
          'Merc.Interno'
          'Ambos')
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 75
        Top = 32
        Width = 382
        Height = 21
        KeyField = 'Codigo'
        ListField = 'Nome'
        ListSource = DM1.dsMaterial
        TabOrder = 2
        OnCloseUp = RzDBLookupComboBox1Exit
        OnDropDown = RzDBLookupComboBox1Enter
        OnEnter = RzDBLookupComboBox1Enter
        OnExit = RzDBLookupComboBox1Exit
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 3
      Top = 93
      Width = 781
      Height = 356
      DataSource = qsMaterial
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtMov'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Movimento'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Unidade'
          Title.Alignment = taCenter
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Largura'
          Title.Alignment = taCenter
          Title.Caption = 'Larg.'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ES'
          Title.Alignment = taCenter
          Width = 24
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TipoMov'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 34
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumNota'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Documento'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrUnitario'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Unit'#225'rio'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Mercado'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clNomeCliForn'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Cliente/Fornecedor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercIcms'
          Title.Alignment = taCenter
          Title.Caption = '% ICMS'
          Width = 43
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumMov'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Movimento'
          Width = 83
          Visible = True
        end>
    end
    object BitBtn3: TBitBtn
      Left = 712
      Top = 452
      Width = 70
      Height = 25
      Caption = 'Mercado'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object qMaterial: TQuery
    OnCalcFields = qMaterialCalcFields
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbestoquematmov.CodMaterial, Dbmaterial.Nome NomeMaterial' +
        ', Dbestoquematmov.NumMov, Dbcor.Nome NomeCor, Dbestoquematmov.La' +
        'rgura, Dbestoquematmov.DtMov, Dbestoquematmov.ES, Dbestoquematmo' +
        'v.TipoMov, Dbestoquematmov.NumNota, Dbestoquematmov.VlrUnitario,' +
        ' Dbestoquematmov.Qtd, Dbestoquematmov.Unidade, Dbestoquematmov.C' +
        'odCor, Dbestoquematmov.PercIcms, Dbestoquematmov.Mercado, Dbesto' +
        'quematmov.CodCliForn'
      'FROM "dbMaterial.DB" Dbmaterial'
      '   INNER JOIN "dbEstoqueMatMov.DB" Dbestoquematmov'
      '   ON  (Dbestoquematmov.CodMaterial = Dbmaterial.Codigo)'
      '   FULL JOIN "Dbcor.db" Dbcor'
      '   ON  (Dbestoquematmov.CodCor = Dbcor.Codigo)  '
      'WHERE   (Dbestoquematmov.CodMaterial = :CodMaterial)  '
      '   AND  (Dbestoquematmov.CodCor = :CodCor)  '
      
        'ORDER BY Dbestoquematmov.DtMov, Dbestoquematmov.ES, Dbmaterial.N' +
        'ome'
      ' ')
    Left = 224
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodMaterial'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CodCor'
        ParamType = ptUnknown
        Value = 0
      end>
    object qMaterialCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object qMaterialNomeMaterial: TStringField
      FieldName = 'NomeMaterial'
      Size = 60
    end
    object qMaterialNumMov: TIntegerField
      FieldName = 'NumMov'
    end
    object qMaterialNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 15
    end
    object qMaterialLargura: TStringField
      FieldName = 'Largura'
      Size = 1
    end
    object qMaterialDtMov: TDateField
      FieldName = 'DtMov'
    end
    object qMaterialES: TStringField
      FieldName = 'ES'
      Size = 1
    end
    object qMaterialTipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 3
    end
    object qMaterialNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object qMaterialVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
    end
    object qMaterialQtd: TFloatField
      FieldName = 'Qtd'
      DisplayFormat = '0.00000'
    end
    object qMaterialUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object qMaterialCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qMaterialPercIcms: TFloatField
      FieldName = 'PercIcms'
    end
    object qMaterialMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
    object qMaterialCodCliForn: TIntegerField
      FieldName = 'CodCliForn'
    end
    object qMaterialclNomeCliForn: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNomeCliForn'
      Size = 40
      Calculated = True
    end
  end
  object qsMaterial: TDataSource
    DataSet = qMaterial
    Left = 256
    Top = 120
  end
  object qCor: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbcor.Nome, Dbcor.Codigo'
      'FROM "dbMaterialCor.DB" Dbmaterialcor'
      '   INNER JOIN "Dbcor.db" Dbcor'
      '   ON  (Dbmaterialcor.CodCor = Dbcor.Codigo)  '
      'WHERE  Dbmaterialcor.CodMaterial = :Cod'
      'ORDER BY DbCor.Nome')
    Left = 328
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Cod'
        ParamType = ptUnknown
        Value = 0
      end>
    object qCorNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCor.DB".Nome'
      Size = 15
    end
    object qCorCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbCor.DB".Codigo'
    end
  end
  object qsCor: TDataSource
    DataSet = qCor
    Left = 360
    Top = 128
  end
end
