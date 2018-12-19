object fUsuarios: TfUsuarios
  Left = 192
  Top = 126
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 510
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 510
    Align = alClient
    Enabled = False
    TabOrder = 0
    object Panel9: TPanel
      Left = 8
      Top = 4
      Width = 564
      Height = 63
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 8
        Width = 66
        Height = 19
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 35
        Top = 36
        Width = 55
        Height = 19
        Caption = 'Senha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBEdit1: TDBEdit
        Left = 97
        Top = 6
        Width = 120
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Usuario'
        DataSource = DM1.dsUsuario
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 98
        Top = 34
        Width = 55
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Senha'
        DataSource = DM1.dsUsuario
        PasswordChar = '*'
        TabOrder = 1
        OnKeyDown = DBEdit2KeyDown
      end
      object Panel3: TPanel
        Left = 440
        Top = 35
        Width = 121
        Height = 24
        TabOrder = 2
        object DBCheckBox1: TDBCheckBox
          Left = 13
          Top = 3
          Width = 97
          Height = 17
          Caption = 'Administrador'
          DataField = 'Administrador'
          DataSource = DM1.dsUsuario
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 71
      Width = 564
      Height = 399
      ActivePage = TabSheet3
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Manuten'#231#227'o'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel1: TBevel
            Left = 278
            Top = 2
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel2: TBevel
            Left = 251
            Top = 2
            Width = 25
            Height = 363
          end
          object Bevel3: TBevel
            Left = 528
            Top = 2
            Width = 25
            Height = 363
          end
          object DBCheckBox2: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Clientes........................................................' +
              '.......'
            DataField = 'Clientes'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox2Click
          end
          object DBCheckBox3: TDBCheckBox
            Left = 13
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Estados e Al'#237'q'#252'otas.............................................' +
              '........'
            DataField = 'Uf'
            DataSource = DM1.dsUsuario
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox3Click
          end
          object DBCheckBox4: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 
              'Grades..........................................................' +
              '.......'
            DataField = 'Grade'
            DataSource = DM1.dsUsuario
            TabOrder = 10
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox4Click
          end
          object DBCheckBox5: TDBCheckBox
            Left = 13
            Top = 148
            Width = 236
            Height = 17
            Caption = 
              'Hist'#243'ricos......................................................' +
              '.......'
            DataField = 'Historicos'
            DataSource = DM1.dsUsuario
            TabOrder = 14
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox5Click
          end
          object DBCheckBox6: TDBCheckBox
            Left = 13
            Top = 228
            Width = 236
            Height = 17
            Caption = 
              'Par'#226'metros......................................................' +
              '......'
            DataField = 'Parametro'
            DataSource = DM1.dsUsuario
            TabOrder = 22
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox7: TDBCheckBox
            Left = 290
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'SubGrupos.......................................................' +
              '.....'
            DataField = 'SubGrupo'
            DataSource = DM1.dsUsuario
            TabOrder = 27
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox7Click
          end
          object DBCheckBox8: TDBCheckBox
            Left = 290
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Situa'#231#227'o Tribut'#225'ria.............................................' +
              '...........'
            DataField = 'SitTrib'
            DataSource = DM1.dsUsuario
            TabOrder = 29
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox8Click
          end
          object DBCheckBox24: TDBCheckBox
            Left = 13
            Top = 48
            Width = 236
            Height = 17
            Caption = 
              'Cor.............................................................' +
              '........'
            DataField = 'Cor'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox24Click
          end
          object DBCheckBox25: TDBCheckBox
            Left = 13
            Top = 68
            Width = 236
            Height = 17
            Caption = 'Condi'#231#245'es de Pagamentos...............................'
            DataField = 'CondPgto'
            DataSource = DM1.dsUsuario
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox25Click
          end
          object DBCheckBox26: TDBCheckBox
            Left = 13
            Top = 188
            Width = 236
            Height = 17
            Caption = 
              'Natureza de Opera'#231#227'o............................................' +
              '.................'
            DataField = 'NatOper'
            DataSource = DM1.dsUsuario
            TabOrder = 18
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox26Click
          end
          object DBCheckBox27: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 'Classifica'#231#227'o Fiscal...........................................'
            DataField = 'ClasFiscal'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox27Click
          end
          object DBCheckBox20: TDBCheckBox
            Left = 13
            Top = 248
            Width = 236
            Height = 17
            Caption = 
              'Rede de Lojas...................................................' +
              '....'
            DataField = 'Lojas'
            DataSource = DM1.dsUsuario
            TabOrder = 23
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox20Click
          end
          object DBCheckBox22: TDBCheckBox
            Left = 13
            Top = 268
            Width = 236
            Height = 17
            Caption = 
              'Regi'#245'es de Vendas...............................................' +
              '...........'
            DataField = 'RegioesVendas'
            DataSource = DM1.dsUsuario
            TabOrder = 25
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox22Click
          end
          object DBCheckBox14: TDBCheckBox
            Left = 290
            Top = 48
            Width = 236
            Height = 17
            Caption = 
              'Transportadoras.................................................' +
              '.'
            DataField = 'Transp'
            DataSource = DM1.dsUsuario
            TabOrder = 31
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox14Click
          end
          object DBCheckBox33: TDBCheckBox
            Left = 13
            Top = 128
            Width = 236
            Height = 17
            Caption = 
              'Grupos..........................................................' +
              '......'
            DataField = 'Grupos'
            DataSource = DM1.dsUsuario
            TabOrder = 12
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox33Click
          end
          object DBCheckBox39: TDBCheckBox
            Left = 13
            Top = 208
            Width = 236
            Height = 17
            Caption = 'Observa'#231#245'es Auxiliares.........................................'
            DataField = 'ObsAux'
            DataSource = DM1.dsUsuario
            TabOrder = 20
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox39Click
          end
          object DBCheckBox41: TDBCheckBox
            Left = 13
            Top = 168
            Width = 236
            Height = 17
            Caption = 
              'Impressoras.....................................................' +
              '..'
            DataField = 'Impressoras'
            DataSource = DM1.dsUsuario
            TabOrder = 16
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox41Click
          end
          object BitBtn7: TBitBtn
            Left = 255
            Top = 8
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BitBtn7Click
          end
          object BitBtn8: TBitBtn
            Left = 255
            Top = 28
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BitBtn8Click
          end
          object BitBtn9: TBitBtn
            Left = 255
            Top = 48
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = BitBtn9Click
          end
          object BitBtn10: TBitBtn
            Left = 255
            Top = 68
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = BitBtn10Click
          end
          object BitBtn11: TBitBtn
            Left = 255
            Top = 88
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = BitBtn11Click
          end
          object BitBtn12: TBitBtn
            Left = 255
            Top = 108
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = BitBtn12Click
          end
          object BitBtn13: TBitBtn
            Left = 255
            Top = 128
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            OnClick = BitBtn13Click
          end
          object BitBtn14: TBitBtn
            Left = 255
            Top = 148
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnClick = BitBtn14Click
          end
          object BitBtn15: TBitBtn
            Left = 255
            Top = 168
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            OnClick = BitBtn15Click
          end
          object BitBtn16: TBitBtn
            Left = 255
            Top = 188
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
            OnClick = BitBtn16Click
          end
          object BitBtn17: TBitBtn
            Left = 255
            Top = 208
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
            OnClick = BitBtn17Click
          end
          object BitBtn19: TBitBtn
            Left = 255
            Top = 248
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 24
            OnClick = BitBtn19Click
          end
          object BitBtn20: TBitBtn
            Left = 255
            Top = 268
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 26
            OnClick = BitBtn20Click
          end
          object BitBtn21: TBitBtn
            Left = 532
            Top = 8
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 28
            OnClick = BitBtn21Click
          end
          object BitBtn22: TBitBtn
            Left = 532
            Top = 28
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 30
            OnClick = BitBtn22Click
          end
          object DBCheckBox48: TDBCheckBox
            Left = 290
            Top = 68
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Clientes...........................................' +
              '.'
            DataField = 'RelCli'
            DataSource = DM1.dsUsuario
            TabOrder = 32
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object BitBtn18: TBitBtn
            Left = 532
            Top = 48
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 33
            OnClick = BitBtn18Click
          end
          object DBCheckBox51: TDBCheckBox
            Left = 290
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Vendedores.........................................' +
              '...'
            DataField = 'RelVendedores'
            DataSource = DM1.dsUsuario
            TabOrder = 34
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox52: TDBCheckBox
            Left = 290
            Top = 108
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Etiquetas Clientes.................................' +
              '.................'
            DataField = 'RelEtiqCli'
            DataSource = DM1.dsUsuario
            TabOrder = 35
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox53: TDBCheckBox
            Left = 290
            Top = 128
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Etiquetas Vendedores......................'
            DataField = 'RelEtiqVend'
            DataSource = DM1.dsUsuario
            TabOrder = 36
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox54: TDBCheckBox
            Left = 290
            Top = 148
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Etiquetas Fornecedores.....................'
            DataField = 'RelEtiqForn'
            DataSource = DM1.dsUsuario
            TabOrder = 37
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox96: TDBCheckBox
            Left = 290
            Top = 168
            Width = 236
            Height = 17
            Caption = 
              'Atelier.........................................................' +
              '.............'
            DataField = 'Atelier'
            DataSource = DM1.dsUsuario
            TabOrder = 38
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox96Click
          end
          object BitBtn37: TBitBtn
            Left = 532
            Top = 168
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 39
            OnClick = BitBtn37Click
          end
          object DBCheckBox106: TDBCheckBox
            Left = 13
            Top = 348
            Width = 236
            Height = 17
            Caption = 
              'M'#227'o de Obra.....................................................' +
              '....'
            DataField = 'MaoDeObra'
            DataSource = DM1.dsUsuario
            TabOrder = 40
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox96Click
          end
          object BitBtn41: TBitBtn
            Left = 255
            Top = 348
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 41
            OnClick = BitBtn37Click
          end
          object DBCheckBox57: TDBCheckBox
            Left = 13
            Top = 328
            Width = 236
            Height = 17
            Caption = 
              'Cidades.........................................................' +
              '........'
            DataField = 'Cidade'
            DataSource = DM1.dsUsuario
            TabOrder = 42
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox57Click
          end
          object BitBtn46: TBitBtn
            Left = 255
            Top = 328
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 43
            OnClick = BitBtn46Click
          end
          object DBCheckBox116: TDBCheckBox
            Left = 13
            Top = 308
            Width = 236
            Height = 17
            Caption = 
              'Opera'#231#245'es de Atelier............................................' +
              '..................'
            DataField = 'OperAtelier'
            DataSource = DM1.dsUsuario
            TabOrder = 44
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox116Click
          end
          object BitBtn47: TBitBtn
            Left = 255
            Top = 308
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 45
            OnClick = BitBtn47Click
          end
          object DBCheckBox121: TDBCheckBox
            Left = 13
            Top = 288
            Width = 236
            Height = 17
            Caption = 'Agenda Telef'#244'nica...........................................'
            DataField = 'Agenda'
            DataSource = DM1.dsUsuario
            TabOrder = 46
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox121Click
          end
          object DBCheckBox132: TDBCheckBox
            Left = 290
            Top = 188
            Width = 236
            Height = 17
            Caption = 
              'F'#225'brica.........................................................' +
              '....'
            DataField = 'Fabrica'
            DataSource = DM1.dsUsuario
            TabOrder = 47
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox132Click
          end
          object BitBtn50: TBitBtn
            Left = 532
            Top = 188
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 48
            OnClick = BitBtn50Click
          end
          object BitBtn54: TBitBtn
            Left = 255
            Top = 287
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 49
            OnClick = BitBtn54Click
          end
          object DBCheckBox97: TDBCheckBox
            Left = 290
            Top = 208
            Width = 236
            Height = 17
            Caption = 'Mostrar data de encerramento das comiss'#245'es.'
            DataField = 'MostrarDtEncerramento'
            DataSource = DM1.dsUsuario
            TabOrder = 50
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox153: TDBCheckBox
            Left = 290
            Top = 226
            Width = 236
            Height = 17
            Caption = 
              'Compania........................................................' +
              '.'
            DataField = 'Cia'
            DataSource = DM1.dsUsuario
            TabOrder = 51
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox153Click
          end
          object BitBtn66: TBitBtn
            Left = 531
            Top = 226
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 52
            OnClick = BitBtn66Click
          end
          object DBCheckBox156: TDBCheckBox
            Left = 290
            Top = 248
            Width = 236
            Height = 17
            Caption = 
              'Filial..........................................................' +
              '........'
            DataField = 'Filial'
            DataSource = DM1.dsUsuario
            TabOrder = 53
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox153Click
          end
          object BitBtn70: TBitBtn
            Left = 531
            Top = 248
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 54
            OnClick = BitBtn66Click
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Compras'
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel4: TBevel
            Left = 251
            Top = 4
            Width = 25
            Height = 363
          end
          object Bevel8: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel12: TBevel
            Left = 528
            Top = 4
            Width = 25
            Height = 363
          end
          object DBCheckBox9: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Fornecedores....................................................' +
              '......'
            DataField = 'Fornecedores'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox9Click
          end
          object DBCheckBox10: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Materiais.......................................................' +
              '..........'
            DataField = 'Material'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox10Click
          end
          object DBCheckBox11: TDBCheckBox
            Left = 13
            Top = 48
            Width = 236
            Height = 17
            Caption = 'Nota de Compra.................................................'
            DataField = 'NotaEnt'
            DataSource = DM1.dsUsuario
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox12: TDBCheckBox
            Left = 13
            Top = 68
            Width = 236
            Height = 17
            Caption = 'Ordem de Compra...............................................'
            DataField = 'OrdemCompra'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox12Click
          end
          object BitBtn23: TBitBtn
            Left = 256
            Top = 28
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn23Click
          end
          object DBCheckBox46: TDBCheckBox
            Left = 13
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Acerto de Estoque...............................................' +
              '.'
            DataField = 'AcertoEst'
            DataSource = DM1.dsUsuario
            Enabled = False
            ReadOnly = True
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            Visible = False
          end
          object BitBtn26: TBitBtn
            Left = 256
            Top = 68
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = BitBtn26Click
          end
          object DBCheckBox47: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Fornecedores......................................'
            DataField = 'RelForn'
            DataSource = DM1.dsUsuario
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox49: TDBCheckBox
            Left = 13
            Top = 128
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Materiais........................................'
            DataField = 'RelProdutos'
            DataSource = DM1.dsUsuario
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox50: TDBCheckBox
            Left = 13
            Top = 148
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Estoque de Materiais...............................' +
              '.....'
            DataField = 'RelEstMat'
            DataSource = DM1.dsUsuario
            TabOrder = 9
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object BitBtn27: TBitBtn
            Left = 256
            Top = 8
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnClick = BitBtn27Click
          end
          object DBCheckBox101: TDBCheckBox
            Left = 13
            Top = 168
            Width = 236
            Height = 17
            Caption = 
              'Requisi'#231#227'o......................................................' +
              '...'
            DataField = 'Requisicao'
            DataSource = DM1.dsUsuario
            TabOrder = 11
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox101Click
          end
          object BitBtn39: TBitBtn
            Left = 256
            Top = 168
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnClick = BitBtn39Click
          end
          object DBCheckBox102: TDBCheckBox
            Left = 13
            Top = 188
            Width = 236
            Height = 17
            Caption = 
              'Atividade.......................................................' +
              '......'
            DataField = 'Atividade'
            DataSource = DM1.dsUsuario
            TabOrder = 13
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox102Click
          end
          object BitBtn40: TBitBtn
            Left = 256
            Top = 188
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            OnClick = BitBtn40Click
          end
          object DBCheckBox105: TDBCheckBox
            Left = 13
            Top = 208
            Width = 236
            Height = 17
            Caption = 
              'Consulta de Fornecedores p/ Atividade...........................' +
              '.........'
            DataField = 'ConsFornecAtiv'
            DataSource = DM1.dsUsuario
            TabOrder = 15
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox107: TDBCheckBox
            Left = 13
            Top = 228
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Materiais Abaixo do M'#237'nimo.........................' +
              '....'
            DataField = 'RelMatMinimo'
            DataSource = DM1.dsUsuario
            TabOrder = 16
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox108: TDBCheckBox
            Left = 13
            Top = 248
            Width = 236
            Height = 17
            Caption = 'Consulta de Estoque de Materiais.........................'
            DataField = 'ConsEstoqueMat'
            DataSource = DM1.dsUsuario
            TabOrder = 17
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox112: TDBCheckBox
            Left = 13
            Top = 268
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio do Hist'#243'rico do Material.....................'
            DataField = 'RelHistMaterial'
            DataSource = DM1.dsUsuario
            TabOrder = 18
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox104: TDBCheckBox
            Left = 285
            Top = 68
            Width = 241
            Height = 17
            Caption = 'Relat'#243'rio de Custo por Setor.................................'
            DataField = 'CustoSetor'
            DataSource = DM1.dsUsuario
            TabOrder = 19
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox120: TDBCheckBox
            Left = 285
            Top = 88
            Width = 241
            Height = 17
            Caption = 
              'Dcto. de Entrada e Sa'#237'da do Estoque.............................' +
              '............................'
            DataField = 'DctoEst'
            DataSource = DM1.dsUsuario
            TabOrder = 20
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox120Click
          end
          object BitBtn48: TBitBtn
            Left = 531
            Top = 88
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
            OnClick = BitBtn48Click
          end
          object DBCheckBox126: TDBCheckBox
            Left = 13
            Top = 288
            Width = 237
            Height = 18
            Caption = 'Relat'#243'rio de Balan'#231'o do Estoque.................................'
            DataField = 'RelBalancoEst'
            DataSource = DM1.dsUsuario
            TabOrder = 22
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox127: TDBCheckBox
            Left = 13
            Top = 308
            Width = 237
            Height = 17
            Caption = 'Relat'#243'rio de Notas de Entrada.................................'
            DataField = 'RelNEntrada'
            DataSource = DM1.dsUsuario
            TabOrder = 23
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox128: TDBCheckBox
            Left = 13
            Top = 328
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Ordens de Compras.................................'
            DataField = 'RelOC'
            DataSource = DM1.dsUsuario
            TabOrder = 24
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox130: TDBCheckBox
            Left = 13
            Top = 348
            Width = 236
            Height = 17
            Caption = 'Consulta Hist'#243'rico de Materiais................................'
            DataField = 'ConsHistMat'
            DataSource = DM1.dsUsuario
            TabOrder = 25
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox133: TDBCheckBox
            Left = 285
            Top = 108
            Width = 241
            Height = 17
            Caption = 
              'Ordem de Servi'#231'o................................................' +
              '.........'
            DataField = 'OS'
            DataSource = DM1.dsUsuario
            TabOrder = 26
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox133Click
          end
          object BitBtn51: TBitBtn
            Left = 531
            Top = 108
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 27
            OnClick = BitBtn51Click
          end
          object DBCheckBox78: TDBCheckBox
            Left = 285
            Top = 128
            Width = 241
            Height = 17
            Caption = 'Troca Mercado..................................................'
            DataField = 'TrocaMercado'
            DataSource = DM1.dsUsuario
            TabOrder = 28
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox140: TDBCheckBox
            Left = 285
            Top = 146
            Width = 241
            Height = 17
            Caption = 'Consulta e Previs'#227'o da OC (Pend./Entregues)..'
            DataField = 'ConsOCPendente'
            DataSource = DM1.dsUsuario
            TabOrder = 29
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox109: TDBCheckBox
            Left = 285
            Top = 165
            Width = 241
            Height = 17
            Caption = 'Armazenamento Refer'#234'ncia...............................'
            DataField = 'ArmazenamentoRef'
            DataSource = DM1.dsUsuario
            TabOrder = 30
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox109Click
          end
          object BitBtn44: TBitBtn
            Left = 531
            Top = 165
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 31
            OnClick = BitBtn44Click
          end
          object DBCheckBox110: TDBCheckBox
            Left = 285
            Top = 185
            Width = 241
            Height = 17
            Caption = 'Confirma'#231#227'o de Modelo (Ref.)...........................'
            DataField = 'ConfirmacaoMod'
            DataSource = DM1.dsUsuario
            TabOrder = 32
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox110Click
          end
          object BitBtn45: TBitBtn
            Left = 531
            Top = 185
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 33
            OnClick = BitBtn45Click
          end
          object DBCheckBox113: TDBCheckBox
            Left = 285
            Top = 205
            Width = 241
            Height = 17
            Caption = 'Localiza'#231#227'o da Navalha....................................'
            DataField = 'LocalNavalha'
            DataSource = DM1.dsUsuario
            TabOrder = 34
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox113Click
          end
          object BitBtn55: TBitBtn
            Left = 531
            Top = 205
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 35
            OnClick = BitBtn55Click
          end
          object DBCheckBox142: TDBCheckBox
            Left = 285
            Top = 225
            Width = 240
            Height = 17
            Caption = 'Ficha (Consumo de Materiais).............................'
            DataField = 'FichaConsumo'
            DataSource = DM1.dsUsuario
            TabOrder = 36
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox142Click
          end
          object BitBtn57: TBitBtn
            Left = 531
            Top = 225
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 37
            OnClick = BitBtn57Click
          end
          object DBCheckBox141: TDBCheckBox
            Left = 285
            Top = 244
            Width = 240
            Height = 17
            Caption = 
              'Tipo de Material................................................' +
              '.'
            DataField = 'TipoMaterial'
            DataSource = DM1.dsUsuario
            TabOrder = 38
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox141Click
          end
          object BitBtn56: TBitBtn
            Left = 531
            Top = 245
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 39
            OnClick = BitBtn56Click
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'PCP'
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel5: TBevel
            Left = 251
            Top = 2
            Width = 25
            Height = 363
          end
          object Bevel9: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 367
            Shape = bsLeftLine
          end
          object Bevel13: TBevel
            Left = 528
            Top = 2
            Width = 25
            Height = 363
          end
          object DBCheckBox30: TDBCheckBox
            Left = 13
            Top = 23
            Width = 236
            Height = 17
            Caption = 
              'Consulta Lote...................................................' +
              '......'
            DataField = 'ConsultaLote'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox31: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 'Baixa de Pedidos................................................'
            DataField = 'BaixaPedidos'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox32: TDBCheckBox
            Left = 13
            Top = 38
            Width = 236
            Height = 17
            Caption = 
              'Gerar Lotes.....................................................' +
              '.......'
            DataField = 'Lote'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox17: TDBCheckBox
            Left = 13
            Top = 70
            Width = 236
            Height = 17
            Caption = 
              'Produtos(Ficha T'#233'cnica).........................................' +
              '......'
            DataField = 'Produto'
            DataSource = DM1.dsUsuario
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox17Click
          end
          object DBCheckBox16: TDBCheckBox
            Left = 13
            Top = 86
            Width = 236
            Height = 17
            Caption = 
              'Setor...........................................................' +
              '...........'
            DataField = 'Setor'
            DataSource = DM1.dsUsuario
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox16Click
          end
          object DBCheckBox44: TDBCheckBox
            Left = 13
            Top = 53
            Width = 236
            Height = 17
            Caption = 
              'Pedido..........................................................' +
              '.......'
            DataField = 'Pedido'
            DataSource = DM1.dsUsuario
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox44Click
          end
          object BitBtn25: TBitBtn
            Left = 255
            Top = 86
            Width = 17
            Height = 16
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = BitBtn25Click
          end
          object BitBtn28: TBitBtn
            Left = 255
            Top = 53
            Width = 17
            Height = 16
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = BitBtn28Click
          end
          object BitBtn29: TBitBtn
            Left = 255
            Top = 70
            Width = 17
            Height = 16
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = BitBtn29Click
          end
          object DBCheckBox55: TDBCheckBox
            Left = 13
            Top = 101
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de C'#225'lculo de Material p/ Lote........................' +
              '...............'
            DataField = 'RelCalcMatLote'
            DataSource = DM1.dsUsuario
            TabOrder = 9
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox58: TDBCheckBox
            Left = 13
            Top = 116
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Pedidos n'#227'o Faturados..............................' +
              '........................................'
            DataField = 'RelPedNFat'
            DataSource = DM1.dsUsuario
            TabOrder = 10
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox59: TDBCheckBox
            Left = 13
            Top = 131
            Width = 236
            Height = 17
            Caption = 
              'R'#243'tulos.........................................................' +
              '......'
            DataField = 'Rotulos'
            DataSource = DM1.dsUsuario
            TabOrder = 11
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox61: TDBCheckBox
            Left = 13
            Top = 161
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Vendas p/ Vendedor.................................' +
              '.....................................'
            DataField = 'RelVendas'
            DataSource = DM1.dsUsuario
            TabOrder = 13
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox62: TDBCheckBox
            Left = 13
            Top = 175
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Vendas p/ Vendedor/Cliente.........................' +
              '.......................'
            DataField = 'RelVendasVendCli'
            DataSource = DM1.dsUsuario
            TabOrder = 14
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox63: TDBCheckBox
            Left = 290
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Vendas p/ Vendedor/Refer'#234'ncia......................' +
              '..........................'
            DataField = 'RelVendasVendRef'
            DataSource = DM1.dsUsuario
            TabOrder = 23
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox98: TDBCheckBox
            Left = 290
            Top = 23
            Width = 236
            Height = 17
            Caption = 
              'Movimento de Tal'#245'es.............................................' +
              '..............'
            DataField = 'MovTalao'
            DataSource = DM1.dsUsuario
            TabOrder = 24
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox98Click
          end
          object DBCheckBox99: TDBCheckBox
            Left = 290
            Top = 38
            Width = 236
            Height = 17
            Caption = 
              'Consulta Lote Exporta'#231#227'o........................................' +
              '....................'
            DataField = 'ConsLote'
            DataSource = DM1.dsUsuario
            TabOrder = 25
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox100: TDBCheckBox
            Left = 13
            Top = 146
            Width = 236
            Height = 17
            Caption = 
              'Lote Exporta'#231#227'o.................................................' +
              '...........'
            DataField = 'LoteExp'
            DataSource = DM1.dsUsuario
            TabOrder = 12
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox60: TDBCheckBox
            Left = 290
            Top = 53
            Width = 236
            Height = 17
            Caption = 'Consulta Movimento de Tal'#245'es............................'
            DataField = 'ConsMovTalao'
            DataSource = DM1.dsUsuario
            TabOrder = 26
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object BitBtn43: TBitBtn
            Left = 531
            Top = 53
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 27
            OnClick = BitBtn43Click
          end
          object DBCheckBox111: TDBCheckBox
            Left = 290
            Top = 67
            Width = 236
            Height = 17
            Caption = 
              'Exclui tal'#245'es...................................................' +
              '..'
            DataField = 'ExcluirTalao'
            DataSource = DM1.dsUsuario
            TabOrder = 28
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox56: TDBCheckBox
            Left = 290
            Top = 83
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio das Metas/Produzidos - Geral.......................'
            DataField = 'RelMetasProd'
            DataSource = DM1.dsUsuario
            TabOrder = 29
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox103: TDBCheckBox
            Left = 290
            Top = 98
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio da Situa'#231#227'o do Atelier.......................'
            DataField = 'RelSitAtelier'
            DataSource = DM1.dsUsuario
            TabOrder = 30
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox114: TDBCheckBox
            Left = 290
            Top = 113
            Width = 236
            Height = 17
            Caption = 'Cons.Movimento de Tal'#245'es Merc.Interno.........'
            DataField = 'ConsMovTalaoMI'
            DataSource = DM1.dsUsuario
            TabOrder = 31
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox34: TDBCheckBox
            Left = 290
            Top = 143
            Width = 236
            Height = 17
            Caption = 
              'Posi'#231#245'es........................................................' +
              '....'
            DataField = 'Posicao'
            DataSource = DM1.dsUsuario
            TabOrder = 32
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox34Click
          end
          object BitBtn24: TBitBtn
            Left = 531
            Top = 143
            Width = 17
            Height = 16
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 33
            OnClick = BitBtn24Click
          end
          object DBCheckBox117: TDBCheckBox
            Left = 13
            Top = 190
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Planejamento/Programa'#231#227'o.........................'
            DataField = 'RelPlanej'
            DataSource = DM1.dsUsuario
            TabOrder = 15
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox118: TDBCheckBox
            Left = 13
            Top = 205
            Width = 236
            Height = 17
            Caption = 
              'Etiquetas para Caixas...........................................' +
              '...............'
            DataField = 'EtiqCx'
            DataSource = DM1.dsUsuario
            TabOrder = 16
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox119: TDBCheckBox
            Left = 290
            Top = 158
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio para o Pr'#233'............................................' +
              '....'
            DataField = 'RelPre'
            DataSource = DM1.dsUsuario
            TabOrder = 34
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox123: TDBCheckBox
            Left = 13
            Top = 220
            Width = 236
            Height = 17
            Caption = 'Pedido Amostra................................................'
            DataField = 'PedAmostra'
            DataSource = DM1.dsUsuario
            TabOrder = 17
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox123Click
          end
          object BitBtn49: TBitBtn
            Left = 255
            Top = 218
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
            OnClick = BitBtn49Click
          end
          object DBCheckBox124: TDBCheckBox
            Left = 13
            Top = 236
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio das Metas/Produzidos - Refer'#234'ncia.....................' +
              '..'
            DataField = 'RelMetasProdRef'
            DataSource = DM1.dsUsuario
            TabOrder = 19
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox125: TDBCheckBox
            Left = 290
            Top = 267
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de C'#225'lculo de Materiais p/ Pedidos....'
            DataField = 'RelCalcMatPed'
            DataSource = DM1.dsUsuario
            TabOrder = 43
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox129: TDBCheckBox
            Left = 13
            Top = 267
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Tal'#245'es de Amostra...........................'
            DataField = 'RelTalaoAmostra'
            DataSource = DM1.dsUsuario
            TabOrder = 22
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox37: TDBCheckBox
            Left = 290
            Top = 172
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio Clientes por Refer'#234'ncia............................'
            DataField = 'RelCliRef'
            DataSource = DM1.dsUsuario
            TabOrder = 35
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox134: TDBCheckBox
            Left = 290
            Top = 187
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Pedidos Embarcados p/ Per'#237'odo...'
            DataField = 'RelPedEmb'
            DataSource = DM1.dsUsuario
            TabOrder = 36
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox135: TDBCheckBox
            Left = 290
            Top = 202
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Produtos por Cole'#231#227'o e Mercado..'
            DataField = 'RelProdColecao'
            DataSource = DM1.dsUsuario
            TabOrder = 37
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox137: TDBCheckBox
            Left = 290
            Top = 217
            Width = 236
            Height = 17
            Caption = 
              'Devolu'#231#245'es......................................................' +
              '......'
            DataField = 'Devolucao'
            DataSource = DM1.dsUsuario
            TabOrder = 38
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox137Click
          end
          object BitBtn52: TBitBtn
            Left = 531
            Top = 215
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 39
            OnClick = BitBtn52Click
          end
          object DBCheckBox138: TDBCheckBox
            Left = 13
            Top = 251
            Width = 236
            Height = 17
            Caption = 
              'Defeitos........................................................' +
              '....'
            DataField = 'Defeitos'
            DataSource = DM1.dsUsuario
            TabOrder = 20
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox138Click
          end
          object BitBtn53: TBitBtn
            Left = 254
            Top = 249
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
            OnClick = BitBtn53Click
          end
          object DBCheckBox66: TDBCheckBox
            Left = 290
            Top = 235
            Width = 236
            Height = 17
            Caption = 
              'Constru'#231#227'o......................................................' +
              '......'
            DataField = 'Construcao'
            DataSource = DM1.dsUsuario
            TabOrder = 40
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox66Click
          end
          object BitBtn38: TBitBtn
            Left = 531
            Top = 233
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 41
            OnClick = BitBtn38Click
          end
          object DBCheckBox70: TDBCheckBox
            Left = 290
            Top = 251
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Proje'#231#227'o de Pedidos.........................'
            DataField = 'RelProjecao'
            DataSource = DM1.dsUsuario
            TabOrder = 42
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox72: TDBCheckBox
            Left = 290
            Top = 283
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio do Estoque Intermedi'#225'rio...................'
            DataField = 'RelEstoqueIntermediario'
            DataSource = DM1.dsUsuario
            TabOrder = 44
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox77: TDBCheckBox
            Left = 290
            Top = 300
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio das Refer'#234'ncias Acumuladas'
            DataField = 'RelRefAcumulada'
            DataSource = DM1.dsUsuario
            TabOrder = 45
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox143: TDBCheckBox
            Left = 290
            Top = 317
            Width = 236
            Height = 17
            Caption = 'Consulta Situa'#231#227'o dos Pedidos'
            DataField = 'ConsPedido'
            DataSource = DM1.dsUsuario
            TabOrder = 46
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox144: TDBCheckBox
            Left = 290
            Top = 334
            Width = 236
            Height = 17
            Caption = 'Altera'#231#227'o de F'#225'brica (Tal'#245'es)'
            DataField = 'TrocaFabrica'
            DataSource = DM1.dsUsuario
            TabOrder = 47
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox145: TDBCheckBox
            Left = 13
            Top = 284
            Width = 236
            Height = 17
            Caption = 'Tipo Material (Produto).....................................'
            DataField = 'TipoMaterialProd'
            DataSource = DM1.dsUsuario
            TabOrder = 48
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox145Click
          end
          object BitBtn58: TBitBtn
            Left = 254
            Top = 282
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 49
            OnClick = BitBtn58Click
          end
          object DBCheckBox146: TDBCheckBox
            Left = 13
            Top = 301
            Width = 236
            Height = 17
            Caption = 'Programa'#231#227'o Produ'#231#227'o...................................'
            DataField = 'Programacao'
            DataSource = DM1.dsUsuario
            TabOrder = 50
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox146Click
          end
          object BitBtn59: TBitBtn
            Left = 254
            Top = 299
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 51
            OnClick = BitBtn59Click
          end
          object DBCheckBox147: TDBCheckBox
            Left = 13
            Top = 318
            Width = 236
            Height = 17
            Caption = 'Exclui Tal'#227'o Auxiliar.........................................'
            DataField = 'ExcluirTalaoAux'
            DataSource = DM1.dsUsuario
            TabOrder = 52
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox154: TDBCheckBox
            Left = 13
            Top = 334
            Width = 236
            Height = 17
            Caption = 'Ficha T'#233'cnica de Constru'#231#227'o..........................'
            DataField = 'FichaConstrucao'
            DataSource = DM1.dsUsuario
            TabOrder = 53
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox154Click
          end
          object BitBtn67: TBitBtn
            Left = 254
            Top = 332
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 54
            OnClick = BitBtn67Click
          end
          object DBCheckBox155: TDBCheckBox
            Left = 13
            Top = 353
            Width = 236
            Height = 17
            Caption = 'Posi'#231#227'o Ficha T'#233'cnica de Constru'#231#227'o............'
            DataField = 'PosicaoFicha'
            DataSource = DM1.dsUsuario
            TabOrder = 55
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox155Click
          end
          object BitBtn69: TBitBtn
            Left = 254
            Top = 351
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 56
            OnClick = BitBtn69Click
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Faturamento'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel6: TBevel
            Left = 251
            Top = 4
            Width = 25
            Height = 363
          end
          object Bevel10: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel14: TBevel
            Left = 528
            Top = 4
            Width = 25
            Height = 363
          end
          object DBCheckBox23: TDBCheckBox
            Left = 13
            Top = 48
            Width = 236
            Height = 17
            Caption = 
              'Gerar Arquivos..................................................' +
              '...'
            DataField = 'GeraArq'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox28: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Consulta de Faturamento Di'#225'rio..................................' +
              '.............'
            DataField = 'ConsFat'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox29: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Notas Fiscais(Sa'#237'das)...........................................' +
              '............'
            DataField = 'NotaFiscal'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox35: TDBCheckBox
            Left = 13
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Notas Emit. p/ Nat. de Opera'#231#227'o....................' +
              '....................................'
            DataField = 'RelVendasNatOper'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox40: TDBCheckBox
            Left = 13
            Top = 68
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Notas Emitidas p/ Vendedor.........................' +
              '...........'
            DataField = 'RelNEmitVend'
            DataSource = DM1.dsUsuario
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox131: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 
              'Consulta Hist'#243'rico dos Clientes.................................' +
              '....................'
            DataField = 'ConsHistCli'
            DataSource = DM1.dsUsuario
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox136: TDBCheckBox
            Left = 13
            Top = 128
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de ICMS...............................................' +
              '......'
            DataField = 'RelICMS'
            DataSource = DM1.dsUsuario
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox71: TDBCheckBox
            Left = 13
            Top = 148
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio do Faturamento.................................'
            DataField = 'RelFaturamento'
            DataSource = DM1.dsUsuario
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox148: TDBCheckBox
            Left = 282
            Top = 31
            Width = 243
            Height = 17
            Caption = 'Regime Tribut'#225'rio...............................................'
            DataField = 'RegimeTrib'
            DataSource = DM1.dsUsuario
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox148Click
          end
          object DBCheckBox149: TDBCheckBox
            Left = 282
            Top = 51
            Width = 243
            Height = 17
            Caption = 'CSOSN (Tab. Simples Nacional)........................'
            DataField = 'CSOSN'
            DataSource = DM1.dsUsuario
            TabOrder = 9
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox149Click
          end
          object DBCheckBox150: TDBCheckBox
            Left = 282
            Top = 74
            Width = 243
            Height = 17
            Caption = 
              'Tabela Cofins...................................................' +
              '..'
            DataField = 'TabCofins'
            DataSource = DM1.dsUsuario
            TabOrder = 10
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox150Click
          end
          object DBCheckBox151: TDBCheckBox
            Left = 282
            Top = 96
            Width = 243
            Height = 17
            Caption = 
              'Tabela Pis......................................................' +
              '....'
            DataField = 'TabPis'
            DataSource = DM1.dsUsuario
            TabOrder = 11
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox151Click
          end
          object DBCheckBox152: TDBCheckBox
            Left = 282
            Top = 118
            Width = 243
            Height = 17
            Caption = 'NFe Inutilizar Numera'#231#227'o...................................'
            DataField = 'NFeInutilizar'
            DataSource = DM1.dsUsuario
            TabOrder = 12
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox152Click
          end
          object BitBtn62: TBitBtn
            Left = 533
            Top = 120
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            OnClick = BitBtn62Click
          end
          object BitBtn61: TBitBtn
            Left = 533
            Top = 98
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            OnClick = BitBtn61Click
          end
          object BitBtn63: TBitBtn
            Left = 533
            Top = 53
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnClick = BitBtn63Click
          end
          object BitBtn64: TBitBtn
            Left = 533
            Top = 33
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 16
            OnClick = BitBtn64Click
          end
          object BitBtn65: TBitBtn
            Left = 533
            Top = 76
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            OnClick = BitBtn65Click
          end
          object DBCheckBox160: TDBCheckBox
            Left = 282
            Top = 11
            Width = 244
            Height = 17
            Caption = 'Cadastro do Percentual do Simples....................'
            DataField = 'PercSimples'
            DataSource = DM1.dsUsuario
            TabOrder = 18
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox160Click
          end
          object BitBtn68: TBitBtn
            Left = 532
            Top = 9
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
            OnClick = BitBtn68Click
          end
          object DBCheckBox157: TDBCheckBox
            Left = 282
            Top = 140
            Width = 243
            Height = 17
            Caption = 'NFe Emails Adicionais........................................'
            DataField = 'NFeEmail'
            DataSource = DM1.dsUsuario
            TabOrder = 20
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox157Click
          end
          object BitBtn71: TBitBtn
            Left = 533
            Top = 141
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
            OnClick = BitBtn71Click
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Comiss'#227'o'
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel7: TBevel
            Left = 251
            Top = 4
            Width = 25
            Height = 363
          end
          object Bevel11: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel15: TBevel
            Left = 528
            Top = 4
            Width = 25
            Height = 363
          end
          object DBCheckBox21: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Comiss'#227'o Vendedor...............................................' +
              '.............'
            DataField = 'Comissao'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox19: TDBCheckBox
            Left = 13
            Top = 68
            Width = 236
            Height = 17
            Caption = 
              'Vendedores......................................................' +
              '....'
            DataField = 'Vendedor'
            DataSource = DM1.dsUsuario
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox19Click
          end
          object DBCheckBox13: TDBCheckBox
            Left = 13
            Top = 48
            Width = 236
            Height = 17
            Caption = 
              'Lan'#231'amento de Comiss'#227'o Vendedor.................................' +
              '......'
            DataField = 'LancComisVend'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox13Click
          end
          object DBCheckBox15: TDBCheckBox
            Left = 13
            Top = 128
            Width = 236
            Height = 17
            Caption = 'Lan'#231'amento de Comiss'#227'o Modelista..........................'
            DataField = 'LancComisMod'
            DataSource = DM1.dsUsuario
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox18: TDBCheckBox
            Left = 13
            Top = 188
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio Extrato de Comiss'#227'o (Modelista).......................' +
              '......'
            DataField = 'RelExtrComisMod'
            DataSource = DM1.dsUsuario
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox38: TDBCheckBox
            Left = 13
            Top = 168
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio Extrato de Comiss'#227'o (Vendedor).................'
            DataField = 'RelExtrComisVend'
            DataSource = DM1.dsUsuario
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox42: TDBCheckBox
            Left = 13
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Modelista.......................................................' +
              '........'
            DataField = 'Modelista'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox42Click
          end
          object DBCheckBox43: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 'Consulta das Comiss'#245'es dos Vendedores.........'
            DataField = 'ExtratoCom'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox45: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 
              'Comiss'#227'o Modelista..............................................' +
              '...'
            DataField = 'ComissaoMod'
            DataSource = DM1.dsUsuario
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object BitBtn30: TBitBtn
            Left = 255
            Top = 68
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = BitBtn30Click
          end
          object DBCheckBox36: TDBCheckBox
            Left = 13
            Top = 148
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio Extr. de Comis. Modelista (Pedidos)...................' +
              '..........'
            DataField = 'RelExtrPedMod'
            DataSource = DM1.dsUsuario
            TabOrder = 10
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object BitBtn36: TBitBtn
            Left = 255
            Top = 88
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnClick = BitBtn36Click
          end
          object BitBtn60: TBitBtn
            Left = 255
            Top = 46
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnClick = BitBtn60Click
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Ctas. a Receber'
        ImageIndex = 5
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel16: TBevel
            Left = 251
            Top = 4
            Width = 25
            Height = 363
          end
          object Bevel17: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel18: TBevel
            Left = 528
            Top = 4
            Width = 25
            Height = 363
          end
          object DBCheckBox64: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Contas a Receber................................................' +
              '........'
            DataField = 'CReceber'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox65: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Lan'#231'a Contas a Receber..........................................' +
              '...............'
            DataField = 'LancCReceber'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox67: TDBCheckBox
            Left = 13
            Top = 68
            Width = 236
            Height = 17
            Caption = 'Tipos de Cobran'#231'a.............................................'
            DataField = 'TiposCobr'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox67Click
          end
          object BitBtn32: TBitBtn
            Left = 255
            Top = 68
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BitBtn32Click
          end
          object DBCheckBox69: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Duplicatas......................................'
            DataField = 'RelBoleto'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox73: TDBCheckBox
            Left = 13
            Top = 188
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Contas a Receber..........................'
            DataField = 'RelCReceber'
            DataSource = DM1.dsUsuario
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox74: TDBCheckBox
            Left = 13
            Top = 208
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio Contas a Receber p/ Cliente...........................' +
              '.'
            DataField = 'RelCRecCli'
            DataSource = DM1.dsUsuario
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox90: TDBCheckBox
            Left = 13
            Top = 228
            Width = 236
            Height = 17
            Caption = 
              'Altera Contas a Receber.........................................' +
              '...................'
            DataField = 'CReceberAltera'
            DataSource = DM1.dsUsuario
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox91: TDBCheckBox
            Left = 13
            Top = 248
            Width = 236
            Height = 17
            Caption = 
              'Paga Contas a Receber...........................................' +
              '............'
            DataField = 'CReceberPag'
            DataSource = DM1.dsUsuario
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox92: TDBCheckBox
            Left = 13
            Top = 268
            Width = 236
            Height = 17
            Caption = 
              'Estorno de Contas a Receber.....................................' +
              '.....................'
            DataField = 'EstPgtoRec'
            DataSource = DM1.dsUsuario
            TabOrder = 9
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox122: TDBCheckBox
            Left = 13
            Top = 288
            Width = 236
            Height = 17
            Caption = 
              'C'#243'pias de Duplicatas............................................' +
              '............'
            DataField = 'CopiaDuplicata'
            DataSource = DM1.dsUsuario
            TabOrder = 10
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = 'Ctas. a Pagar'
        ImageIndex = 6
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel19: TBevel
            Left = 251
            Top = 4
            Width = 25
            Height = 363
          end
          object Bevel20: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel21: TBevel
            Left = 528
            Top = 4
            Width = 25
            Height = 363
          end
          object DBCheckBox75: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Contas a Pagar..................................................' +
              '........'
            DataField = 'CPagar'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox76: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Lan'#231'a Contas a Pagar............................................' +
              '...............'
            DataField = 'LctoPagar'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox79: TDBCheckBox
            Left = 13
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Contas a Pagar.....................................' +
              '...'
            DataField = 'RelCPagar'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox80: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Notas de Entr. p/ Nat. Opera'#231#227'o....................' +
              '..................'
            DataField = 'RelNEntrNatOper'
            DataSource = DM1.dsUsuario
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox81: TDBCheckBox
            Left = 13
            Top = 128
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Ctas. a Pagar p/ Fornecedores.........'
            DataField = 'RelCPagForn'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox82: TDBCheckBox
            Left = 13
            Top = 148
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Pagamento de Juros..........................'
            DataField = 'RelPgtoJuros'
            DataSource = DM1.dsUsuario
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox93: TDBCheckBox
            Left = 13
            Top = 168
            Width = 236
            Height = 17
            Caption = 
              'Altera Contas a Pagar...........................................' +
              '.................'
            DataField = 'CPagarAltera'
            DataSource = DM1.dsUsuario
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox94: TDBCheckBox
            Left = 13
            Top = 188
            Width = 236
            Height = 17
            Caption = 
              'Paga Contas a Pagar.............................................' +
              '..........'
            DataField = 'CPagarPag'
            DataSource = DM1.dsUsuario
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox95: TDBCheckBox
            Left = 13
            Top = 208
            Width = 236
            Height = 17
            Caption = 
              'Estorno de Contas a Pagar.......................................' +
              '...................'
            DataField = 'EstPgtoPagar'
            DataSource = DM1.dsUsuario
            TabOrder = 8
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox139: TDBCheckBox
            Left = 13
            Top = 228
            Width = 236
            Height = 17
            Caption = 'Relat'#243'rio de Transfer'#234'ncia de ICMS......................'
            DataField = 'RelTransfICMS'
            DataSource = DM1.dsUsuario
            TabOrder = 9
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object TabSheet8: TTabSheet
        Caption = 'Financeiro'
        ImageIndex = 7
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 370
          BevelOuter = bvLowered
          TabOrder = 0
          object Bevel22: TBevel
            Left = 251
            Top = 4
            Width = 25
            Height = 363
          end
          object Bevel23: TBevel
            Left = 278
            Top = 1
            Width = 2
            Height = 363
            Shape = bsLeftLine
          end
          object Bevel24: TBevel
            Left = 528
            Top = 4
            Width = 25
            Height = 363
          end
          object DBCheckBox83: TDBCheckBox
            Left = 13
            Top = 8
            Width = 236
            Height = 17
            Caption = 
              'Contas..........................................................' +
              '.........'
            DataField = 'Contas'
            DataSource = DM1.dsUsuario
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox83Click
          end
          object DBCheckBox84: TDBCheckBox
            Left = 13
            Top = 28
            Width = 236
            Height = 17
            Caption = 
              'Entrada de Movimentos...........................................' +
              '...............'
            DataField = 'EntrMov'
            DataSource = DM1.dsUsuario
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox85: TDBCheckBox
            Left = 13
            Top = 48
            Width = 236
            Height = 17
            Caption = 
              'juros...........................................................' +
              '...........'
            DataField = 'Juros'
            DataSource = DM1.dsUsuario
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox85Click
          end
          object DBCheckBox86: TDBCheckBox
            Left = 13
            Top = 68
            Width = 236
            Height = 17
            Caption = 
              'Movimentos......................................................' +
              '............'
            DataField = 'Movto'
            DataSource = DM1.dsUsuario
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox87: TDBCheckBox
            Left = 13
            Top = 88
            Width = 236
            Height = 17
            Caption = 
              'Plano de Contas.................................................' +
              '..'
            DataField = 'PlanoCtas'
            DataSource = DM1.dsUsuario
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox87Click
          end
          object DBCheckBox88: TDBCheckBox
            Left = 13
            Top = 108
            Width = 236
            Height = 17
            Caption = 
              'Relat'#243'rio de Contas.............................................' +
              '.'
            DataField = 'RelCtas'
            DataSource = DM1.dsUsuario
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox89: TDBCheckBox
            Left = 13
            Top = 128
            Width = 236
            Height = 17
            Caption = 
              'Indexador.......................................................' +
              '.....'
            DataField = 'Indexador'
            DataSource = DM1.dsUsuario
            TabOrder = 6
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = DBCheckBox89Click
          end
          object BitBtn31: TBitBtn
            Left = 255
            Top = 8
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = BitBtn31Click
          end
          object BitBtn33: TBitBtn
            Left = 255
            Top = 48
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = BitBtn33Click
          end
          object BitBtn34: TBitBtn
            Left = 255
            Top = 88
            Width = 17
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = BitBtn34Click
          end
          object BitBtn35: TBitBtn
            Left = 255
            Top = 128
            Width = 16
            Height = 17
            Hint = 'Abre o formul'#225'rio de permiss'#245'es'
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clTeal
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnClick = BitBtn35Click
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 4
    Top = 472
    Width = 572
    Height = 33
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 4
      Width = 128
      Height = 25
      DataSource = DM1.dsUsuario
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Vai para o primeiro usu'#225'rio'
        'Volta para o usu'#225'rio anterior'
        'Vai para o pr'#243'ximo usu'#225'rio'
        'Vai para o '#250'ltimo usu'#225'rio')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 132
      Top = 4
      Width = 72
      Height = 25
      Hint = 'Insere um novo usu'#225'rio'
      Caption = '&Inserir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 204
      Top = 4
      Width = 72
      Height = 25
      Hint = 'Altera o usu'#225'rio especificado'
      Caption = '&Alterar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 276
      Top = 4
      Width = 72
      Height = 25
      Hint = 'Exclui o usu'#225'rio selecionado'
      Caption = '&Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 348
      Top = 4
      Width = 74
      Height = 25
      Hint = 'Cancela a altera'#231#227'o ou inclus'#227'o do usu'#225'rio'
      Caption = 'Ca&ncelar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        18000000000098070000CE0E0000C40E00000000000000000000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080808080808080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080FFFFFF008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800000FF0000
        800000808080800080800080800080800080800080800000FF80808000808000
        8080008080008080008080008080008080008080808080808080FFFFFF008080
        008080008080008080008080008080FFFFFF0080800080800080800080800080
        800080800080800000FF00008000008000008080808000808000808000808000
        00FF000080000080808080008080008080008080008080008080008080808080
        FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
        FF0080800080800080800080800080800080800000FF00008000008000008000
        00808080800080800000FF000080000080000080000080808080008080008080
        008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
        FF808080008080008080808080FFFFFF00808000808000808000808000808000
        80800000FF000080000080000080000080808080000080000080000080000080
        000080808080008080008080008080008080008080808080FFFFFF0080800080
        80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
        80800080800080800080800080800080800000FF000080000080000080000080
        0000800000800000800000808080800080800080800080800080800080800080
        80008080808080FFFFFF00808000808000808080808000808000808000808000
        8080FFFFFF808080008080008080008080008080008080008080008080008080
        0000FF0000800000800000800000800000800000808080800080800080800080
        80008080008080008080008080008080008080808080FFFFFF00808000808000
        8080008080008080008080FFFFFF808080008080008080008080008080008080
        0080800080800080800080800080800000800000800000800000800000808080
        8000808000808000808000808000808000808000808000808000808000808000
        8080808080FFFFFF008080008080008080008080008080808080008080008080
        0080800080800080800080800080800080800080800080800080800000FF0000
        8000008000008000008080808000808000808000808000808000808000808000
        8080008080008080008080008080008080808080FFFFFF008080008080008080
        8080800080800080800080800080800080800080800080800080800080800080
        800080800000FF00008000008000008000008000008080808000808000808000
        8080008080008080008080008080008080008080008080008080008080808080
        008080008080008080008080808080FFFFFF0080800080800080800080800080
        800080800080800080800080800000FF00008000008000008080808000008000
        0080000080808080008080008080008080008080008080008080008080008080
        008080008080808080008080008080008080008080008080808080FFFFFF0080
        800080800080800080800080800080800080800080800000FF00008000008000
        00808080800080800000FF000080000080000080808080008080008080008080
        008080008080008080008080008080808080008080008080008080808080FFFF
        FF008080008080808080FFFFFF00808000808000808000808000808000808000
        80800000FF0000800000808080800080800080800080800000FF000080000080
        000080808080008080008080008080008080008080008080808080FFFFFF0080
        80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
        80800080800080800080800080800080800000FF000080008080008080008080
        0080800080800000FF0000800000800000800080800080800080800080800080
        80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
        8080008080808080FFFFFF008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800000FF0000800000FF0080
        8000808000808000808000808000808000808080808080808000808000808000
        8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080808080808080808080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        008080008080008080008080008080008080}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 422
      Top = 4
      Width = 74
      Height = 25
      Hint = 'Confirma a altera'#231#227'o ou inclus'#227'o'
      Caption = '&Confirmar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn1Click
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        18000000000098070000CE0E0000C40E00000000000000000000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8080000080000000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080808080808080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808080000000800000800080000000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        8080800080800080808080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808080000000800000800000800000
        8000800000008080008080008080008080008080008080008080008080008080
        0080800080800080808080800080800080800080800080808080800080800080
        8000808000808000808000808000808000808000808000808000808080000000
        8000008000008000008000008000008000800000008080008080008080008080
        0080800080800080800080800080800080808080800080800080800080800080
        8000808000808080808080808000808000808000808000808000808000808000
        808000808080000000800000800000800000FF00008000008000008000008000
        8000000080800080800080800080800080800080800080800080808080800080
        8000808000808080808000808000808000808000808080808000808000808000
        808000808000808000808000808000808000800000800000800000FF00008080
        00FF000080000080000080008000000080800080800080800080800080800080
        8000808000808080808000808000808080808000808080808000808000808000
        808080808000808000808000808000808000808000808000808000808000FF00
        00800000FF0000808000808000808000FF000080000080000080008000000080
        8000808000808000808000808000808000808080808000808080808000808000
        8080008080808080008080008080008080808080008080008080008080008080
        00808000808000808000808000FF0000808000808000808000808000808000FF
        0000800000800000800080000000808000808000808000808000808000808000
        8080808080008080008080008080008080008080808080008080008080008080
        8080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000FF0000800000800000800080000000808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080808080800080800080800080808080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000FF0000
        8000008000008000800000008080008080008080008080008080008080008080
        0080800080800080800080800080800080808080800080800080800080808080
        8000808000808000808000808000808000808000808000808000808000808000
        808000808000808000808000FF00008000008000008000800000008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8080808000808000808000808080808000808000808000808000808000808000
        808000808000808000808000808000808000808000808000808000FF00008000
        0080000080008000000080800080800080800080800080800080800080800080
        8000808000808000808000808000808080808000808000808000808080808000
        8080008080008080008080008080008080008080008080008080008080008080
        00808000808000808000FF000080000080008000000080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808080
        8080008080008080808080008080008080008080008080008080008080008080
        00808000808000808000808000808000808000808000808000FF000080000080
        0000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080808080FFFFFF808080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000FF0000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080808080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        008080008080008080008080008080008080}
      NumGlyphs = 2
    end
    object BitBtn6: TBitBtn
      Left = 496
      Top = 4
      Width = 73
      Height = 25
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn6Click
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
  end
end
