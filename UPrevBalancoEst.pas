unit UPrevBalancoEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, Buttons, RxLookup, Grids, DBGrids, Db,
  DBTables, Mask, ToolEdit, ComCtrls, CurrEdit, ShellApi;

type
  TfPrevBalancoEst = class(TForm)
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
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    vCodCor  : Integer;
    vLargura : String;
    vMercado : String;
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
    procedure Verifica_CustoMedio;
    procedure Monta_SQL;
  public
    { Public declarations }
  end;

var
  fPrevBalancoEst: TfPrevBalancoEst;
  linha, pagina : Integer;
  TextoGrade, TextoHifen, TextoQtd : String;
  F: TextFile;
  vPrecoMedio, vSaldoFisico, vSaldoFinan : Real;
  vVlrTotal, vVlrTotalICMS, vVlrTotalIPI : Real;

implementation

uses UDM1, UEscImpressora, UPrevBalancoEstUF, UPrevBalancoEstUF2,
  UPrevBalancoEstUF3;

{$R *.DFM}

procedure TfPrevBalancoEst.Monta_SQL;
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

procedure TfPrevBalancoEst.Verifica_CustoMedio;
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
                  if Linha > 61 then
                    Imprime_Cabecalho;
                  if (vVlrEntrada > 0) and (vQtdEntrada > 0) then
                    vPrecoMedio := StrToFloat(FormatFloat('0.00',vVlrEntrada / vQtdEntrada))
                  else
                    vPrecoMedio := 0;
                  Imprime_Detalhe;
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
              //vVlrAux      := StrToFloat(FormatFloat('0.00',qEstoqueCustoQtd.AsFloat * qEstoqueCustoVlrUnitario.AsFloat));
              vVlrAux      := StrToFloat(FormatFloat('0.00',qEstoqueCustoQtd.AsFloat * vVlrAux));
              //vVlrAux      := vVlrAux - qEstoqueCustoVlrDesconto.AsFloat;
              vVlrEntrada  := vVlrEntrada + vVlrAux;
              vSaldoFisico := StrToFloat(FormatFloat('0.00000',vSaldoFisico + qEstoqueCustoQtd.AsFloat));
              //vVlrAux      := qEstoqueCustoQtd.AsFloat * (qEstoqueCustoVlrUnitario.AsFloat - qEstoqueCustoVlrDesconto.AsFloat);
              //vSaldoFinan  := vSaldoFinan + vVlrAux;
            end;
          //if (vSaldoFinan <= 0) or (vSaldoFisico <= 0) then
          //  vPrecoMedio := 0
          //else
          {if (vSaldoFinan > 0) or (vSaldoFisico > 0) then
            vPrecoMedio := vSaldoFinan / vSaldoFisico;}

          if qEstoqueCustoES.AsString = 'S' then
            begin
              vSaldoFisico := StrToFloat(FormatFloat('0.00000',vSaldoFisico - qEstoqueCustoQtd.AsFloat));
              //vSaldoFinan  := vSaldoFinan - (qEstoqueCustoQtd.AsFloat * vPrecoMedio);
              //if vSaldoFinan < 0 then
              //  begin
              //    vSaldoFinan := 0;
              //    vPrecoMedio := 0;
              //  end;
            end;
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
        begin
          if Linha > 61 then
            Imprime_Cabecalho;
          Imprime_Detalhe;
        end;
    end;
  qEstoqueCusto.Filtered := False;
end;

procedure TfPrevBalancoEst.Imprime_Cabecalho;
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

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,' Codigo Material                       Cor             Larg. UM     Saldo Fisico   Pr.Medio      Vlr.Total %ICMS    V.ICMS     V.IPI');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevBalancoEst.Imprime_Detalhe;
var
 i: Integer;
 texto1, Texto2: string;
 vVlrAux : Real;
begin
  Texto2 := qMaterialCodMaterial.AsString;
  for i := 1 to 7 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto2 + ' ';
  Texto2 := Copy(qMaterialNome.AsString,1,30);
  for i := 1 to 30 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := '';
  if vCodCor > 0 then
    begin
      DM1.tCor.IndexFieldNames := 'Codigo';
      DM1.tCor.SetKey;
      DM1.tCorCodigo.AsInteger := vCodCor;
      if DM1.tCor.GotoKey then
        Texto2 := DM1.tCorNome.AsString;
    end;
  for i := 1 to 15 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + '  ';
  texto2 := vLargura;
  for i := 1 to 1 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + '    ';
  texto2 := qMaterialUnidade.AsString;
  for i := 1 to 3 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('#,###,##0.00000',vSaldoFisico);
  for i := 1 to 15 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('###,##0.00',vPrecoMedio);
  for i := 1 to 10 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  if vSaldoFisico > 0 then
    vVlrAux := StrToFloat(FormatFloat('0.00',vSaldoFisico * vPrecoMedio))
  else
    vVlrAux := 0;
  vVlrTotal := vVlrTotal + vVlrAux;
  texto2 := FormatFloat('###,###,##0.00',vVlrAux);
  for i := 1 to 14 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  texto2 := FormatFloat('#0.00',qMaterialICMS.AsFloat);
  for i := 1 to 5 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  if (vSaldoFisico > 0) and (vPrecoMedio > 0) then
    vVlrAux := StrToFloat(FormatFloat('0.00',(vSaldoFisico * vPrecoMedio) * qMaterialICMS.AsFloat / 100))
  else
    vVlrAux := 0;
  vVlrTotalICMS := vVlrTotalICMS + vVlrAux;
  texto2 := FormatFloat('##,##0.00',vVlrAux);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';

  if (vSaldoFisico > 0) and (vPrecoMedio > 0) then
    vVlrAux := StrToFloat(FormatFloat('0.00',(vSaldoFisico * vPrecoMedio) * qMaterialIPI.AsFloat / 100))
  else
    vVlrAux := 0;
  vVlrTotalIPI := vVlrTotalIPI + vVlrAux;
  texto2 := FormatFloat('##,##0.00',vVlrAux);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F,Texto1);
  Linha := Linha + 1;
end;

procedure TfPrevBalancoEst.Imprime_Rodape;
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
  Writeln(F,Texto1);

  linha := linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevBalancoEst.Imprimir;
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
  ProgressBar1.Position   := 0;
  ProgressBar1.Max        := qMaterial.RecordCount;
  CurrencyEdit1.AsInteger := qMaterial.RecordCount;
  CurrencyEdit1.Refresh;
  CurrencyEdit2.Clear;

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
      {if (vSaldoFisico > 0.00001) or (vSaldoFisico = 0.00001) then
        begin
          if Linha > 61 then
            Imprime_Cabecalho;
          Imprime_Detalhe;
        end;}
      ProgressBar1.Position := ProgressBar1.Position + 1;
      qMaterial.Next;
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

procedure TfPrevBalancoEst.BitBtn6Click(Sender: TObject);
begin
  //qEstoqueCusto.Open;
  vMercado := '';
  case ComboBox1.ItemIndex of
    0 : vMercado := 'E';
    1 : vMercado := 'I';
  end;
  Monta_SQL;

  vVlrTotal     := 0;
  vVlrTotalICMS := 0;
  vVlrTotalIPI  := 0;
  Imprimir;
  BitBtn1.SetFocus;
  qEstoqueCusto.Close;
  Close;
end;

procedure TfPrevBalancoEst.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevBalancoEst.FormClose(Sender: TObject;
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

procedure TfPrevBalancoEst.FormShow(Sender: TObject);
begin
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
end;

procedure TfPrevBalancoEst.BitBtn2Click(Sender: TObject);
begin
  fPrevBalancoEstUF := TfPrevBalancoEstUF.Create(Self);
  fPrevBalancoEstUF.ShowModal;
end;

procedure TfPrevBalancoEst.BitBtn3Click(Sender: TObject);
begin
  fPrevBalancoEstUF2 := TfPrevBalancoEstUF2.Create(Self);
  fPrevBalancoEstUF2.ShowModal;
end;

procedure TfPrevBalancoEst.BitBtn4Click(Sender: TObject);
begin
  fPrevBalancoEstUF3 := TfPrevBalancoEstUF3.Create(Self);
  fPrevBalancoEstUF3.ShowModal;
end;

end.
