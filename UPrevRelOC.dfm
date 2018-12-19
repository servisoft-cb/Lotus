object fPrevRelOC: TfPrevRelOC
  Left = 208
  Top = 87
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Ordens de Compra'
  ClientHeight = 515
  ClientWidth = 340
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 515
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 70
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 180
      Top = 70
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 1
      Width = 322
      Height = 36
      Caption = 'Op'#231#245'es de Ordens de Compra'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Pendentes'
        'Encerradas')
      TabOrder = 0
    end
    object DateEdit1: TDateEdit
      Left = 72
      Top = 62
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object DateEdit2: TDateEdit
      Left = 234
      Top = 62
      Width = 95
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 4
      Top = 88
      Width = 332
      Height = 41
      TabOrder = 4
      object RxSpeedButton2: TRxSpeedButton
        Left = 17
        Top = 8
        Width = 88
        Height = 25
        Hint = 'Imprime o relat'#243'rio de fornecedores'
        DropDownMenu = PopupMenu1
        Caption = '&Imprimir'
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
          F75EF75EF75EF75EF75E00000000000000000000000000000000000000000000
          F75EF75EF75EF75E0000F75EF75EF75EF75EF75EF75EF75EF75EF75E0000F75E
          0000F75EF75E0000000000000000000000000000000000000000000000000000
          F75E0000F75E0000F75EF75EF75EF75EF75EF75EE07FE07FE07FF75EF75E0000
          00000000F75E0000F75EF75EF75EF75EF75EF75EEF3DEF3DEF3DF75EF75E0000
          F75E0000F75E0000000000000000000000000000000000000000000000000000
          F75EF75E00000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000F75E
          0000F75E0000F75E0000000000000000000000000000000000000000F75E0000
          F75E00000000F75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000F75E
          0000F75E0000F75EF75EF75E0000FF7F00000000000000000000FF7F00000000
          00000000F75EF75EF75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          F75EF75EF75EF75EF75EF75EF75E0000FF7F00000000000000000000FF7F0000
          F75EF75EF75EF75EF75EF75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          0000F75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
          0000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
          F75EF75EF75E}
        Layout = blGlyphLeft
      end
      object BitBtn2: TBitBtn
        Left = 105
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
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
        Left = 201
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
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
    object CheckBox1: TCheckBox
      Left = 37
      Top = 40
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Couro:'
      TabOrder = 1
    end
    object RxDBGrid1: TRxDBGrid
      Left = 5
      Top = 136
      Width = 329
      Height = 374
      DataSource = DataSource1
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrTot'
          Visible = True
        end>
    end
  end
  object mOC: TMemoryTable
    Active = True
    Left = 48
    Top = 200
    object mOCNumOC: TIntegerField
      FieldName = 'NumOC'
    end
    object mOCDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mOCCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object mOCVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object mOCVlrMercEntr: TFloatField
      FieldName = 'VlrMercEntr'
    end
    object mOCVlrMercAberto: TFloatField
      FieldName = 'VlrMercAberto'
    end
    object mOClkFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFornecedor'
      LookupDataSet = DM1.tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'NomeForn'
      KeyFields = 'CodForn'
      Size = 40
      Lookup = True
    end
    object mOCDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object mOCCodCondPgto: TIntegerField
      FieldName = 'CodCondPgto'
    end
  end
  object msOC: TDataSource
    DataSet = mOC
    Left = 71
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 200
    object ImpressoDOS1: TMenuItem
      Caption = 'Impress'#227'o DOS'
      OnClick = ImpressoDOS1Click
    end
    object ImpressoWindows1: TMenuItem
      Caption = 'Impress'#227'o Windows'
      OnClick = ImpressoWindows1Click
    end
  end
  object tAuxiliar: TTable
    DatabaseName = 'C:\a\'
    TableName = 'dbAuxiliar.DB'
    Left = 168
    Top = 352
    object tAuxiliarData: TDateField
      FieldName = 'Data'
    end
    object tAuxiliarVlrTot: TFloatField
      FieldName = 'VlrTot'
      DisplayFormat = '0.00'
    end
  end
  object qAux: TQuery
    DatabaseName = 'C:\a\'
    Left = 208
    Top = 344
  end
  object DataSource1: TDataSource
    DataSet = tAuxiliar
    Left = 184
    Top = 376
  end
  object QRCompositeReport1: TQRCompositeReport
    OnAddReports = QRCompositeReport1AddReports
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Letter
    Left = 200
    Top = 192
  end
  object msOCPArc: TDataSource
    DataSet = mOCParc
    Left = 128
    Top = 256
  end
  object mOCParc: TMemoryTable
    Active = True
    OnNewRecord = mOCParcNewRecord
    DatabaseName = 'Tabelas'
    TableName = 'mOCParc'
    Left = 88
    Top = 248
    object mOCParcData2: TDateField
      FieldName = 'Data2'
    end
    object mOCParcData3: TDateField
      FieldName = 'Data3'
    end
    object mOCParcData4: TDateField
      FieldName = 'Data4'
    end
    object mOCParcData5: TDateField
      FieldName = 'Data5'
    end
    object mOCParcData6: TDateField
      FieldName = 'Data6'
    end
    object mOCParcData7: TDateField
      FieldName = 'Data7'
    end
    object mOCParcData8: TDateField
      FieldName = 'Data8'
    end
    object mOCParcData9: TDateField
      FieldName = 'Data9'
    end
    object mOCParcValor1: TFloatField
      FieldName = 'Valor1'
    end
    object mOCParcValor2: TFloatField
      FieldName = 'Valor2'
    end
    object mOCParcValor3: TFloatField
      FieldName = 'Valor3'
    end
    object mOCParcValor4: TFloatField
      FieldName = 'Valor4'
    end
    object mOCParcValor5: TFloatField
      FieldName = 'Valor5'
    end
    object mOCParcValor6: TFloatField
      FieldName = 'Valor6'
    end
    object mOCParcValor7: TFloatField
      FieldName = 'Valor7'
    end
    object mOCParcValor8: TFloatField
      FieldName = 'Valor8'
    end
    object mOCParcValor9: TFloatField
      FieldName = 'Valor9'
    end
    object mOCParcNumOC: TIntegerField
      FieldName = 'NumOC'
    end
    object mOCParcData1: TDateTimeField
      FieldName = 'Data1'
    end
  end
end
