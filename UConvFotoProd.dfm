object fConvFotoProd: TfConvFotoProd
  Left = 274
  Top = 139
  Width = 928
  Height = 480
  Caption = 'fConvFotoProd'
  Color = clBtnFace
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
  object Image2: TImage
    Left = 525
    Top = 67
    Width = 261
    Height = 206
    Hint = 'Dois cliques sobre a figura para remov'#234'-la'
    ParentShowHint = False
    ShowHint = True
    Visible = False
  end
  object Label1: TLabel
    Left = 48
    Top = 26
    Width = 177
    Height = 13
    Caption = 'Informar a pasta para salvar  as fotos:'
  end
  object Label2: TLabel
    Left = 176
    Top = 152
    Width = 89
    Height = 13
    Caption = 'Total de Registros:'
  end
  object Label3: TLabel
    Left = 148
    Top = 179
    Width = 117
    Height = 13
    Caption = 'Total de Registros Lidos:'
  end
  object Label4: TLabel
    Left = 271
    Top = 179
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label5: TLabel
    Left = 271
    Top = 152
    Width = 6
    Height = 13
    Caption = '0'
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 227
    Top = 18
    Width = 293
    Height = 21
    InitialDir = 'C:\'
    MultipleDirs = True
    NumGlyphs = 1
    TabOrder = 1
    Text = 'C:\'
  end
end
