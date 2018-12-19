object fRelMaterialPeriodo: TfRelMaterialPeriodo
  Left = 143
  Top = 99
  Width = 1190
  Height = 561
  Caption = 'fRelMaterialPeriodo'
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
    Left = 0
    Top = 24
    Width = 1123
    Height = 794
    DataSource = fConsMaterialPeriodo.dsmEstoque
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
      DataSource = fConsMaterialPeriodo.dsmEstoque
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 1063
        Height = 49
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 200
          Top = 3
          Width = 554
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio Movimento Materiais - 01/11/2009 '#224' 30/11/2009'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
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
        object RLLabel2: TRLLabel
          Left = 0
          Top = 33
          Width = 32
          Height = 12
          Caption = 'C'#243'digo'
        end
        object RLLabel3: TRLLabel
          Left = 40
          Top = 33
          Width = 35
          Height = 12
          Caption = 'Material'
        end
        object RLLabel4: TRLLabel
          Left = 383
          Top = 33
          Width = 18
          Height = 12
          Caption = 'Cor'
        end
        object RLLabel8: TRLLabel
          Left = 608
          Top = 33
          Width = 45
          Height = 12
          Caption = 'Q.Entrada'
        end
        object RLLabel10: TRLLabel
          Left = 805
          Top = 33
          Width = 44
          Height = 12
          Caption = 'Qtd.Saida'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 47
          Width = 1063
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel12: TRLLabel
          Left = 1012
          Top = 31
          Width = 47
          Height = 12
          Caption = 'Saldo Qtd.'
        end
        object RLLabel15: TRLLabel
          Left = 678
          Top = 34
          Width = 57
          Height = 12
          Caption = 'Vlr. Entradas'
        end
        object RLLabel16: TRLLabel
          Left = 894
          Top = 32
          Width = 43
          Height = 12
          Caption = 'Vlr. Saida'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 49
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
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
        object RLDBText2: TRLDBText
          Left = 39
          Top = 2
          Width = 341
          Height = 12
          AutoSize = False
          DataField = 'NomeMaterial'
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
        object RLDBText3: TRLDBText
          Left = 382
          Top = 2
          Width = 167
          Height = 12
          AutoSize = False
          DataField = 'NomeCor'
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
        object RLDBText5: TRLDBText
          Left = 574
          Top = 2
          Width = 80
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdEntrada'
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
        object RLDBText7: TRLDBText
          Left = 774
          Top = 2
          Width = 80
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdSaida'
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
        object RLDBText8: TRLDBText
          Left = 990
          Top = 2
          Width = 71
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Saldo'
          DataSource = fConsMaterialPeriodo.dsmEstoque
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
        object RLDBText12: TRLDBText
          Left = 664
          Top = 2
          Width = 74
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrEntradaNotas'
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
        object RLDBText13: TRLDBText
          Left = 875
          Top = 2
          Width = 66
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSaida'
          DataSource = fConsMaterialPeriodo.dsmEstoque
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 66
        Width = 1063
        Height = 16
        BandType = btSummary
        object RLLabel17: TRLLabel
          Left = 527
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
          Left = 824
          Top = 0
          Width = 117
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSaida'
          DataSource = fConsMaterialPeriodo.dsmEstoque
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult2: TRLDBResult
          Left = 641
          Top = 2
          Width = 98
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrEntrada'
          DataSource = fConsMaterialPeriodo.dsmEstoque
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
      end
    end
  end
end
