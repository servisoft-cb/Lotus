object fProgramacaoOrdem: TfProgramacaoOrdem
  Left = 10
  Top = 16
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Programa'#231#227'o'
  ClientHeight = 506
  ClientWidth = 772
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
    Width = 772
    Height = 506
    Align = alClient
    TabOrder = 0
    object RxLabel5: TRxLabel
      Left = 422
      Top = 53
      Width = 85
      Height = 13
      Caption = 'Pedido Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel6: TRxLabel
      Left = 539
      Top = 53
      Width = 27
      Height = 13
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel7: TRxLabel
      Left = 600
      Top = 53
      Width = 28
      Height = 13
      Caption = 'Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 664
      Top = 6
      Width = 103
      Height = 33
      TabOrder = 6
      object BitBtn5: TBitBtn
        Left = 5
        Top = 4
        Width = 94
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn5Click
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
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 392
      Height = 89
      Caption = 'Consulta os pedidos pendentes por....'
      TabOrder = 0
      object RxLabel3: TRxLabel
        Left = 5
        Top = 22
        Width = 80
        Height = 13
        Caption = 'Dt.Embarque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel1: TRxLabel
        Left = 33
        Top = 47
        Width = 52
        Height = 13
        Caption = 'Carimbo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel4: TRxLabel
        Left = 211
        Top = 22
        Width = 10
        Height = 13
        Caption = #224
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DateEdit1: TDateEdit
        Left = 85
        Top = 13
        Width = 109
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 85
        Top = 38
        Width = 266
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 3
        OnExit = Edit1Exit
      end
      object DateEdit2: TDateEdit
        Left = 242
        Top = 13
        Width = 109
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object BitBtn3: TBitBtn
        Left = 355
        Top = 11
        Width = 31
        Height = 23
        Hint = 
          'Consulta os pedidos pendentes de programa'#231#227'o pela data de embarq' +
          'ue'
        TabOrder = 2
        OnClick = BitBtn3Click
        Glyph.Data = {
          36050000424D360500000000000036040000280000000E000000100000000100
          08000000000000010000CA0E0000C30E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000ACACACACACAC
          ACACACAC0000ACAC0000ACACACACACACACACAC02230500AC0000ACAC00000000
          00000223050500000000ACAC56ACACACAC02230505ACAC000000ACAC56D7D7D7
          02230505ACD7AC000000ACAC56000056AC0505ACD7D7AC000000AC56AC23AC00
          5656ACD7D7D7AC00000056D723AC23AC00ACD7D7D7D7AC0000005623D723AC23
          00ACD7D7D7D7AC00000056D723D723AC00ACD7D7D7D7AC000000AC56D723D700
          ACD7D7D7D7D7AC000000ACAC565600ACD7D7D7D7D7D7AC000000ACAC56D7D7D7
          D7D7D7D700000000FFFFACAC56D7D7D7D7D7D7D7ACD756AC0000ACAC56D7D7D7
          D7D7D7D7AC56ACAC0000ACAC565656565656565656ACACAC0000}
      end
      object BitBtn4: TBitBtn
        Left = 355
        Top = 37
        Width = 31
        Height = 23
        Hint = 'Consulta os pedidos pendentes de programa'#231#227'o pelo carimbo'
        TabOrder = 4
        OnClick = BitBtn4Click
        Glyph.Data = {
          36050000424D360500000000000036040000280000000E000000100000000100
          08000000000000010000CA0E0000C30E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000ACACACACACAC
          ACACACAC0000ACAC0000ACACACACACACACACAC02230500AC0000ACAC00000000
          00000223050500000000ACAC56ACACACAC02230505ACAC000000ACAC56D7D7D7
          02230505ACD7AC000000ACAC56000056AC0505ACD7D7AC000000AC56AC23AC00
          5656ACD7D7D7AC00000056D723AC23AC00ACD7D7D7D7AC0000005623D723AC23
          00ACD7D7D7D7AC00000056D723D723AC00ACD7D7D7D7AC000000AC56D723D700
          ACD7D7D7D7D7AC000000ACAC565600ACD7D7D7D7D7D7AC000000ACAC56D7D7D7
          D7D7D7D700000000FFFFACAC56D7D7D7D7D7D7D7ACD756AC0000ACAC56D7D7D7
          D7D7D7D7AC56ACAC0000ACAC565656565656565656ACACAC0000}
      end
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 406
      Top = 69
      Width = 83
      Height = 21
      AutoSize = False
      Color = clAqua
      DisplayFormat = '0'
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 488
      Top = 69
      Width = 33
      Height = 21
      CharCase = ecUpperCase
      Color = clAqua
      MaxLength = 2
      TabOrder = 2
    end
    object BitBtn7: TBitBtn
      Left = 646
      Top = 67
      Width = 30
      Height = 24
      Hint = 'Confirma o pedido para a programa'#231#227'o'
      TabOrder = 5
      OnClick = BitBtn7Click
      Glyph.Data = {
        5A010000424D5A01000000000000760000002800000012000000130000000100
        040000000000E4000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778877777
        7777770000007777844877777777770000007778444487777777770000007784
        4444487777777700000078444C4444877777770000007444C4C4448777777700
        00007C4C444C444877777700000078C44444C4448777770000008444C4444C44
        487777000000444C7C4448C4448777000000C4C777C4448C4448770000007C77
        777C4448C4448700000077777777C4448C4487000000777777777C4448C44700
        00007777777777C4448C7700000077777777777C444877000000777777777777
        C448770000007777777777777C447700000077777777777777C777000000}
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 98
      Width = 761
      Height = 403
      ActivePage = TabSheet1
      TabOrder = 7
      object TabSheet1: TTabSheet
        Caption = 'Mercado Interno'
        object RxDBGrid1: TRxDBGrid
          Left = 2
          Top = 1
          Width = 749
          Height = 372
          TabStop = False
          DataSource = dsqPedidoPend
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'PedidoCliente'
              Title.Alignment = taCenter
              Title.Caption = 'Pedido Cliente'
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clAqua
              Expanded = False
              FieldName = 'PedCliDif'
              Title.Alignment = taCenter
              Title.Caption = 'Dig.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeCliente'
              Title.Alignment = taCenter
              Title.Caption = 'Cliente'
              Width = 214
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtEmissao'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Emiss'#227'o'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtIniEmbarque'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Embarq.Inicial'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DtFinEmbarque'
              Title.Alignment = taCenter
              Title.Caption = 'Dt.Embarq.Final'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Carimbo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeCompania'
              Title.Caption = 'Compania'
              Width = 227
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Pedido'
              Title.Alignment = taCenter
              Width = 57
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Exporta'#231#227'o'
        ImageIndex = 1
        object RxDBGrid2: TRxDBGrid
          Left = 2
          Top = 9
          Width = 749
          Height = 372
          TabStop = False
          DataSource = dsqLotePend
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PedidoCliente'
              Title.Alignment = taCenter
              Title.Caption = 'Ped.Cliente'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PedCliDif'
              Title.Alignment = taCenter
              Title.Caption = 'Dig.'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Referencia'
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeCor'
              Title.Alignment = taCenter
              Title.Caption = 'Cor'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Lote'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdPares'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd.Pares'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'Item'
              Title.Alignment = taCenter
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
            end
            item
              Expanded = False
              FieldName = 'Carimbo'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeCliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeCompania'
              Title.Alignment = taCenter
              Title.Caption = 'Compania'
              Visible = True
            end>
        end
      end
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 523
      Top = 69
      Width = 60
      Height = 21
      AutoSize = False
      Color = clAqua
      DisplayFormat = '0'
      TabOrder = 3
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 584
      Top = 69
      Width = 60
      Height = 21
      AutoSize = False
      Color = clAqua
      DisplayFormat = '0'
      TabOrder = 4
    end
  end
  object qPedidoPend: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbpedido.Pedido, Dbcliente.Nome NomeCliente, Dbpedido.DtE' +
        'missao, Dbpedido.DtIniEmbarque, Dbpedido.DtFinEmbarque, Dbpedido' +
        '.PedidoCliente, Dbpedido.PedCliDif, Dbpedido.Carimbo, Dbcliente_' +
        '1.Nome NomeCompania'
      'FROM "dbPedido.DB" Dbpedido'
      '   INNER JOIN "DBCLIENTE.DB" Dbcliente'
      '   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)  '
      '   FULL OUTER JOIN "DBCLIENTE.DB" Dbcliente_1'
      '   ON  (Dbpedido.CodCompania = Dbcliente_1.Codigo)  '
      'WHERE   (Dbpedido.CodCompania = 3)  '
      '   AND  (Dbpedido.Cancelado <> TRUE)  '
      '   AND  (Dbpedido.Suspenso <> TRUE)  '
      '   AND  (Dbpedido.QtdParesFat < 1)  '
      
        '   AND  ((Dbpedido.NumProgramacao IS NULL)  or (Dbpedido.NumProg' +
        'ramacao = 0))'
      
        '   AND  ((Dbpedido.LoteExp IS NULL)  or (Dbpedido.LoteExp = Fals' +
        'e))'
      
        'ORDER BY Dbpedido.DtFinEmbarque, Dbpedido.PedidoCliente, Dbpedid' +
        'o.PedCliDif')
    Left = 352
    Top = 136
    object qPedidoPendPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qPedidoPendNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object qPedidoPendDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object qPedidoPendDtIniEmbarque: TDateField
      FieldName = 'DtIniEmbarque'
    end
    object qPedidoPendDtFinEmbarque: TDateField
      FieldName = 'DtFinEmbarque'
    end
    object qPedidoPendPedidoCliente: TIntegerField
      FieldName = 'PedidoCliente'
    end
    object qPedidoPendPedCliDif: TStringField
      FieldName = 'PedCliDif'
      Size = 2
    end
    object qPedidoPendCarimbo: TStringField
      FieldName = 'Carimbo'
    end
    object qPedidoPendNomeCompania: TStringField
      FieldName = 'NomeCompania'
      Size = 40
    end
  end
  object dsqPedidoPend: TDataSource
    DataSet = qPedidoPend
    Left = 368
    Top = 136
  end
  object qLotePend: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbpedido.PedidoCliente, Dbpedido.PedCliDif, Dbproduto.Ref' +
        'erencia, Dblote.Lote, Dbcor.Nome NomeCor, Dblote.QtdPares, Dbped' +
        'idoitem.Item, Dbpedido.DtIniEmbarque, Dbcliente.Nome NomeCliente' +
        ', Dbpedido.DtFinEmbarque, Dbpedido.Carimbo, Dbpedido.CodCompania'
      'FROM "dbPedido.DB" Dbpedido'
      '   INNER JOIN "dbPedidoItem.DB" Dbpedidoitem'
      '   ON  (Dbpedido.Pedido = Dbpedidoitem.Pedido)  '
      '   INNER JOIN "DBCLIENTE.DB" Dbcliente'
      '   ON  (Dbpedido.CodCliente = Dbcliente.Codigo)  '
      '   INNER JOIN "dbLote.DB" Dblote'
      '   ON  (Dbpedidoitem.Pedido = Dblote.NroPedido)  '
      '   AND  (Dbpedidoitem.Item = Dblote.ItemPed)  '
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbpedidoitem.CodProduto = Dbproduto.Codigo)  '
      '   INNER JOIN Dbcor Dbcor'
      '   ON  (Dbpedidoitem.CodCor = Dbcor.Codigo)  '
      'WHERE  (Dbpedido.Cancelado <> TRUE)  '
      '   AND  (Dbpedido.Suspenso <> TRUE)  '
      '   AND  (Dbpedido.LoteExp = True)'
      '   AND  (DbpedidoItem.QtdParesFat < 1)  '
      '   AND  (DbpedidoItem.Cancelado <> True)  '
      '   AND  (DbLote.NumProgramacao < 1)'
      ''
      ''
      '')
    Left = 504
    Top = 184
    object qLotePendPedidoCliente: TIntegerField
      FieldName = 'PedidoCliente'
    end
    object qLotePendPedCliDif: TStringField
      FieldName = 'PedCliDif'
      Size = 2
    end
    object qLotePendReferencia: TStringField
      FieldName = 'Referencia'
      Size = 8
    end
    object qLotePendLote: TIntegerField
      FieldName = 'Lote'
    end
    object qLotePendQtdPares: TFloatField
      FieldName = 'QtdPares'
    end
    object qLotePendItem: TIntegerField
      FieldName = 'Item'
    end
    object qLotePendDtIniEmbarque: TDateField
      FieldName = 'DtIniEmbarque'
    end
    object qLotePendDtFinEmbarque: TDateField
      FieldName = 'DtFinEmbarque'
    end
    object qLotePendCarimbo: TStringField
      FieldName = 'Carimbo'
    end
    object qLotePendCodCompania: TIntegerField
      FieldName = 'CodCompania'
    end
    object qLotePendNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 15
    end
    object qLotePendNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object qLotePendlkNomeCompania: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCompania'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCompania'
      Size = 40
      Lookup = True
    end
  end
  object dsqLotePend: TDataSource
    DataSet = qLotePend
    Left = 528
    Top = 184
  end
end
