object fRelMovSetor: TfRelMovSetor
  Left = 6
  Top = 105
  Width = 782
  Height = 457
  Caption = 'fRelMovSetor'
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
    DataSource = fConsMovSetor.dsmConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 595
      DataSource = fConsMovSetor.dsmConsulta
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 65
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 144
          Top = 8
          Width = 208
          Height = 16
          Caption = 'Relat'#243'rio Movimento  Por Setor '
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
          Left = 24
          Top = 47
          Width = 65
          Height = 16
          Caption = 'Refer'#234'ncia'
        end
        object RLLabel5: TRLLabel
          Left = 144
          Top = 47
          Width = 87
          Height = 16
          Caption = 'Nome Produto'
        end
        object RLLabel6: TRLLabel
          Left = 576
          Top = 47
          Width = 70
          Height = 16
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
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 19
        object RLDBText1: TRLDBText
          Left = 24
          Top = 2
          Width = 65
          Height = 16
          Alignment = taRightJustify
          DataField = 'Referencia'
          DataSource = fConsMovSetor.dsmConsulta
        end
        object RLDBText2: TRLDBText
          Left = 144
          Top = 2
          Width = 393
          Height = 16
          AutoSize = False
          DataField = 'NomeProduto'
          DataSource = fConsMovSetor.dsmConsulta
        end
        object RLDBText3: TRLDBText
          Left = 621
          Top = 2
          Width = 25
          Height = 16
          Alignment = taRightJustify
          DataField = 'Qtd'
          DataSource = fConsMovSetor.dsmConsulta
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
          Width = 36
          Height = 16
          Caption = 'Total:'
        end
        object RLDBResult1: TRLDBResult
          Left = 584
          Top = 2
          Width = 64
          Height = 16
          DataField = 'Qtd'
          DataSource = fConsMovSetor.dsmConsulta
          DisplayMask = '###,###,##0'
          Info = riSum
        end
      end
    end
  end
end
