object fPrevSitAtelier: TfPrevSitAtelier
  Left = 216
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Situa'#231#227'o do Atelier'
  ClientHeight = 226
  ClientWidth = 290
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
    Left = 1
    Top = 1
    Width = 288
    Height = 224
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 178
      Width = 288
      Height = 2
      Shape = bsTopLine
      Style = bsRaised
    end
    object StaticText1: TStaticText
      Left = 5
      Top = 155
      Width = 36
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Atelier:'
      TabOrder = 6
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 43
      Top = 151
      Width = 241
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Atelier'
      LookupSource = DM1.dsAtelier
      TabOrder = 5
      OnEnter = RxDBLookupCombo1Enter
    end
    object Panel2: TPanel
      Left = 5
      Top = 184
      Width = 277
      Height = 36
      BevelInner = bvRaised
      TabOrder = 7
      object RxSpeedButton2: TRxSpeedButton
        Left = 4
        Top = 6
        Width = 88
        Height = 25
        Hint = 'Imprime o relat'#243'rio cfe. sele'#231#227'o acima'
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
        Left = 93
        Top = 6
        Width = 90
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'C&ancelar'
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
        Left = 183
        Top = 6
        Width = 90
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
    object RadioGroup1: TRadioGroup
      Left = 5
      Top = 34
      Width = 280
      Height = 38
      Caption = 'Situa'#231#227'o'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Pendente'
        'Entregue'
        'Ambos')
      TabOrder = 2
      OnClick = RadioGroup1Click
      OnExit = RadioGroup1Click
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 74
      Width = 135
      Height = 71
      Caption = 'Data Entrada no Atelier'
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 13
        Caption = 'Inicial:'
      end
      object Label2: TLabel
        Left = 13
        Top = 48
        Width = 25
        Height = 13
        Caption = 'Final:'
      end
      object DateEdit1: TDateEdit
        Left = 40
        Top = 16
        Width = 90
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit2: TDateEdit
        Left = 40
        Top = 40
        Width = 90
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 149
      Top = 74
      Width = 135
      Height = 71
      Caption = 'Data Entregue'
      Enabled = False
      TabOrder = 4
      object Label3: TLabel
        Left = 8
        Top = 24
        Width = 30
        Height = 13
        Caption = 'Inicial:'
      end
      object Label4: TLabel
        Left = 13
        Top = 48
        Width = 25
        Height = 13
        Caption = 'Final:'
      end
      object DateEdit3: TDateEdit
        Left = 40
        Top = 16
        Width = 90
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit4: TDateEdit
        Left = 40
        Top = 40
        Width = 90
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 10
      Width = 97
      Height = 17
      Caption = 'Por Refer'#234'ncia'
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 160
      Top = 10
      Width = 97
      Height = 17
      Caption = 'Resumido'
      TabOrder = 1
      OnExit = CheckBox2Exit
    end
  end
  object qSituacao: TQuery
    DatabaseName = 'Tabelas'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT Dbtalaomov.Lote, Dbtalaomov.Talao, Dbtalaomov.DataEnt, Db' +
        'talaomov.HoraEnt, Dbproduto.Referencia, Dbtalaomov.CodAtelier, D' +
        'btalaograde.QtdPar, Dbtalaomov.DataSaida, Dbtalaomov.HoraSaida, ' +
        'Dbgradeitem.Tamanho'
      'FROM "dbTalaoMov.db" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)  '
      '   AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)  '
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalao.Lote = Dbtalaograde.Lote)  '
      '   AND  (Dbtalao.Item = Dbtalaograde.Item)  '
      '   INNER JOIN "dbGradeItem.DB" Dbgradeitem'
      '   ON  (Dbgradeitem.CodGrade = Dbtalaograde.CodGrade)  '
      '   AND  (Dbgradeitem.Posicao = Dbtalaograde.Posicao)  '
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbproduto.Codigo = Dbtalao.CodProduto)  '
      'WHERE   (Dbtalaomov.CodAtelier = 4)  '
      '   AND  (Dbtalaomov.DataSaida >= '#39'01/01/2002'#39')  '
      '   AND  (Dbtalaomov.DataSaida <= '#39'12/31/2002'#39')  '
      '   AND  (Dbtalaomov.DataEnt >= '#39'01/01/2002'#39')  '
      '   AND  (Dbtalaomov.DataEnt <= '#39'12/31/2002'#39')  '
      
        'ORDER BY Dbtalaomov.Lote, Dbtalaomov.Talao, Dbtalaomov.DataEnt, ' +
        'Dbtalaomov.HoraEnt')
    Left = 217
    Top = 153
    object qSituacaoLote: TIntegerField
      FieldName = 'Lote'
    end
    object qSituacaoTalao: TIntegerField
      FieldName = 'Talao'
    end
    object qSituacaoDataEnt: TDateField
      FieldName = 'DataEnt'
    end
    object qSituacaoHoraEnt: TTimeField
      FieldName = 'HoraEnt'
    end
    object qSituacaoReferencia: TStringField
      FieldName = 'Referencia'
    end
    object qSituacaoCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
    object qSituacaoQtdPar: TIntegerField
      FieldName = 'QtdPar'
    end
    object qSituacaoDataSaida: TDateField
      FieldName = 'DataSaida'
    end
    object qSituacaoHoraSaida: TTimeField
      FieldName = 'HoraSaida'
    end
    object qSituacaoTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 3
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 177
    Top = 154
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir1Click
    end
    object Visualizar1: TMenuItem
      Caption = '&Visualizar'
      OnClick = Visualizar1Click
    end
  end
  object qReferencia: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbproduto.Referencia, Dbproduto.Codigo, Dbprodut' +
        'o.VlrAtelier'
      'FROM "dbProduto.DB" Dbproduto'
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbproduto.Codigo = Dbtalao.CodProduto)  '
      '   INNER JOIN "dbTalaoMov.db" Dbtalaomov'
      '   ON  (Dbtalao.Lote = Dbtalaomov.Lote)  '
      'WHERE  Dbtalaomov.CodAtelier = :CodAtelier')
    Left = 249
    Top = 153
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'CodAtelier'
        ParamType = ptUnknown
        Value = 0
      end>
    object qReferenciaReferencia: TStringField
      FieldName = 'Referencia'
    end
    object qReferenciaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qReferenciaVlrAtelier: TFloatField
      FieldName = 'VlrAtelier'
    end
  end
  object qPagtos: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcpagarparc.CodAtelier, SUM( Dbcpagarparchist.VlrUltPgto' +
        ' ) VlrPagto, Dbcpagarparchist.Pgto'
      'FROM "DBCPAGARPARC.DB" Dbcpagarparc'
      '   INNER JOIN "dbCPagarParcHist.DB" Dbcpagarparchist'
      '   ON  (Dbcpagarparchist.NumCPagar = Dbcpagarparc.NumCPagar)  '
      
        '   AND  (Dbcpagarparchist.ParcCPagar = Dbcpagarparc.ParcCPagar) ' +
        ' '
      
        'WHERE   Dbcpagarparchist.DtHistorico BETWEEN '#39'01/01/2001'#39' AND '#39'0' +
        '1/01/2003'#39'  '
      '   AND  (Dbcpagarparchist.Pgto = TRUE)  '
      'GROUP BY Dbcpagarparc.CodAtelier, Dbcpagarparchist.Pgto')
    Left = 121
    Top = 153
    object qPagtosCodAtelier: TIntegerField
      FieldName = 'CodAtelier'
      Origin = 'TABELAS."dbCPagarParc.DB".CodAtelier'
    end
    object qPagtosVlrPagto: TFloatField
      FieldName = 'VlrPagto'
      Origin = 'TABELAS."dbCPagarParcHist.DB".VlrUltPgto'
    end
    object qPagtosPgto: TBooleanField
      FieldName = 'Pgto'
      Origin = 'TABELAS."dbCPagarParcHist.DB".Pgto'
    end
  end
end
