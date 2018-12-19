object fConsTalaoAuxiliar: TfConsTalaoAuxiliar
  Left = 108
  Top = 185
  Width = 791
  Height = 387
  Caption = 'Consulta Tal'#227'o Auxiliar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 81
    Width = 783
    Height = 196
    Align = alClient
    DataSource = dsConsTalaoAux
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
    ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Lote'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Talao'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Setor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdPares'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pedido'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ItemPedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtEntrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrEntrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtSaida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrSaida'
        Visible = True
      end>
  end
  object VDBGrid1: TVDBGrid
    Left = 0
    Top = 277
    Width = 783
    Height = 83
    Align = alBottom
    DataSource = dsTalaoAuxiliarGrade
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Vertical = True
    DefaultColWidth = 52
    TitlesWidth = 57
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'Tamanho'
        Title.Alignment = taCenter
        Title.Caption = 'Tam.'
        Title.Color = clMenu
      end
      item
        Alignment = taCenter
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde.'
        Title.Color = clMenu
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 81
    Align = alTop
    TabOrder = 2
    object Shape1: TShape
      Left = 584
      Top = 16
      Width = 33
      Height = 17
      Brush.Color = clYellow
    end
    object Shape2: TShape
      Left = 584
      Top = 34
      Width = 33
      Height = 17
      Brush.Color = clTeal
    end
    object Label5: TLabel
      Left = 624
      Top = 16
      Width = 80
      Height = 13
      Caption = 'Entrada no Setor'
    end
    object Label6: TLabel
      Left = 624
      Top = 32
      Width = 49
      Height = 13
      Caption = 'Encerrado'
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 0
      Width = 185
      Height = 73
      Caption = 'Data de Entrada...'
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 49
        Width = 64
        Height = 16
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 9
        Top = 24
        Width = 69
        Height = 16
        Caption = 'Data Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DateEdit1: TDateEdit
        Left = 80
        Top = 18
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit2: TDateEdit
        Left = 80
        Top = 44
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 192
      Top = 0
      Width = 185
      Height = 73
      Caption = 'Data de Sa'#237'da...'
      TabOrder = 1
      object Label3: TLabel
        Left = 14
        Top = 49
        Width = 64
        Height = 16
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 9
        Top = 24
        Width = 69
        Height = 16
        Caption = 'Data Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DateEdit3: TDateEdit
        Left = 80
        Top = 18
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit4: TDateEdit
        Left = 80
        Top = 44
        Width = 89
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 384
      Top = 0
      Width = 105
      Height = 73
      Caption = 'Situa'#231#227'o...'
      ItemIndex = 2
      Items.Strings = (
        'Pendente'
        'Encerrado'
        'Todos')
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 494
      Top = 21
      Width = 81
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 494
      Top = 48
      Width = 81
      Height = 25
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 697
      Top = 48
      Width = 81
      Height = 25
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
  end
  object qConsTalaoAux: TQuery
    DatabaseName = 'Lotus'
    SQL.Strings = (
      
        'select dbTalaoAuxiliar.Lote, dbTalaoAuxiliar.Talao, dbTalaoAuxil' +
        'iar.CodSetor, dbTalaoAuxiliar.CodGrade, dbSetor.Nome as Setor, d' +
        'bProduto.Referencia,'
      
        'dbTalaoAuxiliar.QtdPares, dbCor.Nome as Cor, dbTalaoAuxiliar.Ped' +
        'ido,  dbTalaoAuxiliar.ItemPedido,'
      
        'dbTalaoAuxiliar.DtEntrada, dbTalaoAuxiliar.HrEntrada, dbTalaoAux' +
        'iliar.DtSaida, dbTalaoAuxiliar.HrSaida'
      'from "dbTalaoAuxiliar.db" dbTalaoAuxiliar'
      
        'left join "dbSetor.db" dbSetor on (dbSetor.Codigo = dbTalaoAuxil' +
        'iar.CodSetor)'
      
        'left join "dbProduto.db" dbProduto on (dbProduto.Codigo = dbTala' +
        'oAuxiliar.CodProduto)'
      
        'left join "dbCor.db" dbCor on (dbCor.Codigo = dbTalaoAuxiliar.Co' +
        'dCor)'
      'WHERE 0 = 0 ')
    Left = 160
    Top = 224
    object qConsTalaoAuxLote: TIntegerField
      FieldName = 'Lote'
    end
    object qConsTalaoAuxTalao: TIntegerField
      FieldName = 'Talao'
    end
    object qConsTalaoAuxCodSetor: TIntegerField
      FieldName = 'CodSetor'
      Visible = False
    end
    object qConsTalaoAuxCodGrade: TIntegerField
      FieldName = 'CodGrade'
      Visible = False
    end
    object qConsTalaoAuxSetor: TStringField
      FieldName = 'Setor'
      Size = 15
    end
    object qConsTalaoAuxReferencia: TStringField
      FieldName = 'Referencia'
      Size = 8
    end
    object qConsTalaoAuxQtdPares: TIntegerField
      FieldName = 'QtdPares'
    end
    object qConsTalaoAuxCor: TStringField
      FieldName = 'Cor'
      Size = 15
    end
    object qConsTalaoAuxPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object qConsTalaoAuxItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object qConsTalaoAuxDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object qConsTalaoAuxHrEntrada: TTimeField
      FieldName = 'HrEntrada'
    end
    object qConsTalaoAuxDtSaida: TDateField
      FieldName = 'DtSaida'
    end
    object qConsTalaoAuxHrSaida: TTimeField
      FieldName = 'HrSaida'
    end
  end
  object dsConsTalaoAux: TDataSource
    DataSet = qConsTalaoAux
    Left = 192
    Top = 224
  end
  object tTalaoAuxiliarGrade: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;CodSetor;CodGrade;Posicao'
    MasterFields = 'Lote;CodSetor'
    MasterSource = dsConsTalaoAux
    TableName = 'dbTalaoAuxiliarGrade.db'
    Left = 163
    Top = 305
    object tTalaoAuxiliarGradeLote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoAuxiliarGradeCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object tTalaoAuxiliarGradeCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tTalaoAuxiliarGradePosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object tTalaoAuxiliarGradeQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tTalaoAuxiliarGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
  end
  object dsTalaoAuxiliarGrade: TDataSource
    DataSet = tTalaoAuxiliarGrade
    Left = 193
    Top = 305
  end
end
