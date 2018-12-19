object fConsCalcMaterialPed: TfConsCalcMaterialPed
  Left = 248
  Top = 101
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cons.Pedidos do Material'
  ClientHeight = 385
  ClientWidth = 133
  Color = 10930928
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 1
    Top = 27
    Width = 120
    Height = 345
    Caption = 'Pedidos do material'
    TabOrder = 0
    object RxDBGrid1: TRxDBGrid
      Left = 8
      Top = 16
      Width = 105
      Height = 321
      Color = clInfoBk
      DataSource = fPrevCalcMaterialLote2.dsAuxCalcMaterialPed
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Lote'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 2
    Width = 78
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
