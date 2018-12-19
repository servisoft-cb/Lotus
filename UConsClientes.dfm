object fConsClientes: TfConsClientes
  Left = 11
  Top = 84
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Clientes'
  ClientHeight = 600
  ClientWidth = 972
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
  object StaticText1: TStaticText
    Left = 0
    Top = 583
    Width = 972
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 
      'Duplo clique ou Enter no registro para fazer a consulta do cadas' +
      'tro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 82
    Width = 972
    Height = 501
    Align = alClient
    DataSource = dsqClientes
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    OnKeyPress = SMDBGrid1KeyPress
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 11
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CgcCpf'
        Title.Alignment = taCenter
        Title.Caption = 'CNPJ/CPF'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Title.Alignment = taCenter
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EmailNFe'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCidade'
        Title.Alignment = taCenter
        Title.Caption = 'Cidade'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Uf'
        Title.Alignment = taCenter
        Title.Caption = 'UF'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeLoja'
        Title.Alignment = taCenter
        Title.Caption = 'Loja'
        Width = 227
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Mercado'
        Title.Alignment = taCenter
        Width = 53
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 972
    Height = 82
    Align = alTop
    Color = clSilver
    TabOrder = 2
    object Label1: TLabel
      Left = 23
      Top = 11
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 416
      Top = 0
      Width = 110
      Height = 26
      Caption = 'Digitar parte do nome e'#13#10'Pressionar Enter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 237
      Top = 40
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cidade:'
    end
    object Bevel2: TBevel
      Left = -93
      Top = 25
      Width = 1200
      Height = 2
      Shape = bsTopLine
    end
    object Label5: TLabel
      Left = 25
      Top = 40
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lojas:'
    end
    object Label6: TLabel
      Left = 228
      Top = 62
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mercado:'
    end
    object Label7: TLabel
      Left = 443
      Top = 40
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estado:'
    end
    object Label8: TLabel
      Left = 4
      Top = 62
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vendedor:'
    end
    object Label9: TLabel
      Left = 574
      Top = 38
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ordenar por:'
    end
    object Edit1: TEdit
      Left = 56
      Top = 3
      Width = 349
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 276
      Top = 32
      Width = 164
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsCidade
      TabOrder = 2
      OnEnter = RxDBLookupCombo1Enter
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 57
      Top = 32
      Width = 166
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsLojas
      TabOrder = 1
    end
    object RxDBLookupCombo4: TRxDBLookupCombo
      Left = 482
      Top = 32
      Width = 50
      Height = 21
      DropDownCount = 8
      LookupField = 'Sigla'
      LookupDisplay = 'Sigla'
      LookupSource = DM1.dsUF
      TabOrder = 3
    end
    object RxDBLookupCombo5: TRxDBLookupCombo
      Left = 57
      Top = 54
      Width = 166
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsVendedor
      TabOrder = 4
      OnEnter = RxDBLookupCombo5Enter
    end
    object ComboBox2: TComboBox
      Left = 637
      Top = 30
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 6
      Text = 'Ordem Num'#233'rica'
      Items.Strings = (
        'Ordem Alfab'#233'tica'
        'Ordem Num'#233'rica'
        'Cidade'
        'Estado'
        'Vendedor')
    end
    object ComboBox1: TComboBox
      Left = 276
      Top = 54
      Width = 164
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Items.Strings = (
        'Exporta'#231#227'o'
        'Mercado Interno')
    end
    object Panel2: TPanel
      Left = 877
      Top = 1
      Width = 94
      Height = 80
      Align = alRight
      Color = clSilver
      TabOrder = 7
      object BitBtn1: TBitBtn
        Left = 3
        Top = 3
        Width = 88
        Height = 27
        Caption = 'Filtrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn3: TBitBtn
        Left = 3
        Top = 32
        Width = 88
        Height = 27
        Caption = 'Imprimir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn3Click
      end
    end
    object CheckBox2: TCheckBox
      Left = 640
      Top = 56
      Width = 105
      Height = 17
      Caption = 'Imprimir Completo'
      TabOrder = 8
    end
    object ckImpEmail: TCheckBox
      Left = 462
      Top = 58
      Width = 105
      Height = 17
      Caption = 'Imp. Email NFe'
      TabOrder = 9
    end
  end
  object qClientes: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT C.Codigo, C.Nome, C.Telefone, C.Fax, C.Uf, C.CgcCpf, C.Lo' +
        'jas, Dblojas.Nome NomeLoja, Dbcidade.Nome NomeCidade,'
      
        'C.Mercado, C.CodVendedor, Dbvendedor.Nome NomeVendedor, C.EndEnt' +
        'rega, C.BairroEntrega, C.CepEntrega,'
      
        'C.UfEntrega, C.EndPgto, C.BairroPgto, C.CepPgto, C.UfPgto, C.End' +
        'ereco, C.Bairro, C.Cep, C.Obs, C.CaixaPostal, C.Email, C.CodCida' +
        'deE,'
      
        'C.CodCidadeP, C.InscrEst, C.Pessoa, C.Fantasia, C.DtCadastro, C.' +
        'Telefone2, C.Contato, C.DDDFone1, C.DDDFone2, C.DDDFax,'
      'C.HomePage, C.CgcCpfEntrega, C.InscEntrega,'
      
        'C.Cidade, C.AprovCredito, C.TipoAprov, C.CidEntrega, C.CidPgto, ' +
        'C.ObsCtas, C.Selecionado, C.Rg, C.CodCidade,'
      
        'C.NumEnd, C.ComplEndereco, C.EmailNFe, C.NumEndEntrega, C.ComplE' +
        'nderecoEntrega'
      ''
      'FROM "dbcliente.DB" C'
      '   INNER JOIN "DBCIDADE.DB" Dbcidade'
      '   ON  (C.CodCidade = Dbcidade.Codigo)'
      '   LEFT OUTER JOIN "DBLOJAS.DB" Dblojas'
      '   ON  (C.Lojas = Dblojas.Codigo)'
      '   INNER JOIN "dbVendedor.DB" Dbvendedor'
      '   ON  (Dbvendedor.Codigo = C.CodVendedor)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 600
    Top = 192
    object qClientesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qClientesNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qClientesTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object qClientesFax: TStringField
      FieldName = 'Fax'
      Size = 15
    end
    object qClientesUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object qClientesCgcCpf: TStringField
      FieldName = 'CgcCpf'
      Size = 18
    end
    object qClientesLojas: TIntegerField
      FieldName = 'Lojas'
    end
    object qClientesNomeLoja: TStringField
      FieldName = 'NomeLoja'
      Size = 40
    end
    object qClientesNomeCidade: TStringField
      FieldName = 'NomeCidade'
      Size = 26
    end
    object qClientesMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
    object qClientesCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object qClientesNomeVendedor: TStringField
      FieldName = 'NomeVendedor'
      Size = 40
    end
    object qClientesEndEntrega: TStringField
      FieldName = 'EndEntrega'
      Size = 40
    end
    object qClientesBairroEntrega: TStringField
      FieldName = 'BairroEntrega'
      Size = 26
    end
    object qClientesCepEntrega: TStringField
      FieldName = 'CepEntrega'
      Size = 10
    end
    object qClientesUfEntrega: TStringField
      FieldName = 'UfEntrega'
      Size = 2
    end
    object qClientesEndPgto: TStringField
      FieldName = 'EndPgto'
      Size = 40
    end
    object qClientesBairroPgto: TStringField
      FieldName = 'BairroPgto'
      Size = 26
    end
    object qClientesCepPgto: TStringField
      FieldName = 'CepPgto'
      Size = 10
    end
    object qClientesUfPgto: TStringField
      FieldName = 'UfPgto'
      Size = 2
    end
    object qClientesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object qClientesBairro: TStringField
      FieldName = 'Bairro'
      Size = 25
    end
    object qClientesCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
    object qClientesObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object qClientesCaixaPostal: TStringField
      FieldName = 'CaixaPostal'
      Size = 10
    end
    object qClientesEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object qClientesCodCidadeE: TIntegerField
      FieldName = 'CodCidadeE'
    end
    object qClientesCodCidadeP: TIntegerField
      FieldName = 'CodCidadeP'
    end
    object qClientesInscrEst: TStringField
      FieldName = 'InscrEst'
      Size = 18
    end
    object qClientesPessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
    object qClientesFantasia: TStringField
      FieldName = 'Fantasia'
    end
    object qClientesDtCadastro: TDateField
      FieldName = 'DtCadastro'
    end
    object qClientesTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 15
    end
    object qClientesContato: TStringField
      FieldName = 'Contato'
      Size = 30
    end
    object qClientesDDDFone1: TIntegerField
      FieldName = 'DDDFone1'
    end
    object qClientesDDDFone2: TIntegerField
      FieldName = 'DDDFone2'
    end
    object qClientesDDDFax: TIntegerField
      FieldName = 'DDDFax'
    end
    object qClientesHomePage: TStringField
      FieldName = 'HomePage'
      Size = 200
    end
    object qClientesCgcCpfEntrega: TStringField
      FieldName = 'CgcCpfEntrega'
      Size = 18
    end
    object qClientesInscEntrega: TStringField
      FieldName = 'InscEntrega'
      Size = 18
    end
    object qClientesCidade: TStringField
      FieldName = 'Cidade'
      Size = 26
    end
    object qClientesAprovCredito: TStringField
      FieldName = 'AprovCredito'
      Size = 1
    end
    object qClientesTipoAprov: TStringField
      FieldName = 'TipoAprov'
      Size = 1
    end
    object qClientesCidEntrega: TStringField
      FieldName = 'CidEntrega'
      Size = 26
    end
    object qClientesCidPgto: TStringField
      FieldName = 'CidPgto'
      Size = 26
    end
    object qClientesObsCtas: TMemoField
      FieldName = 'ObsCtas'
      BlobType = ftMemo
      Size = 1
    end
    object qClientesSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object qClientesRg: TStringField
      FieldName = 'Rg'
      Size = 10
    end
    object qClientesCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object qClientesNumEnd: TStringField
      FieldName = 'NumEnd'
      Size = 15
    end
    object qClientesComplEndereco: TStringField
      FieldName = 'ComplEndereco'
      Size = 50
    end
    object qClientesEmailNFe: TStringField
      FieldName = 'EmailNFe'
      Size = 50
    end
    object qClientesNumEndEntrega: TStringField
      FieldName = 'NumEndEntrega'
      Size = 15
    end
    object qClientesComplEnderecoEntrega: TStringField
      FieldName = 'ComplEnderecoEntrega'
      Size = 50
    end
    object qClienteslkCidEntrega: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidEntrega'
      LookupDataSet = tCidade2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCidadeE'
      Size = 30
      Lookup = True
    end
    object qClienteslkCidPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidPgto'
      LookupDataSet = tCidade2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCidadeP'
      Size = 30
      Lookup = True
    end
  end
  object dsqClientes: TDataSource
    DataSet = qClientes
    Left = 632
    Top = 192
  end
  object tCidade2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCidade.DB'
    Left = 744
    Top = 280
    object tCidade2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCidade2Nome: TStringField
      FieldName = 'Nome'
      Size = 26
    end
    object tCidade2Estado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tCidade2Prefixo: TStringField
      FieldName = 'Prefixo'
      Size = 3
    end
    object tCidade2Cep: TStringField
      FieldName = 'Cep'
      Size = 9
    end
    object tCidade2CodMunicipio: TStringField
      FieldName = 'CodMunicipio'
      Size = 7
    end
  end
end
