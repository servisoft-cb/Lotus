object fConsMovTalao: TfConsMovTalao
  Left = 11
  Top = 12
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Movimento de Tal'#245'es    (Exporta'#231#227'o)'
  ClientHeight = 555
  ClientWidth = 775
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 555
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 769
      Height = 41
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 292
        Height = 20
        Caption = 'Consulta p/ N'#186' do Pedido do Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 304
        Top = 9
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object BitBtn1: TBitBtn
        Left = 689
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      object BitBtn2: TBitBtn
        Left = 568
        Top = 8
        Width = 107
        Height = 25
        Hint = 'Consulta a quantidade produzida'
        Caption = 'Cons. Qtd. Prod.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333FF3FF3333333333CC30003333333333773777333333333C33
          3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
          33003377333337F33377333333333C333300333F333337F33377339333333C33
          3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
          330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
          330077F377F337F33377993399333C33330077FF773337F33377399993333C33
          33333777733337F333FF333333333C33300033333333373FF7773333333333CC
          3000333333333377377733333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object Panel3: TPanel
      Left = 3
      Top = 46
      Width = 769
      Height = 485
      BevelOuter = bvLowered
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 4
        Top = 1
        Width = 469
        Height = 129
        Caption = 'PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 476
        Top = 1
        Width = 290
        Height = 129
        Caption = 'LOTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object RxDBGrid2: TRxDBGrid
        Left = 480
        Top = 15
        Width = 282
        Height = 111
        DataSource = dsLote
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Lote'
            Title.Alignment = taCenter
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdTaloes'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Tal'#245'es'
            Width = 59
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdPares'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.Pares'
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtEmbarque'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Embarque'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TipoTalao'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Visible = True
          end>
      end
      object RxDBGrid1: TRxDBGrid
        Left = 8
        Top = 15
        Width = 459
        Height = 111
        DataSource = dsPedido
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Pedido'
            Title.Alignment = taCenter
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PedidoCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Ped.Cliente'
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PedCliDif'
            Title.Alignment = taCenter
            Title.Caption = 'D'#237'g.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 149
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtEmissao'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Emiss'#227'o'
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtIniEmbarque'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Ini.Emb.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtFinEmbarque'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Fin.Emb.'
            Visible = True
          end>
      end
      object GroupBox3: TGroupBox
        Left = 396
        Top = 130
        Width = 369
        Height = 129
        Caption = 'TAL'#213'ES / ITENS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object RxDBGrid3: TRxDBGrid
        Left = 400
        Top = 144
        Width = 361
        Height = 111
        DataSource = dsTalao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Item'
            Title.Alignment = taCenter
            Width = 25
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkReferencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkDescMaterial'
            Title.Alignment = taCenter
            Title.Caption = 'Material'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCor'
            Title.Alignment = taCenter
            Title.Caption = 'Cor'
            Width = 102
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdPar'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.Prs.'
            Width = 39
            Visible = True
          end>
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 260
        Width = 157
        Height = 220
        Caption = 'TAL'#213'ES / G R A D E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object RxDBGrid4: TRxDBGrid
        Left = 8
        Top = 274
        Width = 148
        Height = 201
        DataSource = dsTalaoGrade
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Talao'
            Title.Alignment = taCenter
            Title.Caption = 'Tal'#227'o'
            Width = 34
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkTamanho'
            Title.Alignment = taCenter
            Title.Caption = 'Tam.'
            Width = 33
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdPar'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Prs.'
            Width = 45
            Visible = True
          end>
      end
      object GroupBox5: TGroupBox
        Left = 163
        Top = 260
        Width = 603
        Height = 220
        Caption = 'MOVIMENTOS DOS TAL'#213'ES   (POR GRADE)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object RxDBGrid5: TRxDBGrid
        Left = 166
        Top = 280
        Width = 595
        Height = 195
        DataSource = dsTalaoMov
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid5DblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Setor'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.Setor'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkSetor'
            Title.Alignment = taCenter
            Title.Caption = 'Setor'
            Width = 103
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataEnt'
            Title.Alignment = taCenter
            Title.Caption = 'Data Entrada'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HoraEnt'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Entrada'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataSaida'
            Title.Alignment = taCenter
            Title.Caption = 'Data Sa'#237'da'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HoraSaida'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Sa'#237'da'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CodAtelier'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.Atelier'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkAtelier'
            Title.Alignment = taCenter
            Title.Caption = 'Atelier'
            Width = 228
            Visible = True
          end>
      end
      object GroupBox6: TGroupBox
        Left = 4
        Top = 130
        Width = 390
        Height = 129
        Caption = ' ITENS DO PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object RxDBGrid6: TRxDBGrid
        Left = 12
        Top = 144
        Width = 382
        Height = 111
        DataSource = dsPedidoItem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 11
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Item'
            Title.Alignment = taCenter
            Width = 25
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkReferencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkDescMaterial'
            Title.Alignment = taCenter
            Title.Caption = 'Material'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkCor'
            Title.Alignment = taCenter
            Title.Caption = 'Cor'
            Width = 102
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdPares'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.Prs.'
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Invoice'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
    object StaticText1: TStaticText
      Left = 3
      Top = 535
      Width = 769
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 
        'D'#234' dois cliques na gride de Movimentos dos Tal'#245'es para mudar (po' +
        'r grade / por refer'#234'ncia)'
      TabOrder = 2
    end
  end
  object tPedido: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'PedidoCliente'
    TableName = 'Dbpedido.DB'
    Left = 7
    Top = 31
    object tPedidoPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tPedidoDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object tPedidoDtIniEmbarque: TDateField
      FieldName = 'DtIniEmbarque'
    end
    object tPedidoDtFinEmbarque: TDateField
      FieldName = 'DtFinEmbarque'
    end
    object tPedidoNumLote: TIntegerField
      FieldName = 'NumLote'
    end
    object tPedidoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tPedidoSuspenso: TBooleanField
      FieldName = 'Suspenso'
    end
    object tPedidoPedidoCliente: TIntegerField
      FieldName = 'PedidoCliente'
    end
    object tPedidoPedCliDif: TStringField
      FieldName = 'PedCliDif'
      Size = 2
    end
    object tPedidoLoteExp: TBooleanField
      FieldName = 'LoteExp'
    end
    object tPedidoPOCliente: TStringField
      FieldName = 'POCliente'
      Size = 13
    end
    object tPedidolkCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCliente'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object tPedidoCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object tPedidoQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object tPedidoQtdParesRep: TFloatField
      FieldName = 'QtdParesRep'
    end
    object tPedidoVlrReposicao: TFloatField
      FieldName = 'VlrReposicao'
    end
    object tPedidoStock: TStringField
      FieldName = 'Stock'
      Size = 15
    end
  end
  object dsPedido: TDataSource
    DataSet = tPedido
    Left = 23
    Top = 31
  end
  object tLote: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexName = 'iNroPedido'
    MasterFields = 'Pedido'
    MasterSource = dsPedido
    TableName = 'dbLote.DB'
    Left = 56
    Top = 31
    object tLoteLote: TIntegerField
      FieldName = 'Lote'
    end
    object tLoteQtdTaloes: TIntegerField
      FieldName = 'QtdTaloes'
    end
    object tLoteQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object tLoteObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 10
    end
    object tLoteImpCalcMaterial: TBooleanField
      FieldName = 'ImpCalcMaterial'
    end
    object tLoteNroPedido: TIntegerField
      FieldName = 'NroPedido'
    end
    object tLoteImpresso: TBooleanField
      FieldName = 'Impresso'
    end
    object tLoteOCGerado: TBooleanField
      FieldName = 'OCGerado'
    end
    object tLoteItemPed: TIntegerField
      FieldName = 'ItemPed'
    end
    object tLoteNumMapaCompras: TIntegerField
      FieldName = 'NumMapaCompras'
    end
    object tLoteDtEmbarque: TDateField
      FieldName = 'DtEmbarque'
    end
    object tLoteTipoTalao: TStringField
      FieldName = 'TipoTalao'
      Size = 1
    end
  end
  object dsLote: TDataSource
    DataSet = tLote
    Left = 69
    Top = 31
  end
  object RxDBFilter1: TRxDBFilter
    Active = True
    DataSource = dsPedido
    Filter.Strings = (
      'LoteExp = True')
    Left = 8
    Top = 68
  end
  object tTalao: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote'
    MasterFields = 'Lote'
    MasterSource = dsLote
    TableName = 'dbTalao.DB'
    Left = 101
    Top = 31
    object tTalaoLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoItem: TIntegerField
      FieldName = 'Item'
    end
    object tTalaoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tTalaoCodCabedal1: TIntegerField
      FieldName = 'CodCabedal1'
    end
    object tTalaoCodCabedal2: TIntegerField
      FieldName = 'CodCabedal2'
    end
    object tTalaoCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tTalaoCodCorForro: TIntegerField
      FieldName = 'CodCorForro'
    end
    object tTalaoCodCorPalmilha: TIntegerField
      FieldName = 'CodCorPalmilha'
    end
    object tTalaoCodCorSolado: TIntegerField
      FieldName = 'CodCorSolado'
    end
    object tTalaoQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
    object tTalaoCodForro: TIntegerField
      FieldName = 'CodForro'
    end
    object tTalaoCodEtiqueta: TIntegerField
      FieldName = 'CodEtiqueta'
    end
    object tTalaoCodSolado: TIntegerField
      FieldName = 'CodSolado'
    end
    object tTalaoCodTaloneira: TIntegerField
      FieldName = 'CodTaloneira'
    end
    object tTalaoCodCorTaloneira: TIntegerField
      FieldName = 'CodCorTaloneira'
    end
    object tTalaoCodPalmilha: TIntegerField
      FieldName = 'CodPalmilha'
    end
    object tTalaolkReferencia: TStringField
      FieldKind = fkLookup
      FieldName = 'lkReferencia'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Referencia'
      KeyFields = 'CodProduto'
      Size = 10
      Lookup = True
    end
    object tTalaolkCorSolado: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCorSolado'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCorSolado'
      Size = 30
      Lookup = True
    end
    object tTalaolkCorForro: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCorForro'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCorForro'
      Size = 30
      Lookup = True
    end
    object tTalaoInvoice: TStringField
      FieldName = 'Invoice'
      Size = 8
    end
    object tTalaolkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 15
      Lookup = True
    end
    object tTalaolkDescMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkDescMaterial'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'DescMaterial'
      KeyFields = 'CodProduto'
      Size = 10
      Lookup = True
    end
    object tTalaoCodForma: TIntegerField
      FieldName = 'CodForma'
    end
  end
  object dsTalao: TDataSource
    DataSet = tTalao
    Left = 122
    Top = 31
  end
  object tTalaoGrade: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Item'
    MasterFields = 'Lote;Item'
    MasterSource = dsTalao
    TableName = 'dbTalaoGrade.DB'
    Left = 154
    Top = 31
    object tTalaoGradeLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoGradeItem: TIntegerField
      FieldName = 'Item'
    end
    object tTalaoGradeTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoGradeQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
    object tTalaoGradelkTamanho: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTamanho'
      LookupDataSet = tGradeItem
      LookupKeyFields = 'CodGrade;Posicao'
      LookupResultField = 'Tamanho'
      KeyFields = 'CodGrade;Posicao'
      Size = 3
      Lookup = True
    end
  end
  object dsTalaoGrade: TDataSource
    DataSet = tTalaoGrade
    Left = 166
    Top = 31
  end
  object tTalaoMov: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Talao;Setor'
    MasterFields = 'Lote;Talao'
    MasterSource = dsTalaoGrade
    TableName = 'dbTalaoMov.db'
    Left = 197
    Top = 31
    object tTalaoMovLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMovTalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMovSetor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMovDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMovHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMovDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMovHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMovCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tTalaoMovlkSetor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkSetor'
      LookupDataSet = DM1.tSetor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Setor'
      Size = 15
      Lookup = True
    end
    object tTalaoMovlkAtelier: TStringField
      FieldKind = fkLookup
      FieldName = 'lkAtelier'
      LookupDataSet = DM1.tAtelier
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Atelier'
      KeyFields = 'CodAtelier'
      Size = 30
      Lookup = True
    end
  end
  object dsTalaoMov: TDataSource
    DataSet = tTalaoMov
    Left = 212
    Top = 31
  end
  object tGradeItem: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbGradeItem.DB'
    Left = 246
    Top = 31
    object tGradeItemCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tGradeItemPosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tGradeItemTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 3
    end
  end
  object tPedidoItem: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Pedido'
    MasterFields = 'Pedido'
    MasterSource = dsPedido
    TableName = 'dbPedidoItem.DB'
    Left = 283
    Top = 31
    object tPedidoItemPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object tPedidoItemItem: TIntegerField
      FieldName = 'Item'
    end
    object tPedidoItemQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object tPedidoItemCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object tPedidoItemCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tPedidoItemCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tPedidoItemQtdParesFat: TFloatField
      FieldName = 'QtdParesFat'
    end
    object tPedidoItemQtdParesRest: TFloatField
      FieldName = 'QtdParesRest'
    end
    object tPedidoItemPreco: TFloatField
      FieldName = 'Preco'
    end
    object tPedidoItemVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tPedidoItemCodCabedal1: TIntegerField
      FieldName = 'CodCabedal1'
    end
    object tPedidoItemCodCabedal2: TIntegerField
      FieldName = 'CodCabedal2'
    end
    object tPedidoItemCodCorForro: TIntegerField
      FieldName = 'CodCorForro'
    end
    object tPedidoItemCodCorSolado: TIntegerField
      FieldName = 'CodCorSolado'
    end
    object tPedidoItemCodCorPalmilha: TIntegerField
      FieldName = 'CodCorPalmilha'
    end
    object tPedidoItemCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tPedidoItemCopiado: TBooleanField
      FieldName = 'Copiado'
    end
    object tPedidoItemSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tPedidoItemQtdParesCanc: TFloatField
      FieldName = 'QtdParesCanc'
    end
    object tPedidoItemCodForro: TIntegerField
      FieldName = 'CodForro'
    end
    object tPedidoItemCodEtiqueta: TIntegerField
      FieldName = 'CodEtiqueta'
    end
    object tPedidoItemVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tPedidoItemCodSolado: TIntegerField
      FieldName = 'CodSolado'
    end
    object tPedidoItemSitTrib: TSmallintField
      FieldName = 'SitTrib'
    end
    object tPedidoItemQtdFatAut: TFloatField
      FieldName = 'QtdFatAut'
    end
    object tPedidoItemQtdFatMan: TFloatField
      FieldName = 'QtdFatMan'
    end
    object tPedidoItemCodTaloneira: TIntegerField
      FieldName = 'CodTaloneira'
    end
    object tPedidoItemCodCorTaloneira: TIntegerField
      FieldName = 'CodCorTaloneira'
    end
    object tPedidoItemCodPalmilha: TIntegerField
      FieldName = 'CodPalmilha'
    end
    object tPedidoItemInvoice: TStringField
      FieldName = 'Invoice'
      Size = 8
    end
    object tPedidoItemLoteGer: TBooleanField
      FieldName = 'LoteGer'
    end
    object tPedidoItemlkReferencia: TStringField
      FieldKind = fkLookup
      FieldName = 'lkReferencia'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Referencia'
      KeyFields = 'CodProduto'
      Size = 8
      Lookup = True
    end
    object tPedidoItemlkCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCor'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 15
      Lookup = True
    end
    object tPedidoItemlkDescMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkDescMaterial'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'DescMaterial'
      KeyFields = 'CodProduto'
      Size = 10
      Lookup = True
    end
  end
  object dsPedidoItem: TDataSource
    DataSet = tPedidoItem
    Left = 294
    Top = 31
  end
  object tTalaoMov2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Talao'
    MasterFields = 'Lote;Item'
    MasterSource = dsTalao
    TableName = 'dbTalaoMov.DB'
    Left = 275
    Top = 142
    object tTalaoMov2Lote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMov2Talao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMov2Setor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMov2DataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMov2HoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMov2DataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMov2HoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMov2CodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tTalaoMov2lkSetor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkSetor'
      LookupDataSet = DM1.tSetor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Setor'
      Size = 15
      Lookup = True
    end
    object tTalaoMov2lkAtelier: TStringField
      FieldKind = fkLookup
      FieldName = 'lkAtelier'
      LookupDataSet = DM1.tAtelier
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Atelier'
      KeyFields = 'CodAtelier'
      Size = 30
      Lookup = True
    end
  end
  object dsTalaoMov2: TDataSource
    DataSet = tTalaoMov2
    Left = 288
    Top = 144
  end
end
