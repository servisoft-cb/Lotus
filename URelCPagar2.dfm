object fRelCPagar2: TfRelCPagar2
  Left = 4
  Top = 101
  Width = 880
  Height = 484
  Caption = 'fRelCPagar2'
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
    Left = 16
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fContasPagar.dsQuery
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 26
      Width = 742
      Height = 199
      DataSource = fContasPagar.dsQuery
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 61
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel6: TRLLabel
          Left = 628
          Top = 6
          Width = 38
          Height = 14
          Caption = 'P'#225'gina:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 620
          Top = 23
          Width = 46
          Height = 14
          Caption = 'Emiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 667
          Top = 6
          Width = 31
          Height = 14
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 667
          Top = 23
          Width = 33
          Height = 14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 44
          Width = 56
          Height = 16
        end
        object RLLabel2: TRLLabel
          Left = 3
          Top = 46
          Width = 45
          Height = 12
          Caption = 'Dt.Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 55
          Top = 44
          Width = 183
          Height = 16
        end
        object RLLabel3: TRLLabel
          Left = 95
          Top = 46
          Width = 50
          Height = 12
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 237
          Top = 44
          Width = 70
          Height = 16
        end
        object RLLabel4: TRLLabel
          Left = 245
          Top = 46
          Width = 48
          Height = 12
          Caption = 'Vlr.Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 306
          Top = 44
          Width = 71
          Height = 16
        end
        object RLLabel5: TRLLabel
          Left = 309
          Top = 46
          Width = 61
          Height = 12
          Caption = 'Saldo a Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 376
          Top = 44
          Width = 88
          Height = 16
        end
        object RLLabel8: TRLLabel
          Left = 394
          Top = 46
          Width = 51
          Height = 12
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 463
          Top = 44
          Width = 57
          Height = 16
        end
        object RLLabel9: TRLLabel
          Left = 469
          Top = 46
          Width = 44
          Height = 12
          Caption = 'Dt.Recto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = 622
          Top = 44
          Width = 120
          Height = 16
        end
        object RLLabel10: TRLLabel
          Left = 654
          Top = 46
          Width = 29
          Height = 12
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 8
          Top = 32
          Width = 38
          Height = 12
          Caption = 'Op'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 48
          Top = 32
          Width = 47
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw10: TRLDraw
          Left = 519
          Top = 44
          Width = 104
          Height = 16
        end
        object RLLabel29: TRLLabel
          Left = 535
          Top = 46
          Width = 63
          Height = 12
          Caption = 'Tipo Cobran'#231'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 61
        Width = 742
        Height = 34
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 1
          Top = 1
          Width = 54
          Height = 13
          Alignment = taCenter
          AutoSize = False
          DataField = 'Data'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 56
          Top = 1
          Width = 181
          Height = 13
          AutoSize = False
          DataField = 'Fornecedor'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 238
          Top = 1
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorParc'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 309
          Top = 1
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorRestante'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 379
          Top = 1
          Width = 86
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 465
          Top = 1
          Width = 54
          Height = 13
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtRecto'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 623
          Top = 1
          Width = 117
          Height = 13
          AutoSize = False
          DataField = 'lkNomeBanco'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 68
          Top = 17
          Width = 156
          Height = 14
          AutoSize = False
          Caption = 'Banco/Ag'#234'ncia/Conta Dep'#243'sito:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 226
          Top = 17
          Width = 514
          Height = 14
          AutoSize = False
          Caption = 'Banco/Ag'#234'ncia/Conta Dep'#243'sito:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw8: TRLDraw
          Left = 0
          Top = 31
          Width = 742
          Height = 3
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel28: TRLLabel
          Left = 3
          Top = 15
          Width = 49
          Height = 12
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 520
          Top = 1
          Width = 102
          Height = 13
          AutoSize = False
          DataField = 'NomeTipoCobranca'
          DataSource = fContasPagar.dsQuery
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 95
        Width = 742
        Height = 35
        BeforePrint = RLBand3BeforePrint
        object RLLabel16: TRLLabel
          Left = 248
          Top = 3
          Width = 69
          Height = 14
          Caption = 'Total do dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 319
          Top = 3
          Width = 108
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'teste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 239
          Top = 18
          Width = 78
          Height = 14
          Caption = 'Total do m'#234's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel19: TRLLabel
          Left = 319
          Top = 18
          Width = 108
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'teste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel20: TRLLabel
          Left = 545
          Top = 3
          Width = 99
          Height = 14
          Caption = 'Qtd.de t'#237'tulos dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 536
          Top = 18
          Width = 108
          Height = 14
          Caption = 'Qtd.de t'#237'tulos m'#234's:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw9: TRLDraw
          Left = 0
          Top = 32
          Width = 742
          Height = 3
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel23: TRLLabel
          Left = 645
          Top = 3
          Width = 66
          Height = 14
          AutoSize = False
          Caption = 'Qtd.de t'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel24: TRLLabel
          Left = 645
          Top = 18
          Width = 66
          Height = 14
          AutoSize = False
          Caption = 'Qtd.de t'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 130
        Width = 742
        Height = 18
        BandType = btSummary
        BeforePrint = RLBand4BeforePrint
        object RLLabel22: TRLLabel
          Left = 251
          Top = 2
          Width = 65
          Height = 14
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel25: TRLLabel
          Left = 525
          Top = 2
          Width = 119
          Height = 14
          Caption = 'Total geral de t'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel26: TRLLabel
          Left = 319
          Top = 2
          Width = 108
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'teste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel27: TRLLabel
          Left = 646
          Top = 2
          Width = 66
          Height = 14
          AutoSize = False
          Caption = 'teste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLLabel1: TRLLabel
      Left = 344
      Top = 32
      Width = 180
      Height = 16
      Caption = 'Relat'#243'rio do contas a pagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
end
