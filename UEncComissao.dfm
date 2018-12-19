object fEncComissao: TfEncComissao
  Left = 124
  Top = 151
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Encerra o per'#237'odo de comiss'#227'o do vendedor'
  ClientHeight = 346
  ClientWidth = 536
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
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 536
    Height = 259
    Align = alTop
    Color = clInfoBk
    DataSource = DM1.dsVendedor
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 314
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEncerramentoCom'
        Title.Alignment = taCenter
        Title.Caption = 'Dt.Encerramento'
        Width = 107
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 266
    Width = 536
    Height = 80
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 47
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 99
      Top = 8
      Width = 430
      Height = 13
      DataField = 'Nome'
      DataSource = DM1.dsVendedor
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 13
      Top = 32
      Width = 83
      Height = 13
      Caption = 'Dt.Encerramento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DateEdit1: TDateEdit
      Left = 100
      Top = 24
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 100
      Top = 46
      Width = 100
      Height = 25
      Caption = 'Confirma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 432
      Top = 46
      Width = 100
      Height = 25
      Caption = '&Fechar'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsVendedor
    Filter.Strings = (
      'Inativo = False')
    Left = 456
    Top = 152
  end
end
