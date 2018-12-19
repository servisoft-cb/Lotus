object fPendencias: TfPendencias
  Left = 263
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pendências'
  ClientHeight = 342
  ClientWidth = 441
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 441
    Height = 309
    DataSource = qsPendencia
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N° Nota'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Emissão'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DiasAtraso'
        Title.Alignment = taCenter
        Title.Caption = 'Atraso'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtVencCReceber'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Vencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RestParcela'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Restante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrParcCReceber'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Parcela'
        Visible = True
      end>
  end
  object BitBtn5: TBitBtn
    Left = 345
    Top = 311
    Width = 95
    Height = 28
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn5Click
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
  object qPendencia: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcreceberparc.NumNota, Dbnotafiscal.DtEmissao, Dbcrecebe' +
        'rparc.DiasAtraso, Dbcreceberparc.DtVencCReceber, Dbcreceberparc.' +
        'RestParcela, Dbcreceberparc.VlrParcCReceber'
      'FROM "dbCReceberParc.DB" Dbcreceberparc'
      '   INNER JOIN "dbNotaFiscal.DB" Dbnotafiscal'
      '   ON  (Dbcreceberparc.NumNota = Dbnotafiscal.NumNota)  '
      'WHERE (Dbcreceberparc.CodCli = :C1) AND'
      '               (Dbcreceberparc.DiasAtraso > 0) AND'
      '               ((Dbcreceberparc.QuitParcCReceber = False) OR'
      '               (Dbcreceberparc.QuitParcCReceber Is Null))')
    Left = 24
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'C1'
        ParamType = ptUnknown
      end>
    object qPendenciaNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbCReceberParc.DB".NumNota'
    end
    object qPendenciaDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbNotaFiscal.DB".DtEmissao'
    end
    object qPendenciaDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
      Origin = 'TABELAS."dbCReceberParc.DB".DiasAtraso'
    end
    object qPendenciaDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".DtVencCReceber'
    end
    object qPendenciaRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCReceberParc.DB".RestParcela'
    end
    object qPendenciaVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".VlrParcCReceber'
    end
  end
  object qsPendencia: TDataSource
    DataSet = qPendencia
    Left = 48
    Top = 224
  end
end
