unit UGerarEFD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Buttons, RxLookup, Grids, DBGrids, Db,
  DBTables, Mask, ToolEdit, ComCtrls, CurrEdit, DBClient, SMDBGrid;

type
  TfGerarEFD = class(TForm)
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
    Bevel1: TBevel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
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
    Label6: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vCodCor  : Integer;
    vLargura : String;
    vMercado : String;
    vContadorReg : Integer;
    F: TextFile;
    vPrecoMedio, vSaldoFisico, vSaldoFinan : Real;
    vVlrTotal : Real;

    procedure Gerar_Arquivo;
    procedure Montar_Cabecalho;
    procedure Montar_Detalhe;
    procedure Montar_Rodape;

    Function  Monta_Texto(Campo : String ; Tamanho : Integer) : String;

    procedure Verifica_CustoMedio;
    procedure Monta_SQL;
  public
    { Public declarations }
  end;

var
  fGerarEFD: TfGerarEFD;

implementation

uses UDM1, DateUtils, StrUtils;

{$R *.DFM}

procedure TfGerarEFD.Monta_SQL;
begin
  qEstoqueCusto.Close;
  qEstoqueCusto.SQL.Clear;
  qEstoqueCusto.SQL.Add('SELECT CodMaterial, CodCor, Largura, VlrUnitario, Sum(Qtd) Qtd, PercIcms, PercIpi, Sum(VlrDesconto) VlrDesconto, ES, Mercado');
  qEstoqueCusto.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qEstoqueCusto.SQL.Add('WHERE (DtMov <= :DtMov)');
  qEstoqueCusto.ParamByName('DtMov').AsDate :=  DateEdit1.Date;
  if vMercado <> '' then
    begin
      qEstoqueCusto.SQL.Add('  AND (Mercado = :Mercado)');
      qEstoqueCusto.ParamByName('Mercado').AsString := vMercado;
    end;
  qEstoqueCusto.SQL.Add('GROUP BY CodMaterial, CodCor, Largura, VlrUnitario, PercIcms, PercIpi, ES, Mercado');
  qEstoqueCusto.SQL.Add('ORDER BY CodMaterial, CodCor, Largura, ES, Mercado');
  qEstoqueCusto.Open;

  //Sql do material
  qMaterial.Close;
  qMaterial.SQL.Clear;
  qMaterial.SQL.Add('SELECT Dbestoquematmov.CodMaterial, Dbmaterial.Nome, SUM( Dbestoquematmov.Qtd2 ) Qtd2, Dbmaterial.Unidade, Dbmaterial.ICMS, Dbmaterial.IPI');
  qMaterial.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qMaterial.SQL.Add('   INNER JOIN "dbMaterial.DB" Dbmaterial');
  qMaterial.SQL.Add('   ON  (Dbestoquematmov.CodMaterial = Dbmaterial.Codigo)');
  qMaterial.SQL.Add('WHERE  (Dbestoquematmov.Qtd2 > 0 ) and (Dbestoquematmov.Dtmov <= :DtMov)');
  qMaterial.ParamByName('DtMov').AsDate := DateEdit1.Date;
  qMaterial.SQL.Add('GROUP BY Dbestoquematmov.CodMaterial, Dbmaterial.Nome, Dbmaterial.Unidade, Dbmaterial.ICMS, Dbmaterial.IPI');
  qMaterial.SQL.Add('ORDER BY Dbmaterial.Nome');
  qMaterial.Open;
end;

procedure TfGerarEFD.Verifica_CustoMedio;
var
  vVlrAux : Real;
  vQtdEntrada, vVlrEntrada : Real;
begin
  qEstoqueCusto.Filtered := False;
  qEstoqueCusto.Filter   := 'CodMaterial = '''+qMaterialCodMaterial.AsString+'''';
  qEstoqueCusto.Filtered := True;
  if qEstoqueCusto.RecordCount > 0 then
  begin
    ProgressBar2.Position := 0;
    ProgressBar2.Max      := qEstoqueCusto.RecordCount;

    vSaldoFisico := 0;
    vSaldoFinan  := 0;
    vPrecoMedio  := 0;
    vQtdEntrada  := 0;
    vVlrEntrada  := 0;
    qEstoqueCusto.First;
    vCodCor  := qEstoqueCustoCodCor.AsInteger;
    vLargura := qEstoqueCustoLargura.AsString;
    while not qEstoqueCusto.Eof do
    begin
      if (qEstoqueCustoLargura.AsString <> vLargura) or (qEstoqueCustoCodCor.AsInteger <> vCodCor) then
      begin
        if (vSaldoFisico >= 0.00001) then
        begin
          if (vVlrEntrada > 0) and (vQtdEntrada > 0) then
            vPrecoMedio := StrToFloat(FormatFloat('0.00',vVlrEntrada / vQtdEntrada))
          else
            vPrecoMedio := 0;
          Montar_Detalhe;
        end;
        vSaldoFisico := 0;
        vSaldoFinan  := 0;
        vPrecoMedio  := 0;
        vQtdEntrada  := 0;
        vVlrEntrada  := 0;
        vCodCor      := qEstoqueCustoCodCor.AsInteger;
        vLargura     := qEstoqueCustoLargura.AsString;
      end;
      if qEstoqueCustoES.AsString = 'E' then
      begin
        vQtdEntrada  := vQtdEntrada + qEstoqueCustoQtd.AsFloat;
        vVlrAux      := StrToFloat(FormatFloat('0.00',qEstoqueCustoVlrUnitario.AsFloat - qEstoqueCustoVlrDesconto.AsFloat));
        vVlrAux      := StrToFloat(FormatFloat('0.00',qEstoqueCustoQtd.AsFloat * vVlrAux));
        vVlrEntrada  := vVlrEntrada + vVlrAux;
        vSaldoFisico := StrToFloat(FormatFloat('0.00000',vSaldoFisico + qEstoqueCustoQtd.AsFloat));
      end;
      if qEstoqueCustoES.AsString = 'S' then
        vSaldoFisico := StrToFloat(FormatFloat('0.00000',vSaldoFisico - qEstoqueCustoQtd.AsFloat));
      vCodCor  := qEstoqueCustoCodCor.AsInteger;
      vLargura := qEstoqueCustoLargura.AsString;
      ProgressBar2.Position := ProgressBar2.Position + 1;
      qEstoqueCusto.Next;
    end;
    if (vVlrEntrada > 0) and (vQtdEntrada > 0) then
      vPrecoMedio := StrToFloat(FormatFloat('0.00',vVlrEntrada / vQtdEntrada))
    else
      vPrecoMedio := 0;
    if (vSaldoFisico >= 0.00001) then
      Montar_Detalhe;
  end;
  qEstoqueCusto.Filtered := False;
end;

procedure TfGerarEFD.Gerar_Arquivo;
var
  Texto : String;
begin
  Texto := IntToStr(YearOf(DateEdit1.Date));
  Label8.Caption := 'EFD' + FormatFloat('00',MonthOf(DateEdit1.Date)) + Copy(Texto,3,2) + '.txt';
  Texto := DirectoryEdit1.Text;
  if Copy(DirectoryEdit1.Text,length(DirectoryEdit1.Text),1) <> '\' then                        
    Texto := DirectoryEdit1.Text + '\';
  Texto := Texto + Label8.Caption;

  AssignFile(F,Texto);
  ReWrite(F);

  ProgressBar1.Position   := 0;
  ProgressBar1.Max        := qMaterial.RecordCount;
  CurrencyEdit1.AsInteger := qMaterial.RecordCount;
  CurrencyEdit1.Refresh;
  CurrencyEdit2.Clear;

  Montar_Cabecalho;

  qMaterial.First;
  while not qMaterial.Eof do
  begin
    CurrencyEdit2.AsInteger := CurrencyEdit2.AsInteger + 1;
    CurrencyEdit2.Refresh;
    Edit1.Text := qMaterialCodMaterial.AsString;
    Edit2.Text := qMaterialNome.AsString;
    Edit1.Refresh;
    Edit2.Refresh;
    Verifica_CustoMedio;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    qMaterial.Next;
  end;
  Montar_Rodape;

  CloseFile(F);
end;

procedure TfGerarEFD.BitBtn6Click(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Codigo';
  vContadorReg := 0;
  vMercado := '';
  case ComboBox1.ItemIndex of
    0 : vMercado := 'E';
    1 : vMercado := 'I';
  end;
  Monta_SQL;

  vVlrTotal     := 0;

  Gerar_Arquivo;
  
  BitBtn1.SetFocus;
  qEstoqueCusto.Close;
end;

procedure TfGerarEFD.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfGerarEFD.FormClose(Sender: TObject;
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

procedure TfGerarEFD.FormShow(Sender: TObject);
begin
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
end;

procedure TfGerarEFD.Montar_Cabecalho;
var
  texto1, texto2 : String;
  i : Integer;
begin
  //Conteúdo fixar '0' - Tam 1
  texto1 := '0';

  //CNPJ da empresa - Tam 14
  Texto1 := texto1 + Monta_Texto(DM1.tFilialCNPJ.AsString,14);

  //Razão social da empresa - Tam 60
  Texto2 := DM1.tFilialEmpresa.AsString;
  for i := 1 to 60 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Data final do período - Tam 8 (AAAAMMDD)
  texto1 := texto1 + FormatFloat('0000',YearOf(DateEdit1.Date)) + FormatFloat('00',MonthOf(DateEdit1.Date)) + FormatFloat('00',DayOf(DateEdit1.Date));

  writeln(F,texto1);

  vContadorReg := 1;
end;

procedure TfGerarEFD.Montar_Detalhe;
var
 i: Integer;
 texto1, Texto2: string;
 vVlrAux : Real;
begin
  //Conteúdo fixar '1' - Tam 1
  texto1 := '1';

  //Tipo código do produto (E)an, (N)cm ou (P)roprio - Tam 1
  texto1 := texto1 + 'P';

  //Indicação de propriedade - Tam 1
   //0=Propriedade do informante ou em seu poder  1=Propriedade do informante em poder de terceiros  2=Propriedade de terceiros em poder do informante
  texto1 := texto1 + '0';

  //Código do produto - Tam 15
  Texto2 := qMaterialCodMaterial.AsString + '.' + IntToStr(vCodCor);
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + Texto2;

  //Nome do produto - Tam 60
  texto2 := '';
  if (vCodCor > 0) and (DM1.tCor.FindKey([vCodCor])) then
    Texto2 := DM1.tCorNome.AsString;
  if texto2 <> '' then
    Texto2 := qMaterialNome.AsString + ' ' + Texto2
  else
    Texto2 := qMaterialNome.AsString;
  Texto2 := copy(Texto2,1,60);
  for i := 1 to 60 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + Texto2;

  //Unidade do produto - Tam 3
  Texto2 :=  qMaterialUnidade.AsString;
  for i := 1 to 3 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + Texto2;

  //Quantidade em estoque - Tam 12  multiplicar por 1000
  vVlrAux := vSaldoFisico * 1000;
  texto2  := FormatFloat('000000000000',vVlrAux);
  texto1  := texto1 + Texto2;


  //Valor total do produto em estoque - Tam 12  multiplicar por 100
  if vSaldoFisico > 0 then
    vVlrAux := StrToFloat(FormatFloat('0.00',vSaldoFisico * vPrecoMedio))
  else
    vVlrAux := 0;
  vVlrTotal := vVlrTotal + vVlrAux;
  vVlrAux := vVlrAux * 100;
  Texto2  := FormatFloat('000000000000',vVlrAux);
  texto1  := texto1 + Texto2;

  //CNPJ de terceiros - Tam 14
  texto2 := '';
  for i := 1 to 14 do
    texto2 := texto2 + '0';
  texto1  := texto1 + texto2;

  texto1 := texto1 + texto2;

  Writeln(F,Texto1);

  vContadorReg := vContadorReg + 1;
end;

procedure TfGerarEFD.Montar_Rodape;
var
  texto1, texto2 : String;
  i : Integer;
  vVlrAux : Real;
begin
  vContadorReg := vContadorReg + 1;
  //Conteúdo fixar '9' - Tam 1
  texto1 := '9';

  //Quantidade de registros - Tam 6
  texto1 := texto1 + FormatFloat('000000',vContadorReg);

  //Valor total do produto em estoque - Tam 12  multiplicar por 100
  vVlrAux := vVlrTotal * 100;
  texto2  := FormatFloat('000000000000',vVlrAux);
  texto1  := texto1 + Texto2;

  Writeln(F,texto1);
end;

function TfGerarEFD.Monta_Texto(Campo: String; Tamanho: Integer): String;
var
  texto2 : String;
  i : Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

end.
