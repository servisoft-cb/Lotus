object fPrevRelPedEmb: TfPrevRelPedEmb
  Left = 209
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Pedidos Embarcados'
  ClientHeight = 156
  ClientWidth = 352
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 156
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 190
      Top = 37
      Width = 51
      Height = 13
      Caption = 'N'#186' Pedido:'
    end
    object Label2: TLabel
      Left = 27
      Top = 80
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label3: TLabel
      Left = 190
      Top = 80
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Edit1: TEdit
      Left = 245
      Top = 29
      Width = 95
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object DateEdit1: TDateEdit
      Left = 85
      Top = 72
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 245
      Top = 72
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 25
      Top = 103
      Width = 303
      Height = 40
      TabOrder = 3
      object RxSpeedButton1: TRxSpeedButton
        Left = 8
        Top = 7
        Width = 95
        Height = 25
        Hint = 'Imprime o relat'#243'rio cfe. sele'#231#227'o acima'
        DropDownMenu = PopupMenu1
        Caption = 'Imprimir'
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
        Layout = blGlyphLeft
      end
      object BitBtn2: TBitBtn
        Left = 103
        Top = 7
        Width = 95
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 0
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
        Left = 199
        Top = 7
        Width = 95
        Height = 25
        Caption = 'Fechar'
        TabOrder = 1
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
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 177
      Height = 57
      Caption = ' Tipo de Mercado '
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Interno'
        'Exporta'#231#227'o'
        'Ambos')
      TabOrder = 4
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 24
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir1Click
    end
    object Visualizar1: TMenuItem
      Caption = '&Visualizar'
      OnClick = Visualizar1Click
    end
  end
  object qPedidoNota: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbpedidonota.Pedido, Dbpedidonota.DtNota, SUM(Db' +
        'pedidonota.QtdPares) QtdPares, Dbproduto.Referencia, Dbcor.Nome,' +
        ' Dbcliente.Nome'
      'FROM "dbPedidoNota.DB" Dbpedidonota'
      '   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem'
      '   ON  (Dbpedidonota.Pedido = Dbpedidoitem.Pedido)  '
      '   AND  (Dbpedidonota.Item = Dbpedidoitem.Item)  '
      '   INNER JOIN "dbPedido.DB" Dbpedido'
      '   ON  (Dbpedidonota.Pedido = Dbpedido.Pedido)  '
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)  '
      '   INNER JOIN "Dbcor.DB" Dbcor'
      '   ON  (Dbpedidoitem.CodCor = Dbcor.Codigo)  '
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)  '
      
        'WHERE (DbpedidoNota.DtNota BETWEEN :D1 AND :D2) AND (Dbpedidonot' +
        'a.Pedido = :P1)'
      
        'GROUP BY Dbpedidonota.Pedido, Dbpedidonota.DtNota, Dbproduto.Ref' +
        'erencia, Dbcor.Nome, Dbcliente.Nome'
      
        'ORDER BY Dbpedidonota.DtNota, Dbpedidonota.Pedido, Dbproduto.Ref' +
        'erencia, Dbcor.Nome')
    Left = 128
    Top = 24
    ParamData = <
      item
        DataType = ftDate
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'D2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'P1'
        ParamType = ptUnknown
      end>
    object qPedidoNotaPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qPedidoNotaDtNota: TDateField
      FieldName = 'DtNota'
    end
    object qPedidoNotaReferencia: TStringField
      FieldName = 'Referencia'
      Size = 8
    end
    object qPedidoNotaNome: TStringField
      FieldName = 'Nome'
      Size = 15
    end
    object qPedidoNotaNome_1: TStringField
      FieldName = 'Nome_1'
      Size = 40
    end
    object qPedidoNotaQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
  end
  object qsPedidoNota: TDataSource
    DataSet = qPedidoNota
    Left = 152
    Top = 24
  end
end
