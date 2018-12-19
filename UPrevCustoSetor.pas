unit UPrevCustoSetor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Mask, ToolEdit, Menus, RXCtrls, Buttons,
  Db, DBTables, ShellApi;

type
  TfPrevCustoSetor = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    qMateriais: TQuery;
    qMateriaisCodSetor: TIntegerField;
    qMateriaisCodMaterial: TIntegerField;
    qMateriaisItem: TIntegerField;
    qMateriaisNomeMaterial: TStringField;
    qMateriaisVlrUnitario: TFloatField;
    qMateriaisQtd: TFloatField;
    qMateriaisCodCor: TIntegerField;
    qMateriaisNroReq: TIntegerField;
    qMateriaisNomeCor: TStringField;
    qMateriaisDtMov: TDateField;
    qMateriaisUnidade: TStringField;
    qMateriaislkNomeSetor: TStringField;
    tReqItemGrade: TTable;
    dsMateriais: TDataSource;
    tReqItemGradeNroReq: TIntegerField;
    tReqItemGradeItem: TIntegerField;
    tReqItemGradeCodGrade: TIntegerField;
    tReqItemGradePosicao: TIntegerField;
    tReqItemGradeQtd: TFloatField;
    tReqItemGradelkTamanho: TStringField;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_SQL;
    procedure Imprime_Cabecalho;
    procedure Imprime_Cab_Setor;
    procedure Imprime_Detalhe;
    procedure Imprime_Total_Setor;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fPrevCustoSetor: TfPrevCustoSetor;
  linha, pagina : Integer;
  F: TextFile;
  vTotalGeral, vTotalSetor : Real;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevCustoSetor.Imprime_Cabecalho;
var
 i : Integer;
 texto1 : String;
begin
  pagina := pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
    end;
  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 113 - Length(Texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  texto1 := '                                            RELATORIO DE CUSTO POR SETOR  -  ' + DateEdit1.Text + ' a ' + DateEdit2.Text + '             Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Codigo Material                                 Cor             Unid. N.Requis. Dt.Movto.    Quantidade  Vlr.Unitario      Vlr.Total');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := 5;
  
  Imprime_Cab_Setor;
end;

procedure TfPrevCustoSetor.Imprime_Cab_Setor;
var
  texto1 : String;
begin
  texto1 := 'Setor: ' + qMateriaislkNomeSetor.AsString;
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := linha + 2;
end;

procedure TfPrevCustoSetor.Imprime_Detalhe;
var
 i : Integer;
 texto1, texto2, texto3, texto4 : string;
 vAux : Real;
begin
  texto2 := qMateriaisCodMaterial.AsString;
  for i  := 1 to 6 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto2 + ' ';
  texto2 := copy(qMateriaisNomeMaterial.AsString,1,40);
  for i := 1 to 40 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := qMateriaisNomeCor.AsString;
  for i := 1 to 15 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '  ';
  texto2 := qMateriaisUnidade.AsString;
  for i := 1 to 3 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   ';
  texto2 := qMateriaisNroReq.AsString;
  for i := 1 to 7 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := qMateriaisDtMov.AsString;
  for i := 1 to 10 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('###,##0.00000',qMateriaisQtd.AsFloat);
  for i := 1 to 13 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('##,###,##0.00',qMateriaisVlrUnitario.AsFloat);
  for i := 1 to 13 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  vAux := qMateriaisVlrUnitario.AsFloat * qMateriaisQtd.AsFloat;
  texto2 := FormatFloat('###,###,##0.00',vAux);
  for i := 1 to 14 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  vTotalSetor := vTotalSetor + vAux;
  vTotalGeral := vTotalGeral + vAux;
  Writeln(F,Texto1);
  Linha := Linha + 1;

  if tReqItemGrade.RecordCount > 0 then
    begin
      Texto2 := '';
      Texto3 := '       Tam.:';
      Texto4 := '       Qtd.:';
      tReqItemGrade.First;
      while not tReqItemGrade.Eof do
        begin
          Texto2 := tReqItemGradelkTamanho.AsString;
          for i := 1 to 6 - length(Texto2) do
            texto2 := ' ' + texto2;
          Texto3 := Texto3 + ' ' + Texto2;
          Texto2 := tReqItemGradeQtd.AsString;
          for i := 1 to 6 - length(texto2) do
            Texto2 := ' ' + texto2;
          texto4 := texto4 + ' ' + texto2;
          tReqItemGrade.Next;
        end;
      Writeln(F,texto3);
      Writeln(F,texto4);
      Writeln(F);
      linha := linha + 3;
    end;
end;

procedure TfPrevCustoSetor.Imprime_Total_Setor;
var
 i : Integer;
 texto1, texto2 : String;
begin
  Writeln(F,'                                                                                                 -----------------------------------');
  texto1 := '                                                                                                 Total Setor ===> ';
  texto2 := FormatFloat('###,###,###,##0.00',vTotalSetor);
  for i := 1 to 18 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,Texto1);
  linha := linha + 2;
  vTotalSetor := 0;
end;

procedure TfPrevCustoSetor.Imprime_Rodape;
var
 i : Integer;
 texto1, texto2 : String;
begin
  Imprime_Total_Setor;
  Writeln(F,'                                                                                                 -----------------------------------');
  texto1 := '                                                                                                 Total Geral ===> ';
  texto2 := FormatFloat('###,###,###,##0.00',vTotalGeral);
  for i := 1 to 18 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,Texto1);
  linha := linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevCustoSetor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dm1.tSetor.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  qMateriais.Active := False;
  Action := Cafree;
end;

procedure TfPrevCustoSetor.Gera_SQL;
begin
  Screen.Cursor := CrHourGlass;
  qMateriais.Active := False;
  qMateriais.SQL.Clear;
  qMateriais.SQL.Add('SELECT Dbreq.CodSetor, Dbreqitem.CodMaterial, Dbreqitem.Item, Dbmaterial.Nome NomeMaterial, Dbreqitem.VlrUnitario, Dbreqitem.Qtd, Dbreqitem.CodCor, Dbreq.NroReq, Dbcor.Nome NomeCor, Dbreq.DtMov, Dbreqitem.Unidade');
  qMateriais.SQL.Add('FROM "dbReqItem.DB" Dbreqitem');
  qMateriais.SQL.Add('  INNER JOIN "dbReq.DB" Dbreq');
  qMateriais.SQL.Add('  ON  (Dbreq.NroReq = Dbreqitem.NroReq)');
  qMateriais.SQL.Add('  INNER JOIN "dbMaterial.DB" Dbmaterial');
  qMateriais.SQL.Add('  ON  (Dbreqitem.CodMaterial = Dbmaterial.Codigo)');
  qMateriais.SQL.Add('  FULL JOIN "Dbcor.db" Dbcor');
  qMateriais.SQL.Add('  ON  (Dbreqitem.CodCor = Dbcor.Codigo)');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qMateriais.SQL.Add('WHERE   (Dbreq.CodSetor = :Setor)');
      qMateriais.SQL.Add('AND  Dbreq.DtMov BETWEEN :Data1 AND :Data2');
      qMateriais.ParamByName('Setor').AsInteger  := RxDBLookupCombo1.KeyValue;
    end
  else
    qMateriais.SQL.Add('WHERE Dbreq.DtMov BETWEEN :Data1 AND :Data2');
  qMateriais.ParamByName('Data1').AsDateTime := DateEdit1.Date;
  qMateriais.ParamByName('Data2').AsDateTime := DateEdit2.Date;
  qMateriais.SQL.Add('ORDER BY Dbreq.CodSetor, NomeMaterial');
  qMateriais.Active := True;
  Screen.Cursor     := CrDefault;
end;

procedure TfPrevCustoSetor.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfPrevCustoSetor.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevCustoSetor.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCustoSetor.BitBtn1Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  DateEdit1.Clear;
  DateEdit2.Clear;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfPrevCustoSetor.BitBtn6Click(Sender: TObject);
var
  Texto : String;
  vCodSetor : Integer;
begin
  vTotalGeral := 0;
  vTotalSetor := 0;
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Gera_SQL;
  vCodSetor := 0;
  if qMateriais.RecordCount > 0 then
    begin
      qMateriais.First;
      while not qMateriais.Eof do
        begin
          if Linha > 61 then
            Imprime_Cabecalho
          else
          if vCodSetor <> qMateriaisCodSetor.AsInteger then
            begin
              Imprime_Total_Setor;
              Writeln(F);
              Linha := Linha + 1;
              Imprime_Cab_Setor;
            end;
          Imprime_Detalhe;
          vCodSetor := qMateriaisCodSetor.AsInteger;
          qMateriais.Next;
        end;
    end;

  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfPrevCustoSetor.FormShow(Sender: TObject);
begin
  Dm1.tSetor.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
end;

end.
