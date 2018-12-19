object fRelHistGeralCliProdMes: TfRelHistGeralCliProdMes
  Left = 10
  Top = 108
  Width = 779
  Height = 457
  HorzScrollBar.Position = 48
  Caption = 'fRelHistGeralCliProdMes'
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
    Left = -40
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fHistGeral.dsmClienteProdMes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 6.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 6.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 23
      Top = 26
      Width = 748
      Height = 271
      DataSource = fHistGeral.dsmClienteProdMes
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 748
        Height = 56
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 9
          Top = 4
          Width = 630
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de Faturamento Cliente Produto por M'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 658
          Top = 2
          Width = 22
          Height = 12
          Caption = 'P'#225'g:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 681
          Top = 2
          Width = 40
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 681
          Top = 14
          Width = 29
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 654
          Top = 14
          Width = 26
          Height = 12
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 3
          Top = 27
          Width = 30
          Height = 10
          Caption = 'Op'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 35
          Top = 27
          Width = 30
          Height = 10
          Caption = 'Op'#231#245'es:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 39
          Width = 160
          Height = 16
        end
        object RLLabel6: TRLLabel
          Left = 24
          Top = 41
          Width = 32
          Height = 12
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLD1: TRLDraw
          Left = 159
          Top = 39
          Width = 95
          Height = 16
        end
        object Data1: TRLLabel
          Left = 175
          Top = 41
          Width = 49
          Height = 12
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLD2: TRLDraw
          Left = 253
          Top = 39
          Width = 144
          Height = 16
        end
        object Data2: TRLLabel
          Left = 261
          Top = 41
          Width = 76
          Height = 12
          Caption = 'Nome do Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLD3: TRLDraw
          Left = 396
          Top = 39
          Width = 46
          Height = 16
        end
        object Data3: TRLLabel
          Left = 399
          Top = 41
          Width = 39
          Height = 12
          Caption = 'M'#234's/Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 441
          Top = 39
          Width = 47
          Height = 16
        end
        object RLLabel8: TRLLabel
          Left = 444
          Top = 41
          Width = 40
          Height = 12
          Caption = 'Qtd.Ped.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 487
          Top = 39
          Width = 48
          Height = 16
        end
        object RLLabel12: TRLLabel
          Left = 489
          Top = 41
          Width = 44
          Height = 12
          Caption = 'Qtd.Rest.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 534
          Top = 39
          Width = 48
          Height = 16
        end
        object RLLabel13: TRLLabel
          Left = 538
          Top = 41
          Width = 38
          Height = 12
          Caption = 'Qtd.Fat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 628
          Top = 39
          Width = 71
          Height = 16
        end
        object RLLabel14: TRLLabel
          Left = 636
          Top = 41
          Width = 42
          Height = 12
          Caption = 'Vlr.Fatur.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 698
          Top = 39
          Width = 50
          Height = 16
        end
        object RLLabel15: TRLLabel
          Left = 706
          Top = 41
          Width = 31
          Height = 12
          Caption = '% Fat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = 581
          Top = 39
          Width = 48
          Height = 16
        end
        object RLLabel16: TRLLabel
          Left = 585
          Top = 41
          Width = 38
          Height = 12
          Caption = 'Q.Canc.'
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
        Top = 56
        Width = 748
        Height = 15
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 1
          Top = 1
          Width = 156
          Height = 12
          AutoSize = False
          DataField = 'NomeCliente'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Fat1: TRLDBText
          Left = 159
          Top = 1
          Width = 92
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'Referencia'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Fat2: TRLDBText
          Left = 254
          Top = 1
          Width = 140
          Height = 12
          AutoSize = False
          DataField = 'NomeProduto'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Fat3: TRLDBText
          Left = 441
          Top = 1
          Width = 46
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdPedido'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 400
          Top = 1
          Width = 36
          Height = 12
          Alignment = taCenter
          Caption = '02/2007'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 488
          Top = 1
          Width = 46
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdRestante'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 535
          Top = 1
          Width = 46
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdFaturada'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 630
          Top = 1
          Width = 67
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrFaturamento'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 581
          Top = 1
          Width = 46
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdCancelada'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 699
          Top = 1
          Width = 48
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'Perc'
          DataSource = fHistGeral.dsmClienteProdMes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw8: TRLDraw
          Left = 0
          Top = 13
          Width = 748
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 101
        Width = 748
        Height = 19
        BandType = btSummary
        BeforePrint = RLBand3BeforePrint
        object RLLabel9: TRLLabel
          Left = 7
          Top = 2
          Width = 157
          Height = 14
          Caption = 'Faturamento no Per'#237'odo ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 166
          Top = 2
          Width = 59
          Height = 14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 471
          Top = 2
          Width = 70
          Height = 14
          Caption = 'Clientes ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel19: TRLLabel
          Left = 542
          Top = 2
          Width = 59
          Height = 14
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 71
        Width = 748
        Height = 15
        BeforePrint = RLBand4BeforePrint
        object RLLabel17: TRLLabel
          Left = 349
          Top = 0
          Width = 83
          Height = 10
          Caption = '     Total da Data ===>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 656
          Top = 0
          Width = 41
          Height = 10
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 86
        Width = 748
        Height = 15
        BeforePrint = RLBand5BeforePrint
        object RLLabel20: TRLLabel
          Left = 349
          Top = 0
          Width = 83
          Height = 10
          Caption = 'Total do Cliente ===>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 608
          Top = 0
          Width = 89
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
end
