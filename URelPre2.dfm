object fRelPre2: TfRelPre2
  Left = 242
  Top = 170
  Width = 928
  Height = 504
  Caption = 'fRelPre2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 48
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fPrevPre2.dsmAuxPre
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 30
      Width = 734
      Height = 323
      DataSource = fPrevPre2.dsmAuxPre
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 54
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 56
          Top = 8
          Width = 505
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio Para o PR'#201
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 625
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
          Left = 617
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
          Left = 660
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
          Left = 660
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
        object RLLabel2: TRLLabel
          Left = 8
          Top = 40
          Width = 51
          Height = 12
          Caption = 'Constru'#231#227'o'
        end
        object RLLabel3: TRLLabel
          Left = 104
          Top = 40
          Width = 38
          Height = 12
          Caption = 'Carimbo'
        end
        object RLLabel4: TRLLabel
          Left = 216
          Top = 40
          Width = 77
          Height = 12
          Caption = 'Material / Posi'#231#227'o'
        end
        object RLLabel5: TRLLabel
          Left = 512
          Top = 40
          Width = 18
          Height = 12
          Caption = 'Cor'
        end
        object RLLabel8: TRLLabel
          Left = 616
          Top = 40
          Width = 37
          Height = 12
          Caption = 'Q.Pares'
        end
        object RLLabel9: TRLLabel
          Left = 688
          Top = 40
          Width = 43
          Height = 12
          Caption = 'Consumo'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 54
        Width = 734
        Height = 17
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 1
          Top = 3
          Width = 123
          Height = 12
          AutoSize = False
          DataField = 'Construcao'
          DataSource = fPrevPre2.dsmAuxPre
        end
        object RLDBText2: TRLDBText
          Left = 128
          Top = 3
          Width = 121
          Height = 12
          AutoSize = False
          DataField = 'Carimbo'
          DataSource = fPrevPre2.dsmAuxPre
        end
        object RLLabel10: TRLLabel
          Left = 254
          Top = 3
          Width = 249
          Height = 12
          AutoSize = False
          Caption = 'Material / Posi'#231#227'o'
        end
        object RLDBText3: TRLDBText
          Left = 506
          Top = 3
          Width = 103
          Height = 12
          AutoSize = False
          DataField = 'lkCor'
          DataSource = fPrevPre2.dsmAuxPre
        end
        object RLDBText4: TRLDBText
          Left = 614
          Top = 3
          Width = 44
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'QtdPar'
          DataSource = fPrevPre2.dsmAuxPre
        end
        object RLDBText5: TRLDBText
          Left = 689
          Top = 3
          Width = 43
          Height = 12
          Alignment = taRightJustify
          DataField = 'Consumo'
          DataSource = fPrevPre2.dsmAuxPre
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 0
          Width = 734
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 115
        Width = 734
        Height = 16
        BandType = btSummary
        BeforePrint = RLBand3BeforePrint
        object RLLabel11: TRLLabel
          Left = 21
          Top = 2
          Width = 70
          Height = 11
          Caption = 'Total de Pares:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 92
          Top = 2
          Width = 70
          Height = 11
          Caption = 'Total de Pares:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 734
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 71
        Width = 734
        Height = 28
        BeforePrint = RLBand4BeforePrint
        object RLLabel13: TRLLabel
          Left = 40
          Top = 1
          Width = 39
          Height = 12
          Alignment = taRightJustify
          Caption = 'Produzir:'
        end
        object RLLabel14: TRLLabel
          Left = 21
          Top = 14
          Width = 58
          Height = 11
          Alignment = taRightJustify
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Pro1: TRLLabel
          Left = 83
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro2: TRLLabel
          Left = 123
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro3: TRLLabel
          Left = 163
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro4: TRLLabel
          Left = 203
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro5: TRLLabel
          Left = 243
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro6: TRLLabel
          Left = 283
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro7: TRLLabel
          Left = 323
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro8: TRLLabel
          Left = 363
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro9: TRLLabel
          Left = 403
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro10: TRLLabel
          Left = 443
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro11: TRLLabel
          Left = 483
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro12: TRLLabel
          Left = 523
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro13: TRLLabel
          Left = 563
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro14: TRLLabel
          Left = 603
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Pro15: TRLLabel
          Left = 643
          Top = 1
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Qtd1: TRLLabel
          Left = 83
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd2: TRLLabel
          Left = 123
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd3: TRLLabel
          Left = 163
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd4: TRLLabel
          Left = 203
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd5: TRLLabel
          Left = 243
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd6: TRLLabel
          Left = 283
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd7: TRLLabel
          Left = 323
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd8: TRLLabel
          Left = 363
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd9: TRLLabel
          Left = 403
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd10: TRLLabel
          Left = 443
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd11: TRLLabel
          Left = 483
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd12: TRLLabel
          Left = 523
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd13: TRLLabel
          Left = 563
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd14: TRLLabel
          Left = 603
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd15: TRLLabel
          Left = 643
          Top = 14
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 99
        Width = 734
        Height = 16
        BeforePrint = RLBand5BeforePrint
        object RLLabel15: TRLLabel
          Left = 45
          Top = 2
          Width = 34
          Height = 12
          Alignment = taRightJustify
          Caption = 'Marcar:'
        end
        object Mar1: TRLLabel
          Left = 83
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar2: TRLLabel
          Left = 123
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar3: TRLLabel
          Left = 163
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar4: TRLLabel
          Left = 203
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar5: TRLLabel
          Left = 243
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar6: TRLLabel
          Left = 283
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar7: TRLLabel
          Left = 323
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar8: TRLLabel
          Left = 363
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar9: TRLLabel
          Left = 403
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar10: TRLLabel
          Left = 443
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar11: TRLLabel
          Left = 483
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar12: TRLLabel
          Left = 523
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar13: TRLLabel
          Left = 563
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar14: TRLLabel
          Left = 603
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
        object Mar15: TRLLabel
          Left = 643
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
        end
      end
    end
  end
end
