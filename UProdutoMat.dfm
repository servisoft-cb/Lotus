object fProdutoMat: TfProdutoMat
  Left = 322
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Materiais do modelo'
  ClientHeight = 244
  ClientWidth = 529
  Color = clMoneyGreen
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
  object Label3: TLabel
    Left = 76
    Top = 94
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cor:'
  end
  object Label4: TLabel
    Left = 52
    Top = 119
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'Unidade:'
  end
  object Label6: TLabel
    Left = 28
    Top = 140
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Qtd.Consumo:'
  end
  object Label7: TLabel
    Left = 5
    Top = 185
    Width = 90
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr.Unit'#225'rio (Custo):'
  end
  object Label9: TLabel
    Left = 30
    Top = 163
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Imp.no Tal'#227'o:'
  end
  object Label10: TLabel
    Left = 54
    Top = 74
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Posi'#231#227'o:'
  end
  object SpeedButton1: TSpeedButton
    Left = 285
    Top = 66
    Width = 23
    Height = 23
    Hint = 'Abre o cadastro de setores'
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
      000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
      00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
      8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
      8888880BB088888888888800008888888888}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 97
    Top = 177
    Width = 104
    Height = 21
    AutoSize = False
    Ctl3D = False
    DecimalPlaces = 3
    DisplayFormat = '0.000'
    ParentCtl3D = False
    TabOrder = 6
  end
  object BitBtn10: TBitBtn
    Left = 119
    Top = 205
    Width = 121
    Height = 29
    Hint = 'Confirma o material'
    Caption = 'Confirma'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtn10Click
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
  object BitBtn11: TBitBtn
    Left = 240
    Top = 205
    Width = 121
    Height = 29
    Hint = 'Cancela o material selecionado'
    Caption = 'Cancelar/Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BitBtn11Click
    Glyph.Data = {
      EE020000424DEE02000000000000420000002800000012000000130000000100
      100003000000AC02000000000000000000000000000000000000007C0000E003
      00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75E007CF75E007CF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75E007CF75EF75E007C007CF75EF75EEE39EE39EE39EE39
      EE39EE39EE39EE39EE39EE39007CF75EF75EF75E007C007C007C000000000000
      0000000000000000000000000000007C007CF75EF75EF75EF75E007C007C0000
      E07FFF7FFF7FFF7FE07FFF7FFF7FFF7F007C007CF75EF75EF75EF75EF75EF75E
      007C007CFF7F1F001F001F001F001F001F00FF7F007CEE39F75EF75EF75EF75E
      F75EF75E007C007C007CFF7FE07FFF7FFF7FFF7FE07F007C007CEE39F75EF75E
      F75EF75EF75EF75EF75E007C007C007C1F001F001F00007C007C007C0000EE39
      F75EF75EF75EF75EF75EF75EF75E0000007C007C007CFF7FE07F007C007CFF7F
      0000EE39F75EF75EF75EF75EF75EF75EF75E0000FF7F1F00007C007C007C007C
      1F00FF7F0000EE39F75EF75EF75EF75EF75EF75EF75E0000FF7FFF7F007C007C
      007C007CE07FFF7F0000EE39F75EF75EF75EF75EF75EF75EF75E0000FF7F1F00
      007C007C007C007C000000000000EE39F75EF75EF75EF75EF75EF75EF75E0000
      E07F007C007CFF7F0000007C007CFF7F0000EE39F75EF75EF75EF75EF75EF75E
      F75E0000007C007C007CFF7F0000007C007C007C007CF75EF75EF75EF75EF75E
      F75EF75E007C007C007CFF7FE07FFF7F0000FF7F0000F75E007C007CF75EF75E
      F75EF75E007C007C007C007C000000000000000000000000F75EF75EF75E007C
      007CF75EF75EF75E007C007C007CF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75E007CF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75E007CF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E}
  end
  object ComboBox2: TComboBox
    Left = 97
    Top = 155
    Width = 104
    Height = 21
    BevelKind = bkFlat
    Style = csDropDownList
    Ctl3D = False
    ItemHeight = 13
    ItemIndex = 0
    ParentCtl3D = False
    TabOrder = 5
    Text = 'Sim'
    Items.Strings = (
      'Sim'
      'N'#227'o')
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Color = clMoneyGreen
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    OnExit = Panel1Exit
    object Label1: TLabel
      Left = 59
      Top = 15
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 55
      Top = 34
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Material:'
    end
    object SpeedButton8: TSpeedButton
      Left = 433
      Top = 27
      Width = 24
      Height = 23
      Hint = 'Abre o formul'#225'rio de cadastro de materiais'
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
        000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
        00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
        8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
        8888880BB088888888888800008888888888}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton8Click
    end
    object CurrencyEdit4: TCurrencyEdit
      Left = 97
      Top = 6
      Width = 57
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 0
      OnExit = CurrencyEdit4Exit
    end
    object BitBtn1: TBitBtn
      Left = 158
      Top = 4
      Width = 145
      Height = 23
      Caption = '(F2) Pesquisa Material'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn1Click
    end
    object RxDBLookupCombo1_Ant: TRxDBLookupCombo
      Left = 1
      Top = 21
      Width = 48
      Height = 21
      DropDownCount = 8
      DropDownWidth = 250
      Ctl3D = False
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsMaterial
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 97
      Top = 29
      Width = 336
      Height = 21
      DropDownCount = 8
      DropDownWidth = 250
      Ctl3D = False
      LookupField = 'CODIGO'
      LookupDisplay = 'NOMESEMACENTO'
      LookupSource = fProdutoComb.dsMaterialFB
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object RxDBLookupCombo15: TRxDBLookupCombo
    Left = 97
    Top = 67
    Width = 186
    Height = 21
    DropDownCount = 8
    DropDownWidth = 250
    Ctl3D = False
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsPosicao
    ParentCtl3D = False
    TabOrder = 1
    OnEnter = RxDBLookupCombo15Enter
  end
  object RxDBLookupCombo3: TRxDBLookupCombo
    Left = 97
    Top = 89
    Width = 186
    Height = 21
    DropDownCount = 8
    DropDownWidth = 250
    Ctl3D = False
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = dsQuery1
    ParentCtl3D = False
    TabOrder = 2
  end
  object RxDBLookupCombo17: TRxDBLookupCombo
    Left = 97
    Top = 111
    Width = 66
    Height = 21
    DropDownCount = 8
    DropDownWidth = 250
    Ctl3D = False
    LookupField = 'Unidade'
    LookupDisplay = 'Unidade'
    LookupSource = dsqMaterialUM
    ParentCtl3D = False
    TabOrder = 3
    OnEnter = RxDBLookupCombo17Enter
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 97
    Top = 133
    Width = 66
    Height = 21
    AutoSize = False
    Ctl3D = False
    DecimalPlaces = 5
    DisplayFormat = '0.00000'
    Enabled = False
    ParentCtl3D = False
    TabOrder = 4
  end
  object Query1: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Nome, dbCor.Codigo'
      'FROM dbCor, dbProdutoCor'
      'WHERE dbCor.Codigo = CodCor'
      'ORDER BY Nome')
    Left = 393
    Top = 155
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCor.DB".Nome'
      Size = 25
    end
    object Query1Codigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbCor.DB".Codigo'
    end
  end
  object dsQuery1: TDataSource
    DataSet = Query1
    Left = 411
    Top = 153
  end
  object qMaterialUM: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Unidade, Nome'
      'FROM "dbMaterial.DB" Dbmaterial'
      'WHERE  Codigo = 1 ')
    Left = 378
    Top = 110
    object qMaterialUMUnidade: TStringField
      FieldName = 'Unidade'
      Origin = 'TABELAS."dbMaterial.DB".Unidade'
      Size = 3
    end
  end
  object dsqMaterialUM: TDataSource
    DataSet = qMaterialUM
    Left = 392
    Top = 112
  end
end
