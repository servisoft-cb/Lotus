object fRelOrdemCompraMail: TfRelOrdemCompraMail
  Left = 161
  Top = 68
  Width = 918
  Height = 657
  VertScrollBar.Position = 315
  BorderIcons = [biSystemMenu]
  Caption = 'fRelOrdemCompraMail'
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
  object RLReport1: TRLReport
    Left = 52
    Top = -304
    Width = 794
    Height = 1123
    DataSource = DM1.dsOrdemCompra
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 770
      DataSource = DM1.dsOrdemCompra
      BeforePrint = RLSubDetail1BeforePrint
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 132
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel3: TRLLabel
          Left = 8
          Top = 13
          Width = 206
          Height = 24
          Caption = 'Ordem de Compra N'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 552
          Top = 26
          Width = 90
          Height = 16
          Caption = 'Data Emiss'#227'o:'
        end
        object RLDBText10: TRLDBText
          Left = 219
          Top = 13
          Width = 73
          Height = 24
          DataField = 'Codigo'
          DataSource = DM1.dsOrdemCompra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText11: TRLDBText
          Left = 645
          Top = 26
          Width = 68
          Height = 16
          DataField = 'DtEmissao'
          DataSource = DM1.dsOrdemCompra
        end
        object RLDraw2: TRLDraw
          Left = 1
          Top = 49
          Width = 716
          Height = 1
        end
        object RLLabel37: TRLLabel
          Left = 8
          Top = 52
          Width = 575
          Height = 19
          AutoSize = False
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel41: TRLLabel
          Left = 8
          Top = 91
          Width = 302
          Height = 16
          AutoSize = False
          Caption = 'Cidade'
        end
        object RLLabel42: TRLLabel
          Left = 8
          Top = 73
          Width = 335
          Height = 16
          AutoSize = False
          Caption = 'Endereco'
        end
        object RLLabel43: TRLLabel
          Left = 350
          Top = 73
          Width = 29
          Height = 16
          Caption = 'Tel.:'
        end
        object RLLabel44: TRLLabel
          Left = 501
          Top = 73
          Width = 30
          Height = 16
          Caption = 'Fax:'
        end
        object RLLabel45: TRLLabel
          Left = 382
          Top = 91
          Width = 35
          Height = 16
          Caption = 'CEP:'
        end
        object RLLabel46: TRLLabel
          Left = 286
          Top = 109
          Width = 91
          Height = 16
          Caption = 'Insc. Estadual:'
        end
        object RLLabel47: TRLLabel
          Left = 8
          Top = 110
          Width = 41
          Height = 16
          Caption = 'CNPJ:'
        end
        object RLLabel48: TRLLabel
          Left = 382
          Top = 73
          Width = 116
          Height = 16
          AutoSize = False
          Caption = 'Tel.:'
        end
        object RLLabel49: TRLLabel
          Left = 533
          Top = 73
          Width = 117
          Height = 16
          AutoSize = False
          Caption = 'Fax:'
        end
        object RLLabel50: TRLLabel
          Left = 312
          Top = 91
          Width = 21
          Height = 16
          Caption = 'UF'
        end
        object RLLabel51: TRLLabel
          Left = 420
          Top = 91
          Width = 203
          Height = 16
          AutoSize = False
          Caption = 'CEP:'
        end
        object RLLabel52: TRLLabel
          Left = 52
          Top = 109
          Width = 211
          Height = 16
          AutoSize = False
          Caption = 'CNPJ:'
        end
        object RLLabel53: TRLLabel
          Left = 380
          Top = 109
          Width = 133
          Height = 16
          AutoSize = False
          Caption = 'Insc. Estadual:'
        end
        object RLDraw10: TRLDraw
          Left = 2
          Top = 129
          Width = 716
          Height = 1
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 132
        Width = 718
        Height = 17
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 14
          object RLDBText1: TRLDBText
            Left = 8
            Top = 5
            Width = 72
            Height = 19
            DataField = 'Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText2: TRLDBText
            Left = 8
            Top = 29
            Width = 59
            Height = 16
            DataField = 'Endereco'
          end
          object RLDBText3: TRLDBText
            Left = 8
            Top = 48
            Width = 44
            Height = 16
            DataField = 'Cidade'
          end
          object RLDBText4: TRLDBText
            Left = 54
            Top = 69
            Width = 37
            Height = 16
            DataField = 'CNPJ'
          end
          object RLDBText5: TRLDBText
            Left = 286
            Top = 49
            Width = 45
            Height = 16
            DataField = 'Estado'
          end
          object RLDBText6: TRLDBText
            Left = 382
            Top = 29
            Width = 21
            Height = 16
            DataField = 'Tel'
          end
          object RLDBText7: TRLDBText
            Left = 534
            Top = 29
            Width = 26
            Height = 16
            DataField = 'Fax'
          end
          object RLDBText8: TRLDBText
            Left = 420
            Top = 49
            Width = 27
            Height = 16
            DataField = 'Cep'
          end
          object RLDBText9: TRLDBText
            Left = 380
            Top = 70
            Width = 32
            Height = 16
            DataField = 'Inscr'
          end
          object RLLabel1: TRLLabel
            Left = 8
            Top = 69
            Width = 41
            Height = 16
            Caption = 'CNPJ:'
          end
          object RLLabel2: TRLLabel
            Left = 350
            Top = 29
            Width = 29
            Height = 16
            Caption = 'Tel.:'
          end
          object RLLabel6: TRLLabel
            Left = 501
            Top = 29
            Width = 30
            Height = 16
            Caption = 'Fax:'
          end
          object RLLabel7: TRLLabel
            Left = 382
            Top = 49
            Width = 35
            Height = 16
            Caption = 'CEP:'
          end
          object RLLabel8: TRLLabel
            Left = 286
            Top = 70
            Width = 91
            Height = 16
            Caption = 'Insc. Estadual:'
          end
          object RLDraw3: TRLDraw
            Left = 1
            Top = 88
            Width = 716
            Height = 1
          end
        end
      end
      object RLSubDetail3: TRLSubDetail
        Left = 0
        Top = 149
        Width = 718
        Height = 79
        DataSource = DM1.dsFornecedores
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 78
          object RLLabel9: TRLLabel
            Left = 7
            Top = 3
            Width = 73
            Height = 16
            Caption = 'Fornecedor:'
          end
          object RLLabel10: TRLLabel
            Left = 17
            Top = 22
            Width = 63
            Height = 16
            Caption = 'Endere'#231'o:'
          end
          object RLLabel11: TRLLabel
            Left = 38
            Top = 40
            Width = 42
            Height = 16
            Caption = 'Bairro:'
          end
          object RLLabel12: TRLLabel
            Left = 32
            Top = 58
            Width = 48
            Height = 16
            Caption = 'Cidade:'
          end
          object RLLabel13: TRLLabel
            Left = 458
            Top = 3
            Width = 29
            Height = 16
            Caption = 'Tel.:'
          end
          object RLLabel14: TRLLabel
            Left = 452
            Top = 22
            Width = 35
            Height = 16
            Caption = 'CEP:'
          end
          object RLLabel15: TRLLabel
            Left = 438
            Top = 40
            Width = 49
            Height = 16
            Caption = 'Estado:'
          end
          object RLDBText12: TRLDBText
            Left = 84
            Top = 3
            Width = 70
            Height = 16
            DataField = 'NomeForn'
            DataSource = DM1.dsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText13: TRLDBText
            Left = 84
            Top = 22
            Width = 53
            Height = 16
            DataField = 'EndForn'
            DataSource = DM1.dsFornecedores
          end
          object RLDBText14: TRLDBText
            Left = 84
            Top = 40
            Width = 64
            Height = 16
            DataField = 'BairroForn'
            DataSource = DM1.dsFornecedores
          end
          object RLDBText15: TRLDBText
            Left = 84
            Top = 58
            Width = 54
            Height = 16
            DataField = 'lkCidade'
            DataSource = DM1.dsFornecedores
          end
          object RLDBText16: TRLDBText
            Left = 494
            Top = 3
            Width = 54
            Height = 16
            DataField = 'Tel1Forn'
            DataSource = DM1.dsFornecedores
          end
          object RLDBText17: TRLDBText
            Left = 494
            Top = 22
            Width = 57
            Height = 16
            DataField = 'CEPForn'
            DataSource = DM1.dsFornecedores
          end
          object RLDBText18: TRLDBText
            Left = 494
            Top = 40
            Width = 71
            Height = 16
            DataField = 'EstadoForn'
            DataSource = DM1.dsFornecedores
          end
          object RLDraw1: TRLDraw
            Left = 1
            Top = 76
            Width = 716
            Height = 1
          end
        end
      end
      object RLSubDetail4: TRLSubDetail
        Left = 0
        Top = 228
        Width = 718
        Height = 101
        DataSource = DM1.dsOrdemCompra
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 101
          object RLLabel16: TRLLabel
            Left = 6
            Top = 3
            Width = 94
            Height = 16
            Caption = 'Transportadora:'
          end
          object RLLabel17: TRLLabel
            Left = 37
            Top = 21
            Width = 63
            Height = 16
            Caption = 'Endere'#231'o:'
          end
          object RLLabel18: TRLLabel
            Left = 52
            Top = 39
            Width = 48
            Height = 16
            Caption = 'Cidade:'
          end
          object RLLabel19: TRLLabel
            Left = 430
            Top = 3
            Width = 56
            Height = 16
            Caption = 'Telefone:'
          end
          object RLLabel20: TRLLabel
            Left = 451
            Top = 21
            Width = 35
            Height = 16
            Caption = 'CEP:'
          end
          object RLLabel21: TRLLabel
            Left = 437
            Top = 39
            Width = 49
            Height = 16
            Caption = 'Estado:'
          end
          object RLDBText19: TRLDBText
            Left = 102
            Top = 3
            Width = 87
            Height = 16
            DataField = 'lkNomeTransp'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDBText20: TRLDBText
            Left = 102
            Top = 21
            Width = 76
            Height = 16
            DataField = 'lkEndTransp'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDBText21: TRLDBText
            Left = 102
            Top = 39
            Width = 72
            Height = 16
            DataField = 'lkCidTransp'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDBText22: TRLDBText
            Left = 488
            Top = 3
            Width = 82
            Height = 16
            DataField = 'lkFoneTransp'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDBText23: TRLDBText
            Left = 488
            Top = 21
            Width = 76
            Height = 16
            DataField = 'lkCepTransp'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDBText24: TRLDBText
            Left = 488
            Top = 39
            Width = 65
            Height = 16
            DataField = 'lkUfTransp'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDraw4: TRLDraw
            Left = 1
            Top = 57
            Width = 716
            Height = 1
          end
          object RLLabel22: TRLLabel
            Left = 6
            Top = 62
            Width = 171
            Height = 16
            Caption = 'Condi'#231#245'es de Pagamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel23: TRLLabel
            Left = 11
            Top = 80
            Width = 16
            Height = 16
            Caption = 'It.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel24: TRLLabel
            Left = 36
            Top = 80
            Width = 115
            Height = 16
            Caption = 'Nome do Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel26: TRLLabel
            Left = 476
            Top = 80
            Width = 35
            Height = 16
            Caption = '% IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel27: TRLLabel
            Left = 266
            Top = 80
            Width = 74
            Height = 16
            Caption = 'Dt. Entrega'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel28: TRLLabel
            Left = 403
            Top = 80
            Width = 30
            Height = 16
            Caption = 'Qtd.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel29: TRLLabel
            Left = 441
            Top = 80
            Width = 25
            Height = 16
            Caption = 'Un.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel30: TRLLabel
            Left = 587
            Top = 80
            Width = 59
            Height = 16
            Caption = 'Vlr. Unit.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel31: TRLLabel
            Left = 651
            Top = 80
            Width = 62
            Height = 16
            Caption = 'Vlr. Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText25: TRLDBText
            Left = 179
            Top = 62
            Width = 78
            Height = 16
            DataField = 'lkCondsPgto'
            DataSource = DM1.dsOrdemCompra
          end
          object RLDraw5: TRLDraw
            Left = 1
            Top = 97
            Width = 716
            Height = 1
          end
          object RLLabel25: TRLLabel
            Left = 525
            Top = 80
            Width = 43
            Height = 16
            Caption = 'Vlr.IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
      object RLSubDetail5: TRLSubDetail
        Left = 0
        Top = 329
        Width = 718
        Height = 136
        DataSource = DM1.dsOrdemCompraItem
        object RLBand5: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 34
          BeforePrint = RLBand5BeforePrint
          object RLDBText26: TRLDBText
            Left = 4
            Top = 2
            Width = 22
            Height = 14
            DataField = 'Item'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText27: TRLDBText
            Left = 84
            Top = 2
            Width = 497
            Height = 16
            AutoSize = False
            DataField = 'lkNomeMaterial'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText29: TRLDBText
            Left = 85
            Top = 18
            Width = 54
            Height = 14
            DataField = 'lkNomeCor'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText30: TRLDBText
            Left = 269
            Top = 18
            Width = 78
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtEntrega'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText31: TRLDBText
            Left = 411
            Top = 18
            Width = 20
            Height = 14
            Alignment = taRightJustify
            DataField = 'Qtd'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText32: TRLDBText
            Left = 439
            Top = 18
            Width = 42
            Height = 14
            DataField = 'Unidade'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText33: TRLDBText
            Left = 592
            Top = 18
            Width = 53
            Height = 14
            Alignment = taRightJustify
            DataField = 'VlrUnitario'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText34: TRLDBText
            Left = 674
            Top = 18
            Width = 40
            Height = 14
            Alignment = taRightJustify
            DataField = 'VlrTotal'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText36: TRLDBText
            Left = 34
            Top = 2
            Width = 48
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodMaterial'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText37: TRLDBText
            Left = 481
            Top = 18
            Width = 32
            Height = 14
            Alignment = taCenter
            DataField = 'AliqIPI'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText38: TRLDBText
            Left = 539
            Top = 18
            Width = 27
            Height = 14
            Alignment = taRightJustify
            DataField = 'VlrIPI'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw11: TRLDraw
            Left = 2
            Top = 1
            Width = 716
            Height = 1
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
        object RLBand8: TRLBand
          Left = 0
          Top = 34
          Width = 718
          Height = 43
          BeforePrint = RLBand8BeforePrint
          object RLDBText28: TRLDBText
            Left = 15
            Top = 11
            Width = 48
            Height = 14
            DataField = 'lkLargura'
            DataSource = DM1.dsOrdemCompraItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel32: TRLLabel
            Left = 69
            Top = 4
            Width = 33
            Height = 16
            Caption = 'Tam:'
          end
          object Tam1: TRLLabel
            Left = 104
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam2: TRLLabel
            Left = 143
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam3: TRLLabel
            Left = 182
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam4: TRLLabel
            Left = 221
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam5: TRLLabel
            Left = 260
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam6: TRLLabel
            Left = 299
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam7: TRLLabel
            Left = 338
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam8: TRLLabel
            Left = 377
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam9: TRLLabel
            Left = 416
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam10: TRLLabel
            Left = 455
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam11: TRLLabel
            Left = 494
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam12: TRLLabel
            Left = 533
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam13: TRLLabel
            Left = 572
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam14: TRLLabel
            Left = 611
            Top = 4
            Width = 38
            Height = 16
          end
          object Tam15: TRLLabel
            Left = 650
            Top = 4
            Width = 38
            Height = 16
          end
          object RLLabel33: TRLLabel
            Left = 73
            Top = 22
            Width = 29
            Height = 16
            Caption = 'Qtd:'
          end
          object Qtd1: TRLLabel
            Left = 104
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd2: TRLLabel
            Left = 143
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd3: TRLLabel
            Left = 182
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd4: TRLLabel
            Left = 221
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd5: TRLLabel
            Left = 260
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd6: TRLLabel
            Left = 299
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd7: TRLLabel
            Left = 338
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd8: TRLLabel
            Left = 377
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd9: TRLLabel
            Left = 416
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd10: TRLLabel
            Left = 455
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd11: TRLLabel
            Left = 494
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd12: TRLLabel
            Left = 533
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd13: TRLLabel
            Left = 572
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd14: TRLLabel
            Left = 611
            Top = 22
            Width = 38
            Height = 16
          end
          object Qtd15: TRLLabel
            Left = 650
            Top = 22
            Width = 38
            Height = 16
          end
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 484
        Width = 718
        Height = 295
        BandType = btFooter
        BeforePrint = RLBand6BeforePrint
        object RLLabel34: TRLLabel
          Left = 4
          Top = 6
          Width = 89
          Height = 16
          Caption = 'Observa'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 554
          Top = 5
          Width = 161
          Height = 25
        end
        object RLLabel35: TRLLabel
          Left = 558
          Top = 8
          Width = 73
          Height = 19
          Caption = 'Total R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel36: TRLLabel
          Left = 677
          Top = 8
          Width = 35
          Height = 19
          Alignment = taRightJustify
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel38: TRLLabel
          Left = 6
          Top = 126
          Width = 448
          Height = 19
          Caption = 'Deve constar o n'#250'mero da ordem de compra na nota fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = 70
          Top = 225
          Width = 217
          Height = 1
        end
        object RLLabel39: TRLLabel
          Left = 131
          Top = 228
          Width = 79
          Height = 17
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw8: TRLDraw
          Left = 422
          Top = 225
          Width = 217
          Height = 1
        end
        object RLLabel40: TRLLabel
          Left = 494
          Top = 228
          Width = 78
          Height = 17
          Caption = 'Comprador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw9: TRLDraw
          Left = 1
          Top = 1
          Width = 716
          Height = 1
        end
        object RLMemo1: TRLMemo
          Left = 6
          Top = 39
          Width = 529
          Height = 16
          Behavior = [beSiteExpander]
        end
      end
      object RLSubDetail6: TRLSubDetail
        Left = 0
        Top = 465
        Width = 718
        Height = 19
        object RLBand7: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          object RLLabel56: TRLLabel
            Left = 24
            Top = 2
            Width = 88
            Height = 14
            Caption = 'Data Vencimento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText35: TRLDBText
            Left = 117
            Top = 2
            Width = 121
            Height = 14
            AutoSize = False
            DataField = 'DtVecto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel57: TRLLabel
            Left = 274
            Top = 2
            Width = 42
            Height = 14
            Caption = 'Parcela:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText39: TRLDBText
            Left = 320
            Top = 2
            Width = 44
            Height = 14
            AutoSize = False
            DataField = 'Parcela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel58: TRLLabel
            Left = 408
            Top = 2
            Width = 32
            Height = 14
            Caption = 'Valor:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText40: TRLDBText
            Left = 444
            Top = 2
            Width = 142
            Height = 14
            AutoSize = False
            DataField = 'VlrParcela'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
  end
end
