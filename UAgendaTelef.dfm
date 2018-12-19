object fAgendaTelef: TfAgendaTelef
  Left = 113
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Agenda Telef'#244'nica'
  ClientHeight = 321
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 80
    Width = 638
    Height = 241
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 636
      Height = 239
      ActivePage = TabSheet3
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnShow = TabSheet1Show
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 628
          Height = 211
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label1: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton1: TSpeedButton
            Left = 501
            Top = 7
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de Clientes'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object Bevel1: TBevel
            Left = 0
            Top = 40
            Width = 624
            Height = 2
            Style = bsRaised
          end
          object Label2: TLabel
            Left = 10
            Top = 56
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 52
            Top = 56
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 501
            Top = 56
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 549
            Top = 56
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 10
            Top = 101
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 68
            Top = 101
            Width = 121
            Height = 13
            DataField = 'Telefone'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 229
            Top = 101
            Width = 66
            Height = 13
            Caption = 'Telefone 2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 303
            Top = 101
            Width = 133
            Height = 13
            DataField = 'Telefone2'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 470
            Top = 101
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText5: TDBText
            Left = 499
            Top = 101
            Width = 121
            Height = 13
            DataField = 'Fax'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 10
            Top = 78
            Width = 89
            Height = 13
            Caption = 'Nome Fantasia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText6: TDBText
            Left = 101
            Top = 78
            Width = 230
            Height = 13
            Color = clBtnFace
            DataField = 'Fantasia'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label8: TLabel
            Left = 341
            Top = 78
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText7: TDBText
            Left = 394
            Top = 78
            Width = 224
            Height = 13
            DataField = 'Contato'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RxDBLookupCombo1: TRxDBLookupCombo
            Left = 161
            Top = 9
            Width = 337
            Height = 21
            DropDownCount = 8
            LookupField = 'Codigo'
            LookupDisplay = 'Nome'
            LookupSource = qsCliente
            TabOrder = 0
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Fornecedores'
        ImageIndex = 1
        OnShow = TabSheet2Show
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 628
          Height = 211
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label10: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton2: TSpeedButton
            Left = 501
            Top = 7
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de Fornecedores'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2Click
          end
          object Bevel2: TBevel
            Left = 0
            Top = 40
            Width = 624
            Height = 2
            Style = bsRaised
          end
          object Label11: TLabel
            Left = 10
            Top = 56
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText9: TDBText
            Left = 50
            Top = 56
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'NomeForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label12: TLabel
            Left = 501
            Top = 56
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText10: TDBText
            Left = 549
            Top = 56
            Width = 68
            Height = 13
            DataField = 'CodForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 10
            Top = 101
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText11: TDBText
            Left = 70
            Top = 101
            Width = 121
            Height = 13
            DataField = 'Tel1Forn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 229
            Top = 101
            Width = 66
            Height = 13
            Caption = 'Telefone 2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText12: TDBText
            Left = 303
            Top = 101
            Width = 133
            Height = 13
            DataField = 'Tel2Forn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 470
            Top = 101
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText13: TDBText
            Left = 499
            Top = 101
            Width = 121
            Height = 13
            DataField = 'FaxForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 10
            Top = 78
            Width = 89
            Height = 13
            Caption = 'Nome Fantasia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText14: TDBText
            Left = 101
            Top = 78
            Width = 228
            Height = 13
            Color = clBtnFace
            DataField = 'Fantasia'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label20: TLabel
            Left = 341
            Top = 78
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText18: TDBText
            Left = 394
            Top = 78
            Width = 221
            Height = 13
            DataField = 'ContatoForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 10
            Top = 124
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText24: TDBText
            Left = 50
            Top = 124
            Width = 421
            Height = 13
            DataField = 'Email'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RxDBLookupCombo2: TRxDBLookupCombo
            Left = 161
            Top = 9
            Width = 337
            Height = 21
            DropDownCount = 8
            LookupField = 'CodForn'
            LookupDisplay = 'NomeForn'
            LookupSource = qsFornecedores
            TabOrder = 0
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Transportadoras'
        ImageIndex = 2
        OnShow = TabSheet3Show
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 628
          Height = 211
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label21: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton3: TSpeedButton
            Left = 501
            Top = 7
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de Transportadoras'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton3Click
          end
          object Bevel3: TBevel
            Left = 0
            Top = 40
            Width = 624
            Height = 2
            Style = bsRaised
          end
          object Label22: TLabel
            Left = 10
            Top = 56
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText19: TDBText
            Left = 51
            Top = 56
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label23: TLabel
            Left = 501
            Top = 56
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText20: TDBText
            Left = 549
            Top = 56
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 10
            Top = 101
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText21: TDBText
            Left = 67
            Top = 101
            Width = 121
            Height = 13
            DataField = 'Fone'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 269
            Top = 101
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText22: TDBText
            Left = 303
            Top = 101
            Width = 133
            Height = 13
            DataField = 'Fax'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 10
            Top = 78
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText27: TDBText
            Left = 61
            Top = 78
            Width = 247
            Height = 13
            DataField = 'Contato'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RxDBLookupCombo3: TRxDBLookupCombo
            Left = 161
            Top = 9
            Width = 337
            Height = 21
            DropDownCount = 8
            LookupField = 'Codigo'
            LookupDisplay = 'Nome'
            LookupSource = qsTransp
            TabOrder = 0
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Vendedores'
        ImageIndex = 3
        OnShow = TabSheet4Show
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 628
          Height = 211
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label9: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton4: TSpeedButton
            Left = 501
            Top = 7
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de Vendedores'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton4Click
          end
          object Bevel4: TBevel
            Left = 0
            Top = 40
            Width = 624
            Height = 2
            Style = bsRaised
          end
          object Label17: TLabel
            Left = 10
            Top = 56
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText8: TDBText
            Left = 52
            Top = 56
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label18: TLabel
            Left = 501
            Top = 56
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText15: TDBText
            Left = 549
            Top = 56
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 10
            Top = 101
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText16: TDBText
            Left = 70
            Top = 101
            Width = 121
            Height = 13
            DataField = 'Fone'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 269
            Top = 101
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText17: TDBText
            Left = 303
            Top = 101
            Width = 133
            Height = 13
            DataField = 'Fax'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 10
            Top = 78
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText23: TDBText
            Left = 62
            Top = 78
            Width = 247
            Height = 13
            DataField = 'Contato'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RxDBLookupCombo4: TRxDBLookupCombo
            Left = 161
            Top = 9
            Width = 337
            Height = 21
            DropDownCount = 8
            LookupField = 'Codigo'
            LookupDisplay = 'Nome'
            LookupSource = qsVendedores
            TabOrder = 0
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Outros'
        ImageIndex = 4
        OnShow = TabSheet5Show
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 628
          Height = 211
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label29: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton5: TSpeedButton
            Left = 501
            Top = 7
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de outros p/ Agenda Telef'#244'nica'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton5Click
          end
          object Bevel5: TBevel
            Left = 0
            Top = 40
            Width = 624
            Height = 2
            Style = bsRaised
          end
          object Label31: TLabel
            Left = 10
            Top = 48
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText25: TDBText
            Left = 50
            Top = 48
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label32: TLabel
            Left = 501
            Top = 48
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText26: TDBText
            Left = 549
            Top = 48
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 10
            Top = 126
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText28: TDBText
            Left = 66
            Top = 126
            Width = 121
            Height = 13
            DataField = 'Telefone1'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 229
            Top = 131
            Width = 66
            Height = 13
            Caption = 'Telefone 2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText29: TDBText
            Left = 303
            Top = 131
            Width = 133
            Height = 13
            DataField = 'Telefone2'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 470
            Top = 131
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText30: TDBText
            Left = 499
            Top = 131
            Width = 121
            Height = 13
            DataField = 'Fax'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 10
            Top = 68
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText31: TDBText
            Left = 66
            Top = 68
            Width = 271
            Height = 13
            Color = clBtnFace
            DataField = 'Contato'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label38: TLabel
            Left = 10
            Top = 146
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText33: TDBText
            Left = 50
            Top = 146
            Width = 421
            Height = 13
            DataField = 'Email'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 10
            Top = 87
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contato2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText32: TDBText
            Left = 66
            Top = 87
            Width = 271
            Height = 13
            Color = clBtnFace
            DataField = 'Contato2'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label39: TLabel
            Left = 10
            Top = 107
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contato3:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText34: TDBText
            Left = 66
            Top = 107
            Width = 271
            Height = 13
            Color = clBtnFace
            DataField = 'Contato3'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object RxDBLookupCombo5: TRxDBLookupCombo
            Left = 161
            Top = 9
            Width = 337
            Height = 21
            DropDownCount = 8
            LookupField = 'Codigo'
            LookupDisplay = 'Nome'
            LookupSource = qsOutros
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 80
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 544
      Top = 6
      Width = 90
      Height = 27
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
        038383838383830E603800000000380E660033333330830E660333333330000E
        660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
        660300000E60330E660333330600330E660333330030330E6603333333303330
        E6033333333033330E0333333330000000033333333333333333}
    end
    object Button1: TButton
      Left = 443
      Top = 6
      Width = 90
      Height = 27
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox1: TGroupBox
      Left = 158
      Top = 2
      Width = 250
      Height = 73
      Caption = ' Op'#231#245'es para imprimir (Tipo) '
      TabOrder = 2
      object ckCliente: TCheckBox
        Left = 8
        Top = 16
        Width = 103
        Height = 17
        Caption = 'Clientes'
        TabOrder = 0
      end
      object ckFornecedor: TCheckBox
        Left = 8
        Top = 34
        Width = 103
        Height = 17
        Caption = 'Fornecedores'
        TabOrder = 1
      end
      object ckTransportadora: TCheckBox
        Left = 8
        Top = 53
        Width = 103
        Height = 17
        Caption = 'Transportadoras'
        TabOrder = 2
      end
      object ckVendedor: TCheckBox
        Left = 152
        Top = 16
        Width = 84
        Height = 17
        Caption = 'Vendedores'
        TabOrder = 3
      end
      object ckOutros: TCheckBox
        Left = 152
        Top = 34
        Width = 84
        Height = 17
        Caption = 'Outros'
        TabOrder = 4
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 4
      Top = 1
      Width = 146
      Height = 73
      Caption = ' Tipo do Relat'#243'rio '
      ItemIndex = 1
      Items.Strings = (
        'Geral'
        'Separar por tipo')
      TabOrder = 3
      Visible = False
    end
  end
  object qCliente: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Codigo, Nome, Telefone, Telefone2, Fax, Contato, Fantasia'
      'FROM "dbCliente.DB" Dbcliente'
      'ORDER BY Nome')
    Left = 245
    Top = 259
    object qClienteCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbCliente.DB".Codigo'
    end
    object qClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 40
    end
    object qClienteTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'TABELAS."dbCliente.DB".Telefone'
      Size = 15
    end
    object qClienteTelefone2: TStringField
      FieldName = 'Telefone2'
      Origin = 'TABELAS."dbCliente.DB".Telefone2'
      Size = 15
    end
    object qClienteFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbCliente.DB".Fax'
      Size = 15
    end
    object qClienteContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbCliente.DB".Contato'
      Size = 30
    end
    object qClienteFantasia: TStringField
      FieldName = 'Fantasia'
      Origin = 'TABELAS."dbCliente.DB".Fantasia'
    end
  end
  object qsCliente: TDataSource
    DataSet = qCliente
    Left = 260
    Top = 259
  end
  object qFornecedores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodForn, NomeForn, Tel1Forn, Tel2Forn, FaxForn, ContatoFo' +
        'rn, Fantasia, Email'
      'FROM "dbFornecedores.DB" Dbfornecedores'
      'ORDER BY NomeForn')
    Left = 291
    Top = 259
    object qFornecedoresCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbFornecedores.DB".CodForn'
    end
    object qFornecedoresNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object qFornecedoresTel1Forn: TStringField
      FieldName = 'Tel1Forn'
      Origin = 'TABELAS."dbFornecedores.DB".Tel1Forn'
      Size = 15
    end
    object qFornecedoresTel2Forn: TStringField
      FieldName = 'Tel2Forn'
      Origin = 'TABELAS."dbFornecedores.DB".Tel2Forn'
      Size = 15
    end
    object qFornecedoresFaxForn: TStringField
      FieldName = 'FaxForn'
      Origin = 'TABELAS."dbFornecedores.DB".FaxForn'
      Size = 15
    end
    object qFornecedoresContatoForn: TStringField
      FieldName = 'ContatoForn'
      Origin = 'TABELAS."dbFornecedores.DB".ContatoForn'
      Size = 40
    end
    object qFornecedoresFantasia: TStringField
      FieldName = 'Fantasia'
      Origin = 'TABELAS."dbFornecedores.DB".Fantasia'
      Size = 60
    end
    object qFornecedoresEmail: TStringField
      FieldName = 'Email'
      Origin = 'TABELAS."dbFornecedores.DB".Email'
      Size = 40
    end
  end
  object qsFornecedores: TDataSource
    DataSet = qFornecedores
    Left = 304
    Top = 259
  end
  object qTransp: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Nome, Codigo, Fone, Fax, Contato'
      'FROM "dbTransp.DB" Dbtransp'
      'where ((Cliente = False) or (Cliente is Null))'
      'ORDER BY Nome')
    Left = 335
    Top = 259
    object qTranspNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbTransp.DB".Nome'
      Size = 40
    end
    object qTranspCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbTransp.DB".Codigo'
    end
    object qTranspFone: TStringField
      FieldName = 'Fone'
      Origin = 'TABELAS."dbTransp.DB".Fone'
      Size = 15
    end
    object qTranspFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbTransp.DB".Fax'
      Size = 15
    end
    object qTranspContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbTransp.DB".Contato'
      Size = 40
    end
  end
  object qsTransp: TDataSource
    DataSet = qTransp
    Left = 348
    Top = 259
  end
  object qVendedores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Codigo, Nome, Fone, Fax, Contato'
      'FROM "dbVendedor.DB" Dbvendedor'
      'ORDER BY Nome')
    Left = 378
    Top = 259
    object qVendedoresCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbVendedor.DB".Codigo'
    end
    object qVendedoresNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbVendedor.DB".Nome'
      Size = 40
    end
    object qVendedoresFone: TStringField
      FieldName = 'Fone'
      Origin = 'TABELAS."dbVendedor.DB".Fone'
      Size = 15
    end
    object qVendedoresFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbVendedor.DB".Fax'
      Size = 15
    end
    object qVendedoresContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbVendedor.DB".Contato'
      Size = 50
    end
  end
  object qsVendedores: TDataSource
    DataSet = qVendedores
    Left = 390
    Top = 259
  end
  object qOutros: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Codigo, Nome, Contato, Telefone1, Telefone2, Fax, Email, ' +
        'Contato2, Contato3'
      'FROM "dbOutros.db" Dboutros'
      'ORDER BY Nome'
      ' ')
    Left = 423
    Top = 258
    object qOutrosCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbOutros.DB".Codigo'
    end
    object qOutrosNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbOutros.DB".Nome'
      Size = 40
    end
    object qOutrosContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbOutros.DB".Contato'
      Size = 30
    end
    object qOutrosTelefone1: TStringField
      FieldName = 'Telefone1'
      Origin = 'TABELAS."dbOutros.DB".Telefone1'
      Size = 15
    end
    object qOutrosTelefone2: TStringField
      FieldName = 'Telefone2'
      Origin = 'TABELAS."dbOutros.DB".Telefone2'
      Size = 15
    end
    object qOutrosFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbOutros.DB".Fax'
      Size = 15
    end
    object qOutrosEmail: TStringField
      FieldName = 'Email'
      Origin = 'TABELAS."dbOutros.DB".Email'
      Size = 50
    end
    object qOutrosContato2: TStringField
      FieldName = 'Contato2'
      Origin = 'TABELAS."dbOutros.DB".Contato2'
      Size = 30
    end
    object qOutrosContato3: TStringField
      FieldName = 'Contato3'
      Origin = 'TABELAS."dbOutros.DB".Contato3'
      Size = 30
    end
  end
  object qsOutros: TDataSource
    DataSet = qOutros
    Left = 436
    Top = 258
  end
  object mAgenda: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Controle;Nome'
    Params = <>
    Left = 157
    Top = 241
    Data = {
      B60000009619E0BD010000001800000006000000000003000000B60008436F6E
      74726F6C650400010000000000044E6F6D650100490000000100055749445448
      02000200280007436F6E7461746F010049000000010005574944544802000200
      6400034661780100490000000100055749445448020002000F0004466F6E6501
      00490000000100055749445448020002001E0006436F6469676F040001000000
      000001000D44454641554C545F4F524445520200820000000000}
    object mAgendaControle: TIntegerField
      FieldName = 'Controle'
    end
    object mAgendaNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object mAgendaContato: TStringField
      FieldName = 'Contato'
      Size = 100
    end
    object mAgendaFax: TStringField
      FieldName = 'Fax'
      Size = 15
    end
    object mAgendaFone: TStringField
      FieldName = 'Fone'
      Size = 30
    end
    object mAgendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object dsmAgenda: TDataSource
    DataSet = mAgenda
    Left = 181
    Top = 241
  end
end
