object fConsDevolucao: TfConsDevolucao
  Left = 87
  Top = 30
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Devoluções'
  ClientHeight = 511
  ClientWidth = 592
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 511
    Align = alClient
    TabOrder = 0
    object Label4: TLabel
      Left = 29
      Top = 494
      Width = 52
      Height = 13
      Caption = 'Resolvidas'
    end
    object ALed1: TALed
      Left = 11
      Top = 491
      Width = 16
      Height = 16
      FalseColor = clGreen
    end
    object Label5: TLabel
      Left = 109
      Top = 494
      Width = 75
      Height = 13
      Caption = 'Não Resolvidas'
    end
    object ALed2: TALed
      Left = 91
      Top = 491
      Width = 16
      Height = 16
      FalseColor = clWhite
    end
    object Panel2: TPanel
      Left = 1
      Top = 2
      Width = 590
      Height = 61
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 72
        Top = 12
        Width = 35
        Height = 13
        Caption = 'Cliente:'
      end
      object Label2: TLabel
        Left = 26
        Top = 42
        Width = 81
        Height = 13
        Caption = 'Data de Contato:'
      end
      object Label3: TLabel
        Left = 224
        Top = 42
        Width = 110
        Height = 13
        Caption = 'Número de Movimento:'
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 111
        Top = 4
        Width = 337
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsCliente
        TabOrder = 0
        OnCloseUp = RxDBLookupCombo1CloseUp
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
      object DateEdit1: TDateEdit
        Left = 111
        Top = 34
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnChange = DateEdit1Change
        OnEnter = DateEdit1Enter
      end
      object Edit1: TEdit
        Left = 339
        Top = 34
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnChange = Edit1Change
        OnClick = Edit1Change
        OnEnter = Edit1Enter
      end
      object BitBtn1: TBitBtn
        Left = 478
        Top = 5
        Width = 95
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
      Left = 1
      Top = 65
      Width = 589
      Height = 423
      DataSource = qsDevolucoes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'NumMov'
          Title.Alignment = taCenter
          Title.Caption = 'Nº. Movimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Width = 272
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtContato'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Contato'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QtdPares'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. de Pares'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NumNota'
          Title.Alignment = taCenter
          Title.Caption = 'Nº da Nota'
          Width = 66
          Visible = True
        end>
    end
  end
  object qDevolucoes: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbdevolucao.NumMov, Dbcliente.Nome, Dbdevolucao.DtContato' +
        ', Dbdevolucao.QtdPares, Dbdevolucao.Resolvido, Dbdevolucao.NumNo' +
        'ta, Dbdevolucao.CodCliente'
      'FROM "dbDevolucao.db" Dbdevolucao'
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbdevolucao.CodCliente = Dbcliente.Codigo)  '
      'ORDER BY Dbdevolucao.NumMov')
    Left = 168
    Top = 240
    object qDevolucoesNumMov: TIntegerField
      FieldName = 'NumMov'
      Origin = 'TABELAS."dbDevolucao.DB".NumMov'
    end
    object qDevolucoesNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 40
    end
    object qDevolucoesDtContato: TDateField
      FieldName = 'DtContato'
      Origin = 'TABELAS."dbDevolucao.DB".DtContato'
    end
    object qDevolucoesQtdPares: TFloatField
      FieldName = 'QtdPares'
      Origin = 'TABELAS."dbDevolucao.DB".QtdPares'
    end
    object qDevolucoesResolvido: TBooleanField
      FieldName = 'Resolvido'
      Origin = 'TABELAS."dbDevolucao.DB".Resolvido'
    end
    object qDevolucoesNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbDevolucao.DB".NumNota'
    end
    object qDevolucoesCodCliente: TIntegerField
      FieldName = 'CodCliente'
      Origin = 'TABELAS."dbDevolucao.DB".CodCliente'
    end
  end
  object qsDevolucoes: TDataSource
    DataSet = qDevolucoes
    Left = 176
    Top = 240
  end
end
