object fRelVerificaGradeMat: TfRelVerificaGradeMat
  Left = 65
  Top = 121
  Width = 925
  Height = 570
  Caption = 'fRelVerificaGradeMat'
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
    Left = 64
    Top = 24
    Width = 794
    Height = 1123
    DataSource = fVerificaGradeMateriais.dsmVerifica
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
    object RLBand1: TRLBand
      Left = 30
      Top = 30
      Width = 734
      Height = 40
      object RLLabel1: TRLLabel
        Left = 8
        Top = 24
        Width = 32
        Height = 12
        Caption = 'C'#243'digo'
      end
      object RLLabel2: TRLLabel
        Left = 48
        Top = 24
        Width = 35
        Height = 12
        Caption = 'Material'
      end
      object RLLabel3: TRLLabel
        Left = 384
        Top = 24
        Width = 77
        Height = 12
        Caption = 'Grade Refer'#234'ncia'
      end
      object RLLabel4: TRLLabel
        Left = 528
        Top = 24
        Width = 73
        Height = 12
        Caption = 'Tam. Refer'#234'ncia'
      end
      object RLLabel5: TRLLabel
        Left = 616
        Top = 24
        Width = 59
        Height = 12
        Caption = 'Tam. Material'
      end
      object RLLabel6: TRLLabel
        Left = 240
        Top = 5
        Width = 249
        Height = 14
        Caption = 'Materiais Com Erro No Lan'#231'amento da Grade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 38
        Width = 734
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 70
      Width = 734
      Height = 155
      DataSource = fVerificaGradeMateriais.dsmVerifica
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 16
        object RLDBText1: TRLDBText
          Left = 3
          Top = 1
          Width = 42
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'CodMaterial'
          DataSource = fVerificaGradeMateriais.dsmVerifica
        end
        object RLDBText2: TRLDBText
          Left = 51
          Top = 1
          Width = 302
          Height = 12
          AutoSize = False
          DataField = 'NomeMaterial'
          DataSource = fVerificaGradeMateriais.dsmVerifica
        end
        object RLDBText3: TRLDBText
          Left = 355
          Top = 1
          Width = 174
          Height = 12
          AutoSize = False
          DataField = 'NomeGrade'
          DataSource = fVerificaGradeMateriais.dsmVerifica
        end
        object RLDBText4: TRLDBText
          Left = 531
          Top = 1
          Width = 70
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'TamReferencia'
          DataSource = fVerificaGradeMateriais.dsmVerifica
        end
        object RLDBText5: TRLDBText
          Left = 613
          Top = 1
          Width = 70
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'TamMaterial'
          DataSource = fVerificaGradeMateriais.dsmVerifica
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 14
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
