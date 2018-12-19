object fConsHistCli: TfConsHistCli
  Left = 0
  Top = 9
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Hist'#243'rico dos Clientes'
  ClientHeight = 532
  ClientWidth = 785
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
    Width = 785
    Height = 532
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 776
      Height = 33
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 149
        Top = 8
        Width = 62
        Height = 20
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel2: TRxLabel
        Left = 532
        Top = 12
        Width = 57
        Height = 16
        Caption = 'Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 213
        Top = 7
        Width = 204
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsCliente
        TabOrder = 1
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
      object BitBtn1: TBitBtn
        Left = 419
        Top = 4
        Width = 110
        Height = 25
        Hint = 'Ativa a consulta cfe. cliente selecionado ao lado'
        Caption = '&Ativar Consulta'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      object BitBtn3: TBitBtn
        Left = 662
        Top = 4
        Width = 110
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BitBtn3Click
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
      object CurrencyEdit8: TCurrencyEdit
        Left = 592
        Top = 7
        Width = 67
        Height = 21
        AutoSize = False
        DisplayFormat = '0'
        TabOrder = 4
        OnKeyDown = CurrencyEdit8KeyDown
      end
      object ComboBox1: TComboBox
        Left = 5
        Top = 7
        Width = 138
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnEnter = ComboBox1Enter
        OnExit = ComboBox1Exit
        Items.Strings = (
          'Interno'
          'Outros')
      end
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 40
      Width = 776
      Height = 489
      ActivePage = TabSheet4
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Pedidos'
        object Label16: TLabel
          Left = 22
          Top = 368
          Width = 82
          Height = 13
          Caption = 'Dt.'#218'ltimo Pedido:'
        end
        object Label17: TLabel
          Left = 48
          Top = 390
          Width = 56
          Height = 13
          Caption = 'Qtd.Pedido:'
        end
        object Label18: TLabel
          Left = 216
          Top = 368
          Width = 83
          Height = 13
          Caption = 'Vlr.'#218'ltimo Pedido:'
        end
        object Label19: TLabel
          Left = 440
          Top = 368
          Width = 87
          Height = 13
          Caption = 'Pares '#218'ltimo Ped.:'
        end
        object Label20: TLabel
          Left = 659
          Top = 368
          Width = 76
          Height = 13
          Caption = 'Pares Pendente'
        end
        object Label21: TLabel
          Left = 207
          Top = 390
          Width = 92
          Height = 13
          Caption = 'Qtd.Total de Pares:'
        end
        object Label22: TLabel
          Left = 456
          Top = 390
          Width = 71
          Height = 13
          Caption = 'Qtd. Pares Fat.'
        end
        object Label23: TLabel
          Left = 8
          Top = 412
          Width = 95
          Height = 13
          Caption = 'Q.Pares Cancelado:'
        end
        object ALed2: TALed
          Left = 21
          Top = 438
          Width = 22
          Height = 14
          Cursor = crHandPoint
          TrueColor = clGreen
          FalseColor = clWhite
          LEDStyle = LEDHorizontal
          OnClick = ALed2Click
        end
        object Label3: TLabel
          Left = 48
          Top = 439
          Width = 55
          Height = 13
          Caption = 'Pendente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ALed3: TALed
          Left = 133
          Top = 438
          Width = 22
          Height = 14
          Cursor = crHandPoint
          TrueColor = clTeal
          FalseColor = clTeal
          LEDStyle = LEDHorizontal
          OnClick = ALed3Click
        end
        object Label10: TLabel
          Left = 159
          Top = 439
          Width = 52
          Height = 13
          Caption = 'Entregue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel1: TBevel
          Left = -2
          Top = 428
          Width = 771
          Height = 2
          Shape = bsTopLine
          Style = bsRaised
        end
        object RxDBGrid2: TRxDBGrid
          Left = 1
          Top = 2
          Width = 765
          Height = 346
          DataSource = DM1.dsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = RxDBGrid2DblClick
          OnGetCellParams = RxDBGrid2GetCellParams
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Pedido'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 48
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PedidoCliente'
              Title.Alignment = taCenter
              Title.Caption = 'Pedido Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PedCliDif'
              Title.Alignment = taCenter
              Title.Caption = 'D'#237'g.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtEmissao'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Emiss'#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 68
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtIniEmbarque'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Emb. Inic.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtFinEmbarque'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Emb. Fin.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrTotal'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdPares'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Pares'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 67
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QtdParesCanc'
              Title.Alignment = taCenter
              Title.Caption = 'Pares Canc.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Alignment = taCenter
              Color = 10930928
              Expanded = False
              FieldName = 'QtdParesFat'
              Title.Alignment = taCenter
              Title.Caption = 'Pares Fat.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 71
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clMoneyGreen
              Expanded = False
              FieldName = 'QtdParesRest'
              Title.Alignment = taCenter
              Title.Caption = 'Pares Pend.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 65
              Visible = True
            end>
        end
        object StaticText2: TStaticText
          Left = 464
          Top = 439
          Width = 294
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'D'#234' 2 cliques na grid p/ chamar o formul'#225'rio de Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object DateEdit1: TDateEdit
          Left = 106
          Top = 360
          Width = 96
          Height = 21
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 2
        end
        object CurrencyEdit3: TCurrencyEdit
          Left = 106
          Top = 382
          Width = 68
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 3
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 300
          Top = 360
          Width = 121
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,###,##0.00'
          ReadOnly = True
          TabOrder = 4
        end
        object CurrencyEdit2: TCurrencyEdit
          Left = 529
          Top = 360
          Width = 95
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 5
        end
        object CurrencyEdit4: TCurrencyEdit
          Left = 300
          Top = 382
          Width = 77
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 6
        end
        object CurrencyEdit5: TCurrencyEdit
          Left = 529
          Top = 382
          Width = 95
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 7
        end
        object CurrencyEdit6: TCurrencyEdit
          Left = 658
          Top = 382
          Width = 80
          Height = 21
          AutoSize = False
          Color = clAqua
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 8
        end
        object CurrencyEdit7: TCurrencyEdit
          Left = 106
          Top = 404
          Width = 68
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 9
        end
        object BitBtn4: TBitBtn
          Left = 227
          Top = 433
          Width = 86
          Height = 25
          Cursor = crHandPoint
          Caption = 'Mostra todos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = BitBtn4Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Itens do Pedido'
        ImageIndex = 1
        object Label4: TLabel
          Left = 4
          Top = 397
          Width = 66
          Height = 13
          Caption = 'Pares Pedido:'
        end
        object Label5: TLabel
          Left = 196
          Top = 397
          Width = 76
          Height = 13
          Caption = 'Pares Entregue:'
        end
        object Label6: TLabel
          Left = 396
          Top = 397
          Width = 84
          Height = 13
          Caption = 'Pares Cancelado:'
        end
        object Label15: TLabel
          Left = 585
          Top = 397
          Width = 79
          Height = 13
          Caption = 'Pares Pendente:'
        end
        object ALed8: TALed
          Left = 16
          Top = 426
          Width = 22
          Height = 14
          TrueColor = clGreen
          FalseColor = clWhite
          LEDStyle = LEDHorizontal
        end
        object Label7: TLabel
          Left = 42
          Top = 427
          Width = 55
          Height = 13
          Caption = 'Pendente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ALed9: TALed
          Left = 113
          Top = 426
          Width = 22
          Height = 14
          TrueColor = clTeal
          FalseColor = clTeal
          LEDStyle = LEDHorizontal
        end
        object Label8: TLabel
          Left = 138
          Top = 427
          Width = 52
          Height = 13
          Caption = 'Entregue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 2
          Top = 16
          Width = 36
          Height = 13
          Caption = 'Pedido:'
        end
        object DBEdit3: TDBEdit
          Left = 73
          Top = 388
          Width = 81
          Height = 21
          DataField = 'QtdPares'
          DataSource = DM1.dsPedido
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 275
          Top = 388
          Width = 81
          Height = 21
          DataField = 'QtdParesFat'
          DataSource = DM1.dsPedido
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 483
          Top = 388
          Width = 81
          Height = 21
          DataField = 'QtdParesCanc'
          DataSource = DM1.dsPedido
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 666
          Top = 388
          Width = 81
          Height = 21
          Color = clMoneyGreen
          DataField = 'QtdParesRest'
          DataSource = DM1.dsPedido
          ReadOnly = True
          TabOrder = 3
        end
        object RxDBGrid4: TRxDBGrid
          Left = 2
          Top = 34
          Width = 763
          Height = 263
          DataSource = DM1.dsPedidoItem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'lkReferencia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkDescMaterial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Material'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkConstrucao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Constru'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkCor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Cor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdPares'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Q.Pares'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Preco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Unit'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrTotal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdParesCanc'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Q.Canc.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 54
              Visible = True
            end
            item
              Color = 10930928
              Expanded = False
              FieldName = 'QtdParesFat'
              Title.Alignment = taCenter
              Title.Caption = 'Q.Fatur.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 49
              Visible = True
            end
            item
              Color = clMoneyGreen
              Expanded = False
              FieldName = 'QtdParesRest'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -6
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Q.Pend.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 48
              Visible = True
            end>
        end
        object DBEdit1: TDBEdit
          Left = 40
          Top = 8
          Width = 89
          Height = 21
          Color = 10930928
          DataField = 'PedidoCliente'
          DataSource = DM1.dsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 130
          Top = 8
          Width = 25
          Height = 21
          Color = 10930928
          DataField = 'PedCliDif'
          DataSource = DM1.dsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object VDBGrid1: TVDBGrid
          Left = 2
          Top = 312
          Width = 763
          Height = 59
          DataSource = DM1.dsPedidoGrade
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 7
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Vertical = True
          TitlesWidth = 70
          Columns = <
            item
              Alignment = taCenter
              Color = clGray
              FieldName = 'lkTamanho'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Tamanho'
              Title.Color = clGray
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
            end
            item
              FieldName = 'Qtd'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd.'
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Notas Fiscais'
        ImageIndex = 2
        object Label2: TLabel
          Left = 31
          Top = 445
          Width = 77
          Height = 13
          Caption = 'Nota Cancelada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object ALed1: TALed
          Left = 12
          Top = 443
          Width = 16
          Height = 16
          FalseColor = clRed
        end
        object RxDBGrid1: TRxDBGrid
          Left = 5
          Top = 2
          Width = 757
          Height = 328
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = RxDBGrid1DblClick
          OnGetCellParams = RxDBGrid1GetCellParams
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NumNota'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Nota'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtEmissao'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Emiss'#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrTotalNota'
              Title.Alignment = taCenter
              Title.Caption = 'Valor da  Nota'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SaidaEntrada'
              Title.Alignment = taCenter
              Title.Caption = 'S/E'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BaseIcms'
              Title.Alignment = taCenter
              Title.Caption = 'Base Icms'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrIcms'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Icms'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrIpi'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Ipi'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkCodNatOper'
              Title.Alignment = taCenter
              Title.Caption = 'Natureza'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeVendedor'
              Title.Alignment = taCenter
              Title.Caption = 'Vendedor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 229
              Visible = True
            end>
        end
        object StaticText1: TStaticText
          Left = 452
          Top = 438
          Width = 312
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'D'#234' 2 cliques na grid p/ chamar o formul'#225'rio de Nota Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object RxDBGrid5: TRxDBGrid
          Left = 3
          Top = 339
          Width = 757
          Height = 87
          DataSource = DM1.dsNotaFiscalItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = RxDBGrid1DblClick
          OnGetCellParams = RxDBGrid1GetCellParams
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Referencia'
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkDescMaterial'
              Title.Alignment = taCenter
              Title.Caption = 'Material'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 237
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeCor'
              Title.Alignment = taCenter
              Title.Caption = 'Nome cor'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Unidade'
              Title.Alignment = taCenter
              Title.Caption = 'Unid.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Qtd'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Icms'
              Title.Alignment = taCenter
              Title.Caption = '% Icms'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ipi'
              Title.Alignment = taCenter
              Title.Caption = '% Ipi'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrUnit'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Unit'#225'rio'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrTotal'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Total'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BaseIcms'
              Title.Alignment = taCenter
              Title.Caption = 'Base Icms'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrIcms'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Icms'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlrIpi'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr.Ipi'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Contas a Receber'
        ImageIndex = 3
        object Label24: TLabel
          Left = 8
          Top = 326
          Width = 76
          Height = 13
          Caption = 'Dt.Maior Atraso:'
        end
        object Label25: TLabel
          Left = 184
          Top = 326
          Width = 106
          Height = 13
          Caption = 'Qtd.Dias Maior Atraso:'
        end
        object Label27: TLabel
          Left = 569
          Top = 326
          Width = 129
          Height = 13
          Caption = 'Qtd.Parc.Pagas Em Atraso:'
        end
        object Label28: TLabel
          Left = 368
          Top = 326
          Width = 92
          Height = 13
          Caption = 'Vlr.do Maior Atraso:'
        end
        object Label26: TLabel
          Left = 377
          Top = 386
          Width = 66
          Height = 13
          Caption = 'Vlr.em Aberto:'
        end
        object Label29: TLabel
          Left = 562
          Top = 386
          Width = 99
          Height = 13
          Caption = 'Vlr.Aberto em Atraso:'
        end
        object Label30: TLabel
          Left = 28
          Top = 384
          Width = 42
          Height = 13
          Caption = 'Vlr.Total:'
        end
        object Label31: TLabel
          Left = 8
          Top = 350
          Width = 118
          Height = 13
          Caption = 'N'#186' da Nota Maior Atraso:'
        end
        object Bevel2: TBevel
          Left = -2
          Top = 368
          Width = 771
          Height = 2
          Shape = bsTopLine
          Style = bsRaised
        end
        object Label32: TLabel
          Left = 280
          Top = 350
          Width = 121
          Height = 13
          Caption = 'M'#233'dia de Dias em Atraso:'
        end
        object Label33: TLabel
          Left = 400
          Top = 410
          Width = 43
          Height = 13
          Caption = 'Vlr.Pago:'
        end
        object Label34: TLabel
          Left = 568
          Top = 410
          Width = 93
          Height = 13
          Caption = 'Vlr.Pago em Atraso:'
        end
        object Bevel3: TBevel
          Left = -3
          Top = 428
          Width = 771
          Height = 2
          Shape = bsTopLine
          Style = bsRaised
        end
        object Label35: TLabel
          Left = 4
          Top = 408
          Width = 66
          Height = 13
          Caption = 'Vlr.Devolvido:'
        end
        object Label36: TLabel
          Left = 195
          Top = 386
          Width = 71
          Height = 13
          Caption = 'Vlr.Abatimento:'
        end
        object Label37: TLabel
          Left = 4
          Top = 442
          Width = 77
          Height = 13
          Caption = 'Vlr.Maior Fatura:'
        end
        object Label38: TLabel
          Left = 217
          Top = 442
          Width = 76
          Height = 13
          Caption = 'Dt.Maior Fatura:'
        end
        object Label39: TLabel
          Left = 412
          Top = 442
          Width = 103
          Height = 13
          Caption = 'N'#186' Nota Maior Fatura:'
        end
        object Label40: TLabel
          Left = 197
          Top = 408
          Width = 69
          Height = 13
          Caption = 'Vlr.Cancelado:'
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 1
          Width = 767
          Height = 312
          Caption = 'Contas a Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label11: TLabel
            Left = 24
            Top = 293
            Width = 37
            Height = 13
            Caption = 'Quitado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object ALed4: TALed
            Left = 5
            Top = 290
            Width = 16
            Height = 16
            FalseColor = clTeal
          end
          object ALed5: TALed
            Left = 69
            Top = 291
            Width = 16
            Height = 16
            FalseColor = clWhite
          end
          object Label12: TLabel
            Left = 88
            Top = 294
            Width = 60
            Height = 13
            Caption = 'N'#227'o Quitado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 178
            Top = 294
            Width = 48
            Height = 13
            Caption = 'Em Atraso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object ALed6: TALed
            Left = 159
            Top = 291
            Width = 16
            Height = 16
            FalseColor = clRed
          end
          object Label14: TLabel
            Left = 257
            Top = 294
            Width = 77
            Height = 13
            Caption = 'Nota Cancelada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object ALed7: TALed
            Left = 238
            Top = 291
            Width = 16
            Height = 16
            FalseColor = 12615935
          end
          object RxDBGrid3: TRxDBGrid
            Left = 4
            Top = 13
            Width = 758
            Height = 275
            DataSource = dsCReceberParc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnGetCellParams = RxDBGrid3GetCellParams
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DtVencCReceber'
                Title.Alignment = taCenter
                Title.Caption = 'Dt. Vencto.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TipoDoc'
                Title.Alignment = taCenter
                Title.Caption = 'T.Doc.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NumNota'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' Nota'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 71
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ParcCReceber'
                Title.Alignment = taCenter
                Title.Caption = 'Parc.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 29
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VlrParcCReceber'
                Title.Alignment = taCenter
                Title.Caption = 'Valor Parcela'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DtPagParcCReceber'
                Title.Alignment = taCenter
                Title.Caption = 'Dt. Pgto.'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PgtoParcial'
                Title.Alignment = taCenter
                Title.Caption = 'Pgto. Parcial'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RestParcela'
                Title.Alignment = taCenter
                Title.Caption = 'Valor Restante'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Despesas'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Abatimentos'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 75
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'clDiasAtraso'
                Title.Alignment = taCenter
                Title.Caption = 'Dias Atraso'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 59
                Visible = True
              end>
          end
        end
        object DateEdit2: TDateEdit
          Left = 87
          Top = 318
          Width = 94
          Height = 21
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 1
        end
        object CurrencyEdit9: TCurrencyEdit
          Left = 293
          Top = 318
          Width = 57
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 2
        end
        object CurrencyEdit11: TCurrencyEdit
          Left = 701
          Top = 318
          Width = 57
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 3
        end
        object CurrencyEdit12: TCurrencyEdit
          Left = 464
          Top = 318
          Width = 97
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 4
        end
        object CurrencyEdit10: TCurrencyEdit
          Left = 443
          Top = 378
          Width = 117
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 5
        end
        object CurrencyEdit13: TCurrencyEdit
          Left = 662
          Top = 378
          Width = 106
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 6
        end
        object CurrencyEdit14: TCurrencyEdit
          Left = 72
          Top = 378
          Width = 114
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 7
        end
        object CurrencyEdit15: TCurrencyEdit
          Left = 128
          Top = 342
          Width = 73
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 8
        end
        object CurrencyEdit16: TCurrencyEdit
          Left = 202
          Top = 342
          Width = 29
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 9
        end
        object CurrencyEdit17: TCurrencyEdit
          Left = 403
          Top = 342
          Width = 62
          Height = 21
          AutoSize = False
          DisplayFormat = '0.00'
          ReadOnly = True
          TabOrder = 10
        end
        object CurrencyEdit18: TCurrencyEdit
          Left = 443
          Top = 402
          Width = 117
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 11
        end
        object CurrencyEdit19: TCurrencyEdit
          Left = 662
          Top = 402
          Width = 106
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 12
        end
        object CurrencyEdit20: TCurrencyEdit
          Left = 72
          Top = 402
          Width = 114
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 13
        end
        object CurrencyEdit21: TCurrencyEdit
          Left = 267
          Top = 378
          Width = 104
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 14
        end
        object CurrencyEdit22: TCurrencyEdit
          Left = 82
          Top = 434
          Width = 114
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 15
        end
        object DateEdit3: TDateEdit
          Left = 296
          Top = 434
          Width = 94
          Height = 21
          NumGlyphs = 2
          ReadOnly = True
          TabOrder = 16
        end
        object CurrencyEdit23: TCurrencyEdit
          Left = 517
          Top = 434
          Width = 91
          Height = 21
          AutoSize = False
          DisplayFormat = '0'
          ReadOnly = True
          TabOrder = 17
        end
        object CurrencyEdit24: TCurrencyEdit
          Left = 267
          Top = 402
          Width = 104
          Height = 21
          AutoSize = False
          DisplayFormat = '###,###,##0.00'
          ReadOnly = True
          TabOrder = 18
        end
      end
    end
  end
  object qQtd: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodCliente, SUM( QtdPares ) QtdPares, SUM( QtdParesFat ) ' +
        'QtdParesFat, SUM( QtdParesRest ) QtdParesRest, SUM( QtdParesCanc' +
        ' ) QtdParesCanc'
      'FROM "dbPedido.DB" Dbpedido'
      'WHERE  CodCliente = :Codigo'
      'GROUP BY CodCliente')
    Left = 745
    Top = 469
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qQtdCodCliente: TIntegerField
      FieldName = 'CodCliente'
      Origin = 'TABELAS."dbPedido.DB".CodCliente'
    end
    object qQtdQtdPares: TFloatField
      FieldName = 'QtdPares'
      Origin = 'TABELAS."dbPedido.DB".QtdPares'
    end
    object qQtdQtdParesFat: TFloatField
      FieldName = 'QtdParesFat'
      Origin = 'TABELAS."dbPedido.DB".QtdParesFat'
    end
    object qQtdQtdParesRest: TFloatField
      FieldName = 'QtdParesRest'
      Origin = 'TABELAS."dbPedido.DB".QtdParesRest'
    end
    object qQtdQtdParesCanc: TFloatField
      FieldName = 'QtdParesCanc'
      Origin = 'TABELAS."dbPedido.DB".QtdParesCanc'
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsPedido
    Filter.Strings = (
      'QtdParesRest > 0')
    Left = 721
    Top = 469
  end
  object tCReceberParc: TTable
    Active = True
    OnCalcFields = tCReceberParcCalcFields
    DatabaseName = 'Tabelas'
    TableName = 'dbCReceberParc.DB'
    Left = 353
    Top = 129
    object tCReceberParcNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberParcParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object tCReceberParcVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
    end
    object tCReceberParcDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
    end
    object tCReceberParcQuitParcCReceber: TBooleanField
      FieldName = 'QuitParcCReceber'
    end
    object tCReceberParcJurosParcCReceber: TFloatField
      FieldName = 'JurosParcCReceber'
    end
    object tCReceberParcDtPagParcCReceber: TDateField
      FieldName = 'DtPagParcCReceber'
    end
    object tCReceberParcCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberParcNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tCReceberParcDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tCReceberParcPgtoParcial: TFloatField
      FieldName = 'PgtoParcial'
    end
    object tCReceberParcRestParcela: TFloatField
      FieldName = 'RestParcela'
    end
    object tCReceberParcContaDupl: TSmallintField
      FieldName = 'ContaDupl'
    end
    object tCReceberParcSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tCReceberParcCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tCReceberParcBaixada: TBooleanField
      FieldName = 'Baixada'
    end
    object tCReceberParcPercComissao: TFloatField
      FieldName = 'PercComissao'
    end
    object tCReceberParcVlrComissao: TFloatField
      FieldName = 'VlrComissao'
    end
    object tCReceberParcPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tCReceberParcAgencia: TStringField
      FieldName = 'Agencia'
      Size = 6
    end
    object tCReceberParcTitPortador: TStringField
      FieldName = 'TitPortador'
    end
    object tCReceberParcCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tCReceberParcDespesas: TFloatField
      FieldName = 'Despesas'
    end
    object tCReceberParcAbatimentos: TFloatField
      FieldName = 'Abatimentos'
    end
    object tCReceberParcCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCReceberParcPgCartorio: TBooleanField
      FieldName = 'PgCartorio'
    end
    object tCReceberParcDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tCReceberParcLetraCambio: TBooleanField
      FieldName = 'LetraCambio'
    end
    object tCReceberParcNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tCReceberParcJurosPagos: TFloatField
      FieldName = 'JurosPagos'
    end
    object tCReceberParcCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tCReceberParcTitProtestado: TBooleanField
      FieldName = 'TitProtestado'
    end
    object tCReceberParcDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCReceberParcTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberParcVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
    end
    object tCReceberParcclDiasAtraso: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'clDiasAtraso'
      Calculated = True
    end
  end
  object dsCReceberParc: TDataSource
    DataSet = tCReceberParc
    Left = 369
    Top = 129
  end
  object qMaiorFatura: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT NumNota, DtGerado, VlrTotal'
      'FROM "dbCReceber.DB" Dbcreceber'
      'WHERE  CodCli = :CodCliente'
      'ORDER BY VlrTotal')
    Left = 569
    Top = 225
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodCliente'
        ParamType = ptUnknown
      end>
    object qMaiorFaturaNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbCReceber.DB".NumNota'
    end
    object qMaiorFaturaDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCReceber.DB".DtGerado'
    end
    object qMaiorFaturaVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCReceber.DB".VlrTotal'
    end
  end
end
