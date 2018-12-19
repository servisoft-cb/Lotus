object fFichaConstrucao_Mat: TfFichaConstrucao_Mat
  Left = 76
  Top = 22
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fFichaConstrucao_Mat'
  ClientHeight = 524
  ClientWidth = 855
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 483
    Width = 855
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 294
      Top = 8
      Width = 100
      Height = 28
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 393
      Top = 8
      Width = 100
      Height = 28
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 6
      Top = 5
      Width = 100
      Height = 28
      Caption = 'Gerar Tamanhos'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 53
    Width = 855
    Height = 61
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 43
      Top = 21
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Material:'
    end
    object Label2: TLabel
      Left = 36
      Top = 45
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Material:'
    end
    object DBEdit1: TDBEdit
      Left = 110
      Top = 13
      Width = 400
      Height = 21
      DataField = 'TIPOMATERIAL'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 110
      Top = 37
      Width = 400
      Height = 21
      DataField = 'NOMEMATERIAL'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 114
    Width = 855
    Height = 99
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    object Label3: TLabel
      Left = 57
      Top = 12
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Cor:'
    end
    object Label4: TLabel
      Left = 12
      Top = 36
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia Material:'
    end
    object Label5: TLabel
      Left = 50
      Top = 59
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
    end
    object Label6: TLabel
      Left = 64
      Top = 82
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medidas:'
    end
    object DBEdit3: TDBEdit
      Left = 110
      Top = 4
      Width = 400
      Height = 21
      DataField = 'NOMECOR'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 110
      Top = 28
      Width = 400
      Height = 21
      DataField = 'REFMATERIAL'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 110
      Top = 51
      Width = 400
      Height = 21
      DataField = 'NOMEFORNECEDOR'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 2
    end
    object DBEdit15: TDBEdit
      Left = 110
      Top = 74
      Width = 400
      Height = 21
      DataField = 'MEDIDAS'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 252
    Width = 855
    Height = 87
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 3
    object StaticText1: TStaticText
      Left = 15
      Top = 15
      Width = 45
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Refor'#231'o:'
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 61
      Top = 11
      Width = 208
      Height = 21
      DataField = 'REFORCO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 23
      Top = 39
      Width = 37
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Planta:'
      TabOrder = 2
    end
    object DBEdit7: TDBEdit
      Left = 61
      Top = 35
      Width = 208
      Height = 21
      DataField = 'PLANTA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 3
    end
    object StaticText3: TStaticText
      Left = 9
      Top = 63
      Width = 51
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Caimento:'
      TabOrder = 4
    end
    object DBEdit8: TDBEdit
      Left = 61
      Top = 59
      Width = 208
      Height = 21
      DataField = 'CAIMENTO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 5
    end
    object DBEdit9: TDBEdit
      Left = 326
      Top = 11
      Width = 208
      Height = 21
      DataField = 'ALMA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 6
    end
    object StaticText4: TStaticText
      Left = 295
      Top = 15
      Width = 30
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Alma:'
      TabOrder = 7
    end
    object StaticText5: TStaticText
      Left = 287
      Top = 39
      Width = 38
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Rebite:'
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 326
      Top = 35
      Width = 208
      Height = 21
      DataField = 'REBITE'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 9
    end
    object StaticText6: TStaticText
      Left = 293
      Top = 63
      Width = 32
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Capa:'
      TabOrder = 10
    end
    object DBEdit11: TDBEdit
      Left = 326
      Top = 59
      Width = 208
      Height = 21
      DataField = 'CAPA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 11
    end
    object StaticText7: TStaticText
      Left = 567
      Top = 15
      Width = 54
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Esqueleto:'
      TabOrder = 12
    end
    object DBEdit12: TDBEdit
      Left = 623
      Top = 11
      Width = 208
      Height = 21
      DataField = 'ESQUELETO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 13
    end
    object DBEdit13: TDBEdit
      Left = 623
      Top = 35
      Width = 208
      Height = 21
      DataField = 'PONTE'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 14
    end
    object StaticText8: TStaticText
      Left = 586
      Top = 39
      Width = 35
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Ponte:'
      TabOrder = 15
    end
    object DBEdit14: TDBEdit
      Left = 623
      Top = 59
      Width = 208
      Height = 21
      DataField = 'LIXA'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 16
    end
    object StaticText9: TStaticText
      Left = 595
      Top = 63
      Width = 26
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Lixa:'
      TabOrder = 17
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 339
    Width = 855
    Height = 144
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 4
    object VDBGrid2: TVDBGrid
      Left = 1
      Top = 1
      Width = 853
      Height = 142
      Align = alClient
      DataSource = DMFichaConstrucao.dsFichaConstrucao_MatTam
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Vertical = True
      DefaultColWidth = 55
      TitlesWidth = 67
      Columns = <
        item
          Alignment = taCenter
          FieldName = 'TAMREF'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Tam. Ref:'
        end
        item
          Alignment = taCenter
          FieldName = 'TAMMAT'
          Title.Alignment = taCenter
          Title.Caption = 'Tam. Mat:'
        end>
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 53
    Align = alTop
    TabOrder = 6
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Posi'#231#227'o:'
    end
    object DBText1: TDBText
      Left = 56
      Top = 15
      Width = 577
      Height = 17
      DataField = 'NOMEPOSICAO'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Pos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 213
    Width = 855
    Height = 39
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 2
    object Label8: TLabel
      Left = 80
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Obs:'
    end
    object DBEdit16: TDBEdit
      Left = 110
      Top = 7
      Width = 643
      Height = 21
      DataField = 'OBS'
      DataSource = DMFichaConstrucao.dsFichaConstrucao_Mat
      TabOrder = 0
    end
  end
end
