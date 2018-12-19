object fConsOS: TfConsOS
  Left = 82
  Top = 47
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de OS'#39's'
  ClientHeight = 508
  ClientWidth = 652
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
    Width = 652
    Height = 508
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 644
      Height = 68
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 15
        Width = 118
        Height = 13
        Caption = 'Nº de Ordem de Serviço:'
      end
      object Label2: TLabel
        Left = 264
        Top = 15
        Width = 57
        Height = 13
        Caption = 'Fornecedor:'
      end
      object Label3: TLabel
        Left = 14
        Top = 46
        Width = 118
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nº de Ordem de Compra:'
      end
      object Label4: TLabel
        Left = 253
        Top = 46
        Width = 68
        Height = 13
        Caption = 'Data Emissão:'
      end
      object Edit1: TEdit
        Left = 137
        Top = 7
        Width = 95
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = Edit1Change
        OnEnter = Edit1Enter
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 325
        Top = 7
        Width = 309
        Height = 21
        DropDownCount = 8
        LookupField = 'CodForn'
        LookupDisplay = 'NomeForn'
        LookupSource = DM1.dsFornecedores
        TabOrder = 1
        OnChange = RxDBLookupCombo1Change
        OnEnter = RxDBLookupCombo1Enter
      end
      object Edit2: TEdit
        Left = 137
        Top = 38
        Width = 95
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnChange = Edit2Change
        OnEnter = Edit2Enter
      end
      object DateEdit1: TDateEdit
        Left = 325
        Top = 38
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
        OnChange = DateEdit1Change
        OnEnter = DateEdit1Enter
      end
      object BitBtn1: TBitBtn
        Left = 539
        Top = 38
        Width = 95
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
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
      Left = 4
      Top = 76
      Width = 644
      Height = 428
      DataSource = qsOS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumOS'
          Title.Alignment = taCenter
          Title.Caption = 'Nº da Ordem de Serviço'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtEmissao'
          Title.Alignment = taCenter
          Title.Caption = 'Data de Emissão'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumOC'
          Title.Alignment = taCenter
          Title.Caption = 'Nº de Ordem de Compra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeForn'
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Width = 284
          Visible = True
        end>
    end
  end
  object qOS: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbos.NumOS, Dbos.DtEmissao, Dbos.NumOC, Dbfornecedores.No' +
        'meForn'
      'FROM "dbOS.db" Dbos'
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbos.CodFornecedor = Dbfornecedores.CodForn)  '
      'ORDER BY Dbos.NumOS')
    Left = 160
    Top = 216
    object qOSNumOS: TIntegerField
      FieldName = 'NumOS'
      Origin = 'TABELAS."dbOS.DB".NumOS'
    end
    object qOSDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbOS.DB".DtEmissao'
    end
    object qOSNumOC: TIntegerField
      FieldName = 'NumOC'
      Origin = 'TABELAS."dbOS.DB".NumOC'
    end
    object qOSNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
  end
  object qsOS: TDataSource
    DataSet = qOS
    Left = 168
    Top = 216
  end
end
