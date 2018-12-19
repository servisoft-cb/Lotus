object fConsProgramacao: TfConsProgramacao
  Left = 20
  Top = 15
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Programações'
  ClientHeight = 530
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 530
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 7
      Top = 8
      Width = 748
      Height = 32
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 633
        Top = 3
        Width = 110
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
    object GroupBox2: TGroupBox
      Left = 7
      Top = 199
      Width = 747
      Height = 160
      Caption = 'Itens das Programações'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object RxDBGrid2: TRxDBGrid
      Left = 14
      Top = 216
      Width = 734
      Height = 138
      DataSource = DM1.dsProgramacaoItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumLancamento'
          Title.Alignment = taCenter
          Title.Caption = 'Nº Programação'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pedido'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ItemPedido'
          Title.Alignment = taCenter
          Title.Caption = 'Item do Pedido'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkCliente'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkReferencia'
          Title.Alignment = taCenter
          Title.Caption = 'Referência'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkCor'
          Title.Alignment = taCenter
          Title.Caption = 'Cor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkCorSolado'
          Title.Alignment = taCenter
          Title.Caption = 'Cor de Solado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QtdPares'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Pares'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtEmbarqueI'
          Title.Alignment = taCenter
          Title.Caption = 'Emb. Inicial'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtEmbarqueF'
          Title.Alignment = taCenter
          Title.Caption = 'Emb. Final'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtCorteI'
          Title.Alignment = taCenter
          Title.Caption = 'Corte Inicial'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtCorteF'
          Title.Alignment = taCenter
          Title.Caption = 'Corte Final'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtCosturaI'
          Title.Caption = 'Costura Inic.'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtCosturaF'
          Title.Alignment = taCenter
          Title.Caption = 'Costura Final'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtPreI'
          Title.Alignment = taCenter
          Title.Caption = 'Pré Inicial'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtPreF'
          Title.Alignment = taCenter
          Title.Caption = 'Pré Final'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtMontagemI'
          Title.Alignment = taCenter
          Title.Caption = 'Mont. Inicial'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DtMontagemF'
          Title.Alignment = taCenter
          Title.Caption = 'Mont. Final'
          Width = 65
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 40
      Width = 747
      Height = 160
      Caption = 'Programações'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object RxDBGrid1: TRxDBGrid
      Left = 14
      Top = 57
      Width = 734
      Height = 138
      DataSource = DM1.dsProgramacao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumLancamento'
          Title.Alignment = taCenter
          Title.Caption = 'Nº Programação'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fabrica'
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QtdDiaCorte'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Dia/Corte'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QtdDiaCostura'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Dia/Costura'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QtdDiaPre'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Dia/Pré'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QtdDiaMontagem'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Dia/Montagem'
          Visible = True
        end>
    end
    object GroupBox3: TGroupBox
      Left = 7
      Top = 361
      Width = 747
      Height = 160
      Caption = 'Datas e Produções'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object RxDBGrid3: TRxDBGrid
      Left = 14
      Top = 378
      Width = 734
      Height = 138
      DataSource = DM1.dsProgramacaoDatas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumLancamento'
          Title.Caption = 'Nº Programação'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Data'
          Title.Alignment = taCenter
          Title.Caption = 'Datas'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QtdCorte'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Corte'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QtdCostura'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Costura'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QtdPre'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Pré'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QtdMontagem'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Montagem'
          Width = 95
          Visible = True
        end>
    end
  end
end
