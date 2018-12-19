object fRelProducao: TfRelProducao
  Left = 343
  Top = 270
  BorderStyle = bsSingle
  Caption = 'fRelProducao'
  ClientHeight = 117
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 1
    Top = 3
    Width = 330
    Height = 73
  end
  object Label1: TLabel
    Left = 10
    Top = 52
    Width = 56
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label2: TLabel
    Left = 168
    Top = 52
    Width = 51
    Height = 13
    Caption = 'Data Final:'
  end
  object Label3: TLabel
    Left = 26
    Top = 27
    Width = 38
    Height = 13
    Caption = 'F'#225'brica:'
  end
  object RLReport1: TRLReport
    Left = 16
    Top = 144
    Width = 1123
    Height = 794
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 1047
      Height = 219
      DataSource = DataSource2
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 1047
        Height = 113
        DataFields = 'CodFabrica'
        object RLGroup2: TRLGroup
          Left = 0
          Top = 19
          Width = 1047
          Height = 86
          DataFields = 'CodFabrica;Data'
          object RLBand2: TRLBand
            Left = 0
            Top = 41
            Width = 1047
            Height = 16
            object RLDBText1: TRLDBText
              Left = 136
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares1'
              DataSource = DataSource2
            end
            object RLDBText2: TRLDBText
              Left = 248
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares2'
              DataSource = DataSource2
            end
            object RLDBText7: TRLDBText
              Left = 360
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares3'
              DataSource = DataSource2
            end
            object RLDBText8: TRLDBText
              Left = 472
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares4'
              DataSource = DataSource2
            end
            object RLDBText9: TRLDBText
              Left = 700
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares6'
              DataSource = DataSource2
            end
            object RLDBText10: TRLDBText
              Left = 587
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares5'
              DataSource = DataSource2
            end
            object RLDBText11: TRLDBText
              Left = 816
              Top = 2
              Width = 47
              Height = 12
              DataField = 'QtdPares7'
              DataSource = DataSource2
            end
            object RLDBText12: TRLDBText
              Left = 8
              Top = 2
              Width = 49
              Height = 12
              DataField = 'Referencia'
              DataSource = DataSource2
            end
          end
          object RLBand1: TRLBand
            Left = 0
            Top = 0
            Width = 1047
            Height = 41
            BandType = btHeader
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Borders.FixedBottom = True
            BeforePrint = RLBand1BeforePrint
            object RLDBText4: TRLDBText
              Left = 48
              Top = 12
              Width = 23
              Height = 12
              DataField = 'Data'
              DataSource = DataSource2
            end
            object Setor1: TRLLabel
              Left = 136
              Top = 27
              Width = 30
              Height = 12
            end
            object Setor2: TRLLabel
              Left = 248
              Top = 27
              Width = 30
              Height = 12
            end
            object Setor3: TRLLabel
              Left = 360
              Top = 27
              Width = 30
              Height = 12
            end
            object Setor4: TRLLabel
              Left = 472
              Top = 27
              Width = 30
              Height = 12
            end
            object Setor5: TRLLabel
              Left = 588
              Top = 27
              Width = 30
              Height = 12
            end
            object Setor6: TRLLabel
              Left = 700
              Top = 27
              Width = 30
              Height = 12
            end
            object Setor7: TRLLabel
              Left = 816
              Top = 27
              Width = 30
              Height = 12
            end
            object RLLabel1: TRLLabel
              Left = 8
              Top = 29
              Width = 49
              Height = 12
              Caption = 'Refer'#234'ncia'
            end
            object RLLabel2: TRLLabel
              Left = 8
              Top = 12
              Width = 26
              Height = 12
              Caption = 'Data:'
            end
          end
          object RLBand4: TRLBand
            Left = 0
            Top = 57
            Width = 1047
            Height = 24
            BandType = btSummary
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Borders.FixedTop = True
            object ResultData1: TRLDBResult
              Left = 136
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares1'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
            object ResultData2: TRLDBResult
              Left = 248
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares2'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
            object ResultData3: TRLDBResult
              Left = 360
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares3'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
            object ResultData4: TRLDBResult
              Left = 472
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares4'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
            object ResultData5: TRLDBResult
              Left = 587
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares5'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
            object ResultData6: TRLDBResult
              Left = 700
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares6'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
            object ResultData7: TRLDBResult
              Left = 816
              Top = 2
              Width = 75
              Height = 12
              DataField = 'QtdPares7'
              DataSource = DataSource2
              DisplayMask = '0'
              Info = riSum
              ResetAfterPrint = True
              Visible = False
            end
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 1047
          Height = 19
          BandType = btHeader
          object RLDBText3: TRLDBText
            Left = 48
            Top = 1
            Width = 41
            Height = 12
            DataField = 'lkFabrica'
            DataSource = DataSource2
          end
          object RLLabel3: TRLLabel
            Left = 8
            Top = 1
            Width = 37
            Height = 12
            Caption = 'F'#225'brica:'
          end
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 113
        Width = 1047
        Height = 32
        BandType = btSummary
        object ResultTotal1: TRLDBResult
          Left = 136
          Top = 0
          Width = 75
          Height = 12
          DataField = 'QtdPares1'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
        object ResultTotal2: TRLDBResult
          Left = 248
          Top = -1
          Width = 75
          Height = 12
          DataField = 'QtdPares2'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
        object ResultTotal3: TRLDBResult
          Left = 360
          Top = -1
          Width = 75
          Height = 12
          DataField = 'QtdPares3'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
        object ResultTotal4: TRLDBResult
          Left = 472
          Top = -1
          Width = 75
          Height = 12
          DataField = 'QtdPares4'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
        object ResultTotal5: TRLDBResult
          Left = 587
          Top = -1
          Width = 75
          Height = 12
          DataField = 'QtdPares5'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
        object ResultTotal6: TRLDBResult
          Left = 700
          Top = -1
          Width = 75
          Height = 12
          DataField = 'QtdPares6'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
        object ResultTotal7: TRLDBResult
          Left = 816
          Top = -1
          Width = 75
          Height = 12
          DataField = 'QtdPares7'
          DataSource = DataSource2
          DisplayMask = '0'
          Info = riSum
          Visible = False
        end
      end
    end
  end
  object DateEdit1: TDateEdit
    Left = 69
    Top = 44
    Width = 96
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object DateEdit2: TDateEdit
    Left = 220
    Top = 44
    Width = 104
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 70
    Top = 19
    Width = 254
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsFabrica
    TabOrder = 0
    OnEnter = RxDBLookupCombo1Enter
    OnExit = RxDBLookupCombo1Exit
  end
  object BitBtn1: TBitBtn
    Left = 1
    Top = 84
    Width = 110
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      88888800000000000888808888888880808800000000000008080888888BBB88
      0008088888877788080800000000000008800888888888808080800000000008
      0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
      088888880FFFFFFFF08888888000000000888888888888888888}
  end
  object BitBtn2: TBitBtn
    Left = 111
    Top = 84
    Width = 110
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 221
    Top = 84
    Width = 110
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
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
  object qrRelProducao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'select dbTalaoMov.CodSetor Setor, dbLote.CodFabrica, dbTalaoMov.' +
        'DtSaida DataSaida, dbPedidoItem.CodProduto, '
      'dbProduto.Referencia, dbPedidoItem.QtdPares'
      'From "dbTalaoAuxiliar.db" dbTalaoMov'
      'left join "dbLote.db" dbLote on (dbLote.Lote = dbTalaoMov.Lote)'
      
        'left join "dbPedidoItem.db" dbPedidoItem on (dbPedidoItem.Pedido' +
        ' = dbLote.NroPedido and dbPedidoItem.Item = dbLote.ItemPed)'
      
        'left join "dbProduto.db" dbProduto on (dbProduto.Codigo = dbPedi' +
        'doItem.CodProduto)'
      'where DtSaida is not null'
      ''
      'union'
      
        'select dbTalaoMov.Setor, dbLote.CodFabrica, dbTalaoMov.DataSaida' +
        ', dbPedidoItem.CodProduto, '
      'dbProduto.Referencia, dbPedidoItem.QtdPares'
      'From "dbTalaoMov.db" dbTalaoMov'
      'left join "dbLote.db" dbLote on (dbLote.Lote = dbTalaoMov.Lote)'
      
        'left join "dbPedidoItem.db" dbPedidoItem on (dbPedidoItem.Pedido' +
        ' = dbLote.NroPedido and dbPedidoItem.Item = dbLote.ItemPed)'
      
        'left join "dbProduto.db" dbProduto on (dbProduto.Codigo = dbPedi' +
        'doItem.CodProduto)'
      'where DataSaida is not null'
      ''
      '')
    Left = 128
    Top = 304
  end
  object cdsRelProducao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodFabrica'
        DataType = ftInteger
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodSetor1'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor2'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor3'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor4'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor5'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor6'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor7'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares1'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares2'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares3'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares4'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares5'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares6'
        DataType = ftInteger
      end
      item
        Name = 'QtdPares7'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CodFabrica'
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 336
    Data = {
      550100009619E0BD01000000180000001100000000000300000055010A436F64
      466162726963610400010000000000044461746104000600000000000A526566
      6572656E636961010049000000010005574944544802000200320009436F6453
      65746F7231040001000000000009436F645365746F7232040001000000000009
      436F645365746F7233040001000000000009436F645365746F72340400010000
      00000009436F645365746F7235040001000000000009436F645365746F723604
      0001000000000009436F645365746F7237040001000000000009517464506172
      6573310400010000000000095174645061726573320400010000000000095174
      6450617265733304000100000000000951746450617265733404000100000000
      0009517464506172657335040001000000000009517464506172657336040001
      00000000000951746450617265733704000100000000000000}
    object cdsRelProducaoCodFabrica: TIntegerField
      FieldName = 'CodFabrica'
    end
    object cdsRelProducaolkFabrica: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFabrica'
      LookupDataSet = DM1.tFabrica
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodFabrica'
      Lookup = True
    end
    object cdsRelProducaoData: TDateField
      FieldName = 'Data'
    end
    object cdsRelProducaoReferencia: TStringField
      DisplayWidth = 50
      FieldName = 'Referencia'
      Size = 50
    end
    object cdsRelProducaoCodSetor1: TIntegerField
      FieldName = 'CodSetor1'
    end
    object cdsRelProducaoCodSetor2: TIntegerField
      FieldName = 'CodSetor2'
    end
    object cdsRelProducaoCodSetor3: TIntegerField
      FieldName = 'CodSetor3'
    end
    object cdsRelProducaoCodSetor4: TIntegerField
      FieldName = 'CodSetor4'
    end
    object cdsRelProducaoCodSetor5: TIntegerField
      FieldName = 'CodSetor5'
    end
    object cdsRelProducaoCodSetor6: TIntegerField
      FieldName = 'CodSetor6'
    end
    object cdsRelProducaoCodSetor7: TIntegerField
      FieldName = 'CodSetor7'
    end
    object cdsRelProducaoQtdPares1: TIntegerField
      FieldName = 'QtdPares1'
    end
    object cdsRelProducaoQtdPares2: TIntegerField
      FieldName = 'QtdPares2'
    end
    object cdsRelProducaoQtdPares3: TIntegerField
      FieldName = 'QtdPares3'
    end
    object cdsRelProducaoQtdPares4: TIntegerField
      FieldName = 'QtdPares4'
    end
    object cdsRelProducaoQtdPares5: TIntegerField
      FieldName = 'QtdPares5'
    end
    object cdsRelProducaoQtdPares6: TIntegerField
      FieldName = 'QtdPares6'
    end
    object cdsRelProducaoQtdPares7: TIntegerField
      FieldName = 'QtdPares7'
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsRelProducao
    Left = 160
    Top = 336
  end
  object cdsSetor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Indice'
        DataType = ftInteger
      end
      item
        Name = 'CodSetor'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CodSetor'
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 272
    Data = {
      530000009619E0BD010000001800000003000000000003000000530006496E64
      696365040001000000000008436F645365746F720400010000000000044E6F6D
      6501004900000001000557494454480200020032000000}
    object cdsSetorIndice: TIntegerField
      FieldName = 'Indice'
    end
    object cdsSetorCodSetor: TIntegerField
      FieldName = 'CodSetor'
    end
    object cdsSetorNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
end
