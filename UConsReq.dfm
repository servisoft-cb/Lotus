object fConsReq: TfConsReq
  Left = 148
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Requisições'
  ClientHeight = 348
  ClientWidth = 498
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
    Width = 498
    Height = 348
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 8
      Top = 8
      Width = 481
      Height = 73
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 66
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Setor:'
      end
      object Label2: TLabel
        Left = 6
        Top = 48
        Width = 88
        Height = 13
        Caption = 'Dt. da Requisição:'
      end
      object Label3: TLabel
        Left = 195
        Top = 48
        Width = 89
        Height = 13
        Caption = 'Nº da Requisição::'
      end
      object Panel3: TPanel
        Left = 386
        Top = 37
        Width = 92
        Height = 32
        Caption = 'Panel3'
        TabOrder = 4
      end
      object BitBtn4: TBitBtn
        Left = 389
        Top = 41
        Width = 85
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BitBtn4Click
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          04000000000040010000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
          03833333333333387F333300000083838383830E603833FFFFFFFF387F33FF00
          000000000000380E6600388888888F387F388300000033333330830E66033333
          33338F387F38F300000033333330000E6603333333FF88887F38F30000003333
          0030330E66033333388F8F387F38F300000033330E00330E660333FFF8F88F38
          7F38F300000000000EE0330E0603388888338F387F38F30000000EEEEEE6030E
          660338FFFFF378387F38F300000000000E60330E6603388888F78F387F38F300
          000033330600330E6603333338788F387F38F300000033330030330E66033333
          38838F387F38F3000000333333303330E603333333338F3387F8F30000003333
          333033330E03333333338FFFF878F30000003333333000000003333333338888
          8888330000003333333333333333333333333333333333000000}
        NumGlyphs = 2
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 98
        Top = 8
        Width = 298
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsSetor
        TabOrder = 0
        OnChange = RxDBLookupCombo1CloseUp
        OnClick = RxDBLookupCombo1CloseUp
        OnCloseUp = RxDBLookupCombo1CloseUp
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
      end
      object DateEdit1: TDateEdit
        Left = 98
        Top = 40
        Width = 90
        Height = 21
        Hint = 'Selecione uma data'
        CalendarHints.Strings = (
          'Ano Anterior'
          'Mês Anterior'
          'Próximo Mês'
          'Próximo Ano')
        GlyphKind = gkCustom
        Glyph.Data = {
          E2020000424DE20200000000000042000000280000001C0000000C0000000100
          100003000000A002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
          EF3D1F7C1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F7C
          1F7C000000000F0000000F000F0000000F00000000000F00EF3D1F7CEF3DEF3D
          EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F1F7C1F7CFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F1F7CFF7FFF7FFF7F
          1F7CFF7FFF7FFF7F1F7CEF3DFF7F1F7C1F7CFF7F000000000000FF7F00000000
          0000F75EFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DEF3D1F7CEF3DEF3DEF3D1F7C
          FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7FF75EFF7FF75E0000FF7F0F00
          EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C1F7C1F7C1F7CEF3DFF7FEF3DFF7F1F7C
          1F7CFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F0F00EF3D1F7CEF3DFF7F
          1F7CEF3DFF7F1F7C1F7CFF7FFF7FEF3D1F7CEF3DFF7F1F7C1F7CFF7FFF7F0000
          FF7FFF7F000000000000F75EFF7F0F00EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C
          EF3DEF3DEF3D1F7C1F7CEF3DFF7F1F7C1F7CFF7F00000000FF7FFF7F0000FF7F
          FF7FFF7FFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DFF7F1F7CEF3DFF7FFF7FFF7F
          FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7F0000000000000000FF7F0F00
          EF3D1F7CEF3DFF7F1F7CEF3D1F7C1F7CEF3DEF3DEF3DEF3D1F7CEF3DFF7F1F7C
          1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7F1F7C1F7CFF7FF75EF75E
          F75EF75EF75EF75EF75EF75EFF7F0F00EF3D1F7CEF3DFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FEF3DFF7F1F7C1F7C0000000000000000000000000000
          0000000000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
          EF3DEF3D1F7C}
        NumGlyphs = 2
        StartOfWeek = Sun
        TabOrder = 1
        OnChange = DateEdit1Change
        OnEnter = DateEdit1Enter
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 288
        Top = 40
        Width = 81
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '#'
        MaxLength = 9
        TabOrder = 2
        OnChange = CurrencyEdit1Change
        OnEnter = CurrencyEdit1Enter
      end
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 88
      Width = 481
      Height = 255
      TabStop = False
      DataSource = DM1.dsReq
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NroReq'
          Title.Alignment = taCenter
          Title.Caption = 'Nº Requisição'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtMov'
          Title.Alignment = taCenter
          Title.Caption = 'Data Emis.'
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
          FieldName = 'lkSetor'
          Title.Alignment = taCenter
          Title.Caption = 'Setor'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrTotal'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Total'
          Width = 72
          Visible = True
        end>
    end
  end
end
