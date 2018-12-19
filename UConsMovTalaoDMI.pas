unit UConsMovTalaoDMI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Db, DBTables, MemTable, Grids,
  DBGrids, ComCtrls, ShellApi;

type
  TfConsMovTalaoDMI = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    DBText5: TDBText;
    Bevel7: TBevel;
    DBText6: TDBText;
    Bevel8: TBevel;
    DBText19: TDBText;
    Bevel9: TBevel;
    DBText20: TDBText;
    StaticText6: TStaticText;
    Bevel12: TBevel;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    Bevel55: TBevel;
    DBText56: TDBText;
    Bevel56: TBevel;
    DBText57: TDBText;
    Bevel57: TBevel;
    DBText58: TDBText;
    Bevel58: TBevel;
    DBText59: TDBText;
    Bevel59: TBevel;
    DBText60: TDBText;
    Bevel60: TBevel;
    DBText61: TDBText;
    Bevel61: TBevel;
    DBText62: TDBText;
    Bevel62: TBevel;
    DBText63: TDBText;
    Bevel63: TBevel;
    DBText64: TDBText;
    Bevel64: TBevel;
    DBText65: TDBText;
    Bevel65: TBevel;
    DBText66: TDBText;
    Bevel66: TBevel;
    DBText67: TDBText;
    Bevel67: TBevel;
    DBText68: TDBText;
    Bevel68: TBevel;
    DBText69: TDBText;
    Bevel69: TBevel;
    DBText70: TDBText;
    Bevel70: TBevel;
    DBText71: TDBText;
    Bevel71: TBevel;
    DBText72: TDBText;
    Bevel72: TBevel;
    DBText73: TDBText;
    Bevel73: TBevel;
    DBText74: TDBText;
    Bevel74: TBevel;
    DBText75: TDBText;
    Bevel75: TBevel;
    DBText76: TDBText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    qSetores: TQuery;
    qSetoresNome: TStringField;
    qSetoresCodSetor: TIntegerField;
    qSetoresItem: TIntegerField;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    mLote: TMemoryTable;
    mLoteSetor1: TIntegerField;
    mLoteProduzido1: TIntegerField;
    mLotePendente1: TIntegerField;
    mLoteSetor2: TIntegerField;
    mLoteProduzido2: TIntegerField;
    mLotePendente2: TIntegerField;
    mLoteSetor3: TIntegerField;
    mLoteProduzido3: TIntegerField;
    mLotePendente3: TIntegerField;
    mLoteSetor4: TIntegerField;
    mLoteProduzido4: TIntegerField;
    mLotePendente4: TIntegerField;
    mLoteSetor5: TIntegerField;
    mLoteProduzido5: TIntegerField;
    mLotePendente5: TIntegerField;
    mLoteSetor6: TIntegerField;
    mLoteProduzido6: TIntegerField;
    mLotePendente6: TIntegerField;
    mLoteSetor7: TIntegerField;
    mLoteProduzido7: TIntegerField;
    mLotePendente7: TIntegerField;
    msLote: TDataSource;
    mLoteTotal1: TIntegerField;
    mLoteTotal2: TIntegerField;
    mLoteTotal3: TIntegerField;
    mLoteTotal4: TIntegerField;
    mLoteTotal5: TIntegerField;
    mLoteTotal6: TIntegerField;
    mLoteTotal7: TIntegerField;
    mLoteTotalProd: TIntegerField;
    mLoteTotalPend: TIntegerField;
    BitBtn6: TBitBtn;
    qLote: TQuery;
    qLoteSetor: TIntegerField;
    dsqlote: TDataSource;
    qLoteTotPar: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Posiciona_Setores;
    procedure Lote;
    procedure Imprimir;
    procedure Imprime_Posicao;
  public
    { Public declarations }
  end;

var
  fConsMovTalaoDMI: TfConsMovTalaoDMI;
  linha, pagina : Integer;
  F: TextFile;

implementation

uses UConsMovTalao, UDM1, UEscImpressora, UAgendaTelef;

{$R *.DFM}

procedure TfConsMovTalaoDMI.Imprime_Posicao;
var
  i, i2 : Integer;
  texto1, texto2 : String;
begin
  Pagina := Pagina + 1;
  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 61 - length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pagina.: ' + IntToStr(Pagina);
  Writeln(F,Texto1);
  texto1 := '             RELATORIO DA SITUACAO DO LOTE                   Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'--------------------------------------------------------------------------------');
  linha := 3;
  texto1 := 'Lote.: ' + DM1.tLoteMILote.AsString;
  Writeln(F,Texto1);
  Writeln(F);
  linha := linha + 2;

  texto1 := 'Qtd. Pares do Lote: ';
  texto2 := FormatFloat('#,###,###',DM1.tLoteMIQtdPares.AsFloat);
  for i := 1 to 9 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,Texto1);
  Writeln(F);
  linha := linha + 2;

  Writeln(F,'--------------------------------------------------------------------------------');
  Writeln(F,'Setor             Qtd.no Setor      Qtd.Produzido     Qtd.Pendente');
  Writeln(F,'--------------------------------------------------------------------------------');
  linha := linha + 3;

  texto1 := '';
  mLote.First;
  qSetores.First;
  for i := 1 to qSetores.RecordCount do
    begin
      texto2 := qSetoresNome.AsString;
      for i2 := 1 to 19 - Length(texto2) do
        texto2 := texto2 + ' ';
      texto1 := texto2;
      texto2 := FormatFloat('#,###,##0',mLote.FieldByName('Total' + IntToStr(i)).AsInteger);
      for i2 := 1 to 9 - Length(texto2) do                                                  
        texto2 := ' ' + texto2;
      texto1 := texto1 + texto2 + '          ';
      texto2 := FormatFloat('#,###,##0',mLote.FieldByName('Produzido' + IntToStr(i)).AsInteger);
      for i2 := 1 to 9 - Length(texto2) do
        texto2 := ' ' + texto2;
      texto1 := texto1 + texto2 + '         ';
      texto2 := FormatFloat('#,###,##0',mLote.FieldByName('Pendente' + IntToStr(i)).AsInteger);
      for i2 := 1 to 9 - Length(texto2) do
        texto2 := ' ' + texto2;
      texto1 := texto1 + texto2;
      Writeln(F,Texto1);
      linha := linha + 1;
      qSetores.Next;
    end;
  Writeln(F,'--------------------------------------------------------------------------------');
  linha  := linha + 1;
  texto1 := 'Lote               ';
  texto2 := FormatFloat('#,###,##0',DM1.tLoteMIQtdPares.AsInteger);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '          ';
  texto2 := FormatFloat('#,###,##0',mLoteTotalProd.AsInteger);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '         ';
  texto2 := FormatFloat('#,###,##0',mLoteTotalPend.AsInteger);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,Texto1);
  linha := linha + 1;

  while linha < 33 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfConsMovTalaoDMI.Imprimir;
var
  Texto : String;
begin
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
  Imprime_Posicao;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfConsMovTalaoDMI.Posiciona_Setores;
var
  i : integer;
begin
  for i := 7 to 13 do
    TStaticText(FindComponent(IntToStr(i))).Caption := '';

  for i := 1 to qSetores.RecordCount do
    begin
      qSetores.Locate('Item',i,[loCaseInsensitive]);
      case i of
        1 : StaticText7.Caption  := qSetoresNome.AsString;
        2 : StaticText8.Caption  := qSetoresNome.AsString;
        3 : StaticText9.Caption  := qSetoresNome.AsString;
        4 : StaticText10.Caption := qSetoresNome.AsString;
        5 : StaticText11.Caption := qSetoresNome.AsString;
        6 : StaticText12.Caption := qSetoresNome.AsString;
        7 : StaticText13.Caption := qSetoresNome.AsString;
      end;
    end;
end;

procedure TfConsMovTalaoDMI.Lote;
var
  i : integer;
begin
  mLote.EmptyTable;
  qSetores.First;
  for i := 1 to qSetores.RecordCount do
    begin
      mLote.Edit;
      mLote.FieldByName('Setor' + IntToStr(i)).AsInteger     := qLoteSetor.AsInteger;
      if qLote.Locate('Setor',qSetoresCodSetor.AsInteger,[loCaseInsensitive]) then
        begin
          mLote.FieldByName('Total' + IntToStr(i)).AsInteger     := DM1.tLoteMIQtdPares.AsInteger;
          mLote.FieldByName('Produzido' + IntToStr(i)).AsInteger := mLote.FieldByName('Produzido' + IntToStr(i)).AsInteger + qLoteTotPar.AsInteger;
          mLote.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mLote.FieldByName('Pendente' + IntToStr(i)).AsInteger + (mLote.FieldByName('Total' + IntToStr(i)).AsInteger
                                                                    - qLoteTotPar.AsInteger);
        end
      else
        begin
          mLote.FieldByName('Total' + IntToStr(i)).AsInteger     := DM1.tLoteMIQtdPares.AsInteger;
          mLote.FieldByName('Produzido' + IntToStr(i)).AsInteger := 0;
          mLote.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mLote.FieldByName('Total' + IntToStr(i)).AsInteger;
        end;
      mLote.Post;
      qSetores.Next;
    end;
  mLote.Edit;
  mLoteTotalProd.AsInteger := mLote.FieldByName('Produzido' + IntToStr(qSetores.RecordCount)).AsInteger;
  mLoteTotalPend.AsInteger := DM1.tLoteMIQtdPares.AsInteger - mLoteTotalProd.AsInteger;
  mLote.Post;
end;

procedure TfConsMovTalaoDMI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsMovTalaoDMI.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovTalaoDMI.FormShow(Sender: TObject);
begin
  Posiciona_Setores;
  Lote;
end;

procedure TfConsMovTalaoDMI.BitBtn6Click(Sender: TObject);
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  Imprimir;
end;

procedure TfConsMovTalaoDMI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
