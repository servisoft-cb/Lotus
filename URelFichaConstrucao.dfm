object fRelFichaConstrucao: TfRelFichaConstrucao
  Left = 36
  Top = 66
  Width = 974
  Height = 636
  Caption = 'fRelFichaConstrucao'
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
    Left = 32
    Top = 16
    Width = 794
    Height = 1123
    DataSource = DMFichaConstrucao.dsFichaConstrucao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 26
      Width = 742
      Height = 575
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      object RLBand1: TRLBand
        Left = 0
        Top = 24
        Width = 742
        Height = 111
        BeforePrint = RLBand1BeforePrint
        object RLDraw27: TRLDraw
          Left = 107
          Top = 87
          Width = 425
          Height = 18
        end
        object RLDraw26: TRLDraw
          Left = 107
          Top = 68
          Width = 425
          Height = 18
        end
        object RLDraw3: TRLDraw
          Left = 533
          Top = 1
          Width = 80
          Height = 43
        end
        object RLDraw2: TRLDraw
          Left = 107
          Top = 24
          Width = 425
          Height = 21
        end
        object RLDraw1: TRLDraw
          Left = 107
          Top = 2
          Width = 425
          Height = 21
        end
        object RLLabel2: TRLLabel
          Left = 563
          Top = 6
          Width = 26
          Height = 11
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 536
          Top = 27
          Width = 74
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'DATA'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 11
          Top = 9
          Width = 95
          Height = 12
          Alignment = taRightJustify
          Caption = 'Nome da Constru'#231#227'o:'
        end
        object RLDBText3: TRLDBText
          Left = 109
          Top = 9
          Width = 96
          Height = 12
          DataField = 'NOMECONSTRUCAO'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
        end
        object RLLabel4: TRLLabel
          Left = 2
          Top = 31
          Width = 104
          Height = 12
          Alignment = taRightJustify
          Caption = 'Nome e Ref. da Forma:'
        end
        object RLDBText4: TRLDBText
          Left = 109
          Top = 31
          Width = 63
          Height = 12
          DataField = 'NOMEFORMA'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
        end
        object RLImage1: TRLImage
          Left = 618
          Top = 2
          Width = 118
          Height = 103
          Stretch = True
        end
        object RLDraw23: TRLDraw
          Left = 366
          Top = 46
          Width = 166
          Height = 21
        end
        object RLLabel11: TRLLabel
          Left = 324
          Top = 53
          Width = 41
          Height = 12
          Alignment = taRightJustify
          Caption = 'Navalha:'
        end
        object RLDBText12: TRLDBText
          Left = 369
          Top = 53
          Width = 161
          Height = 12
          AutoSize = False
          DataField = 'DESCNAVALHA'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
        end
        object RLLabel14: TRLLabel
          Left = 57
          Top = 52
          Width = 49
          Height = 12
          Alignment = taRightJustify
          Caption = 'Montagem:'
        end
        object RLDraw25: TRLDraw
          Left = 107
          Top = 46
          Width = 212
          Height = 21
        end
        object RLLabel15: TRLLabel
          Left = 109
          Top = 52
          Width = 207
          Height = 12
          AutoSize = False
          Caption = 'Montagem:'
        end
        object RLLabel24: TRLLabel
          Left = 79
          Top = 72
          Width = 27
          Height = 12
          Alignment = taRightJustify
          Caption = 'Salto:'
        end
        object RLDBText22: TRLDBText
          Left = 109
          Top = 72
          Width = 412
          Height = 12
          AutoSize = False
          DataField = 'SALTO'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
        end
        object RLLabel25: TRLLabel
          Left = 54
          Top = 91
          Width = 52
          Height = 12
          Alignment = taRightJustify
          Caption = 'Plataforma:'
        end
        object RLDBText23: TRLDBText
          Left = 109
          Top = 91
          Width = 412
          Height = 12
          AutoSize = False
          DataField = 'FACHETADO'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 24
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 176
          Top = 3
          Width = 313
          Height = 19
          Caption = 'FICHA T'#201'CNICA DE CONSTRU'#199#195'O - N'#186':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 493
          Top = 3
          Width = 20
          Height = 19
          DataField = 'ID'
          DataSource = DMFichaConstrucao.dsFichaConstrucao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 135
        Width = 742
        Height = 18
        BeforePrint = RLBand3BeforePrint
        object RLLabel5: TRLLabel
          Left = 84
          Top = 3
          Width = 23
          Height = 12
          Alignment = taRightJustify
          Caption = 'Obs:'
        end
        object RLMemo1: TRLMemo
          Left = 110
          Top = 3
          Width = 617
          Height = 12
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 153
        Width = 742
        Height = 302
        DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
        object RLBand5: TRLBand
          Left = 0
          Top = 20
          Width = 742
          Height = 15
          BeforePrint = RLBand5BeforePrint
          object RLDBText5: TRLDBText
            Left = 4
            Top = 2
            Width = 128
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'NOMEPOSICAO'
            DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLDraw6: TRLDraw
            Left = 3
            Top = 0
            Width = 739
            Height = 4
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
        object RLSubDetail3: TRLSubDetail
          Left = 0
          Top = 35
          Width = 742
          Height = 157
          DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
          object RLBand6: TRLBand
            Left = 0
            Top = 0
            Width = 742
            Height = 17
            object RLDBText6: TRLDBText
              Left = 5
              Top = 2
              Width = 128
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'TIPOMATERIAL'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDraw5: TRLDraw
              Left = 134
              Top = 0
              Width = 607
              Height = 16
            end
            object RLDBText7: TRLDBText
              Left = 135
              Top = 2
              Width = 54
              Height = 12
              AutoSize = False
              DataField = 'REFMATERIAL'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText8: TRLDBText
              Left = 192
              Top = 2
              Width = 248
              Height = 12
              AutoSize = False
              DataField = 'NOMEMATERIAL'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText9: TRLDBText
              Left = 441
              Top = 2
              Width = 105
              Height = 12
              AutoSize = False
              DataField = 'NOMECOR'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText10: TRLDBText
              Left = 546
              Top = 2
              Width = 112
              Height = 12
              AutoSize = False
              DataField = 'NOMEFORNECEDOR'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText11: TRLDBText
              Left = 660
              Top = 2
              Width = 79
              Height = 12
              AutoSize = False
              DataField = 'MEDIDAS'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLBand8: TRLBand
            Left = 0
            Top = 58
            Width = 742
            Height = 29
            BeforePrint = RLBand8BeforePrint
            object RLDraw7: TRLDraw
              Left = 134
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef1: TRLLabel
              Left = 136
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
            end
            object TMat1: TRLLabel
              Left = 136
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
            end
            object RLDraw8: TRLDraw
              Left = 172
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef2: TRLLabel
              Left = 174
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
            end
            object TMat2: TRLLabel
              Left = 174
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw9: TRLDraw
              Left = 210
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef3: TRLLabel
              Left = 212
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat3: TRLLabel
              Left = 212
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw10: TRLDraw
              Left = 248
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef4: TRLLabel
              Left = 250
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat4: TRLLabel
              Left = 250
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw11: TRLDraw
              Left = 286
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef5: TRLLabel
              Left = 288
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat5: TRLLabel
              Left = 288
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw12: TRLDraw
              Left = 324
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef6: TRLLabel
              Left = 326
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat6: TRLLabel
              Left = 326
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw13: TRLDraw
              Left = 362
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef7: TRLLabel
              Left = 364
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat7: TRLLabel
              Left = 364
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw14: TRLDraw
              Left = 400
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef8: TRLLabel
              Left = 402
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat8: TRLLabel
              Left = 402
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw15: TRLDraw
              Left = 438
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef9: TRLLabel
              Left = 440
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat9: TRLLabel
              Left = 440
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw16: TRLDraw
              Left = 476
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef10: TRLLabel
              Left = 478
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat10: TRLLabel
              Left = 478
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw17: TRLDraw
              Left = 514
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef11: TRLLabel
              Left = 516
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat11: TRLLabel
              Left = 516
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw18: TRLDraw
              Left = 552
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef12: TRLLabel
              Left = 554
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat12: TRLLabel
              Left = 554
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw19: TRLDraw
              Left = 590
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef13: TRLLabel
              Left = 592
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat13: TRLLabel
              Left = 592
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw20: TRLDraw
              Left = 628
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef14: TRLLabel
              Left = 630
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat14: TRLLabel
              Left = 630
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw21: TRLDraw
              Left = 666
              Top = -1
              Width = 39
              Height = 30
            end
            object TRef15: TRLLabel
              Left = 668
              Top = 1
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TRef1'
            end
            object TMat15: TRLLabel
              Left = 668
              Top = 14
              Width = 34
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'TMat1'
            end
            object RLDraw22: TRLDraw
              Left = 704
              Top = -1
              Width = 37
              Height = 30
            end
          end
          object RLBand9: TRLBand
            Left = 0
            Top = 87
            Width = 742
            Height = 20
            BeforePrint = RLBand9BeforePrint
            object RLLabel12: TRLLabel
              Left = 7
              Top = 5
              Width = 23
              Height = 12
              Caption = 'Obs:'
            end
            object RLDBMemo1: TRLDBMemo
              Left = 32
              Top = 5
              Width = 681
              Height = 12
              AutoSize = False
              DataField = 'OBS'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
          end
          object RLBand10: TRLBand
            Left = 0
            Top = 17
            Width = 742
            Height = 41
            BeforePrint = RLBand10BeforePrint
            object RLDraw24: TRLDraw
              Left = 134
              Top = 0
              Width = 608
              Height = 40
            end
            object RLLabel13: TRLLabel
              Left = 142
              Top = 0
              Width = 40
              Height = 12
              Alignment = taRightJustify
              Caption = 'Refor'#231'o:'
            end
            object RLLabel16: TRLLabel
              Left = 150
              Top = 13
              Width = 32
              Height = 12
              Alignment = taRightJustify
              Caption = 'Planta:'
            end
            object RLLabel17: TRLLabel
              Left = 136
              Top = 26
              Width = 46
              Height = 12
              Alignment = taRightJustify
              Caption = 'Caimento:'
            end
            object RLLabel18: TRLLabel
              Left = 365
              Top = 0
              Width = 27
              Height = 12
              Alignment = taRightJustify
              Caption = 'Alma:'
            end
            object RLLabel19: TRLLabel
              Left = 359
              Top = 13
              Width = 33
              Height = 12
              Alignment = taRightJustify
              Caption = 'Rebite:'
            end
            object RLLabel20: TRLLabel
              Left = 364
              Top = 26
              Width = 28
              Height = 12
              Alignment = taRightJustify
              Caption = 'Capa:'
            end
            object RLLabel21: TRLLabel
              Left = 568
              Top = 0
              Width = 47
              Height = 12
              Alignment = taRightJustify
              Caption = 'Esqueleto:'
            end
            object RLLabel22: TRLLabel
              Left = 585
              Top = 13
              Width = 30
              Height = 12
              Alignment = taRightJustify
              Caption = 'Ponte:'
            end
            object RLLabel23: TRLLabel
              Left = 592
              Top = 26
              Width = 23
              Height = 12
              Alignment = taRightJustify
              Caption = 'Lixa:'
            end
            object RLDBText13: TRLDBText
              Left = 184
              Top = 0
              Width = 172
              Height = 12
              AutoSize = False
              DataField = 'REFORCO'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText14: TRLDBText
              Left = 184
              Top = 13
              Width = 172
              Height = 11
              AutoSize = False
              DataField = 'PLANTA'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText15: TRLDBText
              Left = 184
              Top = 27
              Width = 172
              Height = 11
              AutoSize = False
              DataField = 'CAIMENTO'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText16: TRLDBText
              Left = 394
              Top = 0
              Width = 172
              Height = 12
              AutoSize = False
              DataField = 'ALMA'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText17: TRLDBText
              Left = 394
              Top = 13
              Width = 172
              Height = 11
              AutoSize = False
              DataField = 'REBITE'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText18: TRLDBText
              Left = 394
              Top = 27
              Width = 172
              Height = 11
              AutoSize = False
              DataField = 'CAPA'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
            end
            object RLDBText19: TRLDBText
              Left = 616
              Top = 0
              Width = 122
              Height = 12
              AutoSize = False
              DataField = 'ESQUELETO'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText20: TRLDBText
              Left = 616
              Top = 13
              Width = 122
              Height = 11
              AutoSize = False
              DataField = 'PONTE'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText21: TRLDBText
              Left = 616
              Top = 27
              Width = 122
              Height = 11
              AutoSize = False
              DataField = 'LIXA'
              DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 20
          BandType = btHeader
          object RLDraw4: TRLDraw
            Left = 134
            Top = 3
            Width = 607
            Height = 16
          end
          object RLLabel6: TRLLabel
            Left = 136
            Top = 5
            Width = 49
            Height = 12
            Caption = 'Refer'#234'ncia'
          end
          object RLLabel7: TRLLabel
            Left = 194
            Top = 5
            Width = 35
            Height = 12
            Caption = 'Material'
          end
          object RLLabel8: TRLLabel
            Left = 445
            Top = 5
            Width = 18
            Height = 12
            Caption = 'Cor'
          end
          object RLLabel9: TRLLabel
            Left = 549
            Top = 5
            Width = 50
            Height = 12
            Caption = 'Fornecedor'
          end
          object RLLabel10: TRLLabel
            Left = 661
            Top = 5
            Width = 37
            Height = 12
            Caption = 'Medidas'
          end
        end
      end
    end
  end
end
