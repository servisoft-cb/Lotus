unit UPrevBalancoEstUF2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Buttons, RxLookup, Grids, DBGrids, Db,
  DBTables, Mask, ToolEdit, ComCtrls, CurrEdit, DBClient, Variants, ShellApi;

type
  TfPrevBalancoEstUF2 = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label10: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    qMaterial: TQuery;
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
    mConsultaVlrUnitario: TFloatField;
    mConsultaLargura: TStringField;
    mConsultaVlrTotalEntrada: TFloatField;
    Label3: TLabel;
    ProgressBar3: TProgressBar;
    mConsultaVlrIcms: TFloatField;
    mConsultaAliqIpi: TFloatField;
    mConsultaUnidade: TStringField;
    mConsultaVlrIpi: TFloatField;
    dsqMaterial: TDataSource;
    qMaterialCodMaterial: TIntegerField;
    qMaterialNome: TStringField;
    qMaterialQtd: TFloatField;
    qMaterialVlrTotal: TFloatField;
    qMaterialUnidade: TStringField;
    qMaterialICMS: TFloatField;
    qMaterialIPI: TFloatField;
    qMaterialFornecedor: TIntegerField;
    qMaterialCodCor: TIntegerField;
    qMaterialLargura: TStringField;
    qMaterialPercIcms: TFloatField;
    qMaterialPercIpi: TFloatField;
    qMaterialTipoMov: TStringField;
    qMaterialES: TStringField;
    qMaterialCodCliForn: TIntegerField;
    qSaida: TQuery;
    qSaidaCodMaterial: TIntegerField;
    qSaidaQtd: TFloatField;
    qSaidaVlrTotal: TFloatField;
    qSaidaCodCor: TIntegerField;
    qSaidaLargura: TStringField;
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
    procedure Grava_mConsultaEnt;
    procedure Grava_mConsultaSai(Qtd : Real);
    procedure Le_qMaterial;
    procedure Le_qSaida;
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
  fPrevBalancoEstUF2: TfPrevBalancoEstUF2;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevBalancoEstUF2.Le_mConsulta;
var
  vQtdAux : Real;
  vQtdEstoque : Real;
  vCodCorAux : String;
  vLargAux : String;

  vCodMatAnt : Integer;
  vCodCorAnt : Integer;
  vLarguraAnt : String;
begin
  mConsulta.Filtered := False;
  vCodCorAux := '0';
  if qSaidaCodCor.AsInteger > 0 then
    vCodCorAux := qMaterialCodCor.AsString;
  vLargAux := '';
  if qSaidaLargura.AsString <> '' then
    vLargAux := qSaidaLargura.AsString;

  mConsulta.FindKey([qSaidaCodMaterial.AsInteger,qSaidaCodCor.AsInteger,vLargAux]);
  vQtdEstoque := qSaidaQtd.AsFloat;
  while not mConsulta.Eof do
    begin
      if (mConsultaCodMaterial.AsInteger <> qSaidaCodMaterial.AsInteger) or
         (mConsultaCodCor.AsInteger <> qSaidaCodCor.AsInteger) or
         (mConsultaLargura.AsString <> qSaidaLargura.AsString) then
        mConsulta.Last
      else
      if StrToFloat(FormatFloat('0.000000',mConsultaQtd.AsFloat)) > StrToFloat(FormatFloat('0.000000',vQtdEstoque)) then
        vQtdAux := StrToFloat(FormatFloat('0.000000',vQtdEstoque))
      else
        vQtdAux := StrToFloat(FormatFloat('0.000000',mConsultaQtd.AsFloat));
      Grava_mConsultaSai(vQtdAux);
      vQtdEstoque := StrToFloat(FormatFloat('0.000000',vQtdEstoque - vQtdAux));
      if StrToFloat(FormatFloat('0.000000',vQtdEstoque)) <= 0 then
        mConsulta.Last;
      mConsulta.Next;
    end;
  mConsulta.Filtered := False;
end;

procedure TfPrevBalancoEstUF2.Grava_mConsultaEnt;
var
  vLargAux : String;
  vVlrAux  : Real;
begin
  vLargAux := '';
  if Trim(qMaterialLargura.AsString) <> '' then
    vLargAux := Trim(qMaterialLargura.AsString);
  if mConsulta.FindKey([vUF,qMaterialCodMaterial.AsInteger,qMaterialCodCor.AsInteger,vLargAux]) then
  //if mConsulta.Locate('UF;CodMaterial;CodCor;Largura',VarArrayOf([vUF,qMaterialCodMaterial.AsInteger,qMaterialCodCor.AsInteger,vLargAux]),[locaseinsensitive]) then
    mConsulta.Edit
  else
    begin
      mConsulta.Insert;
      mConsultaUF.AsString           := vUF;
      mConsultaCodMaterial.AsInteger := qMaterialCodMaterial.AsInteger;
      mConsultaCodCor.AsInteger      := qMaterialCodCor.AsInteger;
      mConsultaLargura.AsString      := vLargAux;
      mConsultaNomeMaterial.AsString := qMaterialNome.AsString;
      mConsultaUnidade.AsString      := qMaterialUnidade.AsString;
      if (qMaterialCodCor.AsInteger > 0) and (DM1.tCor.FindKey([qMaterialCodCor.AsInteger])) then
        mConsultaNomeCor.AsString := DM1.tCorNome.AsString;
    end;

  mConsultaQtdEntrada.AsFloat  := mConsultaQtdEntrada.AsFloat + qMaterialQtd.AsFloat;
  //vVlrAux      := StrToFloat(FormatFloat('0.00',qMaterialQtd.AsFloat * qMaterialVlrUnitario.AsFloat));
  vVlrAux      := StrToFloat(FormatFloat('0.00',qMaterialVlrTotal.AsFloat));
  //vVlrAux      := vVlrAux - qMaterialVlrDesconto.AsFloat;
  //mConsultaVlrTotalEntrada.AsFloat  := mConsultaVlrTotalEntrada.AsFloat + vVlrAux;
  mConsultaVlrTotalEntrada.AsFloat  := mConsultaVlrTotalEntrada.AsFloat + StrToFloat(FormatFloat('0.00',qMaterialVlrTotal.AsFloat));
  mConsultaQtd.AsFloat := StrToFloat(FormatFloat('0.00000',mConsultaQtd.AsFloat + qMaterialQtd.AsFloat));
  if StrToFloat(FormatFloat('0.00000',mConsultaVlrTotalEntrada.AsFloat)) > 0 then
    mConsultaPrecoMedio.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaVlrTotalEntrada.AsFloat / mConsultaQtdEntrada.AsFloat));
  if StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat)) > 0 then
    //mConsultaPrecoTotal.AsFloat := mConsultaPrecoTotal.AsFloat + StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
    mConsultaPrecoTotal.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
  if StrToFloat(FormatFloat('0.00',qMaterialPercIcms.AsFloat)) > 0 then
    mConsultaAliqIcms.AsFloat := StrToFloat(FormatFloat('0.00',qMaterialPercIcms.AsFloat));
  if mConsultaAliqIcms.AsFloat > 0 then
    mConsultaVlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',(qMaterialPercIcms.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  if StrToFloat(FormatFloat('0.00',qMaterialPercIpi.AsFloat)) > 0 then
    mConsultaAliqIpi.AsFloat := StrToFloat(FormatFloat('0.00',qMaterialPercIpi.AsFloat));
  if mConsultaAliqIpi.AsFloat > 0 then
    mConsultaVlrIpi.AsFloat := StrToFloat(FormatFloat('0.00',(qMaterialPercIpi.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  mConsulta.Post;
end;

procedure TfPrevBalancoEstUF2.Grava_mConsultaSai(Qtd : Real);
var
  vLargAux : String;
  vVlrAux  : Real;
begin
  vLargAux := '';
  if Trim(qMaterialLargura.AsString) <> '' then
    vLargAux := Trim(qMaterialLargura.AsString);
  mConsulta.Edit;
  mConsultaQtd.AsFloat      := StrToFloat(FormatFloat('0.00000',mConsultaQtd.AsFloat - Qtd));
  mConsultaQtdSaida.AsFloat := StrToFloat(FormatFloat('0.00000',mConsultaQtdSaida.AsFloat + Qtd));
  if StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat)) > 0 then
    mConsultaPrecoTotal.AsFloat := StrToFloat(FormatFloat('0.00',mConsultaPrecoMedio.AsFloat * mConsultaQtd.AsFloat));
  if mConsultaAliqIcms.AsFloat > 0 then
    mConsultaVlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',(mConsultaAliqIcms.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  if mConsultaAliqIpi.AsFloat > 0 then
    mConsultaVlrIpi.AsFloat := StrToFloat(FormatFloat('0.00',(mConsultaAliqIpi.AsFloat * mConsultaPrecoTotal.AsFloat) / 100));
  mConsulta.Post;
end;

procedure TfPrevBalancoEstUF2.Monta_SQL;
begin
  //Sql do material (somente as entradas)
  qMaterial.Close;
  qMaterial.SQL.Clear;
  qMaterial.SQL.Add('SELECT Dbestoquematmov.CodMaterial, Dbmaterial.Nome, SUM( Dbestoquematmov.Qtd ) Qtd, SUM(  Dbestoquematmov.Qtd *  (Dbestoquematmov.VlrUnitario - Dbestoquematmov.VlrDesconto)) VlrTotal, ');
  qMaterial.SQL.Add('Dbmaterial.Unidade, Dbmaterial.ICMS, Dbmaterial.IPI, Dbmaterial.Fornecedor, Dbestoquematmov.CodCor, Dbestoquematmov.Largura, Dbestoquematmov.PercIcms, Dbestoquematmov.PercIpi, ');
  qMaterial.SQL.Add('Dbestoquematmov.TipoMov, Dbestoquematmov.ES, Dbestoquematmov.CodCliForn ');
  qMaterial.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qMaterial.SQL.Add('   INNER JOIN "dbMaterial.DB" Dbmaterial');
  qMaterial.SQL.Add('   ON (Dbestoquematmov.CodMaterial = Dbmaterial.Codigo)');
  qMaterial.SQL.Add('WHERE (Dbestoquematmov.Qtd > 0)  ');
  qMaterial.SQL.Add('  AND (Dbestoquematmov.Dtmov <= :DtMov) ');
  qMaterial.SQL.Add('  AND (Dbestoquematmov.ES = ''E'') ');
  //qMaterial.SQL.Add('  AND (Dbestoquematmov.CodMaterial = 145) ');
  qMaterial.ParamByName('DtMov').AsDate := DateEdit1.Date;
  if vMercado <> '' then
  begin
    qMaterial.SQL.Add('  AND (Mercado = :Mercado)');
    qMaterial.ParamByName('Mercado').AsString := vMercado;
  end;
  qMaterial.SQL.Add('GROUP BY Dbestoquematmov.CodMaterial, Dbmaterial.Nome, Dbmaterial.Unidade, Dbmaterial.ICMS, Dbmaterial.IPI, Dbmaterial.Fornecedor, ');
  qMaterial.SQL.Add(' Dbestoquematmov.CodCor, Dbestoquematmov.Largura, Dbestoquematmov.PercIcms, Dbestoquematmov.PercIpi, Dbestoquematmov.TipoMov, Dbestoquematmov.ES, Dbestoquematmov.CodCliForn');
  qMaterial.SQL.Add('ORDER BY dbEstoqueMatMov.Es, dbEstoqueMatMov.CodMaterial, dbEstoqueMatMov.CodCor, dbEstoqueMatMov.Largura ');
  qMaterial.Open;

  //Saídas
  qSaida.Close;
  qSaida.SQL.Clear;
  qSaida.SQL.Add('SELECT CodMaterial, SUM( Qtd ) Qtd, SUM(  Qtd *  (VlrUnitario - VlrDesconto)   ) VlrTotal, CodCor, Largura');
  qSaida.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qSaida.SQL.Add('WHERE  ES = ''S''');
  //qSaida.SQL.Add('  AND (Dbestoquematmov.CodMaterial = 145) ');
  if vMercado <> '' then
    begin
      qSaida.SQL.Add('  AND (Mercado = :Mercado)');
      qSaida.ParamByName('Mercado').AsString := vMercado;
    end;
  qSaida.SQL.Add('  AND (Dbestoquematmov.Dtmov <= :DtMov) ');
  qSaida.ParamByName('DtMov').AsDate := DateEdit1.Date;
  qSaida.SQL.Add('GROUP BY CodMaterial, CodCor, Largura');
  qSaida.SQL.Add('ORDER BY CodMaterial, CodCor, Largura');
  qSaida.Open;
end;

procedure TfPrevBalancoEstUF2.Imprime_Cabecalho;
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

procedure TfPrevBalancoEstUF2.Imprime_Detalhe;
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

procedure TfPrevBalancoEstUF2.Imprime_TotalUF;
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

procedure TfPrevBalancoEstUF2.Imprime_Rodape;
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

procedure TfPrevBalancoEstUF2.Le_qMaterial;
var
  Texto : String;
  vFlag : Boolean;
begin
  ProgressBar1.Position   := 0;
  ProgressBar1.Max        := qMaterial.RecordCount;
  CurrencyEdit1.AsInteger := qMaterial.RecordCount + qSaida.RecordCount;
  CurrencyEdit1.Refresh;
  CurrencyEdit2.Clear;

  vFlag := False;
  qMaterial.First;
  while not qMaterial.Eof do
    begin
      ProgressBar1.Position   := ProgressBar1.Position + 1;
      CurrencyEdit2.AsInteger := CurrencyEdit2.AsInteger + 1;
      CurrencyEdit2.Refresh;

      if (qMaterialCodCliForn.AsInteger > 0) and
         (qMaterialTipoMov.AsString = 'NTE') and
         (DM1.tFornecedores.FindKey([qMaterialCodCliForn.AsInteger])) then
        vUF := DM1.tFornecedoresEstadoForn.AsString
      else
      if (qMaterialFornecedor.AsInteger > 0) and (qMaterialES.AsString = 'E') and
         (DM1.tFornecedores.FindKey([qMaterialFornecedor.AsInteger])) then
        vUF := DM1.tFornecedoresEstadoForn.AsString;
      if Trim(vUF) = '' then
        vUF := 'RS';
      if qMaterialES.AsString = 'E' then
        Grava_mConsultaEnt;
      //else
      //  Le_mConsulta;

      qMaterial.Next;
    end;
end;

procedure TfPrevBalancoEstUF2.Le_qSaida;
var
  Texto : String;
begin
  ProgressBar2.Position   := 0;
  ProgressBar2.Max        := qSaida.RecordCount;

  mConsulta.IndexFieldNames := 'CodMaterial;CodCor;Largura;UF';
  qSaida.First;
  while not qSaida.Eof do
    begin
      ProgressBar2.Position   := ProgressBar2.Position + 1;
      CurrencyEdit2.AsInteger := CurrencyEdit2.AsInteger + 1;
      CurrencyEdit2.Refresh;

      Le_mConsulta;

      qSaida.Next;
    end;
end;

procedure TfPrevBalancoEstUF2.Imprimir;
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

  qMaterial.Close;
  qSaida.Close;

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

procedure TfPrevBalancoEstUF2.BitBtn6Click(Sender: TObject);
begin
  //qMaterial.Open;
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
  Le_qSaida;

  mConsulta.IndexFieldNames := 'UF;NomeMaterial;NomeCor;Largura';
  Imprimir;
  BitBtn1.SetFocus;
  qMaterial.Close;
  qSaida.Close;
  Close;
end;

procedure TfPrevBalancoEstUF2.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevBalancoEstUF2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qMaterial.Close;
  qSaida.Close;
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

procedure TfPrevBalancoEstUF2.FormShow(Sender: TObject);
begin
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
  DM1.tFornecedores.Open;
end;

end.
