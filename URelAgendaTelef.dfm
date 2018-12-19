object fRelAgendaTelef: TfRelAgendaTelef
  Left = 48
  Top = 166
  Width = 941
  Height = 535
  Caption = 'fRelAgendaTelef'
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
    Left = 48
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fAgendaTelef.dsmAgenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    ShowProgress = False
    object RLBand1: TRLBand
      Left = 26
      Top = 26
      Width = 742
      Height = 30
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 312
        Top = 8
        Width = 113
        Height = 16
        Caption = 'Agenda Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel48: TRLLabel
        Left = 636
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
        Left = 673
        Top = 3
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
        Left = 644
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
      object RLSystemInfo2: TRLSystemInfo
        Left = 673
        Top = 16
        Width = 64
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
    end
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 56
      Width = 742
      Height = 257
      DataSource = fAgendaTelef.dsmAgenda
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 742
        Height = 89
        DataFields = 'Controle'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 33
          BandType = btHeader
          BeforePrint = RLBand2BeforePrint
          object RLDraw1: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 33
            Align = faClient
          end
          object RLLabel2: TRLLabel
            Left = 306
            Top = 1
            Width = 82
            Height = 16
            Caption = 'C L I E N T E'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel3: TRLLabel
            Left = 3
            Top = 19
            Width = 28
            Height = 12
            Caption = 'Nome'
          end
          object RLLabel4: TRLLabel
            Left = 203
            Top = 19
            Width = 19
            Height = 12
            Caption = 'Fax'
          end
          object RLLabel5: TRLLabel
            Left = 299
            Top = 19
            Width = 24
            Height = 12
            Caption = 'Fone'
          end
          object RLLabel6: TRLLabel
            Left = 467
            Top = 19
            Width = 36
            Height = 12
            Caption = 'Contato'
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 33
          Width = 742
          Height = 16
          object RLDBText1: TRLDBText
            Left = 2
            Top = 2
            Width = 195
            Height = 12
            AutoSize = False
            DataField = 'Nome'
            DataSource = fAgendaTelef.dsmAgenda
          end
          object RLDBText2: TRLDBText
            Left = 201
            Top = 2
            Width = 95
            Height = 12
            AutoSize = False
            DataField = 'Fax'
            DataSource = fAgendaTelef.dsmAgenda
          end
          object RLDBText3: TRLDBText
            Left = 297
            Top = 2
            Width = 168
            Height = 12
            AutoSize = False
            DataField = 'Fone'
            DataSource = fAgendaTelef.dsmAgenda
          end
          object RLDBMemo1: TRLDBMemo
            Left = 467
            Top = 2
            Width = 270
            Height = 12
            AutoSize = False
            DataField = 'Contato'
            DataSource = fAgendaTelef.dsmAgenda
          end
          object RLDraw2: TRLDraw
            Left = 0
            Top = 15
            Width = 742
            Height = 1
            Align = faBottom
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 49
          Width = 742
          Height = 16
          BandType = btFooter
          object RLLabel7: TRLLabel
            Left = 733
            Top = 2
            Width = 6
            Height = 10
            Caption = '.'
          end
        end
      end
    end
  end
end
