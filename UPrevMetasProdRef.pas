unit UPrevMetasProdRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl,
  Buttons, Db, DBTables, Menus, RXCtrls, DBFilter, DBVGrids, RxLookup, Variants, ShellApi;

type
  TfPrevMetasProdRef = class(TForm)
    Panel1: TPanel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    qMetasProd: TQuery;
    RxDBFilter1: TRxDBFilter;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    qMetasProdDataSaida: TDateField;
    qMetasProdSetor: TIntegerField;
    qMetasProdQtdPar: TFloatField;
    qMetasProdReferencia: TStringField;
    qMetasProdCodProduto: TIntegerField;
    qMetasProdCodCor: TIntegerField;
    qMetasProdDescMaterial: TStringField;
    qMetasProdNomeCor: TStringField;
    qMetasProdNomeSetor: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Gera_SQL;
    procedure Gera_SQL_MI;
    procedure Gera_SQL_Ambos;
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Cab_Setor;
    procedure Imprime_Total_Setor;
    procedure Imprime_Rodape;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevMetasProdRef: TfPrevMetasProdRef;
  vTotalProdDia, vTotalProdSetor : Integer;
  linha, pagina : Integer;
  vData : TDate;
  vCodSetor : Integer;
  F: TextFile;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevMetasProdRef.Imprime_Cab_Setor;
var                                         
  Texto1 : String;
begin
  texto1 := '       .....Setor: ' + qMetasProdNomeSetor.AsString;
  Writeln(F,Texto1);
  Linha := Linha + 1;
end;

procedure TfPrevMetasProdRef.Imprime_Total_Setor;
var
  Texto1 : String;
  i : Integer;
begin
  texto1 := FormatFloat('###,###,##0',vTotalProdSetor);
  for i := 1 to 11 - Length(texto1) do
    texto1 := ' ' + texto1;
  texto1 := '                                                                                  | Total Setor: ' + texto1;
  Writeln(F,Texto1);
  vTotalProdSetor := 0;
  Linha := Linha + 1;
end;

procedure TfPrevMetasProdRef.Imprime_Cabecalho;
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
  DM1.tEmpresa.First;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 113 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);
  Texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
  if RxDBLookupCombo1.Text <> '' then
    Texto1 := Texto1 + ' Fabr.: ' + Copy(RxDBLookupCombo1.Text,1,16);
  for i := 1 to 57 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  case RadioGroup1.ItemIndex of
    0: Texto1 := Texto1 + 'RELATORIO METAS/PRODUZIDOS     (Exportacao)             Emissao: ' + DateToStr(Date);
    1: Texto1 := Texto1 + 'RELATORIO METAS/PRODUZIDOS   (Mercado Interno)          Emissao: ' + DateToStr(Date);
    2: Texto1 := Texto1 + 'RELATORIO METAS/PRODUZIDOS (Exportacao/Mercado Interno) Emissao: ' + DateToStr(Date);
  end;
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Data       Referencia          Cor                  Meta   Produzido   Diferenca  |  TOTAL DIA      PRODUZIDO');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := 5;
end;

procedure TfPrevMetasProdRef.Imprime_Detalhe;
var
 i, vMeta, vQtdAux : Integer;
 texto1, texto2 : String;
begin
  texto1 := qMetasProdDataSaida.AsString + ' ';
  texto2 := qMetasProdReferencia.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := qMetasProdDescMaterial.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := qMetasProdNomeCor.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   ';

  //*** Busca a meta por dia
  vMeta := 0;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := qMetasProdCodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
    begin
      i := qMetasProdCodCor.AsInteger;
      if DM1.tProdutoMeta.Locate('CodProd;CodCor;CodSetor',VarArrayOf([qMetasProdCodProduto.AsInteger,i,qMetasProdSetor.AsInteger]),[loCaseInsensitive]) then
        vMeta := DM1.tProdutoMetaQtdMetaDia.AsInteger
      else
        begin
          i := 0;
          if DM1.tProdutoMeta.Locate('CodProd;CodCor;CodSetor',VarArrayOf([qMetasProdCodProduto.AsInteger,i,qMetasProdSetor.AsInteger]),[loCaseInsensitive]) then
            vMeta := DM1.tProdutoMetaQtdMetaDia.AsInteger
        end;
    end;
  texto2 := FormatFloat('###,##0',vMeta);
  for i := 1 to 7 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '  ';
  //*** Fim do bloco que busca a meta por dia

  texto2 := FormatFloat('##,###,##0',qMetasProdQtdPar.AsInteger);
  for i := 1 to 10 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '  ';
  vTotalProdDia   := vTotalProdDia + qMetasProdQtdPar.AsInteger;
  vTotalProdSetor := vTotalProdSetor + qMetasProdQtdPar.AsInteger;

  vQtdAux := qMetasProdQtdPar.AsInteger - vMeta;
  texto2 := FormatFloat('##,###,##0',vQtdAux);
  for i := 1 to 10 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '  |';

  //*** Verifica se a próxima data é diferente (serve para colocar o total por dia)
  vCodSetor := qMetasProdSetor.AsInteger;
  vData     := qMetasProdDataSaida.AsDateTime;
  if qMetasProd.RecordCount = qMetasProd.RecNo then
    vData := 0
  else
    qMetasProd.Next;
  if (vData <> qMetasProdDataSaida.AsDateTime) or (vCodSetor <> qMetasProdSetor.AsInteger) then
    begin
      texto2 := FormatFloat('##,###,##0',vTotalProdDia);
      for i := 1 to 10 - Length(texto2) do
        texto2 := '.' + texto2;
      texto1 := texto1 + '...............' + texto2;
      vTotalProdDia := 0;
    end;
  if vData <> 0 then
    qMetasProd.Prior;
  //*** Fim do bloco do total por dia

  Writeln(F,Texto1);
  Linha := Linha + 1;
end;

procedure TfPrevMetasProdRef.Imprime_Rodape;
begin
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
end;

procedure TfPrevMetasProdRef.Imprimir;
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
  vTotalProdDia   := 0;
  vTotalProdSetor := 0;
  vCodSetor       := 0;
  qMetasProd.First;
  vData           := qMetasProdDataSaida.AsDateTime;
  while not qMetasProd.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      if vCodSetor <> qMetasProdSetor.AsInteger then
        begin
          if vCodSetor > 0 then
            Imprime_Total_Setor;
          Imprime_Cab_Setor;
        end;
      Imprime_Detalhe;
      vCodSetor := qMetasProdSetor.AsInteger;
      qMetasProd.Next;
    end;
  if qMetasProd.RecordCount > 0 then
    Imprime_Total_Setor;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevMetasProdRef.Gera_SQL;
begin
  //*** Gera a SQL para gravar as metas e qtde. produzida (Exportação)
  qMetasProd.Active := False;
  qMetasProd.SQL.Clear;
  qMetasProd.SQL.Add('SELECT Dbtalaomov.DataSaida, Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar, Dbproduto.Referencia, Dbtalao.CodProduto, Dbtalao.CodCor, Dbproduto.DescMaterial, Dbcor.Nome NomeCor, DbSetor.Nome NomeSetor');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add(' INNER JOIN "dbTalaoMov.db" Dbtalaomov');
  qMetasProd.SQL.Add(' ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
  qMetasProd.SQL.Add(' INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
  qMetasProd.SQL.Add(' ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)');
  qMetasProd.SQL.Add(' AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)');
  qMetasProd.SQL.Add(' INNER JOIN "dbTalao.DB" Dbtalao');
  qMetasProd.SQL.Add(' ON  (Dbtalaograde.Lote = Dbtalao.Lote)');
  qMetasProd.SQL.Add(' AND  (Dbtalaograde.Item = Dbtalao.Item)');
  if trim(RxDBLookupCombo1.Text) <> '' then
  begin
    qMetasProd.SQL.Add(' INNER JOIN "dbLote.DB" Dblote');
    qMetasProd.SQL.Add(' ON  (Dblote.Lote = Dbtalao.Lote)');
    qMetasProd.SQL.Add(' INNER JOIN "dbPedido.DB" Dbpedido');
    qMetasProd.SQL.Add(' ON  (Dbpedido.Pedido = Dblote.NroPedido)');
  end;
  qMetasProd.SQL.Add(' INNER JOIN "dbProduto.DB" Dbproduto');
  qMetasProd.SQL.Add(' ON  (Dbtalao.CodProduto = Dbproduto.Codigo)');
  qMetasProd.SQL.Add(' INNER JOIN "Dbcor.DB" Dbcor');
  qMetasProd.SQL.Add(' ON  (Dbtalao.CodCor = Dbcor.Codigo)');
  qMetasProd.SQL.Add('WHERE DbTalaomov.DataSaida BETWEEN :Data1 AND :Data2');
  if trim(RxDBLookupCombo1.Text) <> '' then
    qMetasProd.SQL.Add('AND Dbpedido.CodFabrica = :F1');
  qMetasProd.Params[0].AsDateTime := DateEdit1.Date;
  qMetasProd.Params[1].AsDateTime := DateEdit2.Date;
  if trim(RxDBLookupCombo1.Text) <> '' then
    qMetasProd.Params[2].AsInteger  := RxDBLookupCombo1.KeyValue;
  qMetasProd.SQL.Add('GROUP BY Dbtalaomov.DataSaida, Dbtalaomov.Setor, Dbproduto.Referencia, Dbtalao.CodProduto, Dbtalao.CodCor, Dbproduto.DescMaterial, Dbcor.Nome, Dbcor.Nome,dbSetor.Nome');
  qMetasProd.SQL.Add('ORDER BY Dbtalaomov.Setor, Dbtalaomov.DataSaida, Dbproduto.Referencia, Dbproduto.DescMaterial, NomeCor');
  qMetasProd.Active := True;
end;

procedure TfPrevMetasProdRef.Gera_SQL_MI;
begin
  //*** Gera a SQL para gravar as metas e qtde. produzida (Mercado Interno)
  qMetasProd.Active := False;
  qMetasProd.SQL.Clear;
  qMetasProd.SQL.Add('SELECT Dbtalaomovmi.DataSaida, Dbtalaomovmi.Setor, SUM( Dbtalaomi.QtdPar ) QtdPar, Dbproduto.Referencia, Dbtalaomi.CodProduto, Dbtalaomi.CodCor, Dbproduto.DescMaterial, Dbcor.Nome NomeCor, dbSetor.Nome NomeSetor');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoMovmi.db" Dbtalaomovmi');
  qMetasProd.SQL.Add('   ON  (Dbsetor.Codigo = Dbtalaomovmi.Setor)');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoMi.DB" DbtalaoMI');
  qMetasProd.SQL.Add('   ON  (DbtalaoMi.Lote = DbtalaomovMi.Lote)');
  qMetasProd.SQL.Add('   AND  (DbtalaoMi.Item = DbtalaomovMi.Talao)');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMetasProd.SQL.Add('   INNER JOIN "dbPedido.DB" Dbpedido');
    qMetasProd.SQL.Add('   ON  (Dbpedido.Pedido = DbTalaoMI.NumPedido)');
  end;
  qMetasProd.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qMetasProd.SQL.Add('   ON  (DbtalaoMi.CodProduto = Dbproduto.Codigo)');
  qMetasProd.SQL.Add('   INNER JOIN "Dbcor.DB" Dbcor');
  qMetasProd.SQL.Add('   ON  (DbtalaoMi.CodCor = Dbcor.Codigo)');
  qMetasProd.SQL.Add('WHERE DbTalaomovmi.DataSaida BETWEEN :Data1 AND :Data2');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMetasProd.SQL.Add('AND Dbpedido.CodFabrica = :F1');
    qMetasProd.Params[2].AsInteger  := RxDBLookupCombo1.KeyValue;
  end;
  qMetasProd.Params[0].AsDateTime := DateEdit1.Date;
  qMetasProd.Params[1].AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY DbtalaomovMi.DataSaida, DbtalaomovMi.Setor, Dbproduto.Referencia, DbtalaoMi.CodProduto, DbtalaoMi.CodCor, Dbproduto.DescMaterial, Dbcor.Nome, Dbcor.Nome,dbSetor.Nome');
  qMetasProd.SQL.Add('ORDER BY DbtalaomovMi.Setor, DbtalaomovMi.DataSaida, Dbproduto.Referencia, Dbproduto.DescMaterial, NomeCor');
  qMetasProd.Active := True;
end;

procedure TfPrevMetasProdRef.Gera_SQL_Ambos;
begin
  qMetasProd.Active := False;
  qMetasProd.SQL.Clear;
  qMetasProd.SQL.Add('SELECT Dbtalaomov.DataSaida, Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar, Dbproduto.Referencia, Dbtalao.CodProduto, Dbtalao.CodCor, Dbproduto.DescMaterial, Dbcor.Nome NomeCor, DbSetor.Nome NomeSetor');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add(' INNER JOIN "dbTalaoMov.db" Dbtalaomov');
  qMetasProd.SQL.Add(' ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
  qMetasProd.SQL.Add(' INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
  qMetasProd.SQL.Add(' ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)');
  qMetasProd.SQL.Add(' AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)');
  qMetasProd.SQL.Add(' INNER JOIN "dbTalao.DB" Dbtalao');
  qMetasProd.SQL.Add(' ON  (Dbtalaograde.Lote = Dbtalao.Lote)');
  qMetasProd.SQL.Add(' AND  (Dbtalaograde.Item = Dbtalao.Item)');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMetasProd.SQL.Add(' INNER JOIN "dbLote.DB" Dblote');
    qMetasProd.SQL.Add(' ON  (Dblote.Lote = Dbtalao.Lote)');
    qMetasProd.SQL.Add(' INNER JOIN "dbPedido.DB" Dbpedido');
    qMetasProd.SQL.Add(' ON  (Dbpedido.Pedido = Dblote.NroPedido)');
  end;
  qMetasProd.SQL.Add(' INNER JOIN "dbProduto.DB" Dbproduto');
  qMetasProd.SQL.Add(' ON  (Dbtalao.CodProduto = Dbproduto.Codigo)');
  qMetasProd.SQL.Add(' INNER JOIN "Dbcor.DB" Dbcor');
  qMetasProd.SQL.Add(' ON  (Dbtalao.CodCor = Dbcor.Codigo)');
  qMetasProd.SQL.Add('WHERE DbTalaomov.DataSaida BETWEEN :Data1 AND :Data2');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMetasProd.SQL.Add('AND Dbpedido.CodFabrica = :F1');
    qMetasProd.Params[2].AsInteger  := RxDBLookupCombo1.KeyValue;
  end;
  qMetasProd.Params[0].AsDateTime := DateEdit1.Date;
  qMetasProd.Params[1].AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY Dbtalaomov.DataSaida, Dbtalaomov.Setor, Dbproduto.Referencia, Dbtalao.CodProduto, Dbtalao.CodCor, Dbproduto.DescMaterial, Dbcor.Nome, Dbcor.Nome,dbSetor.Nome');
  qMetasProd.SQL.Add('UNION ALL');
  qMetasProd.SQL.Add('SELECT Dbtalaomovmi.DataSaida, Dbtalaomovmi.Setor, SUM( Dbtalaomi.QtdPar ) QtdPar, Dbproduto.Referencia, Dbtalaomi.CodProduto, Dbtalaomi.CodCor, Dbproduto.DescMaterial, Dbcor.Nome NomeCor, dbSetor.Nome NomeSetor');
  qMetasProd.SQL.Add('FROM "dbSetor.DB" Dbsetor');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoMovmi.db" Dbtalaomovmi');
  qMetasProd.SQL.Add('   ON  (Dbsetor.Codigo = Dbtalaomovmi.Setor)');
  qMetasProd.SQL.Add('   INNER JOIN "dbTalaoMi.DB" DbtalaoMI');
  qMetasProd.SQL.Add('   ON  (DbtalaoMi.Lote = DbtalaomovMi.Lote)');
  qMetasProd.SQL.Add('   AND  (DbtalaoMi.Item = DbtalaomovMi.Talao)');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMetasProd.SQL.Add('   INNER JOIN "dbPedido.DB" Dbpedido');
    qMetasProd.SQL.Add('   ON  (Dbpedido.Pedido = DbTalaoMI.NumPedido)');
  end;
  qMetasProd.SQL.Add('   INNER JOIN "dbProduto.DB" Dbproduto');
  qMetasProd.SQL.Add('   ON  (DbtalaoMi.CodProduto = Dbproduto.Codigo)');
  qMetasProd.SQL.Add('   INNER JOIN "Dbcor.DB" Dbcor');
  qMetasProd.SQL.Add('   ON  (DbtalaoMi.CodCor = Dbcor.Codigo)');
  qMetasProd.SQL.Add('WHERE DbTalaomovmi.DataSaida BETWEEN :Data1 AND :Data2');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMetasProd.SQL.Add('AND Dbpedido.CodFabrica = :F1');
    qMetasProd.Params[2].AsInteger  := RxDBLookupCombo1.KeyValue;
  end;
  qMetasProd.Params[0].AsDateTime := DateEdit1.Date;
  qMetasProd.Params[1].AsDateTime := DateEdit2.Date;
  qMetasProd.SQL.Add('GROUP BY DbtalaomovMi.DataSaida, DbtalaomovMi.Setor, Dbproduto.Referencia, DbtalaoMi.CodProduto, DbtalaoMi.CodCor, Dbproduto.DescMaterial, Dbcor.Nome, Dbcor.Nome,dbSetor.Nome');
  qMetasProd.SQL.Add('ORDER BY Setor, DataSaida, Referencia, DescMaterial, NomeCor');
  qMetasProd.Active := True;
end;

procedure TfPrevMetasProdRef.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    ShowMessage('Data esta incorreta')
  else
  begin
    Screen.Cursor := crHourglass;
    try
      Label4.Visible := True;
      Label4.Refresh;
      Refresh;
      case RadioGroup1.ItemIndex of
        0: Gera_SQL;
        1: Gera_SQL_MI;
        2: Gera_SQL_Ambos;
      end;
      RxDBFilter1.Active := True;
      Screen.Cursor := crDefault;
      Imprimir;
    finally
      Label4.Visible := False;
      Label4.Refresh;
      Refresh;
    end;
  end;
end;

procedure TfPrevMetasProdRef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Dm1.tProduto.Close;
  Dm1.tProdutoMeta.Close;
  Dm1.tFabrica.Close;
  DM1.tSetor.Close;
  Dm1.tCor.Close;
  Action := CaFree;
end;

procedure TfPrevMetasProdRef.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevMetasProdRef.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Nome';
end;

procedure TfPrevMetasProdRef.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Codigo';
end;

procedure TfPrevMetasProdRef.FormShow(Sender: TObject);
begin
  Dm1.tProduto.Open;
  Dm1.tProdutoMeta.Open;
  Dm1.tFabrica.Open;
  DM1.tSetor.Open;
  Dm1.tCor.Open;
end;

end.
