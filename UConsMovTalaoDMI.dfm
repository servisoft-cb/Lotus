object fConsMovTalaoDMI: TfConsMovTalaoDMI
  Left = 53
  Top = 82
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta da Quantidade Produzida   (Mercado Interno)'
  ClientHeight = 400
  ClientWidth = 705
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
    Width = 705
    Height = 400
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 8
      Top = 8
      Width = 689
      Height = 382
      BevelOuter = bvLowered
      TabOrder = 0
      object Bevel12: TBevel
        Left = 120
        Top = 38
        Width = 133
        Height = 28
      end
      object DBText5: TDBText
        Left = 128
        Top = 40
        Width = 119
        Height = 24
        DataField = 'Lote'
        DataSource = DM1.dsLoteMI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel7: TBevel
        Left = 257
        Top = 38
        Width = 140
        Height = 28
      end
      object DBText6: TDBText
        Left = 264
        Top = 40
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'QtdPares'
        DataSource = DM1.dsLoteMI
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel8: TBevel
        Left = 401
        Top = 38
        Width = 140
        Height = 28
      end
      object DBText19: TDBText
        Left = 408
        Top = 40
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'TotalProd'
        DataSource = msLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel9: TBevel
        Left = 545
        Top = 38
        Width = 140
        Height = 28
      end
      object DBText20: TDBText
        Left = 552
        Top = 40
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'TotalPend'
        DataSource = msLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 119
        Top = 7
        Width = 90
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
      object StaticText1: TStaticText
        Left = 257
        Top = 6
        Width = 140
        Height = 28
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Total de Pares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 401
        Top = 6
        Width = 140
        Height = 28
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Produzidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object StaticText3: TStaticText
        Left = 545
        Top = 6
        Width = 140
        Height = 28
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Pendentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object StaticText6: TStaticText
        Left = 4
        Top = 38
        Width = 111
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object PageControl1: TPageControl
        Left = 232
        Top = 71
        Width = 449
        Height = 305
        ActivePage = TabSheet3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object TabSheet3: TTabSheet
          Caption = 'Lote'
          ImageIndex = 2
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 441
            Height = 266
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Bevel55: TBevel
              Left = 6
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText56: TDBText
              Left = 13
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total1'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel56: TBevel
              Left = 150
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText57: TDBText
              Left = 157
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido1'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel57: TBevel
              Left = 294
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText58: TDBText
              Left = 301
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente1'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel58: TBevel
              Left = 6
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText59: TDBText
              Left = 13
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total2'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel59: TBevel
              Left = 150
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText60: TDBText
              Left = 157
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido2'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel60: TBevel
              Left = 294
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText61: TDBText
              Left = 301
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente2'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel61: TBevel
              Left = 6
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText62: TDBText
              Left = 13
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total3'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel62: TBevel
              Left = 150
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText63: TDBText
              Left = 157
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido3'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel63: TBevel
              Left = 294
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText64: TDBText
              Left = 301
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente3'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel64: TBevel
              Left = 6
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText65: TDBText
              Left = 13
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total4'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel65: TBevel
              Left = 150
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText66: TDBText
              Left = 157
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido4'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel66: TBevel
              Left = 294
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText67: TDBText
              Left = 301
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente4'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel67: TBevel
              Left = 6
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText68: TDBText
              Left = 13
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total5'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel68: TBevel
              Left = 150
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText69: TDBText
              Left = 157
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido5'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel69: TBevel
              Left = 294
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText70: TDBText
              Left = 301
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente5'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel70: TBevel
              Left = 6
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText71: TDBText
              Left = 13
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total6'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel71: TBevel
              Left = 150
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText72: TDBText
              Left = 157
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido6'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel72: TBevel
              Left = 294
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText73: TDBText
              Left = 301
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente6'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel73: TBevel
              Left = 6
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText74: TDBText
              Left = 13
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total7'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel74: TBevel
              Left = 150
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText75: TDBText
              Left = 157
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido7'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel75: TBevel
              Left = 294
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText76: TDBText
              Left = 301
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente7'
              DataSource = msLote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object StaticText34: TStaticText
              Left = 6
              Top = 8
              Width = 140
              Height = 28
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSunken
              Caption = 'Total de Pares'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object StaticText35: TStaticText
              Left = 150
              Top = 8
              Width = 140
              Height = 28
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSunken
              Caption = 'Produzidos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object StaticText36: TStaticText
              Left = 294
              Top = 8
              Width = 140
              Height = 28
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSunken
              Caption = 'Pendentes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
          end
        end
      end
      object StaticText7: TStaticText
        Left = 8
        Top = 146
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
      end
      object StaticText8: TStaticText
        Left = 8
        Top = 178
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object StaticText9: TStaticText
        Left = 8
        Top = 210
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object StaticText10: TStaticText
        Left = 8
        Top = 242
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object StaticText11: TStaticText
        Left = 8
        Top = 274
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object StaticText12: TStaticText
        Left = 8
        Top = 306
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
      object StaticText13: TStaticText
        Left = 8
        Top = 338
        Width = 217
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
      end
      object BitBtn6: TBitBtn
        Left = 28
        Top = 7
        Width = 90
        Height = 25
        Hint = 'Imprime os dados abaixo'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
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
  end
  object qSetores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbsetor.Nome, DblotesetorMI.CodSetor, DblotesetorMI.Item'
      'FROM "dbSetor.DB" Dbsetor'
      '   INNER JOIN "dbLoteSetorMI.DB" DblotesetorMI'
      '   ON  (Dbsetor.Codigo = DblotesetorMI.CodSetor)  '
      'WHERE  (DblotesetorMI.Lote = :Lote)'
      'ORDER BY DblotesetorMI.Item')
    Left = 16
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Lote'
        ParamType = ptUnknown
        Value = 0
      end>
    object qSetoresNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbSetor.DB".Nome'
      Size = 15
    end
    object qSetoresCodSetor: TIntegerField
      FieldName = 'CodSetor'
      Origin = 'TABELAS."dbLoteSetor.DB".CodSetor'
    end
    object qSetoresItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbLoteSetor.DB".Item'
    end
  end
  object mLote: TMemoryTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'mLote'
    Left = 80
    Top = 177
    object mLoteSetor1: TIntegerField
      FieldName = 'Setor1'
    end
    object mLoteProduzido1: TIntegerField
      FieldName = 'Produzido1'
    end
    object mLotePendente1: TIntegerField
      FieldName = 'Pendente1'
    end
    object mLoteTotal1: TIntegerField
      FieldName = 'Total1'
    end
    object mLoteSetor2: TIntegerField
      FieldName = 'Setor2'
    end
    object mLoteProduzido2: TIntegerField
      FieldName = 'Produzido2'
    end
    object mLotePendente2: TIntegerField
      FieldName = 'Pendente2'
    end
    object mLoteTotal2: TIntegerField
      FieldName = 'Total2'
    end
    object mLoteSetor3: TIntegerField
      FieldName = 'Setor3'
    end
    object mLoteProduzido3: TIntegerField
      FieldName = 'Produzido3'
    end
    object mLotePendente3: TIntegerField
      FieldName = 'Pendente3'
    end
    object mLoteTotal3: TIntegerField
      FieldName = 'Total3'
    end
    object mLoteSetor4: TIntegerField
      FieldName = 'Setor4'
    end
    object mLoteProduzido4: TIntegerField
      FieldName = 'Produzido4'
    end
    object mLotePendente4: TIntegerField
      FieldName = 'Pendente4'
    end
    object mLoteSetor5: TIntegerField
      FieldName = 'Setor5'
    end
    object mLoteTotal4: TIntegerField
      FieldName = 'Total4'
    end
    object mLoteProduzido5: TIntegerField
      FieldName = 'Produzido5'
    end
    object mLotePendente5: TIntegerField
      FieldName = 'Pendente5'
    end
    object mLoteTotal5: TIntegerField
      FieldName = 'Total5'
    end
    object mLoteSetor6: TIntegerField
      FieldName = 'Setor6'
    end
    object mLoteProduzido6: TIntegerField
      FieldName = 'Produzido6'
    end
    object mLotePendente6: TIntegerField
      FieldName = 'Pendente6'
    end
    object mLoteTotal6: TIntegerField
      FieldName = 'Total6'
    end
    object mLoteSetor7: TIntegerField
      FieldName = 'Setor7'
    end
    object mLoteProduzido7: TIntegerField
      FieldName = 'Produzido7'
    end
    object mLotePendente7: TIntegerField
      FieldName = 'Pendente7'
    end
    object mLoteTotal7: TIntegerField
      FieldName = 'Total7'
    end
    object mLoteTotalProd: TIntegerField
      FieldName = 'TotalProd'
    end
    object mLoteTotalPend: TIntegerField
      FieldName = 'TotalPend'
    end
  end
  object msLote: TDataSource
    DataSet = mLote
    Left = 112
    Top = 177
  end
  object qLote: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT DbtalaomovMI.Setor,  SUM(DbtalaoMI.QtdPar) TotPar'
      'FROM "dbTalaoMovMI.db" DbtalaomovMI'
      '   INNER JOIN "dbTalaoMI.DB" DbtalaoMI'
      '   ON  (DbtalaomovMI.Lote = DbtalaoMI.Lote)'
      '   AND  (DbtalaomovMI.Talao = DbtalaoMI.Item)'
      '   INNER JOIN "dbSetor.DB" Dbsetor'
      '   ON  (Dbsetor.Codigo = DbtalaomovMI.Setor)'
      '   INNER JOIN "dbLoteMI.DB" DbloteMI'
      '   ON  (DbtalaoMI.Lote = DbloteMI.Lote)  '
      'WHERE  (DbloteMI.Lote = :Lote)  '
      '   AND  (DbtalaomovMI.DataSaida IS NOT NULL)'
      'GROUP BY DbtalaomovMI.Setor')
    Left = 24
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Lote'
        ParamType = ptUnknown
      end>
    object qLoteSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qLoteTotPar: TFloatField
      FieldName = 'TotPar'
    end
  end
  object dsqlote: TDataSource
    DataSet = qLote
    Left = 64
    Top = 104
  end
end
