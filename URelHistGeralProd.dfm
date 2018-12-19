object fRelHistGeralProd: TfRelHistGeralProd
  Left = 10
  Top = 108
  Width = 779
  Height = 466
  Caption = 'fRelHistGeralProd'
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
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fHistGeral.dsmProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 6.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 6.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 23
      Top = 26
      Width = 748
      Height = 271
      DataSource = fHistGeral.dsmProduto
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 748
        Height = 53
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 56
          Top = 6
          Width = 570
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de Faturamento por Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 639
          Top = 1
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
          Left = 662
          Top = 1
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
          Left = 662
          Top = 13
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
          Left = 635
          Top = 13
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
          Top = 25
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
          Top = 25
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
          Top = 36
          Width = 125
          Height = 16
        end
        object RLLabel6: TRLLabel
          Left = 24
          Top = 38
          Width = 51
          Height = 11
          Caption = 'Refer'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 590
          Top = 36
          Width = 108
          Height = 16
        end
        object RLLabel7: TRLLabel
          Left = 593
          Top = 38
          Width = 102
          Height = 11
          Caption = 'Valor do Faturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 697
          Top = 36
          Width = 51
          Height = 16
        end
        object RLLabel8: TRLLabel
          Left = 709
          Top = 38
          Width = 34
          Height = 11
          Caption = '%  Fat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 521
          Top = 36
          Width = 70
          Height = 16
        end
        object RLLabel12: TRLLabel
          Left = 534
          Top = 39
          Width = 49
          Height = 11
          Caption = 'Qtd.Fatur.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 124
          Top = 36
          Width = 201
          Height = 16
        end
        object RLLabel13: TRLLabel
          Left = 236
          Top = 38
          Width = 40
          Height = 11
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw7: TRLDraw
          Left = 324
          Top = 36
          Width = 75
          Height = 16
        end
        object RLLabel14: TRLLabel
          Left = 337
          Top = 39
          Width = 54
          Height = 11
          Caption = 'Qtd.Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw8: TRLDraw
          Left = 398
          Top = 36
          Width = 69
          Height = 16
        end
        object RLLabel15: TRLLabel
          Left = 402
          Top = 39
          Width = 61
          Height = 11
          Caption = 'Qtd.Restante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw9: TRLDraw
          Left = 466
          Top = 36
          Width = 56
          Height = 16
        end
        object RLLabel16: TRLLabel
          Left = 470
          Top = 39
          Width = 48
          Height = 11
          Caption = 'Qtd.Canc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 53
        Width = 748
        Height = 16
        object RLDBText1: TRLDBText
          Left = 2
          Top = 1
          Width = 119
          Height = 12
          AutoSize = False
          DataField = 'Referencia'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 591
          Top = 1
          Width = 106
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 698
          Top = 1
          Width = 50
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'PercFat'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 0
          Top = 14
          Width = 748
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText4: TRLDBText
          Left = 524
          Top = 1
          Width = 66
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 127
          Top = 1
          Width = 197
          Height = 12
          AutoSize = False
          DataField = 'NomeProduto'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 327
          Top = 1
          Width = 71
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdPedido'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 400
          Top = 1
          Width = 67
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdRestante'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText8: TRLDBText
          Left = 470
          Top = 1
          Width = 51
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdCancelada'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 69
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
          Left = 405
          Top = 2
          Width = 75
          Height = 14
          Caption = 'Produtos ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 615
          Top = 2
          Width = 82
          Height = 14
          Alignment = taRightJustify
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
        object RLLabel17: TRLLabel
          Left = 703
          Top = 2
          Width = 31
          Height = 11
          Caption = '100,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
      end
    end
  end
end
