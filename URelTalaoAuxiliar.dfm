object fRelTalaoAuxiliar: TfRelTalaoAuxiliar
  Left = 53
  Top = 139
  Width = 902
  Height = 585
  Caption = 'fRelTalaoAuxiliar'
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
    Top = 24
    Width = 794
    Height = 1123
    DataSource = fPrevCalcMaterialLote.dsmMaterial
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 443
      DataSource = fPrevCalcMaterialLote.dsmMaterial
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 61
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 61
          Align = faClient
        end
        object RLLabel1: TRLLabel
          Left = 8
          Top = 11
          Width = 54
          Height = 16
          Caption = 'Material:'
        end
        object RLDBText1: TRLDBText
          Left = 64
          Top = 11
          Width = 84
          Height = 16
          DataField = 'NomeMaterial'
          DataSource = fPrevCalcMaterialLote.dsmMaterial
        end
        object RLLabel2: TRLLabel
          Left = 586
          Top = 35
          Width = 36
          Height = 16
          Caption = 'Total:'
        end
        object RLDBText4: TRLDBText
          Left = 625
          Top = 35
          Width = 53
          Height = 16
          DataField = 'QtdTotal'
          DataSource = fPrevCalcMaterialLote.dsmMaterial
        end
        object RLLabel3: TRLLabel
          Left = 12
          Top = 35
          Width = 50
          Height = 16
          Caption = 'Modelo:'
        end
        object RLDBText5: TRLDBText
          Left = 65
          Top = 35
          Width = 65
          Height = 16
          DataField = 'Referencia'
          DataSource = fPrevCalcMaterialLote.dsmMaterial
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 61
        Width = 718
        Height = 196
        DataSource = fPrevCalcMaterialLote.dsmMaterialGrade
        object RLDetailGrid1: TRLDetailGrid
          Left = 0
          Top = 0
          Width = 718
          Height = 54
          ColCount = 14
          object RLDBText2: TRLDBText
            Left = 4
            Top = 16
            Width = 44
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'Tamanho'
            DataSource = fPrevCalcMaterialLote.dsmMaterialGrade
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText3: TRLDBText
            Left = 4
            Top = 36
            Width = 44
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'Qtd'
            DataSource = fPrevCalcMaterialLote.dsmMaterialGrade
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw1: TRLDraw
            Left = 4
            Top = 33
            Width = 42
            Height = 2
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 54
          Width = 718
          Height = 94
          BandType = btFooter
        end
      end
    end
  end
end
