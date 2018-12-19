object fConsMovTalaoMI: TfConsMovTalaoMI
  Left = 5
  Top = 10
  Width = 784
  Height = 583
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Movimento de tal'#245'es   (Mercado Interno)'
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
    Width = 776
    Height = 556
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 769
      Height = 41
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 131
        Top = 10
        Width = 247
        Height = 20
        Caption = 'Consulta pelo n'#250'mero do Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 380
        Top = 9
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object BitBtn1: TBitBtn
        Left = 685
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      object BitBtn2: TBitBtn
        Left = 568
        Top = 8
        Width = 107
        Height = 25
        Hint = 'Consulta a quantidade produzida'
        Caption = 'Cons. Qtd. Prod.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333FF3FF3333333333CC30003333333333773777333333333C33
          3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
          33003377333337F33377333333333C333300333F333337F33377339333333C33
          3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
          330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
          330077F377F337F33377993399333C33330077FF773337F33377399993333C33
          33333777733337F333FF333333333C33300033333333373FF7773333333333CC
          3000333333333377377733333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object Panel3: TPanel
      Left = 3
      Top = 46
      Width = 769
      Height = 485
      BevelOuter = bvLowered
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 4
        Top = 1
        Width = 242
        Height = 129
        Caption = 'LOTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 250
        Top = 1
        Width = 514
        Height = 129
        Caption = 'PEDIDOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object RxDBGrid2: TRxDBGrid
        Left = 254
        Top = 15
        Width = 503
        Height = 111
        DataSource = DM1.dsLotePedidoMI
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
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
            FieldName = 'Pedido'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkPedidoCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Ped.Cliente'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkPedCliDif'
            Title.Alignment = taCenter
            Title.Caption = 'Dig.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCliente'
            Title.Alignment = taCenter
            Title.Caption = 'Nome do Cliente'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkEmbarque'
            Title.Alignment = taCenter
            Title.Caption = 'Emb.Inicial'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkEmbFinal'
            Title.Alignment = taCenter
            Title.Caption = 'Emb.Final'
            Visible = True
          end>
      end
      object GroupBox3: TGroupBox
        Left = 4
        Top = 130
        Width = 760
        Height = 129
        Caption = 'Tal'#245'es '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object RxDBGrid3: TRxDBGrid
        Left = 8
        Top = 144
        Width = 752
        Height = 111
        DataSource = DM1.dsTalaoMI
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
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
            FieldName = 'Item'
            Title.Alignment = taCenter
            Title.Caption = 'Tal'#227'o'
            Width = 32
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumPedido'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Pedido'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ItemPedido'
            Title.Alignment = taCenter
            Title.Caption = 'It.Pedido'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'lkReferencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkDescMaterial'
            Title.Alignment = taCenter
            Title.Caption = 'Material'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkConstrucao'
            Title.Alignment = taCenter
            Title.Caption = 'Constru'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCor'
            Title.Alignment = taCenter
            Title.Caption = 'Cor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QtdPar'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.Par'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCorSolado'
            Title.Alignment = taCenter
            Title.Caption = 'Cor do Solado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeSolado'
            Title.Alignment = taCenter
            Title.Caption = 'Solado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCabedal1'
            Title.Alignment = taCenter
            Title.Caption = 'Cabedal 1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeCabedal2'
            Title.Alignment = taCenter
            Title.Caption = 'Cabedal 2'
            Visible = True
          end>
      end
      object GroupBox5: TGroupBox
        Left = 4
        Top = 260
        Width = 761
        Height = 220
        Caption = 'MOVIMENTOS DOS TAL'#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object BitBtn3: TBitBtn
          Left = 715
          Top = 20
          Width = 42
          Height = 195
          Hint = 'Exclui o '#250'ltimo movimento do tal'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
        end
      end
      object RxDBGrid5: TRxDBGrid
        Left = 8
        Top = 280
        Width = 709
        Height = 195
        DataSource = dsTalaoMovMI
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
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
            FieldName = 'Setor'
            Title.Alignment = taCenter
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeSetor'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Setor'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataEnt'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Entrada'
            Width = 66
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HoraEnt'
            Title.Alignment = taCenter
            Title.Caption = 'Hr.Entrada'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DataSaida'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Saida'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HoraSaida'
            Title.Alignment = taCenter
            Title.Caption = 'Hr. Saida'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CodAtelier'
            Title.Alignment = taCenter
            Title.Caption = 'Atelier'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeAtelier'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Atelier'
            Visible = True
          end>
      end
      object RxDBGrid1: TRxDBGrid
        Left = 7
        Top = 15
        Width = 234
        Height = 111
        DataSource = DM1.dsLoteMI
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Lote'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QtdTaloes'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.Tal'#245'es'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QtdPares'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.Pares'
            Width = 70
            Visible = True
          end>
      end
    end
  end
  object tTalaoMovMI: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Lote;Talao'
    MasterFields = 'Lote;Item'
    MasterSource = DM1.dsTalaoMI
    TableName = 'dbTalaoMovMI.db'
    Left = 43
    Top = 382
    object tTalaoMovMILote: TIntegerField
      FieldName = 'Lote'
    end
    object tTalaoMovMITalao: TIntegerField
      FieldName = 'Talao'
    end
    object tTalaoMovMISetor: TIntegerField
      FieldName = 'Setor'
    end
    object tTalaoMovMIDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object tTalaoMovMIHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object tTalaoMovMIDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object tTalaoMovMIHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object tTalaoMovMICodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object tTalaoMovMIlkNomeSetor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeSetor'
      LookupDataSet = DM1.tSetor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Setor'
      Size = 15
      Lookup = True
    end
    object tTalaoMovMIlkNomeAtelier: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeAtelier'
      LookupDataSet = DM1.tAtelier
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Atelier'
      KeyFields = 'CodAtelier'
      Size = 50
      Lookup = True
    end
  end
  object dsTalaoMovMI: TDataSource
    DataSet = tTalaoMovMI
    Left = 75
    Top = 382
  end
end
