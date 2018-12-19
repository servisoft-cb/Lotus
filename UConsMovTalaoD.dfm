object fConsMovTalaoD: TfConsMovTalaoD
  Left = 65
  Top = 26
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta da Quantidade Produzida   (Exporta'#231#227'o)'
  ClientHeight = 504
  ClientWidth = 707
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
    Top = 1
    Width = 706
    Height = 496
    TabOrder = 0
    object Panel2: TPanel
      Left = 8
      Top = 8
      Width = 689
      Height = 481
      BevelOuter = bvLowered
      TabOrder = 0
      object Bevel12: TBevel
        Left = 108
        Top = 136
        Width = 140
        Height = 28
      end
      object Bevel11: TBevel
        Left = 108
        Top = 104
        Width = 140
        Height = 28
      end
      object Bevel10: TBevel
        Left = 108
        Top = 72
        Width = 140
        Height = 28
      end
      object Bevel1: TBevel
        Left = 252
        Top = 72
        Width = 140
        Height = 28
      end
      object Label2: TLabel
        Left = 6
        Top = 2
        Width = 106
        Height = 22
        Caption = 'Refer'#234'ncia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 115
        Top = 74
        Width = 126
        Height = 24
        DataField = 'PedidoCliente'
        DataSource = fConsMovTalao.dsPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 114
        Top = 2
        Width = 146
        Height = 29
        Alignment = taRightJustify
        DataField = 'lkReferencia'
        DataSource = fConsMovTalao.dsTalao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText14: TDBText
        Left = 259
        Top = 74
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'QtdPares'
        DataSource = fConsMovTalao.dsPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 396
        Top = 72
        Width = 140
        Height = 28
      end
      object DBText3: TDBText
        Left = 403
        Top = 74
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'TotalProd'
        DataSource = msPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 540
        Top = 72
        Width = 140
        Height = 28
      end
      object DBText4: TDBText
        Left = 547
        Top = 74
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'TotalPend'
        DataSource = msPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText15: TDBText
        Left = 115
        Top = 106
        Width = 126
        Height = 24
        DataField = 'Invoice'
        DataSource = fConsMovTalao.dsTalao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel4: TBevel
        Left = 252
        Top = 104
        Width = 140
        Height = 28
      end
      object DBText16: TDBText
        Left = 259
        Top = 106
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'QtdPares'
        DataSource = fConsMovTalao.dsPedidoItem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 396
        Top = 104
        Width = 140
        Height = 28
      end
      object DBText17: TDBText
        Left = 403
        Top = 106
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'TotalProd'
        DataSource = msFatura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel6: TBevel
        Left = 540
        Top = 104
        Width = 140
        Height = 28
      end
      object DBText18: TDBText
        Left = 547
        Top = 106
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'TotalPend'
        DataSource = msFatura
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 115
        Top = 138
        Width = 126
        Height = 24
        DataField = 'Lote'
        DataSource = fConsMovTalao.dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel7: TBevel
        Left = 252
        Top = 136
        Width = 140
        Height = 28
      end
      object DBText6: TDBText
        Left = 259
        Top = 138
        Width = 127
        Height = 24
        Alignment = taCenter
        DataField = 'QtdPares'
        DataSource = fConsMovTalao.dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel8: TBevel
        Left = 396
        Top = 136
        Width = 140
        Height = 28
      end
      object DBText19: TDBText
        Left = 403
        Top = 138
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
        Left = 540
        Top = 136
        Width = 140
        Height = 28
      end
      object DBText20: TDBText
        Left = 547
        Top = 138
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
      object DBText77: TDBText
        Left = 264
        Top = 2
        Width = 235
        Height = 29
        DataField = 'lkNomeCor'
        DataSource = fConsMovTalao.dsTalao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 591
        Top = 8
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
        Left = 252
        Top = 40
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
        Left = 396
        Top = 40
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
        Left = 540
        Top = 40
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
      object StaticText4: TStaticText
        Left = 8
        Top = 72
        Width = 97
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Pedido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object StaticText5: TStaticText
        Left = 8
        Top = 104
        Width = 97
        Height = 28
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = 'Fatura:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object StaticText6: TStaticText
        Left = 8
        Top = 136
        Width = 97
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
        TabOrder = 6
      end
      object PageControl1: TPageControl
        Left = 232
        Top = 168
        Width = 449
        Height = 305
        ActivePage = TabSheet1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object TabSheet1: TTabSheet
          Caption = 'Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 441
            Height = 266
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Bevel13: TBevel
              Left = 6
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText7: TDBText
              Left = 13
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total1'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel14: TBevel
              Left = 150
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText8: TDBText
              Left = 157
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido1'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel15: TBevel
              Left = 294
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText9: TDBText
              Left = 301
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente1'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel16: TBevel
              Left = 6
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText10: TDBText
              Left = 13
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total2'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel17: TBevel
              Left = 150
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText11: TDBText
              Left = 157
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido2'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel18: TBevel
              Left = 294
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText12: TDBText
              Left = 301
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente2'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel19: TBevel
              Left = 6
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText13: TDBText
              Left = 13
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total3'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel20: TBevel
              Left = 150
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText21: TDBText
              Left = 157
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido3'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel21: TBevel
              Left = 294
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText22: TDBText
              Left = 301
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente3'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel22: TBevel
              Left = 6
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText23: TDBText
              Left = 13
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total4'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel23: TBevel
              Left = 150
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText24: TDBText
              Left = 157
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido4'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel24: TBevel
              Left = 294
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText25: TDBText
              Left = 301
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente4'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel25: TBevel
              Left = 6
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText26: TDBText
              Left = 13
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total5'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel26: TBevel
              Left = 150
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText27: TDBText
              Left = 157
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido5'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel27: TBevel
              Left = 294
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText28: TDBText
              Left = 301
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente5'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel28: TBevel
              Left = 6
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText29: TDBText
              Left = 13
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total6'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel29: TBevel
              Left = 150
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText30: TDBText
              Left = 157
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido6'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel30: TBevel
              Left = 294
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText31: TDBText
              Left = 301
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente6'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel31: TBevel
              Left = 6
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText32: TDBText
              Left = 13
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total7'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel32: TBevel
              Left = 150
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText33: TDBText
              Left = 157
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido7'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel33: TBevel
              Left = 294
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText34: TDBText
              Left = 301
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente7'
              DataSource = msPedido
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object StaticText14: TStaticText
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
            object StaticText15: TStaticText
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
            object StaticText16: TStaticText
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
        object TabSheet2: TTabSheet
          Caption = 'Fatura'
          ImageIndex = 1
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 441
            Height = 266
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object Bevel34: TBevel
              Left = 6
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText35: TDBText
              Left = 13
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total1'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel35: TBevel
              Left = 150
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText36: TDBText
              Left = 157
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido1'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel36: TBevel
              Left = 294
              Top = 40
              Width = 140
              Height = 28
            end
            object DBText37: TDBText
              Left = 301
              Top = 42
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente1'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel37: TBevel
              Left = 6
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText38: TDBText
              Left = 13
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total2'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel38: TBevel
              Left = 150
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText39: TDBText
              Left = 157
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido2'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel39: TBevel
              Left = 294
              Top = 72
              Width = 140
              Height = 28
            end
            object DBText40: TDBText
              Left = 301
              Top = 74
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente2'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel40: TBevel
              Left = 6
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText41: TDBText
              Left = 13
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total3'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel41: TBevel
              Left = 150
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText42: TDBText
              Left = 157
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido3'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel42: TBevel
              Left = 294
              Top = 104
              Width = 140
              Height = 28
            end
            object DBText43: TDBText
              Left = 301
              Top = 106
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente3'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel43: TBevel
              Left = 6
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText44: TDBText
              Left = 13
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total4'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel44: TBevel
              Left = 150
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText45: TDBText
              Left = 157
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido4'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel45: TBevel
              Left = 294
              Top = 136
              Width = 140
              Height = 28
            end
            object DBText46: TDBText
              Left = 301
              Top = 138
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente4'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel46: TBevel
              Left = 6
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText47: TDBText
              Left = 13
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total5'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel47: TBevel
              Left = 150
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText48: TDBText
              Left = 157
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido5'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel48: TBevel
              Left = 294
              Top = 168
              Width = 140
              Height = 28
            end
            object DBText49: TDBText
              Left = 301
              Top = 170
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente5'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel49: TBevel
              Left = 6
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText50: TDBText
              Left = 13
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total6'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel50: TBevel
              Left = 150
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText51: TDBText
              Left = 157
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido6'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel51: TBevel
              Left = 294
              Top = 200
              Width = 140
              Height = 28
            end
            object DBText52: TDBText
              Left = 301
              Top = 202
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente6'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel52: TBevel
              Left = 6
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText53: TDBText
              Left = 13
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Total7'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel53: TBevel
              Left = 150
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText54: TDBText
              Left = 157
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Produzido7'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clTeal
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel54: TBevel
              Left = 294
              Top = 232
              Width = 140
              Height = 28
            end
            object DBText55: TDBText
              Left = 301
              Top = 234
              Width = 127
              Height = 24
              Alignment = taCenter
              DataField = 'Pendente7'
              DataSource = msFatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object StaticText24: TStaticText
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
            object StaticText25: TStaticText
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
            object StaticText26: TStaticText
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
        Top = 243
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
      object StaticText8: TStaticText
        Left = 8
        Top = 275
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
      object StaticText9: TStaticText
        Left = 8
        Top = 307
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
      object StaticText10: TStaticText
        Left = 8
        Top = 339
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
      object StaticText11: TStaticText
        Left = 8
        Top = 371
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
      object StaticText12: TStaticText
        Left = 8
        Top = 403
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
        TabOrder = 13
      end
      object StaticText13: TStaticText
        Left = 8
        Top = 435
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
        TabOrder = 14
      end
      object BitBtn6: TBitBtn
        Left = 500
        Top = 8
        Width = 90
        Height = 25
        Hint = 'Imprime os dados abaixo'
        Caption = '&Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
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
  object qLote: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) Qtd' +
        'Par'
      'FROM "dbTalaoMov.db" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)  '
      '   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)  '
      '   INNER JOIN "dbSetor.DB" Dbsetor'
      '   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)  '
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalaograde.Lote = Dbtalao.Lote)  '
      '   AND  (Dbtalaograde.Item = Dbtalao.Item)  '
      '   INNER JOIN "dbLote.DB" Dblote'
      '   ON  (Dbtalao.Lote = Dblote.Lote)  '
      'WHERE   (Dblote.NroPedido = :Pedido)  '
      '   AND  (Dblote.Lote = :Lote)  '
      '   AND  (Dbtalao.Item = :Item)  '
      '   AND  (Dbtalaomov.DataSaida IS NOT NULL)  '
      'GROUP BY Dbtalaomov.Setor')
    Left = 56
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pedido'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Lote'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Item'
        ParamType = ptUnknown
        Value = 0
      end>
    object qLoteSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qLoteQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
  end
  object qSetores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbsetor.Nome, Dblotesetor.CodSetor, Dblotesetor.Item'
      'FROM "dbSetor.DB" Dbsetor'
      '   INNER JOIN "dbLoteSetor.DB" Dblotesetor'
      '   ON  (Dbsetor.Codigo = Dblotesetor.CodSetor)  '
      'WHERE  (Dblotesetor.Lote = :Lote)'
      '/*   AND  (Dblotesetor.CodSetor <= 7) */'
      'ORDER BY Dblotesetor.Item')
    Left = 24
    Top = 305
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
    Left = 88
    Top = 305
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
    Left = 120
    Top = 305
  end
  object qFatura: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) Qtd' +
        'Par'
      'FROM "dbTalaoMov.db" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)  '
      '   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)  '
      '   INNER JOIN "dbSetor.DB" Dbsetor'
      '   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)  '
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalaograde.Lote = Dbtalao.Lote)  '
      '   AND  (Dbtalaograde.Item = Dbtalao.Item)  '
      '   INNER JOIN "dbLote.DB" Dblote'
      '   ON  (Dbtalao.Lote = Dblote.Lote)  '
      'WHERE   (Dblote.NroPedido = :Pedido)  '
      '   AND  (DbLote.ItemPed = :Item)  '
      '   AND  (Dbtalaomov.DataSaida IS NOT NULL)  '
      'GROUP BY Dbtalaomov.Setor')
    Left = 152
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pedido'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'Item'
        ParamType = ptUnknown
      end>
    object qFaturaSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qFaturaQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
  end
  object mFatura: TMemoryTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'mFatura'
    Left = 184
    Top = 305
    object IntegerField1: TIntegerField
      FieldName = 'Setor1'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Produzido1'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Pendente1'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Total1'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Setor2'
    end
    object IntegerField6: TIntegerField
      FieldName = 'Produzido2'
    end
    object IntegerField7: TIntegerField
      FieldName = 'Pendente2'
    end
    object IntegerField8: TIntegerField
      FieldName = 'Total2'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Setor3'
    end
    object IntegerField10: TIntegerField
      FieldName = 'Produzido3'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Pendente3'
    end
    object IntegerField12: TIntegerField
      FieldName = 'Total3'
    end
    object IntegerField13: TIntegerField
      FieldName = 'Setor4'
    end
    object IntegerField14: TIntegerField
      FieldName = 'Produzido4'
    end
    object IntegerField15: TIntegerField
      FieldName = 'Pendente4'
    end
    object IntegerField16: TIntegerField
      FieldName = 'Setor5'
    end
    object IntegerField17: TIntegerField
      FieldName = 'Total4'
    end
    object IntegerField18: TIntegerField
      FieldName = 'Produzido5'
    end
    object IntegerField19: TIntegerField
      FieldName = 'Pendente5'
    end
    object IntegerField20: TIntegerField
      FieldName = 'Total5'
    end
    object IntegerField21: TIntegerField
      FieldName = 'Setor6'
    end
    object IntegerField22: TIntegerField
      FieldName = 'Produzido6'
    end
    object IntegerField23: TIntegerField
      FieldName = 'Pendente6'
    end
    object IntegerField24: TIntegerField
      FieldName = 'Total6'
    end
    object IntegerField25: TIntegerField
      FieldName = 'Setor7'
    end
    object IntegerField26: TIntegerField
      FieldName = 'Produzido7'
    end
    object IntegerField27: TIntegerField
      FieldName = 'Pendente7'
    end
    object IntegerField28: TIntegerField
      FieldName = 'Total7'
    end
    object mFaturaTotalProd: TIntegerField
      FieldName = 'TotalProd'
    end
    object mFaturaTotalPend: TIntegerField
      FieldName = 'TotalPend'
    end
  end
  object msFatura: TDataSource
    DataSet = mFatura
    Left = 216
    Top = 305
  end
  object qPedido: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) Qtd' +
        'Par'
      'FROM "dbTalaoMov.db" Dbtalaomov'
      '   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde'
      '   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)  '
      '   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)  '
      '   INNER JOIN "dbSetor.DB" Dbsetor'
      '   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)  '
      '   INNER JOIN "dbTalao.DB" Dbtalao'
      '   ON  (Dbtalaograde.Lote = Dbtalao.Lote)  '
      '   AND  (Dbtalaograde.Item = Dbtalao.Item)  '
      '   INNER JOIN "dbLote.DB" Dblote'
      '   ON  (Dbtalao.Lote = Dblote.Lote)  '
      'WHERE   (Dblote.NroPedido = :Pedido)  '
      '   AND  (Dbtalaomov.DataSaida IS NOT NULL)  '
      'GROUP BY Dbtalaomov.Setor')
    Left = 24
    Top = 337
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Pedido'
        ParamType = ptUnknown
        Value = 0
      end>
    object qPedidoSetor: TIntegerField
      FieldName = 'Setor'
    end
    object qPedidoQtdPar: TFloatField
      FieldName = 'QtdPar'
    end
  end
  object mPedido: TMemoryTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'mPedido'
    Left = 56
    Top = 337
    object IntegerField29: TIntegerField
      FieldName = 'Setor1'
    end
    object IntegerField30: TIntegerField
      FieldName = 'Produzido1'
    end
    object IntegerField31: TIntegerField
      FieldName = 'Pendente1'
    end
    object IntegerField32: TIntegerField
      FieldName = 'Total1'
    end
    object IntegerField33: TIntegerField
      FieldName = 'Setor2'
    end
    object IntegerField34: TIntegerField
      FieldName = 'Produzido2'
    end
    object IntegerField35: TIntegerField
      FieldName = 'Pendente2'
    end
    object IntegerField36: TIntegerField
      FieldName = 'Total2'
    end
    object IntegerField37: TIntegerField
      FieldName = 'Setor3'
    end
    object IntegerField38: TIntegerField
      FieldName = 'Produzido3'
    end
    object IntegerField39: TIntegerField
      FieldName = 'Pendente3'
    end
    object IntegerField40: TIntegerField
      FieldName = 'Total3'
    end
    object IntegerField41: TIntegerField
      FieldName = 'Setor4'
    end
    object IntegerField42: TIntegerField
      FieldName = 'Produzido4'
    end
    object IntegerField43: TIntegerField
      FieldName = 'Pendente4'
    end
    object IntegerField44: TIntegerField
      FieldName = 'Setor5'
    end
    object IntegerField45: TIntegerField
      FieldName = 'Total4'
    end
    object IntegerField46: TIntegerField
      FieldName = 'Produzido5'
    end
    object IntegerField47: TIntegerField
      FieldName = 'Pendente5'
    end
    object IntegerField48: TIntegerField
      FieldName = 'Total5'
    end
    object IntegerField49: TIntegerField
      FieldName = 'Setor6'
    end
    object IntegerField50: TIntegerField
      FieldName = 'Produzido6'
    end
    object IntegerField51: TIntegerField
      FieldName = 'Pendente6'
    end
    object IntegerField52: TIntegerField
      FieldName = 'Total6'
    end
    object IntegerField53: TIntegerField
      FieldName = 'Setor7'
    end
    object IntegerField54: TIntegerField
      FieldName = 'Produzido7'
    end
    object IntegerField55: TIntegerField
      FieldName = 'Pendente7'
    end
    object IntegerField56: TIntegerField
      FieldName = 'Total7'
    end
    object mPedidoTotalProd: TIntegerField
      FieldName = 'TotalProd'
    end
    object mPedidoTotalPend: TIntegerField
      FieldName = 'TotalPend'
    end
  end
  object msPedido: TDataSource
    DataSet = mPedido
    Left = 88
    Top = 337
  end
end
