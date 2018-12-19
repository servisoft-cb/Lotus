object fRelComprovante2: TfRelComprovante2
  Left = 6
  Top = 123
  Width = 791
  Height = 451
  Caption = 'fRelComprovante2'
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
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fPrevRelComprovante.dsNotaFiscal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 38
      Width = 734
      Height = 283
      DataSource = fPrevRelComprovante.dsNotaFiscal
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 225
        BeforePrint = RLBand1BeforePrint
        object RLDraw14: TRLDraw
          Left = 0
          Top = 154
          Width = 734
          Height = 28
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 0
          Width = 734
          Height = 65
        end
        object RLLabel1: TRLLabel
          Left = 184
          Top = 7
          Width = 398
          Height = 16
          Caption = 'Comprovante de Entrega de Mercadorias para Transportadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 8
          Top = 29
          Width = 720
          Height = 27
          Alignment = taCenter
          AutoSize = False
          DataField = 'Empresa'
          DataSource = DM1.dsEmpresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 65
          Width = 79
          Height = 23
        end
        object RLLabel2: TRLLabel
          Left = 4
          Top = 69
          Width = 70
          Height = 16
          Caption = 'Nota Fiscal'
        end
        object RLDraw3: TRLDraw
          Left = 78
          Top = 65
          Width = 76
          Height = 23
        end
        object RLLabel3: TRLLabel
          Left = 81
          Top = 69
          Width = 70
          Height = 16
          Caption = 'Qtd / Caixa'
        end
        object RLDraw4: TRLDraw
          Left = 153
          Top = 65
          Width = 262
          Height = 23
        end
        object RLLabel4: TRLLabel
          Left = 258
          Top = 69
          Width = 44
          Height = 16
          Caption = 'Cliente'
        end
        object RLDraw5: TRLDraw
          Left = 414
          Top = 65
          Width = 82
          Height = 23
        end
        object RLLabel5: TRLLabel
          Left = 439
          Top = 69
          Width = 34
          Height = 16
          Caption = 'Peso'
        end
        object RLDraw6: TRLDraw
          Left = 495
          Top = 65
          Width = 79
          Height = 23
        end
        object RLLabel6: TRLLabel
          Left = 499
          Top = 69
          Width = 71
          Height = 16
          Caption = 'Qtd / Pares'
        end
        object RLDraw7: TRLDraw
          Left = 573
          Top = 65
          Width = 161
          Height = 23
        end
        object RLLabel7: TRLLabel
          Left = 636
          Top = 69
          Width = 32
          Height = 16
          Caption = 'OBS'
        end
        object RLDBText2: TRLDBText
          Left = 1
          Top = 92
          Width = 76
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'NumNota'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDBText3: TRLDBText
          Left = 81
          Top = 92
          Width = 70
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDBText4: TRLDBText
          Left = 153
          Top = 92
          Width = 262
          Height = 16
          AutoSize = False
          DataField = 'lkCliente'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDBText5: TRLDBText
          Left = 416
          Top = 92
          Width = 78
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'PesoLiquido'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLLabel8: TRLLabel
          Left = 496
          Top = 92
          Width = 77
          Height = 16
          Alignment = taCenter
        end
        object RLDraw8: TRLDraw
          Left = 0
          Top = 111
          Width = 105
          Height = 44
          Brush.Color = clBlack
          Brush.Style = bsDiagCross
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLDraw9: TRLDraw
          Left = 104
          Top = 111
          Width = 89
          Height = 44
        end
        object RLLabel9: TRLLabel
          Left = 112
          Top = 114
          Width = 76
          Height = 14
          Caption = 'Total de caixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 111
          Top = 131
          Width = 78
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDraw10: TRLDraw
          Left = 192
          Top = 111
          Width = 105
          Height = 44
          Brush.Color = clBlack
          Brush.Style = bsDiagCross
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLDraw11: TRLDraw
          Left = 296
          Top = 111
          Width = 89
          Height = 44
        end
        object RLLabel10: TRLLabel
          Left = 312
          Top = 114
          Width = 53
          Height = 14
          Caption = 'Peso Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText7: TRLDBText
          Left = 303
          Top = 131
          Width = 78
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'PesoLiquido'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDraw12: TRLDraw
          Left = 384
          Top = 111
          Width = 89
          Height = 44
        end
        object RLLabel11: TRLLabel
          Left = 392
          Top = 114
          Width = 72
          Height = 14
          Caption = 'Total de pares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 387
          Top = 131
          Width = 84
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Total de pares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw13: TRLDraw
          Left = 472
          Top = 111
          Width = 262
          Height = 44
          Brush.Color = clBlack
          Brush.Style = bsDiagCross
          Color = clWhite
          ParentColor = False
          Transparent = False
        end
        object RLLabel13: TRLLabel
          Left = 3
          Top = 159
          Width = 94
          Height = 16
          Caption = 'Transportadora:'
        end
        object RLDBText8: TRLDBText
          Left = 99
          Top = 159
          Width = 629
          Height = 16
          AutoSize = False
          DataField = 'lkTransp'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDraw15: TRLDraw
          Left = 0
          Top = 181
          Width = 154
          Height = 32
        end
        object RLLabel14: TRLLabel
          Left = 8
          Top = 188
          Width = 35
          Height = 16
          Caption = 'Data:'
        end
        object RLDBText9: TRLDBText
          Left = 48
          Top = 188
          Width = 68
          Height = 16
          DataField = 'DtEmissao'
          DataSource = fPrevRelComprovante.dsNotaFiscal
        end
        object RLDraw16: TRLDraw
          Left = 153
          Top = 181
          Width = 581
          Height = 32
        end
        object RLLabel15: TRLLabel
          Left = 161
          Top = 188
          Width = 74
          Height = 16
          Caption = 'Ass.Transp:'
        end
      end
    end
  end
end
