object fConsEstoqueOC: TfConsEstoqueOC
  Left = 191
  Top = 95
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Estoque das Ordens de Compras Pendentes'
  ClientHeight = 494
  ClientWidth = 777
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
  object Label1: TLabel
    Left = 0
    Top = 10
    Width = 40
    Height = 13
    Caption = 'Material:'
  end
  object Label2: TLabel
    Left = 21
    Top = 29
    Width = 19
    Height = 13
    Caption = 'Cor:'
  end
  object Edit1: TEdit
    Left = 42
    Top = 6
    Width = 431
    Height = 17
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 42
    Top = 25
    Width = 231
    Height = 17
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ReadOnly = True
    TabOrder = 1
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 56
    Width = 777
    Height = 436
    DataSource = dsqOCPendente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' OC'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Width = 39
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Dt.Emiss'#227'o'
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEntrega'
        Title.Alignment = taCenter
        Title.Caption = 'Dt.Entrega'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VlrUnitario'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr.Unit'#225'rio'
        Width = 69
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.OC'
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdEntregue'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.Entregue'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QtdRestante'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.Restante'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeFornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Fornecedor'
        Visible = True
      end>
  end
  object BitBtn6: TBitBtn
    Left = 677
    Top = 11
    Width = 90
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  object qOCPendente: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbordemcompra.CodFornecedor, Dbordemcompra.DtEmissao, Dbo' +
        'rdemcompraitem.CodMaterial, Dbordemcompraitem.Item, Dbordemcompr' +
        'a.Codigo, Dbordemcompraitem.CodCor, Dbordemcompraitem.Qtd, Dbord' +
        'emcompraitem.VlrUnitario, Dbordemcompraitem.DtEntrega, Dbordemco' +
        'mpraitem.QtdEntregue, Dbordemcompraitem.QtdRestante'
      'FROM "dbOrdemCompraItem.DB" Dbordemcompraitem'
      '   INNER JOIN "dbOrdemCompra.DB" Dbordemcompra'
      '   ON  (Dbordemcompra.Codigo = Dbordemcompraitem.Codigo)  '
      'WHERE   (Dbordemcompraitem.QtdRestante > 0)  '
      '   AND  (Dbordemcompraitem.CodMaterial = :CodMaterial)  '
      '   AND  (Dbordemcompraitem.CodCor = :CodCor)  ')
    Left = 440
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodMaterial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodCor'
        ParamType = ptUnknown
      end>
    object qOCPendenteCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
      Origin = 'TABELAS."dbOrdemCompra.DB".CodFornecedor'
    end
    object qOCPendenteDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbOrdemCompra.DB".DtEmissao'
    end
    object qOCPendenteCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".CodMaterial'
    end
    object qOCPendenteItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".Item'
    end
    object qOCPendenteCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbOrdemCompra.DB".Codigo'
    end
    object qOCPendenteCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".CodCor'
    end
    object qOCPendenteQtd: TFloatField
      FieldName = 'Qtd'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".Qtd'
    end
    object qOCPendenteVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".VlrUnitario'
    end
    object qOCPendenteDtEntrega: TDateField
      FieldName = 'DtEntrega'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".DtEntrega'
    end
    object qOCPendenteQtdEntregue: TFloatField
      FieldName = 'QtdEntregue'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".QtdEntregue'
    end
    object qOCPendenteQtdRestante: TFloatField
      FieldName = 'QtdRestante'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".QtdRestante'
    end
    object qOCPendentelkNomeFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeFornecedor'
      LookupDataSet = DM1.tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'NomeForn'
      KeyFields = 'CodFornecedor'
      Size = 40
      Lookup = True
    end
  end
  object dsqOCPendente: TDataSource
    DataSet = qOCPendente
    Left = 464
    Top = 112
  end
end
