object fConsEstoqueMat: TfConsEstoqueMat
  Left = 141
  Top = 16
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Estoque'
  ClientHeight = 661
  ClientWidth = 1008
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
    Width = 1008
    Height = 661
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1006
      Height = 76
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 5
        Top = 53
        Width = 140
        Height = 16
        Caption = 'Data de Refer'#234'ncia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 392
        Top = 56
        Width = 32
        Height = 13
        Caption = 'Grupo:'
      end
      object Panel3: TPanel
        Left = 578
        Top = 4
        Width = 192
        Height = 39
        TabOrder = 2
        object BitBtn3: TBitBtn
          Left = 97
          Top = 6
          Width = 92
          Height = 30
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
        object BitBtn6: TBitBtn
          Left = 5
          Top = 6
          Width = 92
          Height = 30
          Hint = 'Imprime o relat'#243'rio cfe. sele'#231#227'o acima'
          Caption = '&Imprimir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtn6Click
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
      end
      object DateEdit1: TDateEdit
        Left = 145
        Top = 49
        Width = 96
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 242
        Top = 45
        Width = 89
        Height = 25
        Caption = 'Consulta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          36050000424D360500000000000036040000280000000E000000100000000100
          08000000000000010000CA0E0000C30E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000ACACACACACAC
          ACACACAC0000ACAC0000ACACACACACACACACAC02230500AC0000ACAC00000000
          00000223050500000000ACAC56ACACACAC02230505ACAC000000ACAC56D7D7D7
          02230505ACD7AC000000ACAC56000056AC0505ACD7D7AC000000AC56AC23AC00
          5656ACD7D7D7AC00000056D723AC23AC00ACD7D7D7D7AC0000005623D723AC23
          00ACD7D7D7D7AC00000056D723D723AC00ACD7D7D7D7AC000000AC56D723D700
          ACD7D7D7D7D7AC000000ACAC565600ACD7D7D7D7D7D7AC000000ACAC56D7D7D7
          D7D7D7D700000000FFFFACAC56D7D7D7D7D7D7D7ACD756AC0000ACAC56D7D7D7
          D7D7D7D7AC56ACAC0000ACAC565656565656565656ACACAC0000}
      end
      object RadioGroup2: TRadioGroup
        Left = 6
        Top = 6
        Width = 161
        Height = 35
        Caption = 'Op'#231#227'o do relat'#243'rio'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Com Saldo'
          'Todos')
        TabOrder = 3
        OnClick = RadioGroup2Click
      end
      object RadioGroup1: TRadioGroup
        Left = 418
        Top = 6
        Width = 157
        Height = 35
        Caption = 'Tipo da Impress'#227'o'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Dos'
          'Windows')
        TabOrder = 4
      end
      object RadioGroup3: TRadioGroup
        Left = 170
        Top = 6
        Width = 245
        Height = 35
        Caption = ' Mercado '
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Exporta'#231#227'o'
          'Interno'
          'Ambos')
        TabOrder = 5
        OnClick = RadioGroup2Click
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 424
        Top = 48
        Width = 337
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsGrupo
        TabOrder = 6
      end
      object CheckBox1: TCheckBox
        Left = 765
        Top = 56
        Width = 120
        Height = 17
        Caption = 'Imprimir os tamanhos'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 118
      Width = 1006
      Height = 426
      Align = alClient
      Caption = 'Estoque'
      TabOrder = 1
      object SMDBGrid1: TSMDBGrid
        Left = 2
        Top = 15
        Width = 1002
        Height = 409
        Align = alClient
        Ctl3D = False
        DataSource = dsEstoque
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid1DblClick
        Flat = True
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
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 15
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 9
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'lkSelEstoque'
            Width = 73
            Visible = True
          end
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
            Expanded = False
            FieldName = 'NomeCor'
            Title.Alignment = taCenter
            Title.Caption = 'Nome da Cor'
            Width = 233
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Largura'
            Title.Alignment = taCenter
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd'
            Title.Alignment = taCenter
            Title.Caption = 'Saldo Estoque'
            Width = 88
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'clQtdOC'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. O. Compra'
            Width = 91
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EstMinimo'
            Title.Alignment = taCenter
            Title.Caption = 'Est. M'#237'nimo'
            Visible = True
          end>
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 561
      Width = 1006
      Height = 99
      Align = alBottom
      Caption = 'Estoque da grade'
      TabOrder = 2
      object VDBGrid2: TVDBGrid
        Left = 2
        Top = 15
        Width = 1002
        Height = 79
        Align = alTop
        DataSource = dsEstoqueGrade
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Vertical = True
        DefaultColWidth = 35
        TitlesWidth = 60
        Columns = <
          item
            Alignment = taCenter
            FieldName = 'Tamanho'
            Title.Alignment = taCenter
            Title.Caption = 'Tamanho:'
          end
          item
            Alignment = taCenter
            FieldName = 'Qtd'
            Title.Alignment = taCenter
            Title.Caption = 'Quantid.:'
          end>
      end
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 544
      Width = 1006
      Height = 17
      Align = alBottom
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 
        'Duplo Clique = Mostra as ordens de compras pendentes do material' +
        ' selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Panel4: TPanel
      Left = 1
      Top = 77
      Width = 1006
      Height = 41
      Align = alTop
      Color = clSilver
      TabOrder = 4
      Visible = False
      object Shape1: TShape
        Left = 437
        Top = 16
        Width = 30
        Height = 17
        Brush.Color = 16777088
      end
      object Label3: TLabel
        Left = 469
        Top = 17
        Width = 206
        Height = 13
        Caption = 'Selecionado para copiar para o Documento'
      end
      object BitBtn2: TBitBtn
        Left = 16
        Top = 10
        Width = 137
        Height = 25
        Caption = 'Selecionar Todos'
        TabOrder = 0
        OnClick = BitBtn2Click
      end
      object BitBtn4: TBitBtn
        Left = 154
        Top = 10
        Width = 137
        Height = 25
        Caption = 'Desmarcar Todos'
        TabOrder = 1
        OnClick = BitBtn4Click
      end
      object btnCopiar: TBitBtn
        Left = 736
        Top = 8
        Width = 121
        Height = 25
        Caption = 'Copiar Selecionados'
        TabOrder = 2
        Visible = False
        OnClick = btnCopiarClick
      end
    end
  end
  object qEstoque: TQuery
    AfterScroll = qEstoqueAfterScroll
    OnCalcFields = qEstoqueCalcFields
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbmaterial.Codigo CodMaterial, Dbmaterial.Nome N' +
        'omeMaterial, Dbestoquematmov.CodCor, '
      
        'SUM(Dbestoquematmov.Qtd2) Qtd, Dbmaterial.EstMinimo, Dbestoquema' +
        'tmov.Largura, Dbcor.Nome NomeCor, Dbmaterial.SelEstoque'
      'FROM "dbMaterial.DB" Dbmaterial'
      '   INNER JOIN "dbEstoqueMatMov.DB" Dbestoquematmov'
      '   ON  (Dbmaterial.Codigo = Dbestoquematmov.CodMaterial)  '
      '   FULL JOIN "dbCor.DB" Dbcor'
      '   ON  (Dbestoquematmov.CodCor = Dbcor.Codigo)  '
      
        'GROUP BY Dbmaterial.Codigo, Dbmaterial.Nome, Dbestoquematmov.Cod' +
        'Cor, Dbmaterial.EstMinimo, '
      'Dbestoquematmov.Largura, Dbcor.Nome, Dbmaterial.SelEstoque'
      'ORDER BY NomeMaterial, NomeCor')
    Left = 242
    Top = 320
    object qEstoqueCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object qEstoqueCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qEstoqueNomeMaterial: TStringField
      FieldName = 'NomeMaterial'
      Size = 60
    end
    object qEstoqueQtd: TFloatField
      FieldName = 'Qtd'
      DisplayFormat = '0.00000'
      EditFormat = '0.00000'
    end
    object qEstoqueEstMinimo: TFloatField
      FieldName = 'EstMinimo'
      DisplayFormat = '0.00000'
    end
    object qEstoqueLargura: TStringField
      FieldName = 'Largura'
      Size = 1
    end
    object qEstoqueNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 15
    end
    object qEstoqueclQtdOC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clQtdOC'
      Calculated = True
    end
    object qEstoqueSelEstoque: TBooleanField
      FieldName = 'SelEstoque'
    end
    object qEstoquelkSelEstoque: TBooleanField
      FieldKind = fkLookup
      FieldName = 'lkSelEstoque'
      LookupDataSet = DM1.tMaterial
      LookupKeyFields = 'Codigo'
      LookupResultField = 'SelEstoque'
      KeyFields = 'CodMaterial'
      Lookup = True
    end
  end
  object dsEstoque: TDataSource
    DataSet = qEstoque
    Left = 274
    Top = 320
  end
  object qEstoqueGrade: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbestoquematmov.CodMaterial, Dbestoquematmov.CodCor, Dbes' +
        'toquematmov.Largura, SUM( Dbestoquematmovgrade.Qtd2 ) Qtd, Dbest' +
        'oquematmovgrade.Tamanho'
      'FROM "dbEstoqueMatMov.DB" Dbestoquematmov'
      '   INNER JOIN "dbEstoqueMatMovGrade.DB" Dbestoquematmovgrade'
      '   ON  (Dbestoquematmov.NumMov = Dbestoquematmovgrade.NumMov)  '
      'WHERE  Dbestoquematmov.DtMov <= :Data'
      
        'GROUP BY Dbestoquematmov.CodMaterial, Dbestoquematmov.CodCor, Db' +
        'estoquematmov.Largura, Dbestoquematmovgrade.Tamanho')
    Left = 376
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qEstoqueGradeCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".CodMaterial'
    end
    object qEstoqueGradeCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".CodCor'
    end
    object qEstoqueGradeLargura: TStringField
      FieldName = 'Largura'
      Origin = 'TABELAS."dbEstoqueMatMov.DB".Largura'
      Size = 1
    end
    object qEstoqueGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Origin = 'TABELAS."dbEstoqueMatMovGrade.DB".Tamanho'
      Size = 3
    end
    object qEstoqueGradeQtd: TFloatField
      FieldName = 'Qtd'
      Origin = 'TABELAS."dbEstoqueMatMovGrade.DB".Qtd2'
    end
  end
  object dsEstoqueGrade: TDataSource
    DataSet = qEstoqueGrade
    Left = 400
    Top = 328
  end
  object qOC: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT CodMaterial, CodCor, SUM( QtdRestante ) QtdRestante'
      'FROM "dbOrdemCompraItem.DB" Dbordemcompraitem'
      'WHERE  QtdRestante > 0 '
      'GROUP BY CodMaterial, CodCor')
    Left = 314
    Top = 261
    object qOCCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".CodMaterial'
    end
    object qOCCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".CodCor'
    end
    object qOCQtdRestante: TFloatField
      FieldName = 'QtdRestante'
      Origin = 'TABELAS."dbOrdemCompraItem.DB".QtdRestante'
    end
  end
end
