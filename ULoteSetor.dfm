object fLoteSetor: TfLoteSetor
  Left = 92
  Top = 165
  Width = 668
  Height = 238
  BorderIcons = [biSystemMenu]
  Caption = 'Setores do lote  (Exporta'#231#227'o)'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 656
    Height = 161
    TabOrder = 0
    object RxDBGrid1: TRxDBGrid
      Left = 4
      Top = 5
      Width = 645
      Height = 150
      DataSource = fLoteExp.dsSetorAux
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
          FieldName = 'CodSetor'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.Setor'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeSetor'
          Title.Caption = 'Nome do setor'
          Width = 164
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Ordem'
          Title.Alignment = taCenter
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Atelier'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodAtelier'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.Atelier'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeAtelier'
          Title.Caption = 'Nome do Atelier'
          Width = 269
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 353
    Top = 164
    Width = 304
    Height = 46
    BevelInner = bvRaised
    TabOrder = 1
    object BitBtn6: TBitBtn
      Left = 153
      Top = 5
      Width = 145
      Height = 36
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn6Click
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
    object BitBtn3: TBitBtn
      Left = 6
      Top = 5
      Width = 145
      Height = 36
      Hint = 'Exclui o setor selecionado no lote'
      Caption = '&Excluir o Setor'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsSetor
    Filter.Strings = (
      'ImpTalao = True')
    Left = 200
    Top = 176
  end
end
