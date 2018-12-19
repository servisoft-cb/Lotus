object fConsComissao: TfConsComissao
  Left = 95
  Top = 101
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta da comiss'#227'o dos vendedores'
  ClientHeight = 563
  ClientWidth = 785
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 70
    Width = 785
    Height = 390
    Align = alClient
    Caption = 'Extrato'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SMDBGrid1: TSMDBGrid
      Left = 2
      Top = 15
      Width = 781
      Height = 373
      Align = alClient
      DataSource = dsqComissao
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Flat = False
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
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 14
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtReferencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 67
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NroDoc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Nota/Dcto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ParcDoc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 32
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Funcao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Fun'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 278
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrBase'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Base'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PercComissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '% Com.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrComissao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Comiss'#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 34
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtUsuario'
          Title.Alignment = taCenter
          Title.Caption = 'Data Lan'#231'amento'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HrUsuario'
          Title.Alignment = taCenter
          Title.Caption = 'Hr. Usu'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Usuario'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 460
    Width = 785
    Height = 70
    Align = alBottom
    Color = clSilver
    Enabled = False
    TabOrder = 1
    object RxLabel1: TRxLabel
      Left = 8
      Top = 10
      Width = 87
      Height = 13
      Caption = 'Saldo Anterior:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel2: TRxLabel
      Left = 5
      Top = 32
      Width = 90
      Height = 13
      Caption = 'Total Entradas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel3: TRxLabel
      Left = 17
      Top = 54
      Width = 78
      Height = 13
      Caption = 'Total Saidas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel4: TRxLabel
      Left = 344
      Top = 10
      Width = 107
      Height = 13
      Caption = 'Total Devolu'#231#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel5: TRxLabel
      Left = 348
      Top = 32
      Width = 103
      Height = 13
      Caption = 'Total do Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RxLabel6: TRxLabel
      Left = 271
      Top = 54
      Width = 180
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Saldo at'#233' a data final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 94
      Top = 2
      Width = 151
      Height = 21
      AutoSize = False
      DisplayFormat = '###,###,##0.00'
      TabOrder = 0
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 94
      Top = 24
      Width = 151
      Height = 21
      AutoSize = False
      DisplayFormat = '###,###,##0.00'
      TabOrder = 1
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 94
      Top = 46
      Width = 151
      Height = 21
      AutoSize = False
      DisplayFormat = '###,###,##0.00'
      TabOrder = 2
    end
    object CurrencyEdit4: TCurrencyEdit
      Left = 451
      Top = 2
      Width = 151
      Height = 21
      AutoSize = False
      DisplayFormat = '###,###,##0.00'
      TabOrder = 3
    end
    object CurrencyEdit5: TCurrencyEdit
      Left = 451
      Top = 24
      Width = 151
      Height = 21
      AutoSize = False
      DisplayFormat = '###,###,##0.00'
      TabOrder = 4
    end
    object CurrencyEdit6: TCurrencyEdit
      Left = 451
      Top = 46
      Width = 151
      Height = 21
      AutoSize = False
      DisplayFormat = '###,###,##0.00'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 70
    Align = alTop
    Color = clSilver
    TabOrder = 2
    object Label4: TLabel
      Left = 32
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Vendedor:'
    end
    object Label2: TLabel
      Left = 10
      Top = 32
      Width = 104
      Height = 13
      Caption = 'Data Comissao Inicial:'
    end
    object Label1: TLabel
      Left = 305
      Top = 32
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 456
      Top = 10
      Width = 60
      Height = 13
      Caption = 'Ordenar Por:'
    end
    object Label5: TLabel
      Left = 495
      Top = 33
      Width = 24
      Height = 13
      Caption = 'Tipo:'
      Visible = False
    end
    object Label6: TLabel
      Left = 28
      Top = 55
      Width = 86
      Height = 13
      Caption = 'Data La'#231'to Inicial:'
    end
    object Label7: TLabel
      Left = 305
      Top = 55
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 83
      Top = 2
      Width = 356
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsVendedor
      TabOrder = 0
      OnEnter = RxDBLookupCombo1Enter
    end
    object DateEdit1: TDateEdit
      Left = 116
      Top = 24
      Width = 108
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 331
      Top = 24
      Width = 108
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnExit = DateEdit2Exit
    end
    object BitBtn2: TBitBtn
      Left = 664
      Top = 32
      Width = 119
      Height = 29
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 664
      Top = 3
      Width = 119
      Height = 29
      Hint = 'Abre a consulta'
      Caption = '&Consultar  [F5]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn3Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
    end
    object ComboBox1: TComboBox
      Left = 520
      Top = 2
      Width = 105
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Data'
      Items.Strings = (
        'Data'
        'Nota'
        'Cliente')
    end
    object ComboBox2: TComboBox
      Left = 520
      Top = 25
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '1'
      Visible = False
      Items.Strings = (
        '1'
        '2'
        'Ambos')
    end
    object DateEdit3: TDateEdit
      Left = 116
      Top = 47
      Width = 108
      Height = 21
      NumGlyphs = 2
      TabOrder = 7
    end
    object DateEdit4: TDateEdit
      Left = 331
      Top = 47
      Width = 108
      Height = 21
      NumGlyphs = 2
      TabOrder = 8
      OnExit = DateEdit2Exit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 530
    Width = 785
    Height = 33
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      785
      33)
    object BitBtn4: TBitBtn
      Left = 7
      Top = 4
      Width = 106
      Height = 28
      Hint = 'Abre a consulta'
      Anchors = [akLeft, akBottom]
      Caption = 'Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 114
      Top = 4
      Width = 106
      Height = 28
      Hint = 'Abre a consulta'
      Anchors = [akLeft, akBottom]
      Caption = 'Incluir Novo Lan'#231'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn5: TBitBtn
      Left = 220
      Top = 4
      Width = 106
      Height = 28
      Hint = 'Abre a consulta'
      Anchors = [akLeft, akBottom]
      Caption = 'Alterar Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 326
      Top = 4
      Width = 106
      Height = 28
      Hint = 'Abre a consulta'
      Anchors = [akLeft, akBottom]
      Caption = 'Excluir Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn6Click
    end
  end
  object qComissao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbvendedor.Nome, Dbextcomissao.DtReferencia, Dbextcomissa' +
        'o.CodCliente, Dbextcomissao.ParcDoc, Dbextcomissao.NroDoc, Dbext' +
        'comissao.Funcao, Dbextcomissao.VlrBase, Dbextcomissao.PercDescDu' +
        'pl, Dbextcomissao.PercComissao, Dbextcomissao.VlrComissao, Dbext' +
        'comissao.Tipo, Dbextcomissao.CodVendedor, Dbcliente.Nome NomeCli' +
        'ente, Dbextcomissao.DtUsuario, Dbextcomissao.HrUsuario, Dbextcom' +
        'issao.Usuario, Dbextcomissao.NroLancamento'
      'FROM "dbExtComissao.db" Dbextcomissao'
      '   INNER JOIN "dbVendedor.DB" Dbvendedor'
      '   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)  '
      '   FULL OUTER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbextcomissao.CodCliente = Dbcliente.Codigo)  '
      
        'WHERE   ( (Dbextcomissao.Suspensa IS NULL)  OR  (Dbextcomissao.S' +
        'uspensa = FALSE) )  '
      
        '   AND  Dbextcomissao.DtReferencia BETWEEN '#39'01/01/2008'#39' AND '#39'01/' +
        '01/2009'#39'  '
      '   AND  (Dbextcomissao.CodVendedor = 30)  '
      
        'ORDER BY Dbextcomissao.DtReferencia, Dbextcomissao.NroDoc, Dbext' +
        'comissao.ParcDoc, Dbextcomissao.Funcao')
    Left = 456
    Top = 152
    object qComissaoNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbVendedor.DB".Nome'
      Size = 40
    end
    object qComissaoDtReferencia: TDateField
      FieldName = 'DtReferencia'
      Origin = 'TABELAS."dbExtComissao.DB".DtReferencia'
    end
    object qComissaoCodCliente: TIntegerField
      FieldName = 'CodCliente'
      Origin = 'TABELAS."dbExtComissao.DB".CodCliente'
    end
    object qComissaoParcDoc: TIntegerField
      FieldName = 'ParcDoc'
      Origin = 'TABELAS."dbExtComissao.DB".ParcDoc'
    end
    object qComissaoNroDoc: TIntegerField
      FieldName = 'NroDoc'
      Origin = 'TABELAS."dbExtComissao.DB".NroDoc'
    end
    object qComissaoFuncao: TStringField
      FieldName = 'Funcao'
      Origin = 'TABELAS."dbExtComissao.DB".Funcao'
      Size = 1
    end
    object qComissaoVlrBase: TFloatField
      FieldName = 'VlrBase'
      Origin = 'TABELAS."dbExtComissao.DB".VlrBase'
      DisplayFormat = '###,###,##0.00'
    end
    object qComissaoPercDescDupl: TFloatField
      FieldName = 'PercDescDupl'
      Origin = 'TABELAS."dbExtComissao.DB".PercDescDupl'
      DisplayFormat = '0.00'
    end
    object qComissaoPercComissao: TFloatField
      FieldName = 'PercComissao'
      Origin = 'TABELAS."dbExtComissao.DB".PercComissao'
      DisplayFormat = '0.00'
    end
    object qComissaoVlrComissao: TFloatField
      FieldName = 'VlrComissao'
      Origin = 'TABELAS."dbExtComissao.DB".VlrComissao'
      DisplayFormat = '###,###,##0.00'
    end
    object qComissaoTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'TABELAS."dbExtComissao.DB".Tipo'
      Size = 1
    end
    object qComissaoCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object qComissaoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object qComissaoDtUsuario: TDateField
      FieldName = 'DtUsuario'
    end
    object qComissaoHrUsuario: TTimeField
      FieldName = 'HrUsuario'
    end
    object qComissaoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 15
    end
    object qComissaoNroLancamento: TIntegerField
      FieldName = 'NroLancamento'
    end
  end
  object dsqComissao: TDataSource
    DataSet = qComissao
    Left = 480
    Top = 152
  end
  object qSaldoAnt: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbextcomissao.Funcao, SUM( Dbextcomissao.VlrComissao ) Vl' +
        'rComissao, Dbextcomissao.CodVendedor, Dbvendedor.Nome'
      'FROM "dbExtComissao.db" Dbextcomissao'
      '   INNER JOIN "dbVendedor.DB" Dbvendedor'
      '   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)  '
      'WHERE  Dbextcomissao.DtReferencia < :DtIni'
      
        '       AND Dbextcomissao.CodVendedor = :Codigo AND ((Dbextcomiss' +
        'ao.Suspensa IS NULL) or  (Dbextcomissao.Suspensa = False))'
      
        'GROUP BY Dbextcomissao.Funcao, Dbextcomissao.CodVendedor, Dbvend' +
        'edor.Nome'
      'ORDER BY Dbextcomissao.CodVendedor')
    Left = 536
    Top = 102
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DtIni'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qSaldoAntFuncao: TStringField
      FieldName = 'Funcao'
      Origin = 'TABELAS."dbExtComissao.DB".Funcao'
      Size = 1
    end
    object qSaldoAntVlrComissao: TFloatField
      FieldName = 'VlrComissao'
      Origin = 'TABELAS."dbExtComissao.DB".VlrComissao'
    end
    object qSaldoAntCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
      Origin = 'TABELAS."dbExtComissao.DB".CodVendedor'
    end
    object qSaldoAntNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbVendedor.DB".Nome'
      Size = 40
    end
  end
end
