object fRelHistGeralCliProdCor: TfRelHistGeralCliProdCor
  Left = 10
  Top = 108
  Width = 779
  Height = 463
  Caption = 'fRelHistGeralCliProdCor'
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
    DataSource = fHistGeral.dsmClienteProdCor
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
      Height = 271
      DataSource = fHistGeral.dsmClienteProdCor
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 53
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 16
          Top = 4
          Width = 622
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de Faturamento Cliente por Produto/Cor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 655
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
          Left = 678
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
          Left = 678
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
          Left = 651
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
          Width = 146
          Height = 16
        end
        object RLLabel6: TRLLabel
          Left = 40
          Top = 38
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
        object RLDraw2: TRLDraw
          Left = 598
          Top = 36
          Width = 85
          Height = 16
        end
        object RLLabel7: TRLLabel
          Left = 606
          Top = 38
          Width = 70
          Height = 12
          Caption = 'Vlr.Faturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 682
          Top = 36
          Width = 59
          Height = 16
        end
        object RLLabel8: TRLLabel
          Left = 683
          Top = 38
          Width = 58
          Height = 12
          Caption = '% Sobre Fat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 539
          Top = 36
          Width = 60
          Height = 16
        end
        object RLLabel12: TRLLabel
          Left = 544
          Top = 39
          Width = 50
          Height = 12
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 145
          Top = 36
          Width = 124
          Height = 16
        end
        object RLLabel13: TRLLabel
          Left = 177
          Top = 38
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
        object RLDraw7: TRLDraw
          Left = 268
          Top = 36
          Width = 137
          Height = 16
        end
        object RLLabel14: TRLLabel
          Left = 317
          Top = 38
          Width = 35
          Height = 12
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw8: TRLDraw
          Left = 404
          Top = 36
          Width = 136
          Height = 16
        end
        object RLLabel15: TRLLabel
          Left = 453
          Top = 40
          Width = 18
          Height = 12
          Caption = 'Cor'
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
        Top = 53
        Width = 742
        Height = 16
        object RLDBText1: TRLDBText
          Left = 1
          Top = 1
          Width = 143
          Height = 12
          AutoSize = False
          DataField = 'Fantasia'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 600
          Top = 1
          Width = 81
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 683
          Top = 1
          Width = 58
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'PercFat'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 0
          Top = 14
          Width = 742
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText4: TRLDBText
          Left = 540
          Top = 1
          Width = 58
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 147
          Top = 1
          Width = 121
          Height = 12
          AutoSize = False
          DataField = 'Referencia'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 270
          Top = 1
          Width = 134
          Height = 12
          AutoSize = False
          DataField = 'NomeProduto'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 405
          Top = 1
          Width = 133
          Height = 12
          AutoSize = False
          DataField = 'NomeCor'
          DataSource = fHistGeral.dsmClienteProdCor
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
        Top = 69
        Width = 742
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
          Left = 373
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
          Left = 596
          Top = 2
          Width = 82
          Height = 14
          Alignment = taRightJustify
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmClienteProdCor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
      end
    end
  end
end
