object fPrevPlanejProg: TfPrevPlanejProg
  Left = 197
  Top = 105
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Planejamento e Programa'#231#227'o'
  ClientHeight = 424
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 424
    Align = alClient
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      Left = 5
      Top = 5
      Width = 360
      Height = 39
      Caption = 'Relat'#243'rios...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Planejamento'
        'Programa'#231#227'o')
      TabOrder = 0
      OnClick = RadioGroup1Click
      OnEnter = RadioGroup1Click
      OnExit = RadioGroup1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 5
      Top = 45
      Width = 360
      Height = 57
      Caption = 'Op'#231#245'es dos relat'#243'rios...'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Pedido'
        'Lote Merc. Interno'
        'Lote Exporta'#231#227'o'
        'Data de Embarque')
      TabOrder = 1
      OnClick = RadioGroup2Exit
      OnEnter = RadioGroup2Exit
      OnExit = RadioGroup2Exit
    end
    object Panel2: TPanel
      Left = 4
      Top = 247
      Width = 362
      Height = 36
      TabOrder = 3
      object Label1: TLabel
        Left = 5
        Top = 15
        Width = 66
        Height = 13
        Caption = 'Pedido Inicial:'
      end
      object Label2: TLabel
        Left = 196
        Top = 15
        Width = 61
        Height = 13
        Caption = 'Pedido Final:'
      end
      object Edit1: TEdit
        Left = 74
        Top = 7
        Width = 95
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 260
        Top = 7
        Width = 95
        Height = 21
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 284
      Width = 362
      Height = 36
      Enabled = False
      TabOrder = 4
      object Label3: TLabel
        Left = 16
        Top = 15
        Width = 54
        Height = 13
        Caption = 'Lote Inicial:'
      end
      object Label4: TLabel
        Left = 207
        Top = 15
        Width = 49
        Height = 13
        Caption = 'Lote Final:'
      end
      object Edit3: TEdit
        Left = 74
        Top = 7
        Width = 95
        Height = 21
        TabOrder = 0
      end
      object Edit4: TEdit
        Left = 260
        Top = 7
        Width = 95
        Height = 21
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 4
      Top = 321
      Width = 362
      Height = 36
      Enabled = False
      TabOrder = 5
      object Label5: TLabel
        Left = 4
        Top = 15
        Width = 67
        Height = 13
        Caption = 'Dt. Emb. Inic.:'
      end
      object Label6: TLabel
        Left = 187
        Top = 15
        Width = 69
        Height = 13
        Caption = 'Dt. Emb. Final:'
      end
      object DateEdit1: TDateEdit
        Left = 74
        Top = 7
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit2: TDateEdit
        Left = 260
        Top = 7
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 33
      Top = 368
      Width = 304
      Height = 41
      TabOrder = 6
      object BitBtn1: TBitBtn
        Left = 8
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Imprime cfe. a sele'#231#227'o acima'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
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
      object BitBtn2: TBitBtn
        Left = 104
        Top = 8
        Width = 95
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
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
        Left = 200
        Top = 8
        Width = 95
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
    object Panel6: TPanel
      Left = 4
      Top = 210
      Width = 362
      Height = 36
      TabOrder = 2
      TabStop = True
      object CheckBox1: TCheckBox
        Left = 16
        Top = 11
        Width = 97
        Height = 17
        Caption = 'Faturados'
        Enabled = False
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 4
      Top = 104
      Width = 362
      Height = 105
      Enabled = False
      TabOrder = 7
      object Label7: TLabel
        Left = 56
        Top = 13
        Width = 37
        Height = 13
        Caption = 'Setor 1:'
      end
      object Label8: TLabel
        Left = 56
        Top = 37
        Width = 37
        Height = 13
        Caption = 'Setor 2:'
      end
      object Label9: TLabel
        Left = 56
        Top = 62
        Width = 37
        Height = 13
        Caption = 'Setor 3:'
      end
      object Label10: TLabel
        Left = 56
        Top = 87
        Width = 37
        Height = 13
        Caption = 'Setor 4:'
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 96
        Top = 5
        Width = 185
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsSetor
        TabOrder = 0
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 96
        Top = 29
        Width = 185
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsSetor
        TabOrder = 1
      end
      object RxDBLookupCombo3: TRxDBLookupCombo
        Left = 96
        Top = 54
        Width = 185
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsSetor
        TabOrder = 2
      end
      object RxDBLookupCombo4: TRxDBLookupCombo
        Left = 96
        Top = 79
        Width = 185
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsSetor
        TabOrder = 3
      end
    end
  end
  object mProgramacao: TMemoryTable
    Active = True
    Left = 99
    Top = 32
    object mProgramacaoCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object mProgramacaoPedido: TIntegerField
      FieldName = 'Pedido'
    end
    object mProgramacaoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object mProgramacaoMaterialCor: TStringField
      FieldName = 'MaterialCor'
      Size = 55
    end
    object mProgramacaoQtdPrs: TIntegerField
      FieldName = 'QtdPrs'
    end
    object mProgramacaoDtEmbFinal: TDateTimeField
      FieldName = 'DtEmbFinal'
    end
    object mProgramacaolkNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCli'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCli'
      Size = 40
      Lookup = True
    end
    object mProgramacaolkRef: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRef'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Referencia'
      KeyFields = 'CodProduto'
      Size = 8
      Lookup = True
    end
    object mProgramacaoTalao: TIntegerField
      FieldName = 'Talao'
    end
    object mProgramacaoConstrucao: TStringField
      FieldName = 'Construcao'
    end
    object mProgramacaoLote: TIntegerField
      FieldName = 'Lote'
    end
    object mProgramacaoPosicao: TIntegerField
      FieldName = 'Posicao'
    end
    object mProgramacaoCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object mProgramacaolkTamanho: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTamanho'
      LookupDataSet = DM1.tGradeItemlk
      LookupKeyFields = 'CodGrade;Posicao'
      LookupResultField = 'Tamanho'
      KeyFields = 'CodGrade;Posicao'
      Size = 3
      Lookup = True
    end
    object mProgramacaolkLargura: TStringField
      FieldKind = fkLookup
      FieldName = 'lkLargura'
      LookupDataSet = DM1.tGrade
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Largura'
      KeyFields = 'CodGrade'
      Size = 1
      Lookup = True
    end
    object mProgramacaoDtSetor2: TStringField
      FieldName = 'DtSetor2'
      Size = 8
    end
    object mProgramacaoDtSetor1: TStringField
      FieldName = 'DtSetor1'
      Size = 8
    end
    object mProgramacaoDtSetor3: TStringField
      FieldName = 'DtSetor3'
      Size = 8
    end
    object mProgramacaoDtSetor4: TStringField
      FieldName = 'DtSetor4'
      Size = 8
    end
  end
end
