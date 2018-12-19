object fRelHistGeralCliProd: TfRelHistGeralCliProd
  Left = 10
  Top = 108
  Width = 779
  Height = 463
  Caption = 'fRelHistGeralCliProd'
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
    DataSource = fHistGeral.dsmClienteProd
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
      DataSource = fHistGeral.dsmClienteProd
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 748
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
          Caption = 'Relat'#243'rio de Faturamento Cliente por Produto'
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
          Width = 150
          Height = 16
        end
        object RLLabel6: TRLLabel
          Left = 48
          Top = 38
          Width = 73
          Height = 12
          Caption = 'Nome do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 571
          Top = 36
          Width = 68
          Height = 16
        end
        object RLLabel7: TRLLabel
          Left = 583
          Top = 38
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
        object RLDraw3: TRLDraw
          Left = 638
          Top = 36
          Width = 51
          Height = 16
        end
        object RLLabel8: TRLLabel
          Left = 642
          Top = 38
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
        object RLDraw5: TRLDraw
          Left = 513
          Top = 36
          Width = 59
          Height = 16
        end
        object RLLabel12: TRLLabel
          Left = 526
          Top = 39
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
        object RLDraw6: TRLDraw
          Left = 149
          Top = 36
          Width = 84
          Height = 16
        end
        object RLLabel13: TRLLabel
          Left = 173
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
          Left = 232
          Top = 36
          Width = 123
          Height = 16
        end
        object RLLabel14: TRLLabel
          Left = 281
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
          Left = 354
          Top = 36
          Width = 58
          Height = 16
        end
        object RLLabel15: TRLLabel
          Left = 363
          Top = 38
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
        object RLDraw9: TRLDraw
          Left = 411
          Top = 36
          Width = 59
          Height = 16
        end
        object RLLabel16: TRLLabel
          Left = 414
          Top = 38
          Width = 51
          Height = 12
          Caption = 'Q.Restante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw10: TRLDraw
          Left = 469
          Top = 36
          Width = 45
          Height = 16
        end
        object RLLabel17: TRLLabel
          Left = 474
          Top = 38
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
        Top = 53
        Width = 748
        Height = 15
        object RLDBText1: TRLDBText
          Left = 1
          Top = 1
          Width = 147
          Height = 11
          AutoSize = False
          DataField = 'NomeCliente'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 573
          Top = 1
          Width = 66
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotal'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 641
          Top = 1
          Width = 48
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'PercFat'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 0
          Top = 13
          Width = 748
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText4: TRLDBText
          Left = 515
          Top = 1
          Width = 58
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 151
          Top = 1
          Width = 82
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'Referencia'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 234
          Top = 1
          Width = 120
          Height = 11
          AutoSize = False
          DataField = 'NomeProduto'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 355
          Top = 1
          Width = 58
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdPedido'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText8: TRLDBText
          Left = 413
          Top = 1
          Width = 58
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdRestante'
          DataSource = fHistGeral.dsmClienteProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText9: TRLDBText
          Left = 471
          Top = 1
          Width = 44
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdCancelada'
          DataSource = fHistGeral.dsmClienteProd
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
        Top = 68
        Width = 748
        Height = 19
        BandType = btSummary
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
          DataSource = fHistGeral.dsmClienteProd
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
