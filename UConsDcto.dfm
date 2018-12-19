object fConsDcto: TfConsDcto
  Left = 184
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Dcto. de Entrada e Saída do Estoque'
  ClientHeight = 394
  ClientWidth = 429
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 394
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 422
      Height = 59
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 35
        Top = 11
        Width = 44
        Height = 13
        Caption = 'Nº Dcto.:'
      end
      object Label2: TLabel
        Left = 288
        Top = 40
        Width = 26
        Height = 13
        Caption = 'Data:'
      end
      object Label3: TLabel
        Left = 40
        Top = 40
        Width = 39
        Height = 13
        Caption = 'Usuário:'
      end
      object Edit1: TEdit
        Left = 82
        Top = 3
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = Edit1Change
        OnEnter = Edit1Enter
      end
      object DateEdit1: TDateEdit
        Left = 320
        Top = 32
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnChange = DateEdit1Change
        OnEnter = DateEdit1Enter
      end
      object Edit2: TEdit
        Left = 82
        Top = 32
        Width = 173
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 1
        OnChange = Edit2Change
        OnEnter = Edit2Enter
      end
      object BitBtn1: TBitBtn
        Left = 330
        Top = 3
        Width = 85
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
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
    end
    object RxDBGrid1: TRxDBGrid
      Left = 2
      Top = 64
      Width = 423
      Height = 326
      DataSource = qsDctoEst
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NumDcto'
          Title.Alignment = taCenter
          Title.Caption = 'Nº Dcto.'
          Width = 51
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Data'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Usuario'
          Title.Alignment = taCenter
          Title.Caption = 'Usuário'
          Width = 167
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tipo'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Total'
          Width = 76
          Visible = True
        end>
    end
  end
  object qDctoEst: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT NumDcto, Data, Usuario, Tipo, Total'
      'FROM "dbDctoEst.DB" Dbdctoest'
      'ORDER BY NumDcto')
    Left = 227
    Top = 203
    object qDctoEstNumDcto: TIntegerField
      FieldName = 'NumDcto'
      Origin = 'TABELAS."dbDctoEst.DB".NumDcto'
    end
    object qDctoEstData: TDateField
      FieldName = 'Data'
      Origin = 'TABELAS."dbDctoEst.DB".Data'
    end
    object qDctoEstUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'TABELAS."dbDctoEst.DB".Usuario'
    end
    object qDctoEstTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'TABELAS."dbDctoEst.DB".Tipo'
      Size = 1
    end
    object qDctoEstTotal: TFloatField
      FieldName = 'Total'
      Origin = 'TABELAS."dbDctoEst.DB".Total'
      DisplayFormat = '0.00'
    end
  end
  object qsDctoEst: TDataSource
    DataSet = qDctoEst
    Left = 235
    Top = 203
  end
end
