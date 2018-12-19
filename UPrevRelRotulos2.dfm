object fPrevRelRotulos2: TfPrevRelRotulos2
  Left = 213
  Top = 57
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de R'#243'tulos - Impressora T'#233'rmica'
  ClientHeight = 535
  ClientWidth = 760
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
  object Panel3: TPanel
    Left = 571
    Top = 501
    Width = 180
    Height = 30
    BevelOuter = bvLowered
    TabOrder = 0
    object BitBtn6: TBitBtn
      Left = 10
      Top = 2
      Width = 80
      Height = 25
      Hint = 'Imprime os r'#243'tulos'
      Caption = '&Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn6Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777700000000000777707777777770707700000000000007070777777BBB77
        0007077777788877070700000000000007700777777777707070700000000007
        0700770FFFFFFFF070707770F00000F000077770FFFFFFFF077777770F00000F
        077777770FFFFFFFF07777777000000000777777777777777777}
    end
    object BitBtn1: TBitBtn
      Left = 92
      Top = 2
      Width = 80
      Height = 25
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  end
  object RzPageControl1: TRzPageControl
    Left = 8
    Top = 8
    Width = 753
    Height = 492
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Pedido'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 687
        Height = 188
        Caption = ' Pedidos '
        TabOrder = 0
        object SMDBGrid2: TSMDBGrid
          Left = 6
          Top = 23
          Width = 673
          Height = 156
          Color = clInfoBk
          DataSource = DM1.dsPedido
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 25
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 7
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Pedido'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PedidoCliente'
              Title.Caption = 'Pedido Cliente'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeCliente'
              Title.Caption = 'Nome Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DtEmissao'
              Title.Caption = 'Data Emiss'#227'o'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Situacao'
              Title.Caption = 'Situa'#231#227'o'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdPares'
              Title.Caption = 'Total de Pares'
              Width = 75
              Visible = True
            end>
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 190
        Width = 688
        Height = 279
        Caption = ' Itens do Pedido  '
        TabOrder = 1
        object SMDBGrid1: TSMDBGrid
          Left = 6
          Top = 23
          Width = 673
          Height = 249
          Color = clInfoBk
          DataSource = DM1.dsPedidoItem
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 25
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 6
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Item'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkReferencia'
              Title.Caption = 'Refer'#234'ncia'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkDescMaterial'
              Title.Caption = 'Material'
              Width = 251
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkCor'
              Title.Caption = 'Cor'
              Width = 143
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtdPares'
              Title.Caption = 'Qtd Pares'
              Width = 81
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Lotes Mercado Interno'
      object SMDBGrid3: TSMDBGrid
        Left = 5
        Top = 24
        Width = 188
        Height = 390
        DataSource = DM1.dsLoteMI
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 3
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Lote'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdPares'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pares'
            Width = 80
            Visible = True
          end>
      end
      object SMDBGrid4: TSMDBGrid
        Left = 197
        Top = 24
        Width = 548
        Height = 390
        DataSource = DM1.dsLotePedidoMI
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Pedido'
            Title.Alignment = taCenter
            Title.Caption = 'Ped. Interno'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkPedidoCliente'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Pedido Cliente'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 338
            Visible = True
          end>
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Exporta'#231#227'o'
      object SMDBGrid5: TSMDBGrid
        Left = 5
        Top = 24
        Width = 188
        Height = 390
        DataSource = DM1.dsLote
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 3
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Lote'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdPares'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pares'
            Width = 81
            Visible = True
          end>
      end
      object SMDBGrid6: TSMDBGrid
        Left = 197
        Top = 24
        Width = 548
        Height = 390
        DataSource = DM1.dsLotePedido
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Pedido'
            Title.Alignment = taCenter
            Title.Caption = 'Ped. Interno'
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkPedidoCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Ped. Cliente'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Width = 328
            Visible = True
          end>
      end
    end
  end
  object mPedidoAux: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Pedido'
        DataType = ftInteger
      end
      item
        Name = 'ItemPedido'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Pedido;ItemPedido'
    Params = <>
    StoreDefs = True
    Left = 433
    Top = 338
    Data = {
      3C0000009619E0BD0100000018000000020000000000030000003C0006506564
      69646F04000100000000000A4974656D50656469646F04000100000000000000}
    object mPedidoAuxPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object mPedidoAuxItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
  end
  object dsmPedidoAux: TDataSource
    DataSet = mPedidoAux
    Left = 457
    Top = 338
  end
  object tTalaoMI: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Item'
    TableName = 'dbTalaoMI.DB'
    Left = 505
    Top = 116
    object tTalaoMILote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMIItem: TIntegerField
      FieldName = 'Item'
    end
    object tTalaoMIItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object tTalaoMINumPedido: TIntegerField
      FieldName = 'NumPedido'
    end
  end
end
