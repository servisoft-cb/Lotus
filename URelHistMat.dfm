object fRelHistMat: TfRelHistMat
  Left = 190
  Top = 135
  Width = 1082
  Height = 549
  Caption = 'fRelHistMat'
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
    Left = 104
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fConsHistMat.msMaterial
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
      Height = 65
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 168
        Top = 8
        Width = 393
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relat'#243'rio do Hist'#243'rico de Materiais/Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 664
        Top = 2
        Width = 18
        Height = 10
        Caption = 'Pag:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 680
        Top = 2
        Width = 54
        Height = 10
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 649
        Top = 12
        Width = 33
        Height = 10
        Caption = 'Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 684
        Top = 12
        Width = 24
        Height = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 2
        Top = 47
        Width = 67
        Height = 14
        Caption = 'Dt.Movimento'
      end
      object RLLabel3: TRLLabel
        Left = 70
        Top = 47
        Width = 62
        Height = 14
        Caption = 'N'#186' Nota/Doc'
      end
      object RLLabel4: TRLLabel
        Left = 136
        Top = 47
        Width = 19
        Height = 14
        Caption = 'E/S'
      end
      object RLLabel5: TRLLabel
        Left = 156
        Top = 47
        Width = 23
        Height = 14
        Caption = 'Tipo'
      end
      object RLLabel6: TRLLabel
        Left = 181
        Top = 47
        Width = 27
        Height = 14
        Caption = 'Unid.'
      end
      object RLLabel7: TRLLabel
        Left = 209
        Top = 47
        Width = 75
        Height = 14
        Alignment = taRightJustify
        Caption = 'Quantidade'
      end
      object RLLabel8: TRLLabel
        Left = 287
        Top = 47
        Width = 75
        Height = 14
        Alignment = taRightJustify
        Caption = 'Saldo'
      end
      object RLLabel9: TRLLabel
        Left = 367
        Top = 47
        Width = 72
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vlr. Unit'#225'rio'
      end
      object RLLabel10: TRLLabel
        Left = 440
        Top = 47
        Width = 248
        Height = 14
        Caption = 'Cliente/Fornecedor'
      end
      object RLLabel11: TRLLabel
        Left = 690
        Top = 47
        Width = 40
        Height = 14
        Caption = '% ICMS'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 63
        Width = 734
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
      object RLDraw3: TRLDraw
        Left = 0
        Top = 45
        Width = 734
        Height = 2
        DrawKind = dkLine
      end
      object RLLabel12: TRLLabel
        Left = 2
        Top = 29
        Width = 30
        Height = 14
        Caption = 'Nome'
      end
    end
    object RLBand2: TRLBand
      Left = 30
      Top = 95
      Width = 734
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDBText1: TRLDBText
        Left = 2
        Top = 3
        Width = 65
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'Data'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText2: TRLDBText
        Left = 68
        Top = 3
        Width = 64
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'NumNota'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText3: TRLDBText
        Left = 133
        Top = 3
        Width = 19
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'ES'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText4: TRLDBText
        Left = 153
        Top = 3
        Width = 27
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'TipoMov'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText5: TRLDBText
        Left = 182
        Top = 3
        Width = 28
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'Unidade'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText6: TRLDBText
        Left = 211
        Top = 3
        Width = 72
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Qtd'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText7: TRLDBText
        Left = 287
        Top = 3
        Width = 72
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Saldo'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText8: TRLDBText
        Left = 363
        Top = 3
        Width = 76
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VlrUnitario'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText9: TRLDBText
        Left = 441
        Top = 3
        Width = 248
        Height = 14
        AutoSize = False
        DataField = 'Nome'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDBText10: TRLDBText
        Left = 691
        Top = 3
        Width = 40
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'PercIcms'
        DataSource = fConsHistMat.msMaterial
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 19
        Width = 734
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
    end
  end
end
