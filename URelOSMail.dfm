object fRelOSMail: TfRelOSMail
  Left = 0
  Top = 10
  Width = 786
  Height = 549
  HorzScrollBar.Position = 7
  BorderIcons = [biSystemMenu]
  Caption = 'fRelOSMail'
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
    Left = -3
    Top = 3
    Width = 794
    Height = 1123
    DataSource = DM1.dsOSItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 483
      DataSource = DM1.dsOSItens
      BeforePrint = RLSubDetail1BeforePrint
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 345
        BeforePrint = RLBand1BeforePrint
        object RLDraw1: TRLDraw
          Left = 1
          Top = 2
          Width = 716
          Height = 339
        end
        object RLDraw2: TRLDraw
          Left = 1
          Top = 31
          Width = 250
          Height = 39
        end
        object RLDraw3: TRLDraw
          Left = 250
          Top = 31
          Width = 250
          Height = 39
        end
        object RLDraw4: TRLDraw
          Left = 499
          Top = 31
          Width = 218
          Height = 39
        end
        object RLDraw5: TRLDraw
          Left = 1
          Top = 69
          Width = 716
          Height = 32
        end
        object RLDraw6: TRLDraw
          Left = 2
          Top = 100
          Width = 715
          Height = 32
        end
        object RLDraw7: TRLDraw
          Left = 2
          Top = 131
          Width = 385
          Height = 32
        end
        object RLDraw8: TRLDraw
          Left = 386
          Top = 131
          Width = 176
          Height = 32
        end
        object RLDraw9: TRLDraw
          Left = 561
          Top = 131
          Width = 33
          Height = 32
        end
        object RLDraw10: TRLDraw
          Left = 593
          Top = 131
          Width = 124
          Height = 32
        end
        object RLLabel1: TRLLabel
          Left = 21
          Top = 8
          Width = 72
          Height = 19
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 13
          Top = 41
          Width = 63
          Height = 19
          Caption = 'Nº O.S.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 261
          Top = 41
          Width = 66
          Height = 19
          Caption = 'Nº Lote:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 506
          Top = 41
          Width = 101
          Height = 19
          Caption = 'Dt. Emissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 13
          Top = 76
          Width = 99
          Height = 19
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 13
          Top = 107
          Width = 171
          Height = 19
          Caption = 'Nº Ordem de Compra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 163
          Top = 138
          Width = 63
          Height = 19
          Caption = 'Material'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 458
          Top = 138
          Width = 32
          Height = 19
          Caption = 'Cor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 563
          Top = 138
          Width = 28
          Height = 19
          Caption = 'UN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 609
          Top = 138
          Width = 92
          Height = 19
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 79
          Top = 41
          Width = 167
          Height = 19
          AutoSize = False
          DataField = 'NumOS'
          DataSource = DM1.dsOSItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 331
          Top = 41
          Width = 165
          Height = 19
          AutoSize = False
          DataField = 'NumLote'
          DataSource = DM1.dsOSItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 610
          Top = 41
          Width = 104
          Height = 19
          AutoSize = False
          DataField = 'DtEmissao'
          DataSource = DM1.dsOS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 115
          Top = 76
          Width = 596
          Height = 19
          AutoSize = False
          DataField = 'lkFornecedor'
          DataSource = DM1.dsOS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText5: TRLDBText
          Left = 189
          Top = 107
          Width = 519
          Height = 19
          AutoSize = False
          DataField = 'NumOC'
          DataSource = DM1.dsOS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText6: TRLDBText
          Left = 13
          Top = 164
          Width = 378
          Height = 16
          AutoSize = False
          DataField = 'lkMaterial'
          DataSource = DM1.dsOSItens
        end
        object RLDBText7: TRLDBText
          Left = 391
          Top = 164
          Width = 171
          Height = 16
          AutoSize = False
          DataField = 'lkCor'
          DataSource = DM1.dsOSItens
        end
        object RLDBText8: TRLDBText
          Left = 563
          Top = 164
          Width = 29
          Height = 16
          AutoSize = False
          DataField = 'Unidade'
          DataSource = DM1.dsOSItens
        end
        object RLDBText9: TRLDBText
          Left = 600
          Top = 164
          Width = 113
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtde'
          DataSource = DM1.dsOSItens
        end
        object RLLabel11: TRLLabel
          Left = 13
          Top = 186
          Width = 58
          Height = 16
          Caption = 'Largura:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText10: TRLDBText
          Left = 74
          Top = 186
          Width = 171
          Height = 16
          AutoSize = False
          DataField = 'Largura'
          DataSource = DM1.dsOSItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object QST: TRLDraw
          Left = 3
          Top = 207
          Width = 60
          Height = 25
        end
        object QST1: TRLDraw
          Left = 63
          Top = 207
          Width = 51
          Height = 25
        end
        object QST2: TRLDraw
          Left = 113
          Top = 207
          Width = 51
          Height = 25
        end
        object QST4: TRLDraw
          Left = 213
          Top = 207
          Width = 51
          Height = 25
        end
        object QST3: TRLDraw
          Left = 163
          Top = 207
          Width = 51
          Height = 25
        end
        object QST8: TRLDraw
          Left = 413
          Top = 207
          Width = 51
          Height = 25
        end
        object QST7: TRLDraw
          Left = 363
          Top = 207
          Width = 51
          Height = 25
        end
        object QST6: TRLDraw
          Left = 313
          Top = 207
          Width = 51
          Height = 25
        end
        object QST5: TRLDraw
          Left = 263
          Top = 207
          Width = 51
          Height = 25
        end
        object QST13: TRLDraw
          Left = 663
          Top = 207
          Width = 51
          Height = 25
        end
        object QST12: TRLDraw
          Left = 613
          Top = 207
          Width = 51
          Height = 25
        end
        object QST11: TRLDraw
          Left = 563
          Top = 207
          Width = 51
          Height = 25
        end
        object QST10: TRLDraw
          Left = 513
          Top = 207
          Width = 51
          Height = 25
        end
        object QST9: TRLDraw
          Left = 463
          Top = 207
          Width = 51
          Height = 25
        end
        object QSQ: TRLDraw
          Left = 3
          Top = 231
          Width = 60
          Height = 25
        end
        object QSQ1: TRLDraw
          Left = 63
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ2: TRLDraw
          Left = 113
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ4: TRLDraw
          Left = 213
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ3: TRLDraw
          Left = 163
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ8: TRLDraw
          Left = 413
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ7: TRLDraw
          Left = 363
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ6: TRLDraw
          Left = 313
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ5: TRLDraw
          Left = 263
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ13: TRLDraw
          Left = 663
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ12: TRLDraw
          Left = 613
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ11: TRLDraw
          Left = 563
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ10: TRLDraw
          Left = 513
          Top = 231
          Width = 51
          Height = 25
        end
        object QSQ9: TRLDraw
          Left = 463
          Top = 231
          Width = 51
          Height = 25
        end
        object QSTB: TRLDraw
          Left = 3
          Top = 271
          Width = 60
          Height = 25
        end
        object QST14: TRLDraw
          Left = 63
          Top = 271
          Width = 51
          Height = 25
        end
        object QST15: TRLDraw
          Left = 113
          Top = 271
          Width = 51
          Height = 25
        end
        object QST17: TRLDraw
          Left = 213
          Top = 271
          Width = 51
          Height = 25
        end
        object QST16: TRLDraw
          Left = 163
          Top = 271
          Width = 51
          Height = 25
        end
        object QST21: TRLDraw
          Left = 413
          Top = 271
          Width = 51
          Height = 25
        end
        object QST20: TRLDraw
          Left = 363
          Top = 271
          Width = 51
          Height = 25
        end
        object QST19: TRLDraw
          Left = 313
          Top = 271
          Width = 51
          Height = 25
        end
        object QST18: TRLDraw
          Left = 263
          Top = 271
          Width = 51
          Height = 25
        end
        object QST26: TRLDraw
          Left = 663
          Top = 271
          Width = 51
          Height = 25
        end
        object QST25: TRLDraw
          Left = 613
          Top = 271
          Width = 51
          Height = 25
        end
        object QST24: TRLDraw
          Left = 563
          Top = 271
          Width = 51
          Height = 25
        end
        object QST23: TRLDraw
          Left = 513
          Top = 271
          Width = 51
          Height = 25
        end
        object QST22: TRLDraw
          Left = 463
          Top = 271
          Width = 51
          Height = 25
        end
        object QSQB: TRLDraw
          Left = 3
          Top = 295
          Width = 60
          Height = 25
        end
        object QSQ14: TRLDraw
          Left = 63
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ15: TRLDraw
          Left = 113
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ17: TRLDraw
          Left = 213
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ16: TRLDraw
          Left = 163
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ21: TRLDraw
          Left = 413
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ20: TRLDraw
          Left = 363
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ19: TRLDraw
          Left = 313
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ18: TRLDraw
          Left = 263
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ26: TRLDraw
          Left = 663
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ25: TRLDraw
          Left = 613
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ24: TRLDraw
          Left = 563
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ23: TRLDraw
          Left = 513
          Top = 295
          Width = 51
          Height = 25
        end
        object QSQ22: TRLDraw
          Left = 463
          Top = 295
          Width = 51
          Height = 25
        end
        object Tam: TRLLabel
          Left = 10
          Top = 210
          Width = 47
          Height = 19
          AutoSize = False
          Caption = 'Tam.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam1: TRLLabel
          Left = 69
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam2: TRLLabel
          Left = 119
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam4: TRLLabel
          Left = 219
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam3: TRLLabel
          Left = 169
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam5: TRLLabel
          Left = 269
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam6: TRLLabel
          Left = 319
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam7: TRLLabel
          Left = 369
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam8: TRLLabel
          Left = 419
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam9: TRLLabel
          Left = 469
          Top = 211
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam10: TRLLabel
          Left = 518
          Top = 211
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam11: TRLLabel
          Left = 568
          Top = 211
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam12: TRLLabel
          Left = 616
          Top = 211
          Width = 44
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam13: TRLLabel
          Left = 667
          Top = 211
          Width = 43
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TamB: TRLLabel
          Left = 10
          Top = 275
          Width = 47
          Height = 19
          AutoSize = False
          Caption = 'Tam.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam14: TRLLabel
          Left = 69
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam15: TRLLabel
          Left = 119
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam16: TRLLabel
          Left = 169
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam17: TRLLabel
          Left = 219
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam18: TRLLabel
          Left = 269
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam19: TRLLabel
          Left = 319
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam20: TRLLabel
          Left = 369
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam21: TRLLabel
          Left = 419
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam22: TRLLabel
          Left = 469
          Top = 275
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam23: TRLLabel
          Left = 518
          Top = 275
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam24: TRLLabel
          Left = 568
          Top = 275
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam25: TRLLabel
          Left = 616
          Top = 275
          Width = 44
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Tam26: TRLLabel
          Left = 667
          Top = 275
          Width = 43
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd: TRLLabel
          Left = 10
          Top = 234
          Width = 47
          Height = 19
          AutoSize = False
          Caption = 'Qtd.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd1: TRLLabel
          Left = 69
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd2: TRLLabel
          Left = 119
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd3: TRLLabel
          Left = 169
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd4: TRLLabel
          Left = 219
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd5: TRLLabel
          Left = 269
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd6: TRLLabel
          Left = 319
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd7: TRLLabel
          Left = 369
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd8: TRLLabel
          Left = 419
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd9: TRLLabel
          Left = 469
          Top = 235
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd10: TRLLabel
          Left = 518
          Top = 235
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd11: TRLLabel
          Left = 568
          Top = 235
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd12: TRLLabel
          Left = 616
          Top = 235
          Width = 44
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd13: TRLLabel
          Left = 667
          Top = 235
          Width = 43
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object QtdB: TRLLabel
          Left = 10
          Top = 298
          Width = 47
          Height = 19
          AutoSize = False
          Caption = 'Qtd.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd14: TRLLabel
          Left = 69
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd15: TRLLabel
          Left = 119
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd16: TRLLabel
          Left = 169
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd17: TRLLabel
          Left = 219
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd18: TRLLabel
          Left = 269
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd19: TRLLabel
          Left = 319
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd20: TRLLabel
          Left = 369
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd21: TRLLabel
          Left = 419
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd22: TRLLabel
          Left = 469
          Top = 299
          Width = 39
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd23: TRLLabel
          Left = 518
          Top = 299
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd24: TRLLabel
          Left = 568
          Top = 299
          Width = 41
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd25: TRLLabel
          Left = 616
          Top = 299
          Width = 44
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Qtd26: TRLLabel
          Left = 667
          Top = 299
          Width = 43
          Height = 16
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
end
