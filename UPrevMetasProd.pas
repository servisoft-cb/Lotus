unit UPrevMetasProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl,
  Buttons, Db, DBTables, Menus, RXCtrls, DBFilter, DBVGrids, ShellApi;

type
  TfPrevMetasProd = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    qMetasProd: TQuery;
    RxDBFilter1: TRxDBFilter;
    qMetasProdDataSaida: TDateField;
    qMetasProdSetor: TIntegerField;
    qMetasProdQtdPar: TFloatField;
    qMetasProdMetaDia: TIntegerField;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    dsMetasProd: TDataSource;
    Label4: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  
  private
    procedure Gera_SQL;
    procedure Gera_SQL_MI;
    procedure Gera_SQL_Ambos;
    procedure Move_Setor;
    procedure Imprimir;
    procedure Imprime_Detalhe;
    procedure Imprime_Cabecalho;
    procedure Imprime_Rodape;
    procedure Monta_Detalhe;
    procedure Limpa_Qtd;
    procedure Imprimir_2;
    { Private declarations }
  public
    { Public declarations }
    vCabCodSetor: Array[1..8] of Integer;
    vCabNomSetor: Array[1..8] of String[13];
    vCabMeta, vDetProd, vDetDif, vTotalDif: Array[1..8] of Integer;
    vData: TDateTime;
  end;

var
  fPrevMetasProd: TfPrevMetasProd;
  vCodSetor: Integer;
  linha, pagina: Integer;
  F: TextFile;


implementation

uses UDM1, UEscImpressora, uRelPrevMetas;

{$R *.DFM}

procedure TfPrevMetasProd.Limpa_Qtd;
var
  i : Integer;
begin
  for i := 1 to 8 do
    begin
      vDetProd[i] := 0;
      vDetDif[i]  := 0;
    end;
end;

procedure TfPrevMetasProd.Monta_Detalhe;
var
  i : Integer;
begin
  for i := 1 to 8 do
    begin
      if vCabCodSetor[i] = qMetasProdSetor.AsInteger then
        begin
          vDetProd[i] := vDetProd[i] + qMetasProdQtdPar.AsInteger;
          vDetDif[i]  := vDetProd[i] - qMetasProdMetaDia.AsInteger;
          //vTotalDif[i] := vTotalDif[i] + (vDetProd[i] - qMetasProdMetaDia.AsInteger)
        end;
    end;
end;

procedure TfPrevMetasProd.Imprime_Cabecalho;
var
 i, i2 : Integer;
 texto1, texto2 : String;
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
  DM1.tEmpresa.First;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 113 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  Texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
  for i := 1 to 51 - Length(Texto1) do
     Texto1 := Texto1 + ' ';
  case RadioGroup1.ItemIndex of
    0: Texto1 := Texto1 + 'RELATORIO METAS/PRODUZIDOS        (Exportacao)                Emissao: ' + DateToStr(Date);
    1: Texto1 := Texto1 + 'RELATORIO METAS/PRODUZIDOS      (Mercado Interno)             Emissao: ' + DateToStr(Date);
    2: Texto1 := Texto1 + 'RELATORIO METAS/PRODUZIDOS    (Exportacao/Mercado Interno)    Emissao: ' + DateToStr(Date);
  end;
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := 'Data         ';
  for i := 1 to 8 do
    begin
      Texto2 := vCabNomSetor[i];
      for i2 := 1 to 13 - Length(Texto2) do
        Texto2 := Texto2 + ' ';
      Texto1 := Texto1 + Texto2 + '  ';
    end;
  Writeln(F,Texto1);

  Texto1 := '             ';
  for i := 1 to 8 do
    begin
      Texto2 := FormatFloat('##,##0',vCabMeta[i]);
      for i2 := 1 to 6 - Length(Texto2) do
        Texto2 := Texto2 + ' ';
      Texto1 := Texto1 + 'Meta ' + Texto2 + '    ';
    end;
  Writeln(F,Texto1);
  Writeln(F,'             Prod.   Dif.   Prod.   Dif.   Prod.   Dif.   Prod.   Dif.   Prod.   Dif.   Prod.   Dif.   Prod.   Dif.   Prod.   Dif.');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := 7;
end;

procedure TfPrevMetasProd.Imprime_Detalhe;
var
 i, i2 : Integer;
  texto1, texto2 : String;
begin
  if vData > 01/01/1900 then
    begin
      for i := 1 to 8 do
        vTotalDif[i] := vTotalDif[i] + vDetDif[i];
      texto1 := DateToStr(vData);
      for i := 1 to 8 do
        begin
          texto2 := FormatFloat('#####',vDetProd[i]);
          for i2 := 1 to 5 - Length(Texto2) do
            texto2 := ' ' + texto2;
          texto1 := texto1 + '   ' + texto2;
          texto2 := FormatFloat('#####',vDetDif[i]);
          for i2 := 1 to 6 - Length(Texto2) do
            texto2 := ' ' + texto2;
          texto1 := texto1 + ' ' + texto2;
        end;
      Writeln(F,Texto1);
      Linha := Linha + 1;
    end;
end;

procedure TfPrevMetasProd.Imprime_Rodape;
var
  Texto1, Texto2 : String;
  i, i2 : Integer;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := '..Total Dif.:';
  for i := 1 to 8 do
    begin
      texto2 := FormatFloat('##.###.###',vTotalDif[i]);
      for i2 := 1 to 10 - Length(Texto2) do
        texto2 := ' ' + texto2;
      if i = 1 then
        texto1 := texto1 + '  ' + texto2
      else
        texto1 := texto1 + '     ' + texto2;
    end;
  Writeln(F,Texto1);
  Linha := Linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  Linha := 0;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
end;

procedure TfPrevMetasProd.Imprimir;
var
 Texto : String;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Limpa_Qtd;
  qMetasProd.First;
  vData     := qMetasProdDataSaida.AsDateTime;
  while not qMetasProd.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      if vData = qMetasProdDataSaida.AsDateTime then
        Monta_Detalhe
      else
        begin
          Imprime_Detalhe;
          Limpa_Qtd;
          Monta_Detalhe;
        end;
      vData     := qMetasProdDataSaida.AsDateTime;
      qMetasProd.Next;
    end;
  if qMetasProd.RecordCount > 0 then
    Imprime_Detalhe;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevMetasProd.Move_Setor;
var
 i : Integer;
begin
  for i := 1 to 8 do
    begin
      vCabCodSetor[i] := 0;
      vCabNomSetor[i] := '';
      vCabMeta[i]     := 0;
      vTotalDif[i]    := 0;
    end;
  vCodSetor := 0;
  i := 0;
  DM1.tSetor.IndexFieldNames := 'Codigo';
  DM1.tSetor.First;
  while not DM1.tSetor.Eof do
    begin
      i := i + 1;
      if i < 9 then
        begin
          vCabCodSetor[i] := DM1.tSetorCodigo.AsInteger;
          vCabMeta[i]     := DM1.tSetorMetaDia.AsInteger;
          vCabNomSetor[i] := copy(DM1.tSetorNome.AsString,1,13);
        end
      else
      if i = 9 then
        vCodSetor := DM1.tSetorCodigo.AsInteger;
      DM1.tSetor.Next;
    end;
end;

procedure TfPrevMetasProd.Gera_SQL;
begin
  //*** Gera a SQL para gravar as metas e qtde. produzida (Exportação)
  qMetasProd.Active := False;
  qMetasProd.SQL.Clear;
  qMetasProd.SQL.Add('SELECT Dbtalaomov.DataSaida, Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add('INNER JOIN "dbTalaoMov.db" Dbtalaomov');
  qMetasProd.SQL.Add(' ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
  qMetasProd.SQL.Add('INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
  qMetasProd.SQL.Add(' ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)');
  qMetasProd.SQL.Add(' AND (Dbtalaograde.Talao = Dbtalaomov.Talao)');
  qMetasProd.SQL.Add('WHERE DbTalaoMov.DataSaida BETWEEN :Data1 AND :Data2');
  qMetasProd.Params[0].AsDateTime := DateEdit1.Date;
  qMetasProd.Params[1].AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY Dbtalaomov.DataSaida, Dbtalaomov.Setor, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('ORDER BY Dbtalaomov.DataSaida, Dbtalaomov.Setor');
  qMetasProd.Active := True;
end;

procedure TfPrevMetasProd.Gera_SQL_MI;
begin
  //*** Gera a SQL para gravar as metas e qtde. produzida (Mercado Interno)
  qMetasProd.Active := False;
  qMetasProd.SQL.Clear;
  qMetasProd.SQL.Add('SELECT Dbtalaomovmi.DataSaida, Dbtalaomovmi.Setor, SUM( Dbtalaogrademi.QtdPar ) QtdPar, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add('INNER JOIN "dbTalaoMovMI.db" Dbtalaomovmi');
  qMetasProd.SQL.Add(' ON  (Dbsetor.Codigo = Dbtalaomovmi.Setor)');
  qMetasProd.SQL.Add('INNER JOIN "dbTalaoGradeMI.DB" Dbtalaogrademi');
  qMetasProd.SQL.Add(' ON  (Dbtalaogrademi.Lote = Dbtalaomovmi.Lote)');
  qMetasProd.SQL.Add(' AND (Dbtalaogrademi.Talao = Dbtalaomovmi.Talao)');
  qMetasProd.SQL.Add('WHERE DbTalaomovmi.DataSaida BETWEEN :Data1 AND :Data2');
  qMetasProd.Params[0].AsDateTime := DateEdit1.Date;
  qMetasProd.Params[1].AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY Dbtalaomovmi.DataSaida, Dbtalaomovmi.Setor, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('ORDER BY Dbtalaomovmi.DataSaida, Dbtalaomovmi.Setor');
  qMetasProd.Active := True;
end;

procedure TfPrevMetasProd.Gera_SQL_Ambos;
begin
  qMetasProd.Active := False;
  qMetasProd.SQL.Clear;
  qMetasProd.SQL.Add('SELECT Dbtalaomov.DataSaida, Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoMov.db" Dbtalaomov');
  qMetasProd.SQL.Add('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
  qMetasProd.SQL.Add('   ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)');
  qMetasProd.SQL.Add('   AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)');
  qMetasProd.SQL.Add('WHERE DbTalaomov.DataSaida BETWEEN :Data1 AND :Data2');
  qMetasProd.ParamByName('Data1').AsDateTime := DateEdit1.Date;
  qMetasProd.ParamByName('Data2').AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY Dbtalaomov.DataSaida, Dbtalaomov.Setor, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('UNION ALL');
  qMetasProd.SQL.Add('SELECT DbtalaomovMI.DataSaida, DbtalaomovMI.Setor, SUM( DbtalaogradeMI.QtdPar ) QtdPar, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoMovMI.db" Dbtalaomovmi');
  qMetasProd.SQL.Add('   ON  (Dbsetor.Codigo = Dbtalaomovmi.Setor)');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoGradeMI.DB" Dbtalaogrademi');
  qMetasProd.SQL.Add('   ON  (Dbtalaogrademi.Lote = Dbtalaomovmi.Lote)');
  qMetasProd.SQL.Add('   AND  (Dbtalaogrademi.Talao = Dbtalaomovmi.Talao)');
  qMetasProd.SQL.Add('WHERE DbTalaomovmi.DataSaida BETWEEN :DataMI1 AND :DataMI2');
  qMetasProd.ParamByName('DataMI1').AsDateTime := DateEdit1.Date;
  qMetasProd.ParamByName('DataMI2').AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY Dbtalaomovmi.DataSaida, Dbtalaomovmi.Setor, Dbsetor.MetaDia');
  qMetasProd.SQL.Add('ORDER BY DataSaida, Setor');
  qMetasProd.Active := True;
end;

procedure TfPrevMetasProd.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    ShowMessage('Data esta incorreta')
  else
  begin
    try
      Screen.Cursor  := crHourglass;
      Label4.Visible := True;
      Label4.Refresh;
      Refresh;
      case RadioGroup1.ItemIndex of
        0: Gera_SQL;
        1: Gera_SQL_MI;
        2: Gera_SQL_Ambos;
      end;
       RxDBFilter1.Active := True;
       Move_Setor;
       Screen.Cursor := crDefault;
      case RadioGroup2.ItemIndex of
        0 : Imprimir;
        1 : Imprimir_2;
      end;
    finally
      Label4.Visible := False;
      Label4.Refresh;
      Refresh;
    end;
  end;
end;

procedure TfPrevMetasProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Dm1.tSetor.Close;
  Action := CaFree;
end;

procedure TfPrevMetasProd.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevMetasProd.FormShow(Sender: TObject);
begin
  Dm1.tSetor.Open;
end;

procedure TfPrevMetasProd.Imprimir_2;
begin
          fRelPrevMetas := tfRelPrevMetas.Create(Self);
          fRelPRevMetas.RLReport1.Preview;
          fRelPrevMetas.RLReport1.Free;

end;

end.
