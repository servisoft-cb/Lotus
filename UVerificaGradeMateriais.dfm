object fVerificaGradeMateriais: TfVerificaGradeMateriais
  Left = 177
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Verifica Grade Dos Materiais'
  ClientHeight = 446
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 32
    Top = 16
    Width = 121
    Height = 27
    Caption = 'Verificar Materiais'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 16
    Width = 121
    Height = 27
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object ProgressBar1: TProgressBar
    Left = 32
    Top = 48
    Width = 409
    Height = 17
    TabOrder = 2
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 80
    Width = 752
    Height = 366
    Align = alBottom
    DataSource = dsmVerifica
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
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
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodGrade'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Grade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeGrade'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Grade'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TamReferencia'
        Title.Alignment = taCenter
        Title.Caption = 'Tam. Refer'#234'ncia'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TamMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'Tam. Material'
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 152
    Top = 16
    Width = 121
    Height = 27
    Caption = 'Imprimir'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object CheckBox1: TCheckBox
    Left = 560
    Top = 8
    Width = 161
    Height = 17
    Caption = 'Mostrar sem tamanhos'
    TabOrder = 5
  end
  object CheckBox2: TCheckBox
    Left = 464
    Top = 56
    Width = 177
    Height = 17
    Caption = 'Mostrar s'#243' uma vez o material'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object CheckBox3: TCheckBox
    Left = 560
    Top = 32
    Width = 177
    Height = 17
    Caption = 'Gravar no material como Correto'
    TabOrder = 7
    Visible = False
  end
  object mVerifica: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodMaterial'
        DataType = ftInteger
      end
      item
        Name = 'CodGrade'
        DataType = ftInteger
      end
      item
        Name = 'NomeGrade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TamReferencia'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TamMaterial'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NomeMaterial'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CodMaterial'
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 16
    Data = {
      C00000009619E0BD010000001800000006000000000003000000C0000B436F64
      4D6174657269616C040001000000000008436F64477261646504000100000000
      00094E6F6D6547726164650100490000000100055749445448020002001E000D
      54616D5265666572656E6369610100490000000100055749445448020002000A
      000B54616D4D6174657269616C0100490000000100055749445448020002000A
      000C4E6F6D654D6174657269616C010049000000010005574944544802000200
      28000000}
    object mVerificaCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object mVerificaCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object mVerificaNomeGrade: TStringField
      FieldName = 'NomeGrade'
      Size = 30
    end
    object mVerificaTamReferencia: TStringField
      FieldName = 'TamReferencia'
      Size = 10
    end
    object mVerificaTamMaterial: TStringField
      FieldName = 'TamMaterial'
      Size = 10
    end
    object mVerificaNomeMaterial: TStringField
      FieldName = 'NomeMaterial'
      Size = 40
    end
  end
  object dsmVerifica: TDataSource
    DataSet = mVerifica
    Left = 504
    Top = 16
  end
end
