object fEscFornecedor: TfEscFornecedor
  Left = 207
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Escolher o fornecedor'
  ClientHeight = 61
  ClientWidth = 390
  Color = 10930928
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Fornecedor:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 66
    Top = 8
    Width = 319
    Height = 21
    DropDownCount = 8
    LookupField = 'CodForn'
    LookupDisplay = 'NomeForn'
    LookupSource = fPrevCalcMaterialLote2.dsqFornecedor
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 109
    Top = 33
    Width = 93
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 204
    Top = 33
    Width = 93
    Height = 25
    Caption = 'Cancelar/Fechar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
