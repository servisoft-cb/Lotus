object fConfirmaProduto: TfConfirmaProduto
  Left = 160
  Top = 166
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Confirma Cadastro do Produto'
  ClientHeight = 453
  ClientWidth = 688
  Color = clMoneyGreen
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
    Width = 688
    Height = 27
    Align = alTop
    Color = clMoneyGreen
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Produto:'
    end
    object DBEdit1: TDBEdit
      Left = 47
      Top = 3
      Width = 66
      Height = 21
      Color = clInfoBk
      DataField = 'Codigo'
      DataSource = DM1.dsProduto
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 114
      Top = 3
      Width = 386
      Height = 21
      Color = clInfoBk
      DataField = 'Nome'
      DataSource = DM1.dsProduto
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 40
    Width = 137
    Height = 28
    Caption = 'Confirma Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object SMDBGrid1: TSMDBGrid
    Left = 203
    Top = 27
    Width = 485
    Height = 426
    Align = alRight
    DataSource = dsmPedidoAlterado
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
    ColCount = 7
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pedido'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Pedido'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Width = 29
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tipo'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Lote'
        Width = 85
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Lote'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Lote'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cor'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Width = 180
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 67
    Width = 137
    Height = 28
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object qPedidoItem: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Pedido, Item, CodProduto, CodCor'
      'FROM "dbPedidoItem.DB" Dbpedidoitem'
      'WHERE  CodProduto = :CodProduto'
      'ORDER BY Pedido, Item, CodProduto, CodCor')
    Left = 264
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodProduto'
        ParamType = ptUnknown
      end>
    object qPedidoItemPedido: TIntegerField
      FieldName = 'Pedido'
      Origin = 'TABELAS."dbPedidoItem.DB".Pedido'
    end
    object qPedidoItemItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbPedidoItem.DB".Item'
    end
    object qPedidoItemCodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'TABELAS."dbPedidoItem.DB".CodProduto'
    end
    object qPedidoItemCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbPedidoItem.DB".CodCor'
    end
  end
  object mPedidoAlterado: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'CodProduto'
        DataType = ftInteger
      end
      item
        Name = 'CodCor'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Lote'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 248
    Data = {
      7E0000009619E0BD0100000018000000060000000000030000007E0006506564
      69646F0400010000000000044974656D04000100000000000A436F6450726F64
      75746F040001000000000006436F64436F720400010000000000045469706F01
      00490000000100055749445448020002000C00044C6F74650400010000000000
      0000}
    object mPedidoAlteradoPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object mPedidoAlteradoItem: TIntegerField
      FieldName = 'Item'
    end
    object mPedidoAlteradoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object mPedidoAlteradoCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object mPedidoAlteradolkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Lookup = True
    end
    object mPedidoAlteradoTipo: TStringField
      FieldName = 'Tipo'
      Size = 12
    end
    object mPedidoAlteradoLote: TIntegerField
      FieldName = 'Lote'
    end
  end
  object dsmPedidoAlterado: TDataSource
    DataSet = mPedidoAlterado
    Left = 472
    Top = 248
  end
  object qTalao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT CodProduto, Item, Lote, CodCor'
      'FROM "dbTalao.DB" Dbtalao'
      'WHERE  CodProduto = :CodProduto'
      'ORDER BY Lote, Item, CodProduto, CodCor')
    Left = 264
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodProduto'
        ParamType = ptUnknown
      end>
    object qTalaoCodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'TABELAS."dbTalao.DB".CodProduto'
    end
    object qTalaoItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbTalao.DB".Item'
    end
    object qTalaoLote: TIntegerField
      FieldName = 'Lote'
      Origin = 'TABELAS."dbTalao.DB".Lote'
    end
    object qTalaoCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbTalao.DB".CodCor'
    end
  end
  object qTalaoMI: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Lote, CodProduto, Item, CodCor'
      'FROM "dbTalaoMI.DB" Dbtalaomi'
      'WHERE CodProduto = :CodProduto'
      'ORDER BY Lote, Item, CodProduto, CodCor ')
    Left = 264
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodProduto'
        ParamType = ptUnknown
      end>
    object qTalaoMILote: TIntegerField
      FieldName = 'Lote'
      Origin = 'TABELAS."dbTalaoMI.DB".Lote'
    end
    object qTalaoMICodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'TABELAS."dbTalaoMI.DB".CodProduto'
    end
    object qTalaoMIItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbTalaoMI.DB".Item'
    end
    object qTalaoMICodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbTalaoMI.DB".CodCor'
    end
  end
end
