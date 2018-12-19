object fConsLoteProdPend: TfConsLoteProdPend
  Left = 139
  Top = 198
  Width = 696
  Height = 388
  Caption = 'Consulta Lote (Produzidos / Pendentes)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 4
    Width = 681
    Height = 32
  end
  object Label1: TLabel
    Left = 8
    Top = 19
    Width = 68
    Height = 13
    Caption = 'Lote Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 19
    Width = 61
    Height = 13
    Caption = 'Lote Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SMDBGrid1: TSMDBGrid
    Left = 3
    Top = 40
    Width = 681
    Height = 297
    DataSource = dsConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    ColCount = 7
    RowCount = 2
  end
  object Edit1: TEdit
    Left = 81
    Top = 11
    Width = 73
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 232
    Top = 11
    Width = 73
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 312
    Top = 8
    Width = 57
    Height = 25
    Caption = 'Consultar'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn4: TBitBtn
    Left = 586
    Top = 8
    Width = 95
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BitBtn4Click
    Glyph.Data = {
      B6010000424DB601000000000000760000002800000022000000100000000100
      04000000000040010000CE0E0000C40E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
      03833333333333387F333300000083838383830E603833FFFFFFFF387F33FF00
      000000000000380E6600388888888F387F388300000033333330830E66033333
      33338F387F38F300000033333330000E6603333333FF88887F38F30000003333
      0030330E66033333388F8F387F38F300000033330E00330E660333FFF8F88F38
      7F38F300000000000EE0330E0603388888338F387F38F30000000EEEEEE6030E
      660338FFFFF378387F38F300000000000E60330E6603388888F78F387F38F300
      000033330600330E6603333338788F387F38F300000033330030330E66033333
      38838F387F38F3000000333333303330E603333333338F3387F8F30000003333
      333033330E03333333338FFFF878F30000003333333000000003333333338888
      8888330000003333333333333333333333333333333333000000}
    NumGlyphs = 2
  end
  object ProgressBar1: TProgressBar
    Left = 3
    Top = 340
    Width = 680
    Height = 16
    TabOrder = 5
  end
  object dsConsulta: TDataSource
    DataSet = mConsulta
    Left = 504
    Top = 192
  end
  object qrConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      '')
    Left = 424
    Top = 152
  end
  object mConsulta: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Lote'
    Params = <>
    Left = 464
    Top = 192
    Data = {
      9E0000009619E0BD0100000018000000060000000000030000009E00044C6F74
      6504000100000000000A5265666572656E636961010049000000010005574944
      5448020002001E0003436F720100490000000100055749445448020002001E00
      0A5175616E74696461646504000100000000000E5175616E7450726F64757A69
      646104000100000000000D5175616E7450656E64656E74650400010000000000
      0000}
    object mConsultaLote: TIntegerField
      DisplayWidth = 9
      FieldName = 'Lote'
    end
    object mConsultaReferencia: TStringField
      DisplayWidth = 23
      FieldName = 'Referencia'
      Size = 30
    end
    object mConsultaCor: TStringField
      DisplayWidth = 6
      FieldName = 'Cor'
      Size = 30
    end
    object mConsultaQuantidade: TIntegerField
      DisplayWidth = 24
      FieldName = 'Quantidade'
    end
    object mConsultaQuantProduzida: TIntegerField
      DisplayWidth = 33
      FieldName = 'QuantProduzida'
    end
    object mConsultaQuantPendente: TIntegerField
      DisplayWidth = 33
      FieldName = 'QuantPendente'
    end
  end
  object qLote: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) Qtd' +
        'Par'
      'FROM "dbTalaoMov.db" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)'
      '   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)'
      '   INNER JOIN "dbSetor.DB" Dbsetor'
      '   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)'
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalaograde.Lote = Dbtalao.Lote)'
      '   AND  (Dbtalaograde.Item = Dbtalao.Item)'
      '   INNER JOIN "dbLote.DB" Dblote'
      '   ON  (Dbtalao.Lote = Dblote.Lote)'
      'WHERE   (Dblote.NroPedido = :Pedido)'
      '   AND  (Dblote.Lote = :Lote)'
      '   AND  (Dbtalao.Item = :Item)'
      '   AND  (Dbtalaomov.DataSaida IS NOT NULL)'
      'GROUP BY Dbtalaomov.Setor')
    Left = 464
    Top = 153
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pedido'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Lote'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Item'
        ParamType = ptUnknown
        Value = 0
      end>
    object qLoteSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qLoteQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
  end
end
