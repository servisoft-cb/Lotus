object fRelNavalhaLocal: TfRelNavalhaLocal
  Left = 185
  Top = 128
  Width = 901
  Height = 539
  Caption = 'fRelNavalhaLocal'
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
    Left = 56
    Top = 24
    Width = 794
    Height = 1123
    DataSource = DMNavalha_Local.dsNavalha_Local
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    ShowProgress = False
    BeforePrint = RLReport1BeforePrint
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 93
      Width = 734
      Height = 459
      DataSource = DMNavalha_Local.dsNavalha_Local
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 17
        object RLDBText1: TRLDBText
          Left = 679
          Top = 2
          Width = 52
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DTDESCARTE'
          DataSource = DMNavalha_Local.dsNavalha_Local
        end
        object RLDBText2: TRLDBText
          Left = 626
          Top = 2
          Width = 52
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DTESTOQUE'
          DataSource = DMNavalha_Local.dsNavalha_Local
        end
        object RLDBText3: TRLDBText
          Left = 572
          Top = 2
          Width = 52
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DTENTRADA'
          DataSource = DMNavalha_Local.dsNavalha_Local
        end
        object RLDBText4: TRLDBText
          Left = 1
          Top = 2
          Width = 189
          Height = 12
          AutoSize = False
          DataField = 'NAVALHA'
          DataSource = DMNavalha_Local.dsNavalha_Local
        end
        object RLDBText5: TRLDBText
          Left = 191
          Top = 2
          Width = 189
          Height = 12
          AutoSize = False
          DataField = 'LOCALIZACAO'
          DataSource = DMNavalha_Local.dsNavalha_Local
        end
        object RLDBText6: TRLDBText
          Left = 381
          Top = 2
          Width = 189
          Height = 12
          AutoSize = False
          DataField = 'REORDER'
          DataSource = DMNavalha_Local.dsNavalha_Local
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 15
          Width = 734
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
    end
    object RLBand1: TRLBand
      Left = 30
      Top = 30
      Width = 734
      Height = 63
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 191
        Top = 4
        Width = 290
        Height = 19
        Caption = 'Relat'#243'rio de Localiza'#231#227'o de Navalhas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel48: TRLLabel
        Left = 640
        Top = 3
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
      object RLSystemInfo1: TRLSystemInfo
        Left = 677
        Top = 2
        Width = 55
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
      end
      object RLLabel47: TRLLabel
        Left = 648
        Top = 15
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
      object RLSystemInfo2: TRLSystemInfo
        Left = 677
        Top = 15
        Width = 55
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 0
        Top = 48
        Width = 38
        Height = 12
        Caption = 'Navalha'
      end
      object RLLabel5: TRLLabel
        Left = 192
        Top = 48
        Width = 51
        Height = 12
        Caption = 'Localiza'#231#227'o'
      end
      object RLLabel6: TRLLabel
        Left = 384
        Top = 48
        Width = 36
        Height = 12
        Caption = 'Reorder'
      end
      object RLLabel7: TRLLabel
        Left = 573
        Top = 48
        Width = 48
        Height = 12
        Caption = 'Dt.Entrada'
      end
      object RLLabel8: TRLLabel
        Left = 624
        Top = 48
        Width = 50
        Height = 12
        Caption = 'Dt.Estoque'
      end
      object RLLabel9: TRLLabel
        Left = 680
        Top = 48
        Width = 54
        Height = 12
        Caption = 'Dt.Descarte'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 61
        Width = 734
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
    end
  end
end
