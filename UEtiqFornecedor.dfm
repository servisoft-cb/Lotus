object fEtiqFornecedor: TfEtiqFornecedor
  Left = 11
  Top = 13
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Etiquetas de Fornecedores'
  ClientHeight = 552
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 1
    Top = 2
    Width = 781
    Height = 84
  end
  object Label1: TLabel
    Left = 151
    Top = 13
    Width = 138
    Height = 16
    Caption = 'Seleciona p/ Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 87
    Top = 38
    Width = 202
    Height = 16
    Caption = 'Seleciona p/ Nome Fantasia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 142
    Top = 62
    Width = 147
    Height = 16
    Caption = 'Seleciona p/ C'#243'digo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 258
    Top = 285
    Width = 243
    Height = 24
    Caption = 'Sele'#231#227'o para a Impress'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 168
    Top = 501
    Width = 464
    Height = 46
  end
  object SpeedButton1: TSpeedButton
    Left = 638
    Top = 6
    Width = 23
    Height = 25
    Hint = 'Abre o cadastro de fornecedores'
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
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 290
    Top = 8
    Width = 345
    Height = 21
    DropDownCount = 8
    LookupField = 'CodForn'
    LookupDisplay = 'NomeForn'
    LookupSource = dsFornecedores
    TabOrder = 0
    OnChange = RxDBLookupCombo1Enter
    OnCloseUp = RxDBLookupCombo1Enter
    OnDropDown = RxDBLookupCombo1Enter
    OnEnter = RxDBLookupCombo1Enter
    OnExit = RxDBLookupCombo1Exit
    OnKeyDown = RxDBLookupCombo1KeyDown
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 290
    Top = 33
    Width = 345
    Height = 21
    DropDownCount = 8
    LookupField = 'CodForn'
    LookupDisplay = 'Fantasia'
    LookupSource = dsFornecedores
    TabOrder = 1
    OnChange = RxDBLookupCombo2Enter
    OnCloseUp = RxDBLookupCombo2Enter
    OnDropDown = RxDBLookupCombo2Enter
    OnEnter = RxDBLookupCombo2Enter
    OnExit = RxDBLookupCombo2Exit
    OnKeyDown = RxDBLookupCombo2KeyDown
  end
  object Edit1: TEdit
    Left = 290
    Top = 57
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 92
    Width = 782
    Height = 181
    DataSource = dsFornecedores
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CodForn'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeForn'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fantasia'
        Title.Alignment = taCenter
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EndForn'
        Title.Alignment = taCenter
        Title.Caption = 'Endere'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BairroForn'
        Title.Alignment = taCenter
        Title.Caption = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkCidade'
        Title.Alignment = taCenter
        Title.Caption = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EstadoForn'
        Title.Alignment = taCenter
        Title.Caption = 'Uf'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEPForn'
        Title.Alignment = taCenter
        Title.Caption = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel1Forn'
        Title.Alignment = taCenter
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel2Forn'
        Title.Alignment = taCenter
        Title.Caption = 'Telefone 2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FaxForn'
        Title.Alignment = taCenter
        Title.Caption = 'Fax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CGC'
        Title.Alignment = taCenter
        Title.Caption = 'CNPJ/CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Insc'
        Title.Alignment = taCenter
        Title.Caption = 'Inscr. Estadual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ContatoForn'
        Title.Alignment = taCenter
        Title.Caption = 'Contato'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DataCadastroForn'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Cadastro'
        Width = 71
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 0
    Top = 310
    Width = 782
    Height = 183
    DataSource = dsAuxEtiqueta
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkFantasia'
        Title.Alignment = taCenter
        Title.Caption = 'Fantasia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkEndereco'
        Title.Alignment = taCenter
        Title.Caption = 'Endere'#231'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkBairro'
        Title.Alignment = taCenter
        Title.Caption = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkCidade'
        Title.Alignment = taCenter
        Title.Caption = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkUf'
        Title.Alignment = taCenter
        Title.Caption = 'Uf'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkCep'
        Title.Alignment = taCenter
        Title.Caption = 'Cep'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkTelefone'
        Title.Alignment = taCenter
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkTelefone2'
        Title.Alignment = taCenter
        Title.Caption = 'Telefone2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkFax'
        Title.Alignment = taCenter
        Title.Caption = 'Fax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkCgc'
        Title.Alignment = taCenter
        Title.Caption = 'CNPJ/CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkInscrEst'
        Title.Alignment = taCenter
        Title.Caption = 'Inscr. Estadual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkContato'
        Title.Alignment = taCenter
        Title.Caption = 'Contato'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'lkDtCadastro'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Cadastro'
        Width = 71
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 181
    Top = 509
    Width = 146
    Height = 30
    Hint = 'Imprime a sele'#231#227'o acima'
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BitBtn1Click
    Glyph.Data = {
      0E030000424D0E030000000000003600000028000000110000000E0000000100
      180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
      BFBFBF0000000000000000000000000000000000000000000000000000000000
      00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBFBFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      000000000000000000000000BFBFBF000000BFBFBF00BFBFBF000000BFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF000000
      000000000000BFBFBF00BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000BFBFBFBFBFBF00000000BFBFBF000000BFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
      BFBF00000000BFBFBFBFBFBF0000000000000000000000000000000000000000
      00000000000000000000BFBFBF000000BFBFBF00000000000000BFBFBFBFBFBF
      BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00BFBFBF000000BFBFBF00000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
      000000000000000000000000000000FFFFFF000000000000000000000000BFBF
      BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBF000000FFFFFF000000000000000000000000000000FFFFFF000000
      BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF00BFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000000000000000
      0000000000000000000000BFBFBFBFBFBF00}
  end
  object BitBtn2: TBitBtn
    Left = 327
    Top = 509
    Width = 146
    Height = 30
    Hint = 'Cancela a sele'#231#227'o acima'
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BitBtn2Click
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
  object BitBtn3: TBitBtn
    Left = 473
    Top = 509
    Width = 146
    Height = 30
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtn3Click
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
  object tFornecedores: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbFornecedores.DB'
    Left = 528
    Top = 280
    object tFornecedoresCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object tFornecedoresNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 40
    end
    object tFornecedoresEndForn: TStringField
      FieldName = 'EndForn'
      Size = 40
    end
    object tFornecedoresBairroForn: TStringField
      FieldName = 'BairroForn'
      Size = 30
    end
    object tFornecedoresCidadeForn: TStringField
      FieldName = 'CidadeForn'
      Size = 40
    end
    object tFornecedoresCEPForn: TStringField
      FieldName = 'CEPForn'
      Size = 9
    end
    object tFornecedoresEstadoForn: TStringField
      FieldName = 'EstadoForn'
      Size = 2
    end
    object tFornecedoresTel1Forn: TStringField
      FieldName = 'Tel1Forn'
      Size = 15
    end
    object tFornecedoresTel2Forn: TStringField
      FieldName = 'Tel2Forn'
      Size = 15
    end
    object tFornecedoresFaxForn: TStringField
      FieldName = 'FaxForn'
      Size = 15
    end
    object tFornecedoresCGC: TStringField
      FieldName = 'CGC'
      Size = 18
    end
    object tFornecedoresInsc: TStringField
      FieldName = 'Insc'
    end
    object tFornecedoresContatoForn: TStringField
      FieldName = 'ContatoForn'
      Size = 40
    end
    object tFornecedoresDataCadastroForn: TDateField
      FieldName = 'DataCadastroForn'
    end
    object tFornecedoresObsForn: TMemoField
      FieldName = 'ObsForn'
      BlobType = ftMemo
      Size = 100
    end
    object tFornecedoresRamal: TStringField
      FieldName = 'Ramal'
      Size = 5
    end
    object tFornecedoresEmail: TStringField
      FieldName = 'Email'
      Size = 40
    end
    object tFornecedoresHomePage: TStringField
      FieldName = 'HomePage'
      Size = 50
    end
    object tFornecedoresCodCondPgto: TIntegerField
      FieldName = 'CodCondPgto'
    end
    object tFornecedoresFantasia: TStringField
      FieldName = 'Fantasia'
      Size = 60
    end
    object tFornecedoresFornecedorOutros: TStringField
      FieldName = 'FornecedorOutros'
      Size = 1
    end
    object tFornecedoresCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object tFornecedoreslkCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidade'
      LookupDataSet = DM1.tCidade
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCidade'
      Size = 26
      Lookup = True
    end
  end
  object dsFornecedores: TDataSource
    DataSet = tFornecedores
    Left = 558
    Top = 280
  end
  object tAuxEtiqueta: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbAuxEtiqueta.DB'
    Left = 600
    Top = 280
    object tAuxEtiquetaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tAuxEtiquetalkNome: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNome'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'NomeForn'
      KeyFields = 'Codigo'
      Size = 40
      Lookup = True
    end
    object tAuxEtiquetalkFantasia: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFantasia'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'Fantasia'
      KeyFields = 'Codigo'
      Size = 30
      Lookup = True
    end
    object tAuxEtiquetalkEndereco: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEndereco'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'EndForn'
      KeyFields = 'Codigo'
      Size = 40
      Lookup = True
    end
    object tAuxEtiquetalkBairro: TStringField
      FieldKind = fkLookup
      FieldName = 'lkBairro'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'BairroForn'
      KeyFields = 'Codigo'
      Size = 30
      Lookup = True
    end
    object tAuxEtiquetalkUf: TStringField
      FieldKind = fkLookup
      FieldName = 'lkUf'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'EstadoForn'
      KeyFields = 'Codigo'
      Size = 2
      Lookup = True
    end
    object tAuxEtiquetalkCep: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCep'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'CEPForn'
      KeyFields = 'Codigo'
      Size = 9
      Lookup = True
    end
    object tAuxEtiquetalkTelefone: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTelefone'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'Tel1Forn'
      KeyFields = 'Codigo'
      Size = 15
      Lookup = True
    end
    object tAuxEtiquetalkTelefone2: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTelefone2'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'Tel2Forn'
      KeyFields = 'Codigo'
      Size = 15
      Lookup = True
    end
    object tAuxEtiquetalkFax: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFax'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'FaxForn'
      KeyFields = 'Codigo'
      Size = 15
      Lookup = True
    end
    object tAuxEtiquetalkCgc: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCgc'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'CGC'
      KeyFields = 'Codigo'
      Size = 18
      Lookup = True
    end
    object tAuxEtiquetalkInscrEst: TStringField
      FieldKind = fkLookup
      FieldName = 'lkInscrEst'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'Insc'
      KeyFields = 'Codigo'
      Size = 15
      Lookup = True
    end
    object tAuxEtiquetalkContato: TStringField
      FieldKind = fkLookup
      FieldName = 'lkContato'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'ContatoForn'
      KeyFields = 'Codigo'
      Size = 30
      Lookup = True
    end
    object tAuxEtiquetalkDtCadastro: TStringField
      FieldKind = fkLookup
      FieldName = 'lkDtCadastro'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'DataCadastroForn'
      KeyFields = 'Codigo'
      Size = 10
      Lookup = True
    end
    object tAuxEtiquetalkCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidade'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'lkCidade'
      KeyFields = 'Codigo'
      Size = 26
      Lookup = True
    end
  end
  object dsAuxEtiqueta: TDataSource
    DataSet = tAuxEtiqueta
    Left = 632
    Top = 280
  end
end
