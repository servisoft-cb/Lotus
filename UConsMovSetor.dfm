object fConsMovSetor: TfConsMovSetor
  Left = 11
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Mov. Setor'
  ClientHeight = 434
  ClientWidth = 762
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
  object Label1: TLabel
    Left = 24
    Top = 11
    Width = 28
    Height = 13
    Caption = 'Setor:'
  end
  object Label2: TLabel
    Left = 5
    Top = 33
    Width = 47
    Height = 13
    Caption = 'Dt. Inicial:'
  end
  object Label3: TLabel
    Left = 181
    Top = 33
    Width = 42
    Height = 13
    Caption = 'Dt. Final:'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 54
    Width = 762
    Height = 2
    Align = alBottom
    Shape = bsTopLine
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 22
    Width = 75
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
    Left = 478
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 53
    Top = 3
    Width = 273
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsSetor
    TabOrder = 0
    OnEnter = RxDBLookupCombo1Enter
  end
  object DateEdit1: TDateEdit
    Left = 53
    Top = 25
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object DateEdit2: TDateEdit
    Left = 226
    Top = 25
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn3: TBitBtn
    Left = 403
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object ProgressBar1: TProgressBar
    Left = 328
    Top = 2
    Width = 360
    Height = 17
    TabOrder = 6
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 56
    Width = 762
    Height = 378
    ActivePage = TabSheet2
    Align = alBottom
    TabIndex = 1
    TabOrder = 7
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Acumulado'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 758
        Height = 355
        Align = alClient
        DataSource = dsmConsulta
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
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'Referencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeProduto'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Width = 333
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtd'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 117
            Visible = True
          end>
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Detalhado'
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 0
        Width = 758
        Height = 355
        Align = alClient
        DataSource = dsmDetalhado
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
        ColCount = 12
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Lote'
            Title.Alignment = taCenter
            Width = 56
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Talao'
            Title.Alignment = taCenter
            Title.Caption = 'Tal'#227'o'
            Width = 36
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Referencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataEntrada'
            Title.Alignment = taCenter
            Title.Caption = 'Data Entrada'
            Width = 68
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HoraEntrada'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Entrada'
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataSaida'
            Title.Alignment = taCenter
            Title.Caption = 'Data Saida'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HoraSaida'
            Title.Alignment = taCenter
            Title.Caption = 'Hora Saida'
            Width = 51
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 62
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Tipo'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NomeProduto'
            Title.Alignment = taCenter
            Title.Caption = 'Nome do Produto'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CodProduto'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Produto'
            Visible = True
          end>
      end
    end
  end
  object qTalao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtalao.CodProduto, Dbtalaomov.Setor, SUM( Dbtalaograde.Q' +
        'tdPar ) QtdPar'
      'FROM "DBTALAOMOV.DB" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)  '
      '   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)  '
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalaograde.Lote = Dbtalao.Lote)  '
      '   AND  (Dbtalaograde.Item = Dbtalao.Item)  '
      'WHERE   (Dbtalaomov.Setor = :Setor)  '
      '   AND  (Dbtalaomov.DataSaida BETWEEN :Data1 AND :Data2) '
      'GROUP BY Dbtalao.CodProduto, Dbtalaomov.Setor')
    Left = 408
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Setor'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    object qTalaoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object qTalaoSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qTalaoQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
  end
  object qTalaoMI: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtalaomi.CodProduto, SUM( Dbtalaomi.QtdPar ) QtdPar, Dbt' +
        'alaomovmi.Setor'
      'FROM "dbTalaoMovMI.DB" Dbtalaomovmi'
      '   INNER JOIN "dbTalaoMI.DB" Dbtalaomi'
      '   ON  (Dbtalaomovmi.Lote = Dbtalaomi.Lote)  '
      '   AND  (Dbtalaomovmi.Talao = Dbtalaomi.Item)  '
      'WHERE   (Dbtalaomovmi.Setor = :Setor)'
      '   AND  (Dbtalaomovmi.DataSaida BETWEEN :Data1 AND :Data2)'
      'GROUP BY Dbtalaomi.CodProduto, Dbtalaomovmi.Setor'
      ' ')
    Left = 440
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Setor'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    object qTalaoMICodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'TABELAS."dbTalaoMI.DB".CodProduto'
    end
    object qTalaoMIQtdPar: TFloatField
      FieldName = 'QtdPar'
      Origin = 'TABELAS."dbTalaoMI.DB".QtdPar'
    end
    object qTalaoMISetor: TIntegerField
      FieldName = 'Setor'
      Origin = 'TABELAS."dbTalaoMovMI.DB".Setor'
    end
  end
  object mConsulta: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Referencia'
    Params = <>
    OnNewRecord = mConsultaNewRecord
    Left = 608
    Top = 104
    object mConsultaCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object mConsultaNomeSetor: TStringField
      FieldName = 'NomeSetor'
      Size = 30
    end
    object mConsultaCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object mConsultaReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mConsultaNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object mConsultaQtd: TFloatField
      FieldName = 'Qtd'
    end
  end
  object dsmConsulta: TDataSource
    DataSet = mConsulta
    Left = 632
    Top = 104
  end
  object qTalaoDet: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtalao.CodProduto, Dbtalaomov.Setor, Dbtalaomov.Lote, Db' +
        'talaomov.Talao, Dbtalaomov.DataEnt, Dbtalaomov.HoraEnt, Dbtalaom' +
        'ov.DataSaida, Dbtalaomov.HoraSaida, Dbtalaograde.QtdPar, Dbtalao' +
        '.CodCor'
      'FROM "DBTALAOMOV.DB" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)  '
      '   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)  '
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalaograde.Lote = Dbtalao.Lote)  '
      '   AND  (Dbtalaograde.Item = Dbtalao.Item)  '
      'WHERE   (Dbtalaomov.Setor = :Setor)  '
      '   AND  Dbtalaomov.DataSaida BETWEEN :Data1 AND :Data2  ')
    Left = 408
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Setor'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    object qTalaoDetCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object qTalaoDetSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qTalaoDetLote: TIntegerField
      FieldName = 'Lote'
    end
    object qTalaoDetTalao: TIntegerField
      FieldName = 'Talao'
    end
    object qTalaoDetDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object qTalaoDetHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object qTalaoDetDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object qTalaoDetHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object qTalaoDetQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
    object qTalaoDetCodCor: TIntegerField
      FieldName = 'CodCor'
    end
  end
  object qTalaoMIDet: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtalaomi.CodProduto, Dbtalaomovmi.Setor, Dbtalaomovmi.Lo' +
        'te, Dbtalaomovmi.Talao, Dbtalaomovmi.DataEnt, Dbtalaomovmi.HoraE' +
        'nt, Dbtalaomovmi.DataSaida, Dbtalaomovmi.HoraSaida, Dbtalaomi.Co' +
        'dCor, Dbtalaomi.QtdPar'
      'FROM "dbTalaoMovMI.DB" Dbtalaomovmi'
      '   INNER JOIN "dbTalaoMI.DB" Dbtalaomi'
      '   ON  (Dbtalaomovmi.Lote = Dbtalaomi.Lote)  '
      '   AND  (Dbtalaomovmi.Talao = Dbtalaomi.Item)  '
      'WHERE   (Dbtalaomovmi.Setor = :Setor)  '
      '   AND  Dbtalaomovmi.DataSaida BETWEEN :Data1 AND :Data2 ')
    Left = 440
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Setor'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    object qTalaoMIDetCodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'TABELAS."dbTalaoMI.DB".CodProduto'
    end
    object qTalaoMIDetSetor: TIntegerField
      FieldName = 'Setor'
      Origin = 'TABELAS."dbTalaoMovMI.DB".Setor'
    end
    object qTalaoMIDetLote: TIntegerField
      FieldName = 'Lote'
      Origin = 'TABELAS."dbTalaoMovMI.DB".Lote'
    end
    object qTalaoMIDetTalao: TIntegerField
      FieldName = 'Talao'
      Origin = 'TABELAS."dbTalaoMovMI.DB".Talao'
    end
    object qTalaoMIDetDataEnt: TDateField
      FieldName = 'DataEnt'
      Origin = 'TABELAS."dbTalaoMovMI.DB".DataEnt'
    end
    object qTalaoMIDetHoraEnt: TTimeField
      FieldName = 'HoraEnt'
      Origin = 'TABELAS."dbTalaoMovMI.DB".HoraEnt'
    end
    object qTalaoMIDetDataSaida: TDateField
      FieldName = 'DataSaida'
      Origin = 'TABELAS."dbTalaoMovMI.DB".DataSaida'
    end
    object qTalaoMIDetHoraSaida: TTimeField
      FieldName = 'HoraSaida'
      Origin = 'TABELAS."dbTalaoMovMI.DB".HoraSaida'
    end
    object qTalaoMIDetCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbTalaoMI.DB".CodCor'
    end
    object qTalaoMIDetQtdPar: TIntegerField
      FieldName = 'QtdPar'
      Origin = 'TABELAS."dbTalaoMI.DB".QtdPar'
    end
  end
  object mDetalhado: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DataSaida;HoraSaida'
    Params = <>
    Left = 601
    Top = 140
    object mDetalhadoLote: TIntegerField
      FieldName = 'Lote'
    end
    object mDetalhadoTalao: TIntegerField
      FieldName = 'Talao'
    end
    object mDetalhadoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object mDetalhadoReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mDetalhadoNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object mDetalhadoDataEntrada: TDateField
      FieldName = 'DataEntrada'
    end
    object mDetalhadoHoraEntrada: TTimeField
      FieldName = 'HoraEntrada'
      DisplayFormat = 'HH:MM'
    end
    object mDetalhadoDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object mDetalhadoHoraSaida: TTimeField
      FieldName = 'HoraSaida'
      DisplayFormat = 'HH:MM'
    end
    object mDetalhadoQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mDetalhadoTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
  end
  object dsmDetalhado: TDataSource
    DataSet = mDetalhado
    Left = 624
    Top = 144
  end
end
