object fRelCReceber2: TfRelCReceber2
  Left = 2
  Top = 110
  Width = 795
  Height = 455
  Caption = 'fRelCReceber2'
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
    DataSource = fContasReceber2.dsqParcelas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 57
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 280
        Top = 2
        Width = 237
        Height = 19
        Caption = 'Relat'#243'rio do Contas a Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 2
        Top = 25
        Width = 33
        Height = 12
        Caption = 'Op'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 36
        Top = 25
        Width = 42
        Height = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel48: TRLLabel
        Left = 610
        Top = 2
        Width = 38
        Height = 14
        Caption = 'P'#225'gina:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 649
        Top = 3
        Width = 64
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
      end
      object RLLabel47: TRLLabel
        Left = 620
        Top = 20
        Width = 28
        Height = 14
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 649
        Top = 21
        Width = 64
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 4
        Top = 41
        Width = 51
        Height = 14
        Caption = 'Dt. Vecto.'
      end
      object RLLabel5: TRLLabel
        Left = 66
        Top = 41
        Width = 40
        Height = 14
        Caption = 'N'#186' Nota'
      end
      object RLLabel6: TRLLabel
        Left = 108
        Top = 41
        Width = 28
        Height = 14
        Caption = 'Parc.'
      end
      object RLLabel7: TRLLabel
        Left = 140
        Top = 41
        Width = 56
        Height = 14
        Caption = 'Dt.Emiss'#227'o'
      end
      object RLLabel8: TRLLabel
        Left = 444
        Top = 41
        Width = 56
        Height = 14
        Caption = 'Vlr.Parcela'
      end
      object RLLabel9: TRLLabel
        Left = 521
        Top = 41
        Width = 47
        Height = 14
        Caption = 'Vlr. Pago'
      end
      object RLLabel10: TRLLabel
        Left = 583
        Top = 41
        Width = 54
        Height = 14
        Caption = 'Devolu'#231#227'o'
      end
      object RLLabel12: TRLLabel
        Left = 647
        Top = 41
        Width = 66
        Height = 14
        Caption = 'Vlr. Restante'
      end
      object RLLabel13: TRLLabel
        Left = 199
        Top = 41
        Width = 35
        Height = 14
        Caption = 'Cliente'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 56
        Width = 718
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 95
      Width = 718
      Height = 216
      DataSource = fContasReceber2.dsqParcelas
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        object RLDBText1: TRLDBText
          Left = 2
          Top = 0
          Width = 58
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Data'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText2: TRLDBText
          Left = 62
          Top = 0
          Width = 48
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Nota'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText3: TRLDBText
          Left = 111
          Top = 0
          Width = 26
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Parcela'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText4: TRLDBText
          Left = 139
          Top = 0
          Width = 58
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtGerado'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText5: TRLDBText
          Left = 199
          Top = 0
          Width = 230
          Height = 14
          AutoSize = False
          DataField = 'NomeCliente'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText6: TRLDBText
          Left = 431
          Top = 0
          Width = 70
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorParc'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText7: TRLDBText
          Left = 502
          Top = 0
          Width = 70
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorPago'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText8: TRLDBText
          Left = 574
          Top = 0
          Width = 70
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrDevolucao'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDBText9: TRLDBText
          Left = 646
          Top = 0
          Width = 70
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrDevolucao'
          DataSource = fContasReceber2.dsqParcelas
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 15
          Width = 718
          Height = 1
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 34
        BandType = btSummary
        object RLLabel11: TRLLabel
          Left = 56
          Top = 2
          Width = 49
          Height = 14
          Caption = 'Vlr. Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 32
          Top = 17
          Width = 74
          Height = 14
          Caption = 'Vlr.Devolu'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 107
          Top = 2
          Width = 142
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorParc'
          DataSource = fContasReceber2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult2: TRLDBResult
          Left = 107
          Top = 17
          Width = 142
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrDevolucao'
          DataSource = fContasReceber2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLLabel15: TRLLabel
          Left = 280
          Top = 2
          Width = 86
          Height = 14
          Caption = 'Vlr. Abatimentos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 295
          Top = 17
          Width = 71
          Height = 14
          Caption = 'Vlr. Recebido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 367
          Top = 2
          Width = 142
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Abatimentos'
          DataSource = fContasReceber2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult4: TRLDBResult
          Left = 367
          Top = 17
          Width = 142
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorPago'
          DataSource = fContasReceber2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLLabel17: TRLLabel
          Left = 616
          Top = 2
          Width = 88
          Height = 14
          Caption = 'Total a Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult5: TRLDBResult
          Left = 544
          Top = 17
          Width = 165
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'ValorRestante'
          DataSource = fContasReceber2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
      end
    end
  end
end
