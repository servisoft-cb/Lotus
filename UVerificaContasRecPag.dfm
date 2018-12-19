object fVerificaContasRecPag: TfVerificaContasRecPag
  Left = 365
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Verifica'
  ClientHeight = 378
  ClientWidth = 624
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
  object Label1: TLabel
    Left = 6
    Top = 10
    Width = 56
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label2: TLabel
    Left = 11
    Top = 32
    Width = 51
    Height = 13
    Caption = 'Data Final:'
  end
  object DateEdit1: TDateEdit
    Left = 63
    Top = 2
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DateEdit2: TDateEdit
    Left = 63
    Top = 24
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 24
    Width = 113
    Height = 25
    Caption = 'Verifica C.Receber'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 24
    Width = 113
    Height = 25
    Caption = 'Verifica C.Pagar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 56
    Width = 625
    Height = 321
    ActivePage = TabSheet3
    TabIndex = 2
    TabOrder = 4
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Contas a Receber'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 621
        Height = 298
        Align = alClient
        DataSource = dsmReceber
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 6
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumNota'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Nota'
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtEmissao'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Emiss'#227'o'
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CodCliente'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Cliente'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 289
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrDuplicata'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 102
            Visible = True
          end>
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Contas a Pagar'
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 0
        Width = 621
        Height = 298
        Align = alClient
        DataSource = dsmPagar
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 6
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumNota'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Nota'
            Width = 71
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtEntrada'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrada'
            Width = 66
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CodFornecedor'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Fornecedor'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeFornecedor'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Fornecedor'
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrDuplicata'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Width = 97
            Visible = True
          end>
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Contas a Receber (Limpar)'
      object Label3: TLabel
        Left = 14
        Top = 34
        Width = 51
        Height = 13
        Caption = 'Data Final:'
      end
      object BitBtn4: TBitBtn
        Left = 64
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 0
        OnClick = BitBtn4Click
      end
      object DateEdit3: TDateEdit
        Left = 71
        Top = 26
        Width = 100
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object DateEdit4: TDateEdit
        Left = 223
        Top = 26
        Width = 99
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        Text = '01/01/2011'
        Visible = False
      end
      object ProgressBar1: TProgressBar
        Left = 64
        Top = 136
        Width = 473
        Height = 17
        TabOrder = 3
      end
    end
  end
  object BitBtn3: TBitBtn
    Left = 392
    Top = 24
    Width = 113
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object mReceber: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 409
    Top = 156
    Data = {
      840000009619E0BD0100000018000000050000000000030000008400074E756D
      4E6F74610400010000000000094474456D697373616F04000600000000000A43
      6F64436C69656E746504000100000000000B4E6F6D65436C69656E7465010049
      00000001000557494454480200020028000C566C724475706C69636174610800
      0400000000000000}
    object mReceberNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mReceberDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mReceberCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mReceberNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object mReceberVlrDuplicata: TFloatField
      FieldName = 'VlrDuplicata'
    end
  end
  object mPagar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 473
    Top = 156
    Data = {
      8A0000009619E0BD0100000018000000050000000000030000008A00074E756D
      4E6F74610400010000000000094474456E747261646104000600000000000D43
      6F64466F726E656365646F7204000100000000000E4E6F6D65466F726E656365
      646F7201004900000001000557494454480200020028000C566C724475706C69
      6361746108000400000000000000}
    object mPagarNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mPagarDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object mPagarCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
    end
    object mPagarNomeFornecedor: TStringField
      FieldName = 'NomeFornecedor'
      Size = 40
    end
    object mPagarVlrDuplicata: TFloatField
      FieldName = 'VlrDuplicata'
    end
  end
  object dsmReceber: TDataSource
    DataSet = mReceber
    Left = 425
    Top = 156
  end
  object dsmPagar: TDataSource
    DataSet = mPagar
    Left = 489
    Top = 156
  end
  object qCReceber: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnotafiscal.NumNota, Dbnotafiscal.Filial, Dbnotafiscal.D' +
        'tEmissao, Dbnotafiscal.CodCli, Dbnotafiscal.VlrTotalDupl, Dbclie' +
        'nte.Nome, dbNotaFiscal.Serie, dbNotaFiscal.NumSeq'
      'FROM "DBNOTAFISCAL.DB" Dbnotafiscal'
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)  '
      
        'WHERE  (Dbnotafiscal.DtEmissao BETWEEN '#39'01/01/2006'#39' AND '#39'01/01/2' +
        '008'#39' )'
      
        '       AND ((dbNotaFiscal.CondPgto = '#39'P'#39') or (dbNotaFiscal.CondP' +
        'gto = '#39'V'#39'))'
      ' ')
    Left = 233
    Top = 116
    object qCReceberNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbNotaFiscal.DB".NumNota'
    end
    object qCReceberFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbNotaFiscal.DB".Filial'
    end
    object qCReceberDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbNotaFiscal.DB".DtEmissao'
    end
    object qCReceberCodCli: TIntegerField
      FieldName = 'CodCli'
      Origin = 'TABELAS."dbNotaFiscal.DB".CodCli'
    end
    object qCReceberVlrTotalDupl: TFloatField
      FieldName = 'VlrTotalDupl'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrTotalDupl'
    end
    object qCReceberNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 40
    end
    object qCReceberSerie: TStringField
      FieldName = 'Serie'
      Origin = 'TABELAS."dbNotaFiscal.DB".Serie'
      Size = 3
    end
    object qCReceberNumSeq: TIntegerField
      FieldName = 'NumSeq'
      Origin = 'TABELAS."dbNotaFiscal.DB".NumSeq'
    end
  end
  object qCPagar: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnentrada.NumNEntr, Dbnentrada.CodForn, Dbnentrada.DtEnt' +
        'rada, Dbfornecedores.NomeForn, Dbnentrada.VlrTotalNEntr'
      'FROM "DBNENTRADA.DB" Dbnentrada'
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbnentrada.CodForn = Dbfornecedores.CodForn)'
      
        'WHERE   Dbnentrada.DtEntrada BETWEEN '#39'01/01/2007'#39' AND '#39'01/01/200' +
        '8'#39'  '
      
        '   AND  ( (Dbnentrada.CondPgto = '#39'P'#39')  OR  (Dbnentrada.CondPgto ' +
        '= '#39'V'#39') )  '
      ' '
      ' '
      ' '
      ' ')
    Left = 297
    Top = 116
    object qCPagarNumNEntr: TIntegerField
      FieldName = 'NumNEntr'
      Origin = 'TABELAS."dbNEntrada.DB".NumNEntr'
    end
    object qCPagarCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbNEntrada.DB".CodForn'
    end
    object qCPagarDtEntrada: TDateField
      FieldName = 'DtEntrada'
      Origin = 'TABELAS."dbNEntrada.DB".DtEntrada'
    end
    object qCPagarNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object qCPagarVlrTotalNEntr: TFloatField
      FieldName = 'VlrTotalNEntr'
      Origin = 'TABELAS."dbNEntrada.DB".VlrTotalNEntr'
    end
  end
  object tCReceberParc: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCReceberParc.DB'
    Left = 233
    Top = 204
    object tCReceberParcNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberParcParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object tCReceberParcVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
    end
    object tCReceberParcDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
    end
    object tCReceberParcQuitParcCReceber: TBooleanField
      FieldName = 'QuitParcCReceber'
    end
    object tCReceberParcJurosParcCReceber: TFloatField
      FieldName = 'JurosParcCReceber'
    end
    object tCReceberParcDtPagParcCReceber: TDateField
      FieldName = 'DtPagParcCReceber'
    end
    object tCReceberParcCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberParcNumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tCReceberParcDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tCReceberParcPgtoParcial: TFloatField
      FieldName = 'PgtoParcial'
    end
    object tCReceberParcRestParcela: TFloatField
      FieldName = 'RestParcela'
    end
    object tCReceberParcContaDupl: TSmallintField
      FieldName = 'ContaDupl'
    end
    object tCReceberParcSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tCReceberParcCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tCReceberParcBaixada: TBooleanField
      FieldName = 'Baixada'
    end
    object tCReceberParcPercComissao: TFloatField
      FieldName = 'PercComissao'
    end
    object tCReceberParcVlrComissao: TFloatField
      FieldName = 'VlrComissao'
    end
    object tCReceberParcPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tCReceberParcAgencia: TStringField
      FieldName = 'Agencia'
      Size = 6
    end
    object tCReceberParcTitPortador: TStringField
      FieldName = 'TitPortador'
    end
    object tCReceberParcCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tCReceberParcDespesas: TFloatField
      FieldName = 'Despesas'
    end
    object tCReceberParcAbatimentos: TFloatField
      FieldName = 'Abatimentos'
    end
    object tCReceberParcCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCReceberParcPgCartorio: TBooleanField
      FieldName = 'PgCartorio'
    end
    object tCReceberParcDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tCReceberParcLetraCambio: TBooleanField
      FieldName = 'LetraCambio'
    end
    object tCReceberParcNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tCReceberParcJurosPagos: TFloatField
      FieldName = 'JurosPagos'
    end
    object tCReceberParcCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tCReceberParcTitProtestado: TBooleanField
      FieldName = 'TitProtestado'
    end
    object tCReceberParcDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCReceberParcTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberParcVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
    end
    object tCReceberParcDuplicataImp: TBooleanField
      FieldName = 'DuplicataImp'
    end
    object tCReceberParcPagarParteNaNota: TBooleanField
      FieldName = 'PagarParteNaNota'
    end
    object tCReceberParcMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
    object tCReceberParcFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberParcPercComissao2: TFloatField
      FieldName = 'PercComissao2'
    end
    object tCReceberParcCodVendedor2: TIntegerField
      FieldName = 'CodVendedor2'
    end
    object tCReceberParcCodBancoBoleto: TIntegerField
      FieldName = 'CodBancoBoleto'
    end
    object tCReceberParcComissaoItem: TBooleanField
      FieldName = 'ComissaoItem'
    end
    object tCReceberParcTransferencia: TBooleanField
      FieldName = 'Transferencia'
    end
    object tCReceberParcSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tCReceberParcNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
    end
    object tCReceberParcCodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
    end
    object tCReceberParcExportacao: TBooleanField
      FieldName = 'Exportacao'
    end
    object tCReceberParcNumNota: TIntegerField
      FieldName = 'NumNota'
    end
  end
  object tCPagarParc: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'DBCPAGARPARC.DB'
    Left = 289
    Top = 204
    object tCPagarParcNumCPagar: TIntegerField
      FieldName = 'NumCPagar'
    end
    object tCPagarParcParcCPagar: TIntegerField
      FieldName = 'ParcCPagar'
    end
    object tCPagarParcDtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
    end
    object tCPagarParcVlrParcCPagar: TFloatField
      FieldName = 'VlrParcCPagar'
    end
    object tCPagarParcQuitParcCPagar: TBooleanField
      FieldName = 'QuitParcCPagar'
    end
    object tCPagarParcDtPagParcCPagar: TDateField
      FieldName = 'DtPagParcCPagar'
    end
    object tCPagarParcJurosParcCPagar: TFloatField
      FieldName = 'JurosParcCPagar'
    end
    object tCPagarParcCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object tCPagarParcNumNotaEnt: TIntegerField
      FieldName = 'NumNotaEnt'
    end
    object tCPagarParcDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tCPagarParcPgtoParcial: TFloatField
      FieldName = 'PgtoParcial'
    end
    object tCPagarParcRestParcela: TFloatField
      FieldName = 'RestParcela'
    end
    object tCPagarParcBanco: TStringField
      FieldName = 'Banco'
      Size = 40
    end
    object tCPagarParcPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tCPagarParcNroDuplicata: TIntegerField
      FieldName = 'NroDuplicata'
    end
    object tCPagarParcDespesas: TFloatField
      FieldName = 'Despesas'
    end
    object tCPagarParcAbatimentos: TFloatField
      FieldName = 'Abatimentos'
    end
    object tCPagarParcCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCPagarParcDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tCPagarParcJurosPagos: TFloatField
      FieldName = 'JurosPagos'
    end
    object tCPagarParcCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tCPagarParcDtRecto: TDateField
      FieldName = 'DtRecto'
    end
    object tCPagarParcCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tCPagarParcVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
    end
    object tCPagarParcNumNossaNota: TIntegerField
      FieldName = 'NumNossaNota'
    end
    object tCPagarParcNomeBancoForn: TStringField
      FieldName = 'NomeBancoForn'
      Size = 30
    end
    object tCPagarParcAgenciaForn: TStringField
      FieldName = 'AgenciaForn'
      Size = 5
    end
    object tCPagarParcNumContaForn: TStringField
      FieldName = 'NumContaForn'
      Size = 15
    end
    object tCPagarParcSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tCPagarParcNumSeqNEntrada: TIntegerField
      FieldName = 'NumSeqNEntrada'
    end
  end
  object tCReceber: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCReceber.DB'
    Left = 233
    Top = 260
    object tCReceberFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tCReceberQuitado: TBooleanField
      FieldName = 'Quitado'
    end
    object tCReceberCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCReceberHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object tCReceberCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tCReceberDuplicataImp: TBooleanField
      FieldName = 'DuplicataImp'
    end
    object tCReceberVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tCReceberBoletoImp: TBooleanField
      FieldName = 'BoletoImp'
    end
  end
  object tCPagar: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCPagar.DB'
    Left = 297
    Top = 260
    object tCPagarNumCPagar: TIntegerField
      FieldName = 'NumCPagar'
    end
    object tCPagarNumNotaEnt: TIntegerField
      FieldName = 'NumNotaEnt'
    end
    object tCPagarCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object tCPagarQuitado: TBooleanField
      FieldName = 'Quitado'
    end
    object tCPagarTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCPagarDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCPagarHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object tCPagarNroDuplicata: TIntegerField
      FieldName = 'NroDuplicata'
    end
    object tCPagarCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tCPagarVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tCPagarCodNatOper: TIntegerField
      FieldName = 'CodNatOper'
    end
    object tCPagarSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tCPagarNumSeqNEntrada: TIntegerField
      FieldName = 'NumSeqNEntrada'
    end
  end
end
