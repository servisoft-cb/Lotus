object fRelFichaConsumoMat: TfRelFichaConsumoMat
  Left = 68
  Top = 125
  Width = 841
  Height = 480
  Caption = 'fRelFichaConsumoMat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 21
    Top = 2
    Width = 794
    Height = 1123
    DataSource = DM1.dsFichaConsumo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 699
      DataSource = DM1.dsFichaConsumo
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 133
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 199
          Top = 6
          Width = 274
          Height = 19
          Caption = 'Ficha de Consumo de Materiais - N'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 641
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
          Left = 661
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
          Left = 626
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
          Left = 661
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
        object RLDraw2: TRLDraw
          Left = 0
          Top = 131
          Width = 718
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel2: TRLLabel
          Left = 32
          Top = 31
          Width = 65
          Height = 14
          Caption = 'Refer'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 50
          Top = 43
          Width = 47
          Height = 14
          Caption = 'Modelo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 27
          Top = 55
          Width = 70
          Height = 14
          Caption = 'Constru'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 74
          Top = 67
          Width = 23
          Height = 14
          Caption = 'Cia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 52
          Top = 79
          Width = 45
          Height = 14
          Caption = 'Tempo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 12
          Top = 91
          Width = 85
          Height = 14
          Caption = 'Dt. Movimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText8: TRLDBText
          Left = 101
          Top = 33
          Width = 49
          Height = 12
          DataField = 'Referencia'
          DataSource = DM1.dsFichaConsumo
        end
        object RLDBText10: TRLDBText
          Left = 101
          Top = 45
          Width = 32
          Height = 12
          DataField = 'Modelo'
          DataSource = DM1.dsFichaConsumo
        end
        object RLDBText11: TRLDBText
          Left = 101
          Top = 57
          Width = 51
          Height = 12
          DataField = 'Construcao'
          DataSource = DM1.dsFichaConsumo
        end
        object RLDBText12: TRLDBText
          Left = 101
          Top = 69
          Width = 17
          Height = 12
          DataField = 'Cia'
          DataSource = DM1.dsFichaConsumo
        end
        object RLDBText13: TRLDBText
          Left = 101
          Top = 81
          Width = 31
          Height = 12
          DataField = 'Tempo'
          DataSource = DM1.dsFichaConsumo
        end
        object RLDBText14: TRLDBText
          Left = 101
          Top = 93
          Width = 31
          Height = 12
          DataField = 'DtMov'
          DataSource = DM1.dsFichaConsumo
        end
        object RLLabel10: TRLLabel
          Left = 4
          Top = 115
          Width = 91
          Height = 14
          Caption = 'Tipo de Material'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 184
          Top = 115
          Width = 121
          Height = 14
          Caption = 'Descri'#231#227'o do Material'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 625
          Top = 115
          Width = 30
          Height = 14
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 658
          Top = 115
          Width = 57
          Height = 14
          Caption = 'Consumo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 0
          Top = 113
          Width = 718
          Height = 2
          DrawKind = dkLine
        end
        object RLDBText1: TRLDBText
          Left = 477
          Top = 6
          Width = 72
          Height = 19
          DataField = 'NumMov'
          DataSource = DM1.dsFichaConsumo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 133
        Width = 718
        Height = 200
        DataSource = DM1.dsFichaConsumoMat
        object RLGroup1: TRLGroup
          Left = 0
          Top = 0
          Width = 718
          Height = 104
          DataFields = 'Opcao'
          object RLBand2: TRLBand
            Left = 0
            Top = 21
            Width = 718
            Height = 16
            object RLDBText2: TRLDBText
              Left = 3
              Top = 2
              Width = 178
              Height = 11
              AutoSize = False
              DataField = 'lkNomeTipoMaterial'
              DataSource = DM1.dsFichaConsumoMat
            end
            object RLDBText6: TRLDBText
              Left = 184
              Top = 2
              Width = 439
              Height = 11
              AutoSize = False
              DataField = 'NomeMaterial'
              DataSource = DM1.dsFichaConsumoMat
            end
            object RLDraw1: TRLDraw
              Left = 0
              Top = 14
              Width = 718
              Height = 2
              Align = faBottom
              DrawKind = dkLine
              Pen.Style = psDot
            end
            object RLDBText7: TRLDBText
              Left = 626
              Top = 2
              Width = 28
              Height = 11
              Alignment = taCenter
              AutoSize = False
              DataField = 'Unidade'
              DataSource = DM1.dsFichaConsumoMat
            end
            object RLDBText4: TRLDBText
              Left = 658
              Top = 2
              Width = 57
              Height = 11
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Consumo'
              DataSource = DM1.dsFichaConsumoMat
            end
          end
          object RLBand3: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 21
            BandType = btHeader
            BeforePrint = RLBand3BeforePrint
            object RLLabel4: TRLLabel
              Left = 45
              Top = 3
              Width = 40
              Height = 14
              Caption = 'Op'#231#227'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
            end
            object RLDBText3: TRLDBText
              Left = 86
              Top = 3
              Width = 37
              Height = 14
              DataField = 'Opcao'
              DataSource = DM1.dsFichaConsumoMat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsUnderline]
              ParentFont = False
            end
            object RLDraw3: TRLDraw
              Left = 0
              Top = 19
              Width = 718
              Height = 2
              Align = faBottom
              DrawKind = dkLine
              Pen.Style = psDot
            end
          end
        end
      end
    end
  end
end
