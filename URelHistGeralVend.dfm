object fRelHistGeralVend: TfRelHistGeralVend
  Left = 10
  Top = 108
  Width = 779
  Height = 463
  Caption = 'fRelHistGeralVend'
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
    DataSource = fHistGeral.dsmVendedor
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
      DataSource = fHistGeral.dsmVendedor
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 742
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
          Caption = 'Relat'#243'rio de Faturamento por Vendedor'
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
          Width = 377
          Height = 16
        end
        object RLLabel6: TRLLabel
          Left = 168
          Top = 38
          Width = 91
          Height = 11
          Caption = 'Nome do Vendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 472
          Top = 36
          Width = 190
          Height = 16
        end
        object RLLabel7: TRLLabel
          Left = 525
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
          Left = 661
          Top = 36
          Width = 81
          Height = 16
        end
        object RLLabel8: TRLLabel
          Left = 669
          Top = 38
          Width = 61
          Height = 11
          Caption = '% Sobre Fat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 376
          Top = 36
          Width = 97
          Height = 16
        end
        object RLLabel12: TRLLabel
          Left = 397
          Top = 39
          Width = 55
          Height = 11
          Caption = 'Quantidade'
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
        Width = 742
        Height = 16
        object RLDBText1: TRLDBText
          Left = 2
          Top = 1
          Width = 373
          Height = 12
          AutoSize = False
          DataField = 'NomeVendedor'
          DataSource = fHistGeral.dsmVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 474
          Top = 1
          Width = 186
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmVendedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 664
          Top = 1
          Width = 76
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'PercFat'
          DataSource = fHistGeral.dsmVendedor
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
          Width = 742
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText4: TRLDBText
          Left = 377
          Top = 1
          Width = 95
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fHistGeral.dsmVendedor
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
          Left = 389
          Top = 2
          Width = 93
          Height = 14
          Caption = 'Vendedores ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 577
          Top = 2
          Width = 82
          Height = 14
          Alignment = taRightJustify
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmVendedor
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
