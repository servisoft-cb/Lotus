object fTrocaMercado: TfTrocaMercado
  Left = 6
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Troca o mercado'
  ClientHeight = 422
  ClientWidth = 784
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
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 3
    Width = 784
    Height = 381
    DataSource = dsmEstoque
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtMovimento'
        Title.Alignment = taCenter
        Title.Caption = 'Dt.Movimento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota (Doc)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCliForn'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente/Fornecedor'
        Width = 294
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ES'
        Title.Alignment = taCenter
        Title.Caption = 'Entr./Sa'#237'da'
        Width = 67
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tipo'
        Title.Alignment = taCenter
        Width = 38
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Quantidade'
        Title.Alignment = taCenter
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Mercado'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumMov'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Mov.Estoque'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 388
    Width = 177
    Height = 30
    Caption = 'Confirma a troca autom'#225'tica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 604
    Top = 388
    Width = 161
    Height = 30
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 442
    Top = 388
    Width = 161
    Height = 30
    Caption = 'Confirma os selecionados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object mEstoque: TMemoryTable
    Active = True
    Left = 616
    Top = 56
    object mEstoqueNumMov: TIntegerField
      FieldName = 'NumMov'
    end
    object mEstoqueNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mEstoqueNomeCliForn: TStringField
      FieldName = 'NomeCliForn'
      Size = 40
    end
    object mEstoqueES: TStringField
      FieldName = 'ES'
      Size = 1
    end
    object mEstoqueTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object mEstoqueQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object mEstoqueMercado: TStringField
      FieldName = 'Mercado'
      Size = 1
    end
    object mEstoqueDtMovimento: TDateField
      FieldName = 'DtMovimento'
    end
  end
  object dsmEstoque: TDataSource
    DataSet = mEstoque
    Left = 632
    Top = 56
  end
end
