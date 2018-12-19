object fRelMovSetorDet: TfRelMovSetorDet
  Left = 6
  Top = 105
  Width = 782
  Height = 457
  Caption = 'fRelMovSetorDet'
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
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fConsMovSetor.dsmDetalhado
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 595
      DataSource = fConsMovSetor.dsmDetalhado
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 65
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 80
          Top = 8
          Width = 285
          Height = 16
          Caption = 'Relat'#243'rio Movimento  Por Setor (Detalhado) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 640
          Top = 3
          Width = 63
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 640
          Top = 16
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
          Left = 613
          Top = 3
          Width = 25
          Height = 12
          Caption = 'P'#225'g.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 612
          Top = 16
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
          Left = 100
          Top = 48
          Width = 56
          Height = 14
          Caption = 'Refer'#234'ncia'
        end
        object RLLabel5: TRLLabel
          Left = 518
          Top = 48
          Width = 70
          Height = 14
          Caption = 'Nome Produto'
        end
        object RLLabel6: TRLLabel
          Left = 382
          Top = 48
          Width = 58
          Height = 14
          Caption = 'Quantidade'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 64
          Width = 718
          Height = 1
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel8: TRLLabel
          Left = 6
          Top = 26
          Width = 42
          Height = 16
          Caption = 'Setor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 51
          Top = 26
          Width = 42
          Height = 16
          Caption = 'Setor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 8
          Top = 48
          Width = 24
          Height = 14
          Caption = 'Lote'
        end
        object RLLabel11: TRLLabel
          Left = 44
          Top = 48
          Width = 29
          Height = 14
          Caption = 'Tal'#227'o'
        end
        object RLLabel12: TRLLabel
          Left = 162
          Top = 48
          Width = 53
          Height = 14
          Caption = 'Dt.Entrada'
        end
        object RLLabel13: TRLLabel
          Left = 234
          Top = 48
          Width = 26
          Height = 14
          Caption = 'Hora'
        end
        object RLLabel14: TRLLabel
          Left = 274
          Top = 48
          Width = 43
          Height = 14
          Caption = 'Dt.Saida'
        end
        object RLLabel15: TRLLabel
          Left = 346
          Top = 48
          Width = 26
          Height = 14
          Caption = 'Hora'
        end
        object RLLabel16: TRLLabel
          Left = 454
          Top = 48
          Width = 23
          Height = 14
          Caption = 'Tipo'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 19
        object RLDBText1: TRLDBText
          Left = 100
          Top = 2
          Width = 56
          Height = 14
          Alignment = taRightJustify
          DataField = 'Referencia'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText2: TRLDBText
          Left = 516
          Top = 2
          Width = 200
          Height = 14
          AutoSize = False
          DataField = 'NomeProduto'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText3: TRLDBText
          Left = 416
          Top = 2
          Width = 20
          Height = 14
          Alignment = taRightJustify
          DataField = 'Qtd'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 18
          Width = 718
          Height = 1
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText4: TRLDBText
          Left = 45
          Top = 2
          Width = 30
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Talao'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText5: TRLDBText
          Left = 1
          Top = 2
          Width = 43
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Lote'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText6: TRLDBText
          Left = 158
          Top = 2
          Width = 62
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'DataEntrada'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText7: TRLDBText
          Left = 222
          Top = 2
          Width = 42
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'HoraEntrada'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText8: TRLDBText
          Left = 270
          Top = 2
          Width = 62
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'DataSaida'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText9: TRLDBText
          Left = 334
          Top = 2
          Width = 42
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'HoraSaida'
          DataSource = fConsMovSetor.dsmDetalhado
        end
        object RLDBText10: TRLDBText
          Left = 443
          Top = 2
          Width = 69
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Tipo'
          DataSource = fConsMovSetor.dsmDetalhado
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 84
        Width = 718
        Height = 21
        BandType = btSummary
        object RLLabel7: TRLLabel
          Left = 480
          Top = 2
          Width = 29
          Height = 14
          Caption = 'Total:'
        end
        object RLDBResult1: TRLDBResult
          Left = 560
          Top = 2
          Width = 52
          Height = 14
          DataField = 'Qtd'
          DataSource = fConsMovSetor.dsmDetalhado
          DisplayMask = '###,###,##0'
          Info = riSum
        end
      end
    end
  end
end
