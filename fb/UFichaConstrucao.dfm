object fFichaConstrucao: TfFichaConstrucao
  Left = 24
  Top = 11
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ficha T'#233'cnica de Constru'#231#227'o'
  ClientHeight = 714
  ClientWidth = 980
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
    Top = 0
    Width = 980
    Height = 39
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 6
      Top = 9
      Width = 74
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 80
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 980
    Height = 222
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 831
      Top = 9
      Width = 39
      Height = 13
      Caption = 'N'#186' Mov:'
    end
    object Label3: TLabel
      Left = 815
      Top = 29
      Width = 55
      Height = 13
      Caption = 'Dt. Gerado:'
    end
    object Label4: TLabel
      Left = 844
      Top = 49
      Width = 26
      Height = 13
      Caption = 'Hora:'
    end
    object Label5: TLabel
      Left = 831
      Top = 69
      Width = 39
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label8: TLabel
      Left = 31
      Top = 34
      Width = 57
      Height = 13
      Caption = 'Constru'#231#227'o:'
    end
    object Label2: TLabel
      Left = 62
      Top = 12
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object Label7: TLabel
      Left = 56
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Forma:'
    end
    object Label9: TLabel
      Left = 458
      Top = 9
      Width = 22
      Height = 13
      Caption = 'Obs:'
    end
    object Label10: TLabel
      Left = 35
      Top = 97
      Width = 53
      Height = 13
      Caption = 'Montagem:'
    end
    object Label11: TLabel
      Left = 45
      Top = 78
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Navalha:'
    end
    object Label12: TLabel
      Left = 61
      Top = 120
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Salto:'
    end
    object Label13: TLabel
      Left = 35
      Top = 142
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Plataforma:'
    end
    object DBEdit1: TDBEdit
      Left = 871
      Top = 1
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'ID'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit3: TDBEdit
      Left = 871
      Top = 21
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'DTUSUARIO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      ReadOnly = True
      TabOrder = 9
    end
    object DBEdit4: TDBEdit
      Left = 871
      Top = 41
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'HRUSUARIO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      ReadOnly = True
      TabOrder = 10
    end
    object DBEdit5: TDBEdit
      Left = 871
      Top = 61
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'USUARIO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      ReadOnly = True
      TabOrder = 11
    end
    object DBEdit2: TDBEdit
      Left = 90
      Top = 26
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMECONSTRUCAO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      TabOrder = 1
    end
    object DBDateEdit1: TDBDateEdit
      Left = 90
      Top = 4
      Width = 100
      Height = 21
      DataField = 'DATA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      NumGlyphs = 2
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 90
      Top = 48
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEFORMA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      TabOrder = 2
    end
    object DBMemo1: TDBMemo
      Left = 450
      Top = 24
      Width = 359
      Height = 182
      DataField = 'OBS'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object RxDBComboBox1: TRxDBComboBox
      Left = 90
      Top = 91
      Width = 313
      Height = 21
      Style = csDropDownList
      DataField = 'TIPO_MONTAGEM'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        'Na Palmilha de Montagem'
        'Na Plataforma')
      TabOrder = 4
      Values.Strings = (
        '1'
        '2')
    end
    object DBEdit7: TDBEdit
      Left = 90
      Top = 70
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCNAVALHA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      TabOrder = 3
    end
    object DBEdit8: TDBEdit
      Left = 90
      Top = 112
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      DataField = 'SALTO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      TabOrder = 5
    end
    object DBEdit9: TDBEdit
      Left = 90
      Top = 134
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FACHETADO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao
      TabOrder = 6
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 261
    Width = 980
    Height = 453
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 2
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Tamanhos / Foto'
      object Label6: TLabel
        Left = 8
        Top = 18
        Width = 48
        Height = 13
        Caption = 'Tamanho:'
      end
      object Image1: TImage
        Left = 608
        Top = 144
        Width = 313
        Height = 265
        Stretch = True
      end
      object VDBGrid1: TVDBGrid
        Left = 6
        Top = 34
        Width = 963
        Height = 99
        DataSource = DMFichaConstrucao.dsFichaConstrucao_Tam
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Vertical = True
        DefaultColWidth = 35
        TitlesWidth = 67
        Columns = <
          item
            Alignment = taCenter
            FieldName = 'TAMANHO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Tamanho:'
          end>
      end
      object Edit1: TEdit
        Left = 56
        Top = 10
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 6
        TabOrder = 1
      end
      object BitBtn3: TBitBtn
        Left = 180
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Confirmar'
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn33: TBitBtn
        Left = 554
        Top = 134
        Width = 25
        Height = 23
        Hint = 'Abre o caminho p/ localizar a foto'
        TabOrder = 3
        OnClick = BitBtn33Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object StaticText2: TStaticText
        Left = 12
        Top = 143
        Width = 28
        Height = 17
        Alignment = taRightJustify
        Caption = 'Foto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit22: TDBEdit
        Left = 44
        Top = 136
        Width = 508
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDFOTO'
        DataSource = DMFichaConstrucao.dsFichaConstrucao
        ReadOnly = True
        TabOrder = 5
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Material'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 273
        Height = 430
        Align = alLeft
        TabOrder = 0
        object Panel4: TPanel
          Left = 1
          Top = 393
          Width = 271
          Height = 36
          Align = alBottom
          Color = clSilver
          TabOrder = 0
          object BitBtn4: TBitBtn
            Left = 5
            Top = 6
            Width = 83
            Height = 30
            Caption = 'Inserir Posi'#231#227'o'
            TabOrder = 0
            OnClick = BitBtn4Click
          end
          object BitBtn9: TBitBtn
            Left = 87
            Top = 6
            Width = 83
            Height = 30
            Caption = 'Alterar Posi'#231#227'o'
            TabOrder = 2
            OnClick = BitBtn9Click
          end
          object BitBtn5: TBitBtn
            Left = 169
            Top = 6
            Width = 83
            Height = 30
            Caption = 'Excluir Posi'#231#227'o'
            TabOrder = 1
            OnClick = BitBtn5Click
          end
        end
        object SMDBGrid1: TSMDBGrid
          Left = 1
          Top = 1
          Width = 271
          Height = 392
          Align = alClient
          Ctl3D = False
          DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Flat = False
          BandsFont.Charset = DEFAULT_CHARSET
          BandsFont.Color = clWindowText
          BandsFont.Height = -11
          BandsFont.Name = 'MS Sans Serif'
          BandsFont.Style = []
          Groupings = <>
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clSilver
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 16
          ScrollBars = ssHorizontal
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'NOMEPOSICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Posi'#231#227'o'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SOMENTEMATERIAL'
              Title.Alignment = taCenter
              Title.Caption = 'Somente Nome do Material'
              Width = 52
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'INFORMARGRADE'
              Title.Alignment = taCenter
              Title.Caption = 'Informar Tamanho'
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'INFORMAROPCAOMAT'
              Title.Alignment = taCenter
              Title.Caption = 'Informar outras op'#231#245'es'
              Visible = True
            end>
        end
      end
      object Panel5: TPanel
        Left = 273
        Top = 0
        Width = 703
        Height = 430
        Align = alClient
        TabOrder = 1
        object SMDBGrid2: TSMDBGrid
          Left = 1
          Top = 42
          Width = 701
          Height = 230
          Align = alClient
          Ctl3D = False
          DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Flat = False
          BandsFont.Charset = DEFAULT_CHARSET
          BandsFont.Color = clWindowText
          BandsFont.Height = -11
          BandsFont.Name = 'MS Sans Serif'
          BandsFont.Style = []
          Groupings = <>
          GridStyle.Style = gsCustom
          GridStyle.OddColor = clSilver
          GridStyle.EvenColor = clWindow
          TitleHeight.PixelCount = 24
          FooterColor = clBtnFace
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 16
          ScrollBars = ssHorizontal
          ColCount = 17
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ITEMMATERIAL'
              Title.Alignment = taCenter
              Title.Caption = 'Item'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOMATERIAL'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo Material'
              Width = 110
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'REFMATERIAL'
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMEMATERIAL'
              Title.Alignment = taCenter
              Title.Caption = 'Material'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMECOR'
              Title.Alignment = taCenter
              Title.Caption = 'Cor'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMEFORNECEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Fornecedor'
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDAS'
              Title.Alignment = taCenter
              Title.Caption = 'Medidas'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'REFORCO'
              Title.Alignment = taCenter
              Title.Caption = 'Refor'#231'o'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PLANTA'
              Title.Alignment = taCenter
              Title.Caption = 'Planta'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CAIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Caimento'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ALMA'
              Title.Alignment = taCenter
              Title.Caption = 'Alma'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'REBITE'
              Title.Alignment = taCenter
              Title.Caption = 'Rebite'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CAPA'
              Title.Alignment = taCenter
              Title.Caption = 'Capa'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ESQUELETO'
              Title.Alignment = taCenter
              Title.Caption = 'Esqueleto'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PONTE'
              Title.Alignment = taCenter
              Title.Caption = 'Ponte'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'LIXA'
              Title.Alignment = taCenter
              Title.Caption = 'Lixa'
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 701
          Height = 41
          Align = alTop
          TabOrder = 1
          object BitBtn6: TBitBtn
            Left = 450
            Top = 6
            Width = 83
            Height = 30
            Caption = 'Inserir Material'
            TabOrder = 0
            OnClick = BitBtn6Click
          end
          object BitBtn8: TBitBtn
            Left = 532
            Top = 6
            Width = 83
            Height = 30
            Caption = 'Alterar Material'
            TabOrder = 2
            OnClick = BitBtn8Click
          end
          object BitBtn7: TBitBtn
            Left = 614
            Top = 6
            Width = 83
            Height = 30
            Caption = 'Excluir Material'
            TabOrder = 1
            OnClick = BitBtn7Click
          end
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = 272
          Width = 701
          Height = 157
          Align = alBottom
          Caption = 'Tamanhos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object VDBGrid2: TVDBGrid
            Left = 2
            Top = 15
            Width = 697
            Height = 140
            Align = alClient
            Ctl3D = False
            DataSource = DMFichaConstrucao.dsFichaConstrucao_MatTam
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Vertical = True
            DefaultColWidth = 35
            TitlesWidth = 67
            Columns = <
              item
                Alignment = taCenter
                FieldName = 'TAMREF'
                Title.Alignment = taCenter
                Title.Caption = 'Tam. Ref:'
              end
              item
                Alignment = taCenter
                FieldName = 'TAMMAT'
                Title.Alignment = taCenter
                Title.Caption = 'Tam. Mat:'
              end>
          end
        end
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Jpegs (*.jpg)|*.jpg|JPeg|*.JPeg'
    InitialDir = 'C:'
    Left = 492
    Top = 401
  end
end
