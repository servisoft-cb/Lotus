object fRelClientes2: TfRelClientes2
  Left = 49
  Top = 141
  Width = 913
  Height = 494
  VertScrollBar.Position = 56
  Caption = 'fRelClientes2'
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
    Left = 29
    Top = -37
    Width = 794
    Height = 1123
    DataSource = fConsClientes.dsqClientes
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
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 30
      Width = 734
      Height = 643
      DataSource = fConsClientes.dsqClientes
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 49
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 250
          Top = 8
          Width = 222
          Height = 19
          Caption = 'Rela'#231#227'o de Clientes por Loja'
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
        object RLLabel2: TRLLabel
          Left = 0
          Top = 34
          Width = 32
          Height = 12
          Caption = 'C'#243'digo'
        end
        object RLLabel3: TRLLabel
          Left = 32
          Top = 34
          Width = 28
          Height = 12
          Caption = 'Nome'
        end
        object RLLabel5: TRLLabel
          Left = 552
          Top = 34
          Width = 32
          Height = 12
          Caption = 'Cidade'
        end
        object RLLabel6: TRLLabel
          Left = 285
          Top = 34
          Width = 50
          Height = 12
          Caption = 'CNPJ/CPF'
        end
        object RLLabel8: TRLLabel
          Left = 381
          Top = 33
          Width = 39
          Height = 12
          Caption = 'Telefone'
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 47
          Width = 734
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel7: TRLLabel
          Left = 467
          Top = 33
          Width = 19
          Height = 12
          Caption = 'Fax'
        end
        object RLLabel9: TRLLabel
          Left = 694
          Top = 34
          Width = 16
          Height = 12
          Caption = 'UF'
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 49
        Width = 734
        Height = 520
        DataFields = 'NomeLoja'
        object RLBand2: TRLBand
          Left = 0
          Top = 20
          Width = 734
          Height = 31
          BeforePrint = RLBand2BeforePrint
          object RLDBText1: TRLDBText
            Left = 1
            Top = 3
            Width = 30
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Codigo'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText2: TRLDBText
            Left = 32
            Top = 3
            Width = 251
            Height = 12
            AutoSize = False
            DataField = 'Nome'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText6: TRLDBText
            Left = 552
            Top = 3
            Width = 141
            Height = 12
            AutoSize = False
            DataField = 'NomeCidade'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText7: TRLDBText
            Left = 285
            Top = 3
            Width = 95
            Height = 12
            AutoSize = False
            DataField = 'CgcCpf'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText9: TRLDBText
            Left = 381
            Top = 3
            Width = 84
            Height = 12
            AutoSize = False
            DataField = 'Telefone'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText4: TRLDBText
            Left = 467
            Top = 3
            Width = 84
            Height = 12
            AutoSize = False
            DataField = 'Fax'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText5: TRLDBText
            Left = 694
            Top = 3
            Width = 23
            Height = 12
            AutoSize = False
            DataField = 'Uf'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText17: TRLDBText
            Left = 32
            Top = 17
            Width = 329
            Height = 12
            AutoSize = False
            DataField = 'EmailNFe'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDraw3: TRLDraw
            Left = 0
            Top = 0
            Width = 734
            Height = 2
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 734
          Height = 20
          BandType = btHeader
          object RLLabel4: TRLLabel
            Left = 48
            Top = 5
            Width = 26
            Height = 11
            Caption = 'Loja:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLDBText3: TRLDBText
            Left = 80
            Top = 5
            Width = 49
            Height = 11
            DataField = 'NomeLoja'
            DataSource = fConsClientes.dsqClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand8: TRLBand
          Left = 0
          Top = 51
          Width = 734
          Height = 109
          BeforePrint = RLBand8BeforePrint
          object RLDraw4: TRLDraw
            Left = 0
            Top = 0
            Width = 734
            Height = 2
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel25: TRLLabel
            Left = 17
            Top = 4
            Width = 35
            Height = 12
            Caption = 'Cliente:'
          end
          object RLDBText21: TRLDBText
            Left = 53
            Top = 4
            Width = 30
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Codigo'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText22: TRLDBText
            Left = 85
            Top = 4
            Width = 325
            Height = 12
            AutoSize = False
            DataField = 'Nome'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel26: TRLLabel
            Left = 446
            Top = 4
            Width = 27
            Height = 12
            Caption = 'Fone:'
          end
          object RLDBText23: TRLDBText
            Left = 474
            Top = 4
            Width = 26
            Height = 12
            AutoSize = False
            DataField = 'DDDFone1'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText24: TRLDBText
            Left = 501
            Top = 4
            Width = 84
            Height = 12
            AutoSize = False
            DataField = 'Telefone'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel27: TRLLabel
            Left = 591
            Top = 4
            Width = 22
            Height = 12
            Caption = 'Fax:'
          end
          object RLDBText25: TRLDBText
            Left = 616
            Top = 4
            Width = 26
            Height = 12
            AutoSize = False
            DataField = 'DDDFax'
            DataSource = fConsClientes.dsqClientes
          end
          object RLDBText26: TRLDBText
            Left = 644
            Top = 4
            Width = 84
            Height = 12
            AutoSize = False
            DataField = 'Fax'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel28: TRLLabel
            Left = 30
            Top = 17
            Width = 22
            Height = 12
            Alignment = taRightJustify
            Caption = 'End:'
          end
          object RLLabel29: TRLLabel
            Left = 53
            Top = 17
            Width = 372
            Height = 12
            AutoSize = False
            Caption = 'End:'
          end
          object RLLabel30: TRLLabel
            Left = 442
            Top = 18
            Width = 31
            Height = 12
            Alignment = taRightJustify
            Caption = 'CNPJ:'
          end
          object RLDBText27: TRLDBText
            Left = 474
            Top = 18
            Width = 109
            Height = 12
            AutoSize = False
            DataField = 'CgcCpf'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel31: TRLLabel
            Left = 587
            Top = 18
            Width = 26
            Height = 12
            Alignment = taRightJustify
            Caption = 'I.Est:'
          end
          object RLLabel32: TRLLabel
            Left = 616
            Top = 18
            Width = 112
            Height = 12
            AutoSize = False
            Caption = 'I.Est:'
          end
          object RLLabel33: TRLLabel
            Left = 22
            Top = 41
            Width = 30
            Height = 12
            Alignment = taRightJustify
            Caption = 'Bairro:'
          end
          object RLDBText28: TRLDBText
            Left = 53
            Top = 41
            Width = 267
            Height = 12
            AutoSize = False
            DataField = 'Bairro'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel34: TRLLabel
            Left = 325
            Top = 41
            Width = 23
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cep:'
          end
          object RLDBText29: TRLDBText
            Left = 350
            Top = 41
            Width = 75
            Height = 12
            AutoSize = False
            DataField = 'Cep'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel35: TRLLabel
            Left = 17
            Top = 53
            Width = 35
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cidade:'
          end
          object RLDBText30: TRLDBText
            Left = 53
            Top = 53
            Width = 267
            Height = 12
            AutoSize = False
            DataField = 'NomeCidade'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel36: TRLLabel
            Left = 329
            Top = 53
            Width = 19
            Height = 12
            Alignment = taRightJustify
            Caption = 'UF:'
          end
          object RLDBText31: TRLDBText
            Left = 350
            Top = 53
            Width = 75
            Height = 12
            AutoSize = False
            DataField = 'Uf'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel37: TRLLabel
            Left = 19
            Top = 28
            Width = 33
            Height = 12
            Alignment = taRightJustify
            Caption = 'Compl:'
          end
          object RLDBText32: TRLDBText
            Left = 53
            Top = 28
            Width = 372
            Height = 12
            AutoSize = False
            DataField = 'ComplEndereco'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel38: TRLLabel
            Left = 7
            Top = 66
            Width = 45
            Height = 12
            Alignment = taRightJustify
            Caption = 'Vendedor:'
          end
          object RLDBText33: TRLDBText
            Left = 53
            Top = 66
            Width = 253
            Height = 12
            AutoSize = False
            DataField = 'NomeVendedor'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel41: TRLLabel
            Left = 2
            Top = 92
            Width = 50
            Height = 12
            Alignment = taRightJustify
            Caption = 'Email NFe:'
          end
          object RLDBText36: TRLDBText
            Left = 53
            Top = 92
            Width = 373
            Height = 12
            AutoSize = False
            DataField = 'EmailNFe'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel47: TRLLabel
            Left = 434
            Top = 66
            Width = 39
            Height = 12
            Alignment = taRightJustify
            Caption = 'Contato:'
          end
          object RLDBText38: TRLDBText
            Left = 474
            Top = 66
            Width = 250
            Height = 12
            AutoSize = False
            DataField = 'Contato'
            DataSource = fConsClientes.dsqClientes
          end
        end
        object RLBand9: TRLBand
          Left = 0
          Top = 160
          Width = 734
          Height = 72
          BeforePrint = RLBand9BeforePrint
          object RLLabel52: TRLLabel
            Left = 30
            Top = 21
            Width = 22
            Height = 12
            Alignment = taRightJustify
            Caption = 'End:'
          end
          object RLLabel53: TRLLabel
            Left = 53
            Top = 21
            Width = 372
            Height = 12
            AutoSize = False
            Caption = 'End:'
          end
          object RLLabel54: TRLLabel
            Left = 429
            Top = 22
            Width = 44
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cnpj/Cpf:'
          end
          object RLDBText46: TRLDBText
            Left = 474
            Top = 22
            Width = 109
            Height = 12
            AutoSize = False
            DataField = 'CgcCpf'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel57: TRLLabel
            Left = 22
            Top = 45
            Width = 30
            Height = 12
            Alignment = taRightJustify
            Caption = 'Bairro:'
          end
          object RLDBText47: TRLDBText
            Left = 53
            Top = 45
            Width = 267
            Height = 12
            AutoSize = False
            DataField = 'BairroEntrega'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel58: TRLLabel
            Left = 325
            Top = 45
            Width = 23
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cep:'
          end
          object RLDBText48: TRLDBText
            Left = 350
            Top = 45
            Width = 75
            Height = 12
            AutoSize = False
            DataField = 'CepEntrega'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel59: TRLLabel
            Left = 17
            Top = 57
            Width = 35
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cidade:'
          end
          object RLDBText49: TRLDBText
            Left = 53
            Top = 57
            Width = 267
            Height = 12
            AutoSize = False
            DataField = 'lkCidEntrega'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel60: TRLLabel
            Left = 329
            Top = 57
            Width = 19
            Height = 12
            Alignment = taRightJustify
            Caption = 'UF:'
          end
          object RLDBText50: TRLDBText
            Left = 350
            Top = 57
            Width = 75
            Height = 12
            AutoSize = False
            DataField = 'UfEntrega'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel61: TRLLabel
            Left = 19
            Top = 32
            Width = 33
            Height = 12
            Alignment = taRightJustify
            Caption = 'Compl:'
          end
          object RLDBText51: TRLDBText
            Left = 53
            Top = 32
            Width = 372
            Height = 12
            AutoSize = False
            DataField = 'ComplEnderecoEntrega'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel73: TRLLabel
            Left = 41
            Top = 4
            Width = 282
            Height = 12
            Caption = 
              'Endere'#231'o de Entrega ............................................' +
              '...................'
          end
        end
        object RLBand10: TRLBand
          Left = 0
          Top = 232
          Width = 734
          Height = 57
          BeforePrint = RLBand10BeforePrint
          object RLLabel56: TRLLabel
            Left = 30
            Top = 18
            Width = 22
            Height = 12
            Alignment = taRightJustify
            Caption = 'End:'
          end
          object RLLabel64: TRLLabel
            Left = 22
            Top = 30
            Width = 30
            Height = 12
            Alignment = taRightJustify
            Caption = 'Bairro:'
          end
          object RLDBText45: TRLDBText
            Left = 53
            Top = 30
            Width = 267
            Height = 12
            AutoSize = False
            DataField = 'BairroPgto'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel65: TRLLabel
            Left = 325
            Top = 30
            Width = 23
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cep:'
          end
          object RLDBText52: TRLDBText
            Left = 350
            Top = 30
            Width = 75
            Height = 12
            AutoSize = False
            DataField = 'CepPgto'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel66: TRLLabel
            Left = 17
            Top = 42
            Width = 35
            Height = 12
            Alignment = taRightJustify
            Caption = 'Cidade:'
          end
          object RLDBText53: TRLDBText
            Left = 53
            Top = 42
            Width = 267
            Height = 12
            AutoSize = False
            DataField = 'lkCidPgto'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel67: TRLLabel
            Left = 329
            Top = 42
            Width = 19
            Height = 12
            Alignment = taRightJustify
            Caption = 'UF:'
          end
          object RLDBText54: TRLDBText
            Left = 350
            Top = 42
            Width = 75
            Height = 12
            AutoSize = False
            DataField = 'UfPgto'
            DataSource = fConsClientes.dsqClientes
          end
          object RLLabel69: TRLLabel
            Left = 41
            Top = 4
            Width = 290
            Height = 12
            Caption = 
              'Endere'#231'o de Cobran'#231'a ...........................................' +
              '....................'
          end
          object RLDBText39: TRLDBText
            Left = 53
            Top = 18
            Width = 372
            Height = 12
            AutoSize = False
            DataField = 'EndPgto'
            DataSource = fConsClientes.dsqClientes
          end
        end
      end
    end
  end
end
