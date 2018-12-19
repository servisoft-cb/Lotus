unit UPrevBalancoEstUF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Buttons, RxLookup, Grids, DBGrids, Db,
  DBTables, Mask, ToolEdit, ComCtrls, CurrEdit, DBClient, ShellApi;

type
  TfPrevBalancoEstUF = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    qEstoqueCusto: TQuery;
    qEstoqueCustoCodMaterial: TIntegerField;
    qEstoqueCustoCodCor: TIntegerField;
    qEstoqueCustoLargura: TStringField;
    qEstoqueCustoVlrUnitario: TFloatField;
    qEstoqueCustoQtd: TFloatField;
    qEstoqueCustoPercIcms: TFloatField;
    qEstoqueCustoPercIpi: TFloatField;
    qEstoqueCustoVlrDesconto: TFloatField;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    qEstoqueCustoES: TStringField;
    DataSource1: TDataSource;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label10: TLabel;
    ComboBox1: TComboBox;
    qEstoqueCustoMercado: TStringField;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    qMaterial: TQuery;
    qMaterialCodMaterial: TIntegerField;
    qMaterialNome: TStringField;
    qMaterialQtd2: TFloatField;
    qMaterialUnidade: TStringField;
    qMaterialICMS: TFloatField;
    qMaterialIPI: TFloatField;
    mConsulta: TClientDataSet;
    mConsultaUF: TStringField;
    mConsultaCodMaterial: TIntegerField;
    mConsultaCodCor: TIntegerField;
    mConsultaNomeMaterial: TStringField;
    mConsultaNomeCor: TStringField;
    mConsultaQtd: TFloatField;
    mConsultaQtdEntrada: TFloatField;
    mConsultaQtdSaida: TFloatField;
    mConsultaAliqIcms: TFloatField;
    mConsultaPrecoMedio: TFloatField;
    mConsultaPrecoTotal: TFloatField;
    qEstoqueCustoCodCliForn: TIntegerField;
    mConsultaVlrUnitario: TFloatField;
    mConsultaLargura: TStringField;
    qMaterialFornecedor: TIntegerField;
    mConsultaVlrTotalEntrada: TFloatField;
    Label3: TLabel;
    ProgressBar3: TProgressBar;
    mConsultaVlrIcms: TFloatField;
    mConsultaAliqIpi: TFloatField;
    mConsultaUnidade: TStringField;
    mConsultaVlrIpi: TFloatField;
    qEstoqueCustoDtMov: TDateField;
    qEstoqueCustoTipoMov: TStringField;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    TextoGrade, TextoHifen, TextoQtd : String;
    vCodCor  : Integer;
    vLargura : String;
    vMercado : String;
    vUF      : String;
    vPrecoMedio, vSaldoFisico, vSaldoFinan : Real;
    vVlrTotal, vVlrTotalICMS, vVlrTotalIPI : Real;
    vVlrTotalUF, vVlrTotalICMSUF, vVlrTotalIPIUF : Real;
    linha, pagina : Integer;
    F: TextFile;

    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
    procedure Imprime_TotalUF;
    procedure Monta_SQL;
    procedure Le_qEstoqueCusto(Tipo : String);
    procedure Grava_mConsultaEnt;
    procedure Grava_mConsultaSai(Qtd : Real ; Inserir : Boolean);
    procedure Le_qMaterial;
    procedure Le_mConsulta;

  public
    { Public declarations }
  end;

const
  cINegrito = #27#71;
  cFNegrito = #27#72;
  cExpand = #14;
  cCondens = #15;

var
  fPrevBalancoEstUF: TfPrevBalancoEstUF;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevBalancoEstUF.Le_mConsulta;
var
  vCodCorAux : String;
  vQtdAux : Real;
  vQtdEstoque : Real;
begin
  vQtdEstoque := qEstoqueCustoQtd.AsFloat;
  vCodCorAux := '0';
  if qEstoqueCustoCodCor.AsInteger > 0 then
    vCodCorAux := qEstoqueCustoCodCor.AsString;
  mConsulta.Filtered := False;
  if Trim(qEstoqueCustoLargura.AsString) <> '' then
    mConsulta.Filter   := 'CodMaterial = '''+qEstoqueCustoCodMaterial.AsString+''' and CodCor = ''' + vCodCorAux + ''' and Largura = ''' + Trim(qEstoqueCustoLargura.AsString) +''''
  else
    mConsulta.Filter   := 'CodMaterial = '''+qEstoqueCustoCodMaterial.AsString+''' and CodCor = ''' + vCodCorAux + '''';
  mConsulta.Filtered := True;
  mConsulta.First;
  while not mConsulta.Eof do
    begin
      if StrToFloat(FormatFloat('0.000000',mConsultaQtd.AsFloat)) > StrToFloat(FormatFloat('0.000000',vQtdEstoque)) then
        vQtdAux := StrToFloat(FormatFloat('0.000000',vQtdEstoque))
      else
        vQtdAux := StrToFloat(FormatFloat('0.000000',mConsultaQtd.AsFloat));
      Grava_mConsultaSai(vQtdAux,False);
      vQtdEstoque := StrToFloat(FormatFloat('0.000000',vQtdEstoque - vQtdAux));
      if StrToFloat(FormatFloat('0.000000',vQtdEstoque)) <= 0 then
        mConsulta.Last;
      mConsulta.Next;
    end;
  Grava_mConsultaSai(StrToFloat(FormatFloat('0.000000',vQtdEstoque)),True);
  mConsulta.Filtered := False;
end;

procedure TfPrevBalancoEstUF.Grava_mConsultaEnt;
var
  vLargAux : String;
  vVlrAux  : Real;
begin
  vLargAux := '';
  if Trim(qEstoqueCustoLargura.AsString) <> '' then
    vLargAux := Trim(qEstoqueCustoLargura.AsString);
  if mConsulta.FindKey([vUF,qEstoqueCustoCodMaterial.AsInteger,qEstoqueCustoCodCor.AsInteger,vLargAux]) then
    mConsulta.Edit
  else
    begin
      mConsulta.Insert;
      mConsultaUF.AsString           := vUF;
      mConsultaCodMaterial.AsInteger := qEstoqueCustoCodMaterial.AsInteger;
      mConsultaCodCor.AsInteger      := qEstoqueCustoCodCor.AsInteger;
      mConsultaLargura.AsString      := vLargAux;
      mConsultaNomeMaterial.AsString := qMaterialNome.AsString;
      mConsultaUnidade.AsString      := qMaterialUnidade.AsString;
      if (qEstoqueCustoCodCor.AsInteger > 0) and (DM1.tCor.FindKey([qEstoqueCustoCodCor.AsInteger])) then
        mConsultaNomeCor.AsString := DM1.tCorNome.AsString;
    end;
  mConsultaQtdEntrada.AsFloat  := mConsultaQtdEntrada.AsFloat + qEstoqueCustoQtd.AsFloat;
  vVlrAux      := StrToFloat(FormatFloat('0.00',qEstoqueCustoQtd.AsFloat * qEstoqueCustoVlrUnitario.AsFloat));
  vVlrAux      := vVlrAux - qEstoqueCustoVlrDesconto.AsFloat;
  mConsultaVlrTotalEntrada.AsFloat  := mConsultaVlrTotalEntrada.AsFloat + vVlrAux;
  mConsultaQtd.AsFloat := StrToFloat(FormatFloat('0.00000',mConsultaQtd.AsFloat + qEstoqueCustoQtd.AsFloat));
  if StrToFloat(FormatFloat('0.00000',mConsultaVlrTotalEntrada.AsFloat)) > 0 then
    mConsultaPrecoMedio.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaVlrTotalEntrada.AsFloat / mConsultaQtdEntrada.AsFloat));
  if StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat)) > 0 then
    //mConsultaPrecoTotal.AsFloat := mConsultaPrecoTotal.AsFloat + StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
    mConsultaPrecoTotal.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
  if StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIcms.AsFloat)) > 0 then
    mConsultaAliqIcms.AsFloat := StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIcms.AsFloat));
  if mConsultaAliqIcms.AsFloat > 0 then
    mConsultaVlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',(qEstoqueCustoPercIcms.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  if StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIpi.AsFloat)) > 0 then
    mConsultaAliqIpi.AsFloat := StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIpi.AsFloat));
  if mConsultaAliqIpi.AsFloat > 0 then
    mConsultaVlrIpi.AsFloat := StrToFloat(FormatFloat('0.00',(qEstoqueCustoPercIpi.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  mConsulta.Post;
end;

procedure TfPrevBalancoEstUF.Grava_mConsultaSai(Qtd : Real ; Inserir : Boolean);
var
  vLargAux : String;
  vVlrAux  : Real;                              
begin
  vLargAux := '';
  if Trim(qEstoqueCustoLargura.AsString) <> '' then
    vLargAux := Trim(qEstoqueCustoLargura.AsString);
  if not Inserir then
    mConsulta.Edit
  else
    begin
      mConsulta.Insert;
      mConsultaUF.AsString           := vUF;
      mConsultaCodMaterial.AsInteger := qEstoqueCustoCodMaterial.AsInteger;
      mConsultaCodCor.AsInteger      := qEstoqueCustoCodCor.AsInteger;
      mConsultaLargura.AsString      := vLargAux;
      mConsultaNomeMaterial.AsString := qMaterialNome.AsString;
      mConsultaUnidade.AsString      := qMaterialUnidade.AsString;
      if (qEstoqueCustoCodCor.AsInteger > 0) and (DM1.tCor.FindKey([qEstoqueCustoCodCor.AsInteger])) then
        mConsultaNomeCor.AsString := DM1.tCorNome.AsString;
    end;
  mConsultaQtd.AsFloat      := StrToFloat(FormatFloat('0.00000',mConsultaQtd.AsFloat - Qtd));
  mConsultaQtdSaida.AsFloat := StrToFloat(FormatFloat('0.00000',mConsultaQtdSaida.AsFloat + Qtd));
  if StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat)) > 0 then
    //mConsultaPrecoTotal.AsFloat := mConsultaPrecoTotal.AsFloat + StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
    mConsultaPrecoTotal.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
  if StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIcms.AsFloat)) > 0 then
    mConsultaAliqIcms.AsFloat := StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIcms.AsFloat));
  if mConsultaAliqIcms.AsFloat > 0 then
    mConsultaVlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',(qEstoqueCustoPercIcms.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  if StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIpi.AsFloat)) > 0 then
    mConsultaAliqIpi.AsFloat := StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIpi.AsFloat));
  if mConsultaAliqIpi.AsFloat > 0 then
    mConsultaVlrIpi.AsFloat := StrToFloat(FormatFloat('0.00',(qEstoqueCustoPercIpi.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  mConsulta.Post;
end;

{procedure TfPrevBalancoEstUF.Grava_mConsultaSai;
var
  vLargAux : String;
  vVlrAux  : Real;
begin
  vLargAux := '';
  if Trim(qEstoqueCustoLargura.AsString) <> '' then
    vLargAux := Trim(qEstoqueCustoLargura.AsString);
  if qEstoqueCustoES.AsString = 'E' then
    begin
      if mConsulta.FindKey([vUF,qEstoqueCustoCodMaterial.AsInteger,qEstoqueCustoCodCor.AsInteger,vLargAux]) then
        mConsulta.Edit
      else
        mConsulta.Insert;
    end
  else
    begin
      if mConsulta.Locate('CodMaterial;CodCor;Largura',VarArrayOf([qEstoqueCustoCodMaterial.AsInteger,qEstoqueCustoCodCor.AsInteger,vLargAux]),[locaseinsensitive]) then
        mConsulta.Edit
      else
        mConsulta.Insert;
    end;
  if mConsulta.State in [dsInsert] then
    begin
      mConsultaUF.AsString           := vUF;
      mConsultaCodMaterial.AsInteger := qEstoqueCustoCodMaterial.AsInteger;
      mConsultaCodCor.AsInteger      := qEstoqueCustoCodCor.AsInteger;
      mConsultaLargura.AsString      := vLargAux;
      mConsultaNomeMaterial.AsString := qMaterialNome.AsString;
      mConsultaUnidade.AsString      := qMaterialUnidade.AsString;
      if (qEstoqueCustoCodCor.AsInteger > 0) and (DM1.tCor.FindKey([qEstoqueCustoCodCor.AsInteger])) then
        mConsultaNomeCor.AsString := DM1.tCorNome.AsString;
    end;
  if qEstoqueCustoES.AsString = 'E' then
    begin
      mConsultaQtdEntrada.AsFloat  := mConsultaQtdEntrada.AsFloat + qEstoqueCustoQtd.AsFloat;
      vVlrAux      := StrToFloat(FormatFloat('0.00',qEstoqueCustoQtd.AsFloat * qEstoqueCustoVlrUnitario.AsFloat));
      vVlrAux      := vVlrAux - qEstoqueCustoVlrDesconto.AsFloat;
      mConsultaVlrTotalEntrada.AsFloat  := mConsultaVlrTotalEntrada.AsFloat + vVlrAux;
      mConsultaQtd.AsFloat := StrToFloat(FormatFloat('0.00000',mConsultaQtd.AsFloat + qEstoqueCustoQtd.AsFloat));
    end
  else
  if qEstoqueCustoES.AsString = 'S' then
    begin
      mConsultaQtd.AsFloat      := StrToFloat(FormatFloat('0.00000',mConsultaQtd.AsFloat - qEstoqueCustoQtd.AsFloat));
      mConsultaQtdSaida.AsFloat := StrToFloat(FormatFloat('0.00000',mConsultaQtdSaida.AsFloat - qEstoqueCustoQtd.AsFloat));
    end;
  if StrToFloat(FormatFloat('0.00000',mConsultaVlrTotalEntrada.AsFloat)) > 0 then
    mConsultaPrecoMedio.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaVlrTotalEntrada.AsFloat / mConsultaQtdEntrada.AsFloat));
  if StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat)) > 0 then
    mConsultaPrecoTotal.AsFloat := mConsultaPrecoTotal.AsFloat + StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
  if StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIcms.AsFloat)) > 0 then
    mConsultaAliqIcms.AsFloat := StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIcms.AsFloat));
  if mConsultaAliqIcms.AsFloat > 0 then
    mConsultaVlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',(qEstoqueCustoPercIcms.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  if StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIpi.AsFloat)) > 0 then
    mConsultaAliqIpi.AsFloat := StrToFloat(FormatFloat('0.00',qEstoqueCustoPercIpi.AsFloat));
  if mConsultaAliqIpi.AsFloat > 0 then
    mConsultaVlrIpi.AsFloat := StrToFloat(FormatFloat('0.00',(qEstoqueCustoPercIpi.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  mConsulta.Post;
end;}

procedure TfPrevBalancoEstUF.Monta_SQL;
begin
  qEstoqueCusto.Close;
  qEstoqueCusto.SQL.Clear;
  qEstoqueCusto.SQL.Add('SELECT CodMaterial, CodCor, Largura, DtMov, VlrUnitario, Qtd, PercIcms, PercIpi, VlrDesconto, TipoMov, ES, Mercado, CodCliForn');
  qEstoqueCusto.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qEstoqueCusto.SQL.Add('WHERE (DtMov <= :DtMov)');
  qEstoqueCusto.ParamByName('DtMov').AsDate :=  DateEdit1.Date;
  if vMercado <> '' then
    begin
      qEstoqueCusto.SQL.Add('  AND (Mercado = :Mercado)');
      qEstoqueCusto.ParamByName('Mercado').AsString := vMercado;
    end;
  qEstoqueCusto.SQL.Add('ORDER BY CodMaterial, CodCor, Largura, ES, CodCliForn, Mercado');
  qEstoqueCusto.Open;

  //Sql do material
  qMaterial.Close;
  qMaterial.SQL.Clear;
  qMaterial.SQL.Add('SELECT Dbestoquematmov.CodMaterial, Dbmaterial.Nome, SUM( Dbestoquematmov.Qtd2 ) Qtd2, Dbmaterial.Unidade, Dbmaterial.ICMS, Dbmaterial.IPI, dbMaterial.Fornecedor');
  qMaterial.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qMaterial.SQL.Add('   INNER JOIN "dbMaterial.DB" Dbmaterial');
  qMaterial.SQL.Add('   ON  (Dbestoquematmov.CodMaterial = Dbmaterial.Codigo)');
  qMaterial.SQL.Add('WHERE  (Dbestoquematmov.Qtd2 > 0) and (Dbestoquematmov.Dtmov <= :DtMov)');
  qMaterial.ParamByName('DtMov').AsDate := DateEdit1.Date;
  qMaterial.SQL.Add('GROUP BY Dbestoquematmov.CodMaterial, Dbmaterial.Nome, Dbmaterial.Unidade, Dbmaterial.ICMS, Dbmaterial.IPI, dbMaterial.Fornecedor');
  qMaterial.SQL.Add('ORDER BY Dbmaterial.Nome');
  qMaterial.Open;
end;

procedure TfPrevBalancoEstUF.Le_qEstoqueCusto(Tipo : String);
var
  vVlrAux : Real;
  vQtdEntrada, vVlrEntrada : Real;
begin
  qEstoqueCusto.Filtered := False;
  qEstoqueCusto.Filter   := 'CodMaterial = '''+qMaterialCodMaterial.AsString+''' and ES = ''' + Tipo + '''';
  qEstoqueCusto.Filtered := True;
  if qEstoqueCusto.RecordCount > 0 then
    begin
      ProgressBar2.Position := 0;
      ProgressBar2.Max      := qEstoqueCusto.RecordCount;

      qEstoqueCusto.First;
      vCodCor  := qEstoqueCustoCodCor.AsInteger;
      vLargura := qEstoqueCustoLargura.AsString;
      while not qEstoqueCusto.Eof do
        begin
          ProgressBar2.Position := ProgressBar2.Position + 1;
          vUF := '';
          if (qEstoqueCustoCodCliForn.AsInteger > 0) and
             (qEstoqueCustoTipoMov.AsString = 'NTE') and
             (DM1.tFornecedores.FindKey([qEstoqueCustoCodCliForn.AsInteger])) then
            vUF := DM1.tFornecedoresEstadoForn.AsString
          else
          if (qMaterialFornecedor.AsInteger > 0) and (qEstoqueCustoES.AsString = 'E') and
             (DM1.tFornecedores.FindKey([qMaterialFornecedor.AsInteger])) then
            vUF := DM1.tFornecedoresEstadoForn.AsString;
          if Tipo = 'E' then
            Grava_mConsultaEnt
          else
            Le_mConsulta;
          vCodCor  := qEstoqueCustoCodCor.AsInteger;
          vLargura := qEstoqueCustoLargura.AsString;
          qEstoqueCusto.Next;
        end;
    end;
  qEstoqueCusto.Filtered := False;
end;

procedure TfPrevBalancoEstUF.Imprime_Cabecalho;
var
  Texto1 : String;
  I : Integer;
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
  for i := 1 to 113 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  case ComboBox1.ItemIndex of
    0 : texto1 := '  E X P O R T A C A O                     BALANCO - Referencia: ' + DateEdit1.Text + '                                       Emissao: ' + DateToStr(Date);
    1 : texto1 := '  M E R C.  I N T E R N O                 BALANCO - Referencia: ' + DateEdit1.Text + '                                       Emissao: ' + DateToStr(Date);
    2 : texto1 := '                                          BALANCO - Referencia: ' + DateEdit1.Text + '                                       Emissao: ' + DateToStr(Date);
  end;
  Writeln(F,Texto1);

  Writeln(F,'-------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'UF Codigo Material                       Cor             Larg. UM     Saldo Fisico   Pr.Medio      Vlr.Total %ICMS    V.ICMS    V.IPI');
  Writeln(F,'-------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevBalancoEstUF.Imprime_Detalhe;
var
 i: Integer;
 texto1, Texto2: string;
 vVlrAux : Real;
begin
  Texto2 := mConsultaUF.AsString;
  for i := 1 to 2 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := Texto2 + ' ';

  Texto2 := mConsultaCodMaterial.AsString;
  for i := 1 to 6 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + ' ';

  Texto2 := Copy(mConsultaNomeMaterial.AsString,1,30);
  for i := 1 to 30 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  Texto2 := mConsultaNomeCor.AsString;
  for i := 1 to 15 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + '  ';
  texto2 := mConsultaLargura.AsString;
  for i := 1 to 1 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + '    ';
  texto2 := mConsultaUnidade.AsString;
  for i := 1 to 3 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('#,###,##0.00000',mConsultaQtd.AsFloat);
  for i := 1 to 15 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('###,##0.00',mConsultaPrecoMedio.AsFloat);
  for i := 1 to 10 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  vVlrTotal   := vVlrTotal + mConsultaPrecoTotal.AsFloat;
  vVlrTotalUF := vVlrTotalUF + mConsultaPrecoTotal.AsFloat;
  texto2 := FormatFloat('###,###,##0.00',mConsultaPrecoTotal.AsFloat);
  for i := 1 to 14 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  texto2 := FormatFloat('#0.00',mConsultaAliqIcms.AsFloat);
  for i := 1 to 5 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  vVlrTotalICMS   := vVlrTotalICMS + mConsultaVlrIcms.AsFloat;
  vVlrTotalICMSUF := vVlrTotalICMSUF + mConsultaVlrIcms.AsFloat; 
  texto2 := FormatFloat('##,##0.00',mConsultaVlrIcms.AsFloat);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  vVlrTotalIPI   := vVlrTotalIPI + mConsultaVlrIpi.AsFloat;
  vVlrTotalIPIUF := vVlrTotalIPIUF + mConsultaVlrIpi.AsFloat; 
  texto2 := FormatFloat('##,##0.00',vVlrAux);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F,Texto1);
  Linha := Linha + 1;
end;

procedure TfPrevBalancoEstUF.Imprime_TotalUF;
var
 i: Integer;
 Texto1, Texto2 : string;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  texto1 := 'UF: ' + vUF +  '    Valor Total: ';
  Texto2 := FormatFloat('###,###,###,##0.00',vVlrTotalUF);
  for i := 1 to 18 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '         Valor Total ICMS: ';

  Texto2 := FormatFloat('###,###,##0.00',vVlrTotalICMSUF);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      Valor Total IPI: ';

  Texto2 := FormatFloat('###,###,##0.00',vVlrTotalIPIUF);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  Writeln(F,cINegrito + Texto1 + CFNegrito);

  Writeln(F);
  Writeln(F);

  Linha := Linha + 2;
  vVlrTotalICMSUF := 0;
  vVlrTotalIPIUF  := 0;
  vVlrTotalUF     := 0;
end;

procedure TfPrevBalancoEstUF.Imprime_Rodape;
var
 i: Integer;
 Texto1, Texto2 : string;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  texto1 := '      Valor Total: ';
  Texto2 := FormatFloat('###,###,###,##0.00',vVlrTotal);
  for i := 1 to 18 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '           Valor Total ICMS: ';

  Texto2 := FormatFloat('###,###,##0.00',vVlrTotalICMS);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '        Valor Total IPI: ';

  Texto2 := FormatFloat('###,###,##0.00',vVlrTotalIPI);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  Writeln(F,cINegrito + Texto1 + CFNegrito);

  linha := linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevBalancoEstUF.Le_qMaterial;
var
  Texto : String;
begin
  ProgressBar1.Position   := 0;
  ProgressBar1.Max        := qMaterial.RecordCount;
  CurrencyEdit1.AsInteger := qMaterial.RecordCount;
  CurrencyEdit1.Refresh;
  CurrencyEdit2.Clear;

  qMaterial.First;
  while not qMaterial.Eof do
    begin
      ProgressBar1.Position   := ProgressBar1.Position + 1;
      CurrencyEdit2.AsInteger := CurrencyEdit2.AsInteger + 1;
      CurrencyEdit2.Refresh;
      Le_qEstoqueCusto('E');
      Le_qEstoqueCusto('S');
      qMaterial.Next;
    end;
end;

procedure TfPrevBalancoEstUF.Imprimir;
var
  Texto : String;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);

  ProgressBar3.Max      := mConsulta.RecordCount;
  ProgressBar3.Position := 0;
  vUF := '';
  mConsulta.First;
  while not mConsulta.Eof do
    begin
      if mConsultaQtd.AsCurrency <= 0.000000001 then
      begin
        vUF := mConsultaUF.AsString;
        mConsulta.Next;
        if vUF <> mConsultaUF.AsString then
          Imprime_TotalUF;
        Continue;
      end;
      ProgressBar3.Position := ProgressBar3.Position + 1;
      if Linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      vUF := mConsultaUF.AsString;
      mConsulta.Next;
      if vUF <> mConsultaUF.AsString then
        Imprime_TotalUF;
    end;

  Imprime_TotalUF;
  Imprime_Rodape;

  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevBalancoEstUF.BitBtn6Click(Sender: TObject);
begin
  //qEstoqueCusto.Open;
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  DM1.tCor.IndexFieldNames          := 'Codigo';
  mConsulta.EmptyDataSet;
  vMercado := '';
  case ComboBox1.ItemIndex of
    0 : vMercado := 'E';
    1 : vMercado := 'I';
  end;
  Monta_SQL;

  vVlrTotal     := 0;
  vVlrTotalICMS := 0;
  vVlrTotalIPI  := 0;
  Le_qMaterial;
  Imprimir;
  BitBtn1.SetFocus;
  qEstoqueCusto.Close;
  Close;
end;

procedure TfPrevBalancoEstUF.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevBalancoEstUF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qEstoqueCusto.Close;
  if Screen.FormCount < 3 then
    begin
      DM1.tCor.Close;
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      DM1.tEstoqueMatMov.Close;
      DM1.tEstoqueMatMovGrade.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevBalancoEstUF.FormShow(Sender: TObject);
begin
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
  DM1.tFornecedores.Open;
end;

end.
