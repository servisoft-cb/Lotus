object fConsConfirmacao: TfConsConfirmacao
  Left = 128
  Top = 82
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 563
  ClientWidth = 757
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
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 43
    Width = 757
    Height = 503
    Align = alClient
    DataSource = dsqConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Lan'#231'amento'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Title.Alignment = taCenter
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Confirmado'
        Title.Alignment = taCenter
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Hora'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 757
    Height = 43
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Ordenar Por:'
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 8
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Nome Cliente'
      Items.Strings = (
        'Nome Cliente'
        'Modelo'
        'Nome Cor'
        'Data'
        'N'#186' Lan'#231'amento')
    end
    object BitBtn1: TBitBtn
      Left = 243
      Top = 4
      Width = 77
      Height = 25
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 546
    Width = 757
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo clique para posicionar o registro e voltar para o cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object qConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbconfirmacao.Cliente, Dbconfirmacao.Id, Dbconfirmacao.Mo' +
        'delo, Dbconfirmacao.Cor, Dbconfirmacao.Confirmado, Dbconfirmacao' +
        '.Data, Dbconfirmacao.Hora, Dbcor.Nome NomeCor, Dbcliente.Nome No' +
        'meCliente'
      'FROM "dbConfirmacao.DB" Dbconfirmacao'
      '   LEFT JOIN dbcor Dbcor'
      '   ON  (Dbconfirmacao.Cor = Dbcor.Codigo)  '
      '   LEFT JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbconfirmacao.Cliente = Dbcliente.Codigo)  ')
    Left = 304
    Top = 120
    object qConsultaCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object qConsultaId: TIntegerField
      FieldName = 'Id'
    end
    object qConsultaModelo: TStringField
      FieldName = 'Modelo'
      Size = 30
    end
    object qConsultaCor: TIntegerField
      FieldName = 'Cor'
    end
    object qConsultaConfirmado: TBooleanField
      FieldName = 'Confirmado'
      DisplayValues = 'Sim;N'#227'o'
    end
    object qConsultaData: TDateField
      FieldName = 'Data'
    end
    object qConsultaHora: TTimeField
      FieldName = 'Hora'
    end
    object qConsultaNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 15
    end
    object qConsultaNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
  end
  object dsqConsulta: TDataSource
    DataSet = qConsulta
    Left = 328
    Top = 120
  end
end
