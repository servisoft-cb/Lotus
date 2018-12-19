object fRelCopiaNF2: TfRelCopiaNF2
  Left = 2
  Top = 101
  Width = 804
  Height = 472
  VertScrollBar.Position = 142
  BorderIcons = [biSystemMenu]
  Caption = 'fRelCopiaNF2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 2
    Top = -140
    Width = 794
    Height = 1123
    DataSource = DM1.dsNotaFiscal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 501
      DataSource = DM1.dsNotaFiscal
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 117
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel3: TRLLabel
          Left = 190
          Top = 13
          Width = 172
          Height = 18
          Caption = 'Copia da Nota Fiscal Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 534
          Top = 15
          Width = 90
          Height = 16
          Caption = 'Data Emissão:'
        end
        object RLDBText10: TRLDBText
          Left = 366
          Top = 13
          Width = 69
          Height = 18
          DataField = 'NumNota'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText11: TRLDBText
          Left = 630
          Top = 15
          Width = 68
          Height = 16
          DataField = 'DtEmissao'
          DataSource = DM1.dsNotaFiscal
        end
        object RLDraw2: TRLDraw
          Left = 1
          Top = 33
          Width = 716
          Height = 1
        end
        object RLLabel37: TRLLabel
          Left = 8
          Top = 36
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
          Top = 75
          Width = 302
          Height = 16
          AutoSize = False
          Caption = 'Cidade'
        end
        object RLLabel42: TRLLabel
          Left = 8
          Top = 57
          Width = 335
          Height = 16
          AutoSize = False
          Caption = 'Endereco'
        end
        object RLLabel43: TRLLabel
          Left = 350
          Top = 57
          Width = 29
          Height = 16
          Caption = 'Tel.:'
        end
        object RLLabel44: TRLLabel
          Left = 501
          Top = 57
          Width = 30
          Height = 16
          Caption = 'Fax:'
        end
        object RLLabel45: TRLLabel
          Left = 382
          Top = 75
          Width = 35
          Height = 16
          Caption = 'CEP:'
        end
        object RLLabel46: TRLLabel
          Left = 286
          Top = 93
          Width = 91
          Height = 16
          Caption = 'Insc. Estadual:'
        end
        object RLLabel47: TRLLabel
          Left = 8
          Top = 94
          Width = 41
          Height = 16
          Caption = 'CNPJ:'
        end
        object RLLabel48: TRLLabel
          Left = 382
          Top = 57
          Width = 116
          Height = 16
          AutoSize = False
          Caption = 'Tel.:'
        end
        object RLLabel49: TRLLabel
          Left = 533
          Top = 57
          Width = 117
          Height = 16
          AutoSize = False
          Caption = 'Fax:'
        end
        object RLLabel50: TRLLabel
          Left = 312
          Top = 75
          Width = 21
          Height = 16
          Caption = 'UF'
        end
        object RLLabel51: TRLLabel
          Left = 420
          Top = 75
          Width = 203
          Height = 16
          AutoSize = False
          Caption = 'CEP:'
        end
        object RLLabel52: TRLLabel
          Left = 52
          Top = 93
          Width = 211
          Height = 16
          AutoSize = False
          Caption = 'CNPJ:'
        end
        object RLLabel53: TRLLabel
          Left = 380
          Top = 93
          Width = 259
          Height = 16
          AutoSize = False
          Caption = 'Insc. Estadual:'
        end
        object RLDraw10: TRLDraw
          Left = 2
          Top = 115
          Width = 716
          Height = 1
        end
      end
      object RLSubDetail3: TRLSubDetail
        Left = 0
        Top = 117
        Width = 718
        Height = 79
        DataSource = DM1.dsCliente
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 78
          object RLLabel9: TRLLabel
            Left = 32
            Top = 3
            Width = 48
            Height = 16
            Caption = 'Cliente:'
          end
          object RLLabel10: TRLLabel
            Left = 17
            Top = 22
            Width = 63
            Height = 16
            Caption = 'Endereço:'
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
            Width = 41
            Height = 16
            DataField = 'Nome'
            DataSource = DM1.dsCliente
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
            Width = 59
            Height = 16
            DataField = 'Endereco'
            DataSource = DM1.dsCliente
          end
          object RLDBText14: TRLDBText
            Left = 84
            Top = 40
            Width = 38
            Height = 16
            DataField = 'Bairro'
            DataSource = DM1.dsCliente
          end
          object RLDBText15: TRLDBText
            Left = 84
            Top = 58
            Width = 44
            Height = 16
            DataField = 'Cidade'
            DataSource = DM1.dsCliente
          end
          object RLDBText16: TRLDBText
            Left = 494
            Top = 3
            Width = 52
            Height = 16
            DataField = 'Telefone'
            DataSource = DM1.dsCliente
          end
          object RLDBText17: TRLDBText
            Left = 494
            Top = 22
            Width = 27
            Height = 16
            DataField = 'Cep'
            DataSource = DM1.dsCliente
          end
          object RLDBText18: TRLDBText
            Left = 494
            Top = 40
            Width = 16
            Height = 16
            DataField = 'Uf'
            DataSource = DM1.dsCliente
          end
          object RLDraw1: TRLDraw
            Left = 1
            Top = 76
            Width = 716
            Height = 1
          end
          object RLLabel54: TRLLabel
            Left = 416
            Top = 58
            Width = 71
            Height = 16
            Alignment = taRightJustify
            Caption = 'CNPJ/CPF:'
          end
          object RLDBText8: TRLDBText
            Left = 494
            Top = 58
            Width = 46
            Height = 16
            DataField = 'CgcCpf'
            DataSource = DM1.dsCliente
          end
        end
      end
      object RLSubDetail4: TRLSubDetail
        Left = 0
        Top = 196
        Width = 718
        Height = 152
        DataSource = DM1.dsNotaFiscal
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 151
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
            Caption = 'Endereço:'
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
          object RLLabel21: TRLLabel
            Left = 437
            Top = 21
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
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText20: TRLDBText
            Left = 102
            Top = 21
            Width = 76
            Height = 16
            DataField = 'lkEndTransp'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText21: TRLDBText
            Left = 102
            Top = 39
            Width = 93
            Height = 16
            DataField = 'lkCidadeTransp'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText22: TRLDBText
            Left = 488
            Top = 3
            Width = 82
            Height = 16
            DataField = 'lkFoneTransp'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText24: TRLDBText
            Left = 488
            Top = 21
            Width = 65
            Height = 16
            DataField = 'lkUFTransp'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDraw4: TRLDraw
            Left = 1
            Top = 57
            Width = 716
            Height = 1
          end
          object RLLabel22: TRLLabel
            Left = 6
            Top = 114
            Width = 171
            Height = 16
            Caption = 'Condições de Pagamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel23: TRLLabel
            Left = 11
            Top = 132
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
            Top = 132
            Width = 188
            Height = 16
            Caption = 'Referência/Nome do Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel25: TRLLabel
            Left = 666
            Top = 132
            Width = 47
            Height = 16
            Caption = 'Vlr. IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel27: TRLLabel
            Left = 369
            Top = 132
            Width = 58
            Height = 16
            Caption = 'Sit. Trib.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel28: TRLLabel
            Left = 435
            Top = 132
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
            Left = 473
            Top = 132
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
            Left = 512
            Top = 132
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
            Left = 579
            Top = 132
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
            Top = 114
            Width = 71
            Height = 16
            DataField = 'lkCondPgto'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDraw5: TRLDraw
            Left = 1
            Top = 149
            Width = 716
            Height = 1
          end
          object RLDraw3: TRLDraw
            Left = 2
            Top = 105
            Width = 716
            Height = 1
          end
          object RLLabel20: TRLLabel
            Left = 33
            Top = 63
            Width = 67
            Height = 15
            Caption = 'Base ICMS:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel26: TRLLabel
            Left = 290
            Top = 63
            Width = 66
            Height = 15
            Caption = 'Valor ICMS:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel36: TRLLabel
            Left = 524
            Top = 63
            Width = 65
            Height = 15
            Caption = 'Valor Frete:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel38: TRLLabel
            Left = 6
            Top = 84
            Width = 94
            Height = 15
            Caption = 'Valor do Seguro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel39: TRLLabel
            Left = 284
            Top = 84
            Width = 72
            Height = 15
            Caption = 'Outra Desp.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel40: TRLLabel
            Left = 508
            Top = 84
            Width = 81
            Height = 15
            Caption = 'Valor Total IPI:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText2: TRLDBText
            Left = 102
            Top = 62
            Width = 62
            Height = 16
            DataField = 'BaseIcms'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText3: TRLDBText
            Left = 102
            Top = 83
            Width = 61
            Height = 16
            DataField = 'VlrSeguro'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText4: TRLDBText
            Left = 358
            Top = 83
            Width = 73
            Height = 16
            DataField = 'OutrasDesp'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText5: TRLDBText
            Left = 358
            Top = 62
            Width = 48
            Height = 16
            DataField = 'VlrIcms'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText6: TRLDBText
            Left = 591
            Top = 62
            Width = 50
            Height = 16
            DataField = 'VlrFrete'
            DataSource = DM1.dsNotaFiscal
          end
          object RLDBText7: TRLDBText
            Left = 591
            Top = 83
            Width = 33
            Height = 16
            DataField = 'VlrIpi'
            DataSource = DM1.dsNotaFiscal
          end
        end
      end
      object RLSubDetail5: TRLSubDetail
        Left = 0
        Top = 348
        Width = 718
        Height = 55
        DataSource = DM1.dsNotaFiscalItens
        object RLBand5: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 54
          BeforePrint = RLBand5BeforePrint
          object RLDBText26: TRLDBText
            Left = 3
            Top = 2
            Width = 29
            Height = 16
            DataField = 'Item'
            DataSource = DM1.dsNotaFiscalItens
          end
          object RLDBText30: TRLDBText
            Left = 372
            Top = 2
            Width = 56
            Height = 16
            Alignment = taCenter
            AutoSize = False
            DataField = 'lkSitTributaria'
            DataSource = DM1.dsNotaFiscalItens
          end
          object RLDBText31: TRLDBText
            Left = 441
            Top = 2
            Width = 25
            Height = 16
            Alignment = taRightJustify
            DataField = 'Qtd'
            DataSource = DM1.dsNotaFiscalItens
          end
          object RLDBText32: TRLDBText
            Left = 472
            Top = 2
            Width = 51
            Height = 16
            DataField = 'Unidade'
            DataSource = DM1.dsNotaFiscalItens
          end
          object RLDBText33: TRLDBText
            Left = 527
            Top = 2
            Width = 43
            Height = 16
            Alignment = taRightJustify
            DataField = 'VlrUnit'
            DataSource = DM1.dsNotaFiscalItens
          end
          object RLDBText34: TRLDBText
            Left = 592
            Top = 2
            Width = 48
            Height = 16
            Alignment = taRightJustify
            DataField = 'VlrTotal'
            DataSource = DM1.dsNotaFiscalItens
          end
          object RLLabel32: TRLLabel
            Left = 69
            Top = 17
            Width = 33
            Height = 16
            Caption = 'Tam:'
          end
          object Tam1: TRLLabel
            Left = 104
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam2: TRLLabel
            Left = 143
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam3: TRLLabel
            Left = 182
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam4: TRLLabel
            Left = 221
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam5: TRLLabel
            Left = 260
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam6: TRLLabel
            Left = 299
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam7: TRLLabel
            Left = 338
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam8: TRLLabel
            Left = 377
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam9: TRLLabel
            Left = 416
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam10: TRLLabel
            Left = 455
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam11: TRLLabel
            Left = 494
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam12: TRLLabel
            Left = 533
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam13: TRLLabel
            Left = 572
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam14: TRLLabel
            Left = 611
            Top = 17
            Width = 38
            Height = 16
          end
          object Tam15: TRLLabel
            Left = 650
            Top = 17
            Width = 38
            Height = 16
          end
          object RLLabel33: TRLLabel
            Left = 73
            Top = 35
            Width = 29
            Height = 16
            Caption = 'Qtd:'
          end
          object Qtd1: TRLLabel
            Left = 104
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd2: TRLLabel
            Left = 143
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd3: TRLLabel
            Left = 182
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd4: TRLLabel
            Left = 221
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd5: TRLLabel
            Left = 260
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd6: TRLLabel
            Left = 299
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd7: TRLLabel
            Left = 338
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd8: TRLLabel
            Left = 377
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd9: TRLLabel
            Left = 416
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd10: TRLLabel
            Left = 455
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd11: TRLLabel
            Left = 494
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd12: TRLLabel
            Left = 533
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd13: TRLLabel
            Left = 572
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd14: TRLLabel
            Left = 611
            Top = 35
            Width = 38
            Height = 16
          end
          object Qtd15: TRLLabel
            Left = 650
            Top = 35
            Width = 38
            Height = 16
          end
          object RLLabel4: TRLLabel
            Left = 35
            Top = 2
            Width = 333
            Height = 16
            AutoSize = False
          end
          object RLDBText1: TRLDBText
            Left = 680
            Top = 2
            Width = 33
            Height = 16
            Alignment = taRightJustify
            DataField = 'VlrIpi'
            DataSource = DM1.dsNotaFiscalItens
          end
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 403
        Width = 718
        Height = 131
        BandType = btFooter
        BeforePrint = RLBand6BeforePrint
        object RLLabel34: TRLLabel
          Left = 4
          Top = 6
          Width = 89
          Height = 16
          Caption = 'Observações:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 465
          Top = 5
          Width = 253
          Height = 45
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
          Width = 382
          Height = 16
        end
        object RLLabel1: TRLLabel
          Left = 489
          Top = 8
          Width = 128
          Height = 18
          Alignment = taRightJustify
          Caption = 'Total Produto R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 468
          Top = 27
          Width = 149
          Height = 18
          Alignment = taRightJustify
          Caption = 'Total Nota Fiscal R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 620
          Top = 8
          Width = 96
          Height = 18
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 620
          Top = 27
          Width = 96
          Height = 18
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
end
