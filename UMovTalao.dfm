object fMovTalao: TfMovTalao
  Left = 153
  Top = 377
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Movimento de Tal'#245'es'
  ClientHeight = 113
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 113
    Align = alClient
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 222
      Top = 16
      Width = 37
      Height = 16
      Caption = 'Lote:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel2: TRxLabel
      Left = 339
      Top = 16
      Width = 48
      Height = 16
      Caption = 'Tal'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel3: TRxLabel
      Left = 215
      Top = 40
      Width = 44
      Height = 16
      Caption = 'Setor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel4: TRxLabel
      Left = 8
      Top = 81
      Width = 94
      Height = 20
      Caption = 'C'#243'd. Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = -1
      Top = 106
      Width = 663
      Height = 2
      Shape = bsTopLine
      Style = bsRaised
    end
    object Bevel2: TBevel
      Left = 0
      Top = 72
      Width = 663
      Height = 2
      Shape = bsTopLine
      Style = bsRaised
    end
    object Label14: TLabel
      Left = 256
      Top = 80
      Width = 211
      Height = 24
      Alignment = taCenter
      Caption = '...Movimento gerado...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel5: TRxLabel
      Left = 499
      Top = 16
      Width = 40
      Height = 16
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 103
      Top = 80
      Width = 125
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object Panel2: TPanel
      Left = 542
      Top = 37
      Width = 117
      Height = 33
      TabOrder = 6
      object BitBtn1: TBitBtn
        Left = 3
        Top = 4
        Width = 110
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
    object GroupBox1: TGroupBox
      Left = 5
      Top = 0
      Width = 206
      Height = 69
      Caption = 'Gera o Lote no corte'
      TabOrder = 7
      object Label2: TLabel
        Left = 146
        Top = 16
        Width = 39
        Height = 13
        Caption = 'N'#186' Lote:'
      end
      object RadioGroup1: TRadioGroup
        Left = 3
        Top = 12
        Width = 114
        Height = 52
        ItemIndex = 1
        Items.Strings = (
          'Exporta'#231#227'o'
          'Mercado Interno')
        TabOrder = 0
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 128
        Top = 32
        Width = 73
        Height = 21
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 1
        OnKeyDown = CurrencyEdit1KeyDown
      end
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 261
      Top = 11
      Width = 73
      Height = 21
      AutoSize = False
      DisplayFormat = '0'
      TabOrder = 1
      OnExit = CurrencyEdit2Exit
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 389
      Top = 11
      Width = 73
      Height = 21
      AutoSize = False
      DisplayFormat = '0'
      TabOrder = 2
      OnExit = CurrencyEdit3Exit
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 261
      Top = 35
      Width = 202
      Height = 21
      DropDownCount = 8
      LookupField = 'CodSetor'
      LookupDisplay = 'Nome'
      LookupSource = dsqSetor
      TabOrder = 4
    end
    object BitBtn7: TBitBtn
      Left = 464
      Top = 31
      Width = 25
      Height = 25
      Hint = 'Confirma a baixa do tal'#227'o no setor'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn7Click
      Glyph.Data = {
        A6020000424DA602000000000000420000002800000011000000110000000100
        1000030000006402000000000000000000000000000000000000007C0000E003
        00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EC202F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EC202F75EF75EF75EF75EF75EF75EF75EF75EF75E
        1700FF7FF75EF75EF75EF75EF75EF75EDD01F75EF75EF75EF75EF75EF75EF75E
        F75E170017001700FF7FF75EF75EF75EF75EF75EC202F75EF75EF75EF75EF75E
        F75EF75E1700170017001700FF7FF75EF75EF75EF75EF75E4301F75E00000000
        000000000000170017001700FF7F17001700FF7FF75EF75EF75EF75E9901F75E
        0000FF7FFF7FFF7F170017001700FF7F0000F75E17001700FF7FF75EF75EF75E
        C202F75E0000FF7FEF3DEF3DEF3D1700FF7FFF7F0000F75EF75E1700FF7FF75E
        F75EF75E1D03F75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000F75EF75EF75E
        1700FF7FF75EF75E0200F75E0000FF7FEF3DEF3DEF3DEF3DEF3DFF7F0000F75E
        F75EF75EF75E1700FF7FF75E1903F75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
        0000F75EF75EF75EF75EF75E1700FF7FDA00F75E0000FF7FEF3DEF3DF75EF75E
        F75EFF7F0000F75EF75EF75EF75EF75EF75E1700D300F75E0000FF7FFF7FFF7F
        FF7F0000000000000000F75EF75EF75EF75EF75EF75EF75E1901F75E0000FF7F
        EF3DEF3DF75E0000F75E0000F75EF75EF75EF75EF75EF75EF75EF75E9000F75E
        0000FF7FFF7FFF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75EF75EF75E
        5802F75E000000000000000000000000F75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75E3501F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EB781}
    end
    object DateEdit1: TDateEdit
      Left = 542
      Top = 11
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object qSetor: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbsetor.Nome, Dblotesetormi.CodSetor, Dblotesetormi.Item'
      'FROM "dbLoteSetorMI.DB" Dblotesetormi'
      '   INNER JOIN "dbSetor.DB" Dbsetor'
      '   ON  (Dblotesetormi.CodSetor = Dbsetor.Codigo)  '
      'WHERE  Dblotesetormi.Lote = :NumLote'
      'ORDER BY Dblotesetormi.Item')
    Left = 24
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumLote'
        ParamType = ptUnknown
        Value = 0
      end>
    object qSetorNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbSetor.DB".Nome'
      Size = 15
    end
    object qSetorCodSetor: TIntegerField
      FieldName = 'CodSetor'
      Origin = 'TABELAS."dbLoteSetorMI.DB".CodSetor'
    end
    object qSetorItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbLoteSetorMI.DB".Item'
    end
  end
  object dsqSetor: TDataSource
    DataSet = qSetor
    Left = 40
    Top = 56
  end
end
