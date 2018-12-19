object fRelCiaCad: TfRelCiaCad
  Left = 69
  Top = 147
  Width = 892
  Height = 567
  Caption = 'fRelCiaCad'
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
    Left = 24
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DMCia.dsCia
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    object RLBand1: TRLBand
      Left = 30
      Top = 30
      Width = 734
      Height = 52
      BandType = btHeader
      object RLDraw1: TRLDraw
        Left = 1
        Top = 27
        Width = 732
        Height = 24
      end
      object RLLabel1: TRLLabel
        Left = 200
        Top = 4
        Width = 276
        Height = 19
        Caption = 'Relat'#243'rio do Cadastro de Compania'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel48: TRLLabel
        Left = 627
        Top = 2
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
        Left = 666
        Top = 2
        Width = 64
        Height = 12
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
        Left = 637
        Top = 14
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
        Left = 666
        Top = 14
        Width = 64
        Height = 12
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 8
        Top = 32
        Width = 45
        Height = 16
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 56
        Top = 32
        Width = 41
        Height = 16
        DataField = 'Nome'
        DataSource = DMCia.dsCia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 82
      Width = 734
      Height = 255
      DataSource = DMCia.dsCiaItens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 50
        BandType = btHeader
        object RLLabel3: TRLLabel
          Left = 8
          Top = 33
          Width = 22
          Height = 14
          Caption = 'Item'
        end
        object RLLabel4: TRLLabel
          Left = 38
          Top = 33
          Width = 59
          Height = 14
          Caption = 'Constru'#231#227'o'
        end
        object RLLabel5: TRLLabel
          Left = 244
          Top = 33
          Width = 56
          Height = 14
          Caption = 'Refer'#234'ncia'
        end
        object RLLabel6: TRLLabel
          Left = 352
          Top = 33
          Width = 49
          Height = 14
          Caption = 'Processo'
        end
        object RLLabel7: TRLLabel
          Left = 679
          Top = 33
          Width = 50
          Height = 14
          Caption = 'Pre'#231'o Par'
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 48
          Width = 734
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psInsideFrame
        end
        object RLLabel8: TRLLabel
          Left = 288
          Top = 8
          Width = 99
          Height = 23
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Caption = 'Refer'#234'ncias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 50
        Width = 734
        Height = 19
        object RLDBText2: TRLDBText
          Left = 669
          Top = 2
          Width = 62
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Preco'
          DataSource = DMCia.dsCiaItens
        end
        object RLDBText3: TRLDBText
          Left = 352
          Top = 2
          Width = 313
          Height = 14
          AutoSize = False
          DataField = 'Processo'
          DataSource = DMCia.dsCiaItens
        end
        object RLDBText4: TRLDBText
          Left = 37
          Top = 2
          Width = 204
          Height = 14
          AutoSize = False
          DataField = 'lkNomeConstrucao'
          DataSource = DMCia.dsCiaItens
        end
        object RLDBText5: TRLDBText
          Left = 243
          Top = 2
          Width = 107
          Height = 14
          AutoSize = False
          DataField = 'lkReferencia'
          DataSource = DMCia.dsCiaItens
        end
        object RLDBText6: TRLDBText
          Left = 3
          Top = 2
          Width = 32
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'Item'
          DataSource = DMCia.dsCiaItens
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 17
          Width = 734
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
    end
  end
end
