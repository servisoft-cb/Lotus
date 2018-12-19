object fRelOC2: TfRelOC2
  Left = 41
  Top = 49
  Width = 788
  Height = 528
  HorzScrollBar.Position = 19
  Caption = 'fRelOC2'
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
    Left = -11
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fConsOC.dsqOrdem
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 9.000000000000000000
    Margins.RightMargin = 9.000000000000000000
    object RLBand1: TRLBand
      Left = 34
      Top = 38
      Width = 726
      Height = 69
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 168
        Top = 8
        Width = 266
        Height = 19
        Caption = 'Relat'#243'rio das Ordens de Compras '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel48: TRLLabel
        Left = 591
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
        Left = 630
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
        Left = 601
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
        Left = 630
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
      object RLLabel2: TRLLabel
        Left = 2
        Top = 37
        Width = 30
        Height = 12
        Caption = 'N'#186' OC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 41
        Top = 37
        Width = 243
        Height = 12
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 290
        Top = 37
        Width = 32
        Height = 12
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 323
        Top = 37
        Width = 278
        Height = 12
        AutoSize = False
        Caption = 'Nome Material'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 365
        Top = 53
        Width = 44
        Height = 12
        Caption = 'Qtd. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 499
        Top = 53
        Width = 63
        Height = 12
        Caption = 'Qtd. Pendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 426
        Top = 53
        Width = 61
        Height = 12
        Caption = 'Qtd. Entregue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 673
        Top = 37
        Width = 51
        Height = 12
        Caption = 'Dt. Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 41
        Top = 53
        Width = 208
        Height = 12
        AutoSize = False
        Caption = 'Cor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 253
        Top = 53
        Width = 68
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vlr. Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 588
        Top = 53
        Width = 64
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Vlr. Pendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 684
        Top = 53
        Width = 40
        Height = 12
        Caption = 'Vlr. Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 67
        Width = 726
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 34
      Top = 107
      Width = 726
      Height = 134
      DataSource = fConsOC.dsqOrdem
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 726
        Height = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLDBText1: TRLDBText
          Left = 0
          Top = 2
          Width = 42
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'NumOC'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText2: TRLDBText
          Left = 42
          Top = 2
          Width = 241
          Height = 12
          AutoSize = False
          DataField = 'NomeForn'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText3: TRLDBText
          Left = 284
          Top = 2
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'CodMaterial'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText4: TRLDBText
          Left = 324
          Top = 2
          Width = 269
          Height = 12
          AutoSize = False
          DataField = 'NomeMaterial'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText6: TRLDBText
          Left = 668
          Top = 2
          Width = 56
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtEntrega'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText7: TRLDBText
          Left = 42
          Top = 15
          Width = 241
          Height = 12
          AutoSize = False
          DataField = 'NomeCor'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText8: TRLDBText
          Left = 284
          Top = 15
          Width = 38
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'VlrUnitario'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText9: TRLDBText
          Left = 340
          Top = 15
          Width = 70
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText10: TRLDBText
          Left = 417
          Top = 15
          Width = 70
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdEntregue'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText11: TRLDBText
          Left = 492
          Top = 15
          Width = 70
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QtdRestante'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText12: TRLDBText
          Left = 586
          Top = 15
          Width = 66
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'clVlrRestante'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDBText13: TRLDBText
          Left = 653
          Top = 15
          Width = 70
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotal'
          DataSource = fConsOC.dsqOrdem
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 28
          Width = 726
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 30
        Width = 726
        Height = 14
        BandType = btSummary
        object RLLabel15: TRLLabel
          Left = 480
          Top = 0
          Width = 67
          Height = 11
          Caption = 'Vlr. Total ===>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 564
          Top = 0
          Width = 87
          Height = 12
          Alignment = taRightJustify
          DataField = 'clVlrRestante'
          DataSource = fConsOC.dsqOrdem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
        object RLDBResult2: TRLDBResult
          Left = 662
          Top = 0
          Width = 62
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrTotal'
          DataSource = fConsOC.dsqOrdem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
      end
    end
  end
end
