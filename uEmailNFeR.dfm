object fEmailNFeR: TfEmailNFeR
  Left = 288
  Top = 103
  Width = 836
  Height = 563
  Caption = 'fEmailNFeR'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fEmailNFeC.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 19
      Top = 19
      Width = 756
      Height = 64
      DataSource = fEmailNFeC.DataSource1
      object RLDetailGrid1: TRLDetailGrid
        Left = 0
        Top = 18
        Width = 756
        Height = 18
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        ColCount = 2
        Organization = goInColumns
        object RLDBText1: TRLDBText
          Left = 179
          Top = 0
          Width = 196
          Height = 14
          AutoSize = False
          DataField = 'EMAILNFE'
          DataSource = fEmailNFeC.DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 0
          Top = 0
          Width = 16
          Height = 14
          DataField = 'UF'
          DataSource = fEmailNFeC.DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 19
          Top = 0
          Width = 156
          Height = 14
          AutoSize = False
          DataField = 'NOME'
          DataSource = fEmailNFeC.DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 756
        Height = 18
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 274
          Top = 1
          Width = 170
          Height = 16
          Caption = 'RELA'#199#195'O DE EMAILS NFE'
        end
      end
    end
  end
end
