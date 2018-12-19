object fCopiaDuplicata: TfCopiaDuplicata
  Left = 415
  Top = 336
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#243'pia de Duplicata'
  ClientHeight = 128
  ClientWidth = 358
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
    Width = 358
    Height = 128
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 55
      Width = 86
      Height = 13
      Caption = 'Nota Fiscal Inicial:'
    end
    object Label2: TLabel
      Left = 188
      Top = 55
      Width = 81
      Height = 13
      Caption = 'Nota Fiscal Final:'
    end
    object Label3: TLabel
      Left = 69
      Top = 31
      Width = 27
      Height = 13
      Caption = 'S'#233'rie:'
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 100
      Top = 47
      Width = 79
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 1
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 272
      Top = 47
      Width = 79
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 32
      Top = 80
      Width = 295
      Height = 41
      TabOrder = 3
      object BitBtn1: TBitBtn
        Left = 11
        Top = 8
        Width = 90
        Height = 25
        Hint = 'Imprime sele'#231#227'o de c'#243'pias de duplicatas cfe. sele'#231#227'o acima'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          0E030000424D0E030000000000003600000028000000110000000E0000000100
          180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
          BFBFBF0000000000000000000000000000000000000000000000000000000000
          00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBFBFBF
          BF00BFBFBF000000000000000000000000000000000000000000000000000000
          000000000000000000000000BFBFBF000000BFBFBF00BFBFBF000000BFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF000000
          000000000000BFBFBF00BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000BFBFBF00BFBF
          BF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000BFBFBFBFBFBF00000000BFBFBF000000BFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
          BFBF00000000BFBFBFBFBFBF0000000000000000000000000000000000000000
          00000000000000000000BFBFBF000000BFBFBF00000000000000BFBFBFBFBFBF
          BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00BFBFBF000000BFBFBF00000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
          000000000000000000000000000000FFFFFF000000000000000000000000BFBF
          BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBF000000FFFFFF000000000000000000000000000000FFFFFF000000
          BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF00BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000000000000000
          0000000000000000000000BFBFBFBFBFBF00}
      end
      object BitBtn2: TBitBtn
        Left = 102
        Top = 8
        Width = 90
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
        Left = 193
        Top = 8
        Width = 90
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
    object Edit1: TEdit
      Left = 100
      Top = 24
      Width = 79
      Height = 21
      TabOrder = 0
    end
  end
  object mDuplicata: TMemoryTable
    Active = True
    DatabaseName = 'Tabelas'
    Left = 8
    Top = 8
    object mDuplicataNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mDuplicataParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mDuplicataVcto: TDateTimeField
      FieldName = 'Vcto'
    end
    object mDuplicataCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mDuplicataVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      DisplayFormat = '0.00'
    end
    object mDuplicataVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '0.00'
    end
    object mDuplicatalkNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCliente'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object mDuplicatalkEndereco: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEndereco'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Endereco'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object mDuplicatalkBairro: TStringField
      FieldKind = fkLookup
      FieldName = 'lkBairro'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Bairro'
      KeyFields = 'CodCliente'
      Size = 25
      Lookup = True
    end
    object mDuplicatalkUf: TStringField
      FieldKind = fkLookup
      FieldName = 'lkUf'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Uf'
      KeyFields = 'CodCliente'
      Size = 2
      Lookup = True
    end
    object mDuplicatalkCep: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCep'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cep'
      KeyFields = 'CodCliente'
      Size = 9
      Lookup = True
    end
    object mDuplicatalkEndPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEndPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'EndPgto'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object mDuplicatalkUfPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkUfPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'UfPgto'
      KeyFields = 'CodCliente'
      Size = 2
      Lookup = True
    end
    object mDuplicatalkCepPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCepPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CepPgto'
      KeyFields = 'CodCliente'
      Size = 9
      Lookup = True
    end
    object mDuplicatalkCnpj: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCnpj'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CgcCpf'
      KeyFields = 'CodCliente'
      Size = 18
      Lookup = True
    end
    object mDuplicatalkInscrEst: TStringField
      FieldKind = fkLookup
      FieldName = 'lkInscrEst'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'InscrEst'
      KeyFields = 'CodCliente'
      Size = 18
      Lookup = True
    end
    object mDuplicataDtEmissao: TDateTimeField
      FieldName = 'DtEmissao'
    end
    object mDuplicatalkTelefone: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTelefone'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Telefone'
      KeyFields = 'CodCliente'
      Size = 15
      Lookup = True
    end
    object mDuplicataCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object mDuplicataCidPgto: TStringField
      FieldName = 'CidPgto'
      Size = 30
    end
    object mDuplicatalkNumEnd: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNumEnd'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'NumEnd'
      KeyFields = 'CodCliente'
      Size = 15
      Lookup = True
    end
    object mDuplicatalkComplEndereco: TStringField
      FieldKind = fkLookup
      FieldName = 'lkComplEndereco'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'ComplEndereco'
      KeyFields = 'CodCliente'
      Size = 50
      Lookup = True
    end
  end
  object ValorPorExtenso1: TValorPorExtenso
    MoedaNoSingular = 'REAL'
    MoedaNoPlural = 'REAIS'
    TipoDoTexto = ttMaiuscula
    Genero = gMasculino
    Left = 40
    Top = 8
  end
end
