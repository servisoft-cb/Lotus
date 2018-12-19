object fRelConsumoMat: TfRelConsumoMat
  Left = 4
  Top = 101
  Width = 1007
  Height = 561
  HorzScrollBar.Position = 149
  Caption = 'fRelConsumoMat'
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
    Left = -149
    Top = 24
    Width = 1123
    Height = 794
    DataSource = fConsConsumoMat.dsmEstoque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    PageSetup.Orientation = poLandscape
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 30
      Width = 1063
      Height = 451
      DataSource = fConsConsumoMat.dsmEstoque
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 1063
        Height = 57
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 200
          Top = 16
          Width = 554
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio Movimento Estoque - 01/11/2009 '#224' 30/11/2009'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 0
          Top = 42
          Width = 32
          Height = 12
          Caption = 'C'#243'digo'
        end
        object RLLabel3: TRLLabel
          Left = 40
          Top = 42
          Width = 35
          Height = 12
          Caption = 'Material'
        end
        object RLLabel4: TRLLabel
          Left = 280
          Top = 42
          Width = 18
          Height = 12
          Caption = 'Cor'
        end
        object RLLabel5: TRLLabel
          Left = 455
          Top = 42
          Width = 45
          Height = 12
          Caption = 'Q.Anterior'
        end
        object RLLabel8: TRLLabel
          Left = 576
          Top = 42
          Width = 68
          Height = 12
          Caption = 'Q.Entrada Nota'
        end
        object RLLabel9: TRLLabel
          Left = 649
          Top = 42
          Width = 64
          Height = 12
          Caption = 'Q.Outras Entr.'
        end
        object RLLabel10: TRLLabel
          Left = 802
          Top = 42
          Width = 44
          Height = 12
          Caption = 'Qtd.Saida'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 55
          Width = 1063
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel12: TRLLabel
          Left = 940
          Top = 40
          Width = 47
          Height = 12
          Caption = 'Saldo Qtd.'
        end
        object RLLabel13: TRLLabel
          Left = 1011
          Top = 40
          Width = 50
          Height = 12
          Caption = 'Saldo Valor'
        end
        object RLLabel11: TRLLabel
          Left = 368
          Top = 41
          Width = 55
          Height = 12
          Caption = 'Custo M'#233'dio'
        end
        object RLLabel14: TRLLabel
          Left = 521
          Top = 42
          Width = 52
          Height = 12
          Caption = 'Vlr. Anterior'
        end
        object RLLabel15: TRLLabel
          Left = 723
          Top = 43
          Width = 57
          Height = 12
          Caption = 'Vlr. Entradas'
        end
        object RLLabel16: TRLLabel
          Left = 870
          Top = 41
          Width = 43
          Height = 12
          Caption = 'Vlr. Saida'
        end
        object RLLabel6: TRLLabel
          Left = 992
          Top = 4
          Width = 34
          Height = 12
          Caption = 'P'#225'gina:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 984
          Top = 17
          Width = 42
          Height = 12
          Caption = 'Emiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 1027
          Top = 2
          Width = 31
          Height = 14
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 1027
          Top = 17
          Width = 29
          Height = 12
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
        Top = 57
        Width = 1063
        Height = 17
        object RLDBText1: TRLDBText
          Left = 0
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'CodMaterial'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText2: TRLDBText
          Left = 38
          Top = 2
          Width = 244
          Height = 12
          AutoSize = False
          DataField = 'NomeMaterial'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText3: TRLDBText
          Left = 282
          Top = 2
          Width = 93
          Height = 12
          AutoSize = False
          DataField = 'NomeCor'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText4: TRLDBText
          Left = 422
          Top = 2
          Width = 76
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdAnt'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText5: TRLDBText
          Left = 574
          Top = 2
          Width = 70
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdEntradaNota'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText6: TRLDBText
          Left = 644
          Top = 2
          Width = 68
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdEntradaOutros'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText7: TRLDBText
          Left = 780
          Top = 2
          Width = 70
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdSaida'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText8: TRLDBText
          Left = 918
          Top = 2
          Width = 71
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Saldo'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 15
          Width = 1063
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText9: TRLDBText
          Left = 990
          Top = 2
          Width = 72
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSaldo'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText10: TRLDBText
          Left = 375
          Top = 2
          Width = 47
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'PrecoCustoMedio'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText11: TRLDBText
          Left = 498
          Top = 2
          Width = 76
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrAnt'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText12: TRLDBText
          Left = 712
          Top = 2
          Width = 68
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrEntradaNotas'
          DataSource = fConsConsumoMat.dsmEstoque
        end
        object RLDBText13: TRLDBText
          Left = 851
          Top = 2
          Width = 66
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSaida'
          DataSource = fConsConsumoMat.dsmEstoque
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 74
        Width = 1063
        Height = 63
        BandType = btSummary
        object RLLabel17: TRLLabel
          Left = 570
          Top = 3
          Width = 111
          Height = 11
          Caption = 'Total Entrada (Nota) ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 800
          Top = 0
          Width = 117
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSaida'
          DataSource = fConsConsumoMat.dsmEstoque
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult2: TRLDBResult
          Left = 684
          Top = 2
          Width = 98
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrEntradaNotas'
          DataSource = fConsConsumoMat.dsmEstoque
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
      end
    end
  end
end
