unit UContasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl,
  RXLookup, Db, DBTables, RXSplit, DBFilter, RXCtrls, Menus, Printers,
  Mask, ToolEdit, CurrEdit, ALed, Variants, ShellApi;

type
  TfContasPagar = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    RxDBGrid2: TRxDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    RxDBGrid3: TRxDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    RxLabel1: TRxLabel;
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CheckBox1: TCheckBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    ALed1: TALed;
    ALed2: TALed;
    ALed3: TALed;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel4: TBevel;
    Memo1: TMemo;
    Label13: TLabel;
    Edit4: TEdit;
    Query1: TQuery;
    dsQuery: TDataSource;
    Query1Duplicata: TIntegerField;
    Query1Nota: TIntegerField;
    Query1Parcela: TIntegerField;
    Query1Data: TDateField;
    Query1Fornecedor: TStringField;
    Query1CodConta: TIntegerField;
    Query1DtPgto: TDateField;
    Query1lkNomeBanco: TStringField;
    Query1NumNotaEnt: TIntegerField;
    Query1NumCPagar: TIntegerField;
    Label14: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Query1ValorParc: TFloatField;
    Query1JurosPagos: TFloatField;
    Query1ValorRestante: TFloatField;
    Query1ValorPago: TFloatField;
    Query1DiasAtraso: TFloatField;
    qAuxImp: TQuery;
    Bevel5: TBevel;
    Label19: TLabel;
    CheckBox2: TCheckBox;
    Query1Fantasia: TStringField;
    Query1Abatimentos: TFloatField;
    Query1lkDtGerado: TDateField;
    Query1DtRecto: TDateField;
    RadioGroup2: TRadioGroup;
    GroupBox1: TGroupBox;
    ALed4: TALed;
    Label20: TLabel;
    BitBtn6: TBitBtn;
    Label21: TLabel;
    Label22: TLabel;
    Query1VlrDevolucao: TFloatField;
    Query1NumNossaNota: TIntegerField;
    Query1NomeBancoForn: TStringField;
    Query1AgenciaForn: TStringField;
    Query1NumContaForn: TStringField;
    Label23: TLabel;
    tCPagarParc2: TTable;
    tCPagarParc2NumCPagar: TIntegerField;
    tCPagarParc2ParcCPagar: TIntegerField;
    tCPagarParc2DtVencCPagar: TDateField;
    tCPagarParc2VlrParcCPagar: TFloatField;
    tCPagarParc2QuitParcCPagar: TBooleanField;
    tCPagarParc2DtPagParcCPagar: TDateField;
    tCPagarParc2JurosParcCPagar: TFloatField;
    tCPagarParc2CodForn: TIntegerField;
    tCPagarParc2NumNotaEnt: TIntegerField;
    tCPagarParc2Desconto: TFloatField;
    tCPagarParc2PgtoParcial: TFloatField;
    tCPagarParc2RestParcela: TFloatField;
    tCPagarParc2Banco: TStringField;
    tCPagarParc2PlanoContas: TIntegerField;
    tCPagarParc2NroDuplicata: TIntegerField;
    tCPagarParc2Despesas: TFloatField;
    tCPagarParc2Abatimentos: TFloatField;
    tCPagarParc2CodConta: TIntegerField;
    tCPagarParc2DiasAtraso: TFloatField;
    tCPagarParc2JurosPagos: TFloatField;
    tCPagarParc2CodTipoCobranca: TIntegerField;
    tCPagarParc2DtRecto: TDateField;
    tCPagarParc2CodAtelier: TIntegerField;
    tCPagarParc2VlrDevolucao: TFloatField;
    tCPagarParc2NumNossaNota: TIntegerField;
    tCPagarParc2NomeBancoForn: TStringField;
    tCPagarParc2AgenciaForn: TStringField;
    tCPagarParc2NumContaForn: TStringField;
    qTotal: TQuery;
    qTotalJurosPagos: TFloatField;
    qTotalPgtoParcial: TFloatField;
    qTotalRestParcela: TFloatField;
    qTotalVlrDevolucao: TFloatField;
    qTotalVlrParcCPagar: TFloatField;
    Query1CodForn: TIntegerField;
    Query1NomeTipoCobranca: TStringField;
    Query1lkTipoConta: TStringField;
    Label24: TLabel;
    Edit5: TEdit;
    Query1NumSeqNEntrada: TIntegerField;
    Query1Serie: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tCPagarParcCalcFields(DataSet: TDataSet);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure CheckBox1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure RxDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure DateEdit2Change(Sender: TObject);
  private
    { Private declarations }
    procedure Filtra_Calcula2;
    procedure Monta_RxDbGrid;
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Total_Dia;
    procedure Imprime_Total_Mes;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fContasPagar: TfContasPagar;
  vQtdTitulosDia, vQtdTitulosMes, vQtdTitulos : Integer;
  vVlrTotalDia, vVlrTotal, vVlrTotalMes : Real;
  vDtVecto : TDateTime;
  F: TextFile;
  linha, pagina : Integer; 

implementation

uses UDM1, UContasPagarPag, URelCPagar, UCPagarAltera, UConsCPagarHist,
  UEstPagamentoPagar, UEscImpressora, UContasPagarDev, UAgendaTelef,
  URelCPagar2;

{$R *.DFM}

procedure TfContasPagar.Filtra_Calcula2;
var
  vValorGeral, vValorPago, vValorRestante, vJurosPagos, vValorDevolucao : Currency;
  vSeparador : String;
begin
  //Query1.DisableControls;
  vValorGeral     := 0;
  vValorPago      := 0;
  vValorRestante  := 0;
  vValorDevolucao := 0;
  vJurosPagos     := 0;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT A.NroDuplicata AS Duplicata, A.NumNotaEnt AS Nota, A.ParcCPagar AS Parcela, A.DtVencCPagar AS Data, ');
  Query1.SQL.Add('A.VlrParcCPagar AS ValorParc, B.NomeForn AS Fornecedor,B.Fantasia AS Fantasia, A.JurosParcCPagar AS JurosPagos, A.RestParcela AS ValorRestante, ');
  Query1.SQL.Add('A.CodConta AS CodConta, A.DtPagParcCPagar AS DtPgto, A.NumNotaEnt, A.NumCPagar,A.PgtoParcial As ValorPago,A.DiasAtraso As DiasAtraso,A.Abatimentos As Abatimentos, ');
  Query1.SQL.Add('A.DtRecto As DtRecto, A.VlrDevolucao As VlrDevolucao, A.NumNossaNota, A.NomeBancoForn, A.AgenciaForn, A.NumContaForn, A.CodForn, C.Nome NomeTipoCobranca, ');
  Query1.SQL.Add('A.NumSeqNEntrada, A.Serie ');
  Query1.SQL.Add('FROM dbCPagarParc A');
  Query1.SQL.Add('LEFT JOIN  "dbFornecedores" B ');
  Query1.SQL.Add('ON B.CodForn = A.CodForn');
  Query1.SQL.Add('LEFT JOIN "dbTipoCobranca" C ');
  Query1.SQL.Add('ON C.Codigo = A.CodTipoCobranca ');
  vSeparador := 'WHERE';
  if RadioGroup1.ItemIndex = 0 then
    begin
      Query1.SQL.Add(vSeparador + ' (A.RestParcela > 0)');
      vSeparador := 'AND';
    end;
  if RadioGroup1.ItemIndex = 1 then
    begin
      Query1.SQL.Add(vSeparador + ' (A.PgtoParcial > 0)');
      vSeparador := 'AND';
    end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      Query1.SQL.Add(vSeparador + ' (A.CodForn = :CodForn)');
      vSeparador := 'AND';
      Query1.ParamByName('CodForn').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      case RadioGroup1.ItemIndex of
        0,2 : Query1.SQL.Add(vSeparador +  ' (A.DtVencCPagar BETWEEN :DataI AND :DataF)');
        1   : Query1.SQL.Add(vSeparador + '(A.DtPagParcCPagar BETWEEN :DataI AND :DataF)');
      end;
      Query1.ParamByName('DataI').AsDate := DateEdit1.Date;
      Query1.ParamByName('DataF').AsDate := DateEdit2.Date;
    end;
  Query1.SQL.Add('ORDER BY A.DtVencCPagar, B.NomeForn');
  Query1.Open;

  //Total
  qTotal.Close;
  qTotal.SQL.Clear;
  qTotal.SQL.Add('SELECT SUM( JurosParcCPagar ) JurosPagos, SUM( PgtoParcial ) PgtoParcial, SUM( RestParcela ) RestParcela, SUM( VlrDevolucao ) VlrDevolucao, SUM( VlrParcCPagar ) VlrParcCPagar');
  qTotal.SQL.Add('FROM "dbCPagarParc.DB" A');
  vSeparador := 'WHERE';
  if RadioGroup1.ItemIndex = 0 then
    begin
      qTotal.SQL.Add(vSeparador + ' (A.RestParcela > 0)');
      vSeparador := 'AND';
    end;
  if RadioGroup1.ItemIndex = 1 then
    begin
      qTotal.SQL.Add(vSeparador + ' (A.PgtoParcial > 0)');
      vSeparador := 'AND';
    end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qTotal.SQL.Add(vSeparador + ' (A.CodForn = :CodForn)');
      vSeparador := 'AND';
      qTotal.ParamByName('CodForn').AsInteger := RxDBLookupCombo1.KeyValue;
    end;

  if RxDBLookupCombo1.Text <> '' then
    begin
      qTotal.SQL.Add(vSeparador + ' (A.CodForn = :CodForn)');
      vSeparador := 'AND';
      qTotal.ParamByName('CodForn').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      case RadioGroup1.ItemIndex of
        0,2 : qTotal.SQL.Add(vSeparador +  ' (A.DtVencCPagar BETWEEN :DataI AND :DataF)');
        1   : qTotal.SQL.Add(vSeparador + '(A.DtPagParcCPagar BETWEEN :DataI AND :DataF)');
      end;
      qTotal.ParamByName('DataI').AsDate := DateEdit1.Date;
      qTotal.ParamByName('DataF').AsDate := DateEdit2.Date;
    end;
  qTotal.Open;
  qTotal.First;
  while not qTotal.EOF do
    begin
      vValorGeral     := vValorGeral     + qTotalVlrParcCPagar.AsFloat;
      vValorPago      := vValorPago      + qTotalPgtoParcial.AsFloat;
      vValorDevolucao := vValorDevolucao + qTotalVlrDevolucao.AsFloat;
      vValorRestante  := vValorRestante  + qTotalRestParcela.AsFloat;
      vJurosPagos     := vJurosPagos     + qTotalJurosPagos.AsFloat;
      qTotal.Next;
    end;
  //****

  {Query1.First;
  while not Query1.EOF do
    begin
      vValorGeral     := vValorGeral     + Query1ValorParc.AsFloat;
      vValorPago      := vValorPago      + Query1ValorPago.AsFloat;
      vValorDevolucao := vValorDevolucao + Query1VlrDevolucao.AsFloat;
      vValorRestante  := vValorRestante  + Query1ValorRestante.AsFloat;
      vJurosPagos     := vJurosPagos     + Query1JurosPagos.AsFloat;
      Query1.Next;
    end;}
  Label4.Caption  := FormatFloat('#,###,##0.00',vValorPago + vJurosPagos);
  Label16.Caption := FormatFloat('#,###,##0.00',vValorGeral);
  Label18.Caption := FormatFloat('#,###,##0.00',vValorRestante);
  Label22.Caption := FormatFloat('#,###,##0.00',vValorDevolucao);
  //Query1.EnableControls;
  RxSpeedButton1.Enabled := True;
end;

procedure TfContasPagar.Monta_RxDbGrid;
begin
  RxDBGrid2.Columns[0].Width  := 42;
  RxDBGrid2.Columns[1].Width  := 28;
  RxDBGrid2.Columns[2].Width  := 41;
  RxDBGrid2.Columns[3].Width  := 49;
  RxDBGrid2.Columns[4].Width  := 24;
  RxDBGrid2.Columns[5].Width  := 68;
  RxDBGrid2.Columns[6].Width  := 59;
  RxDBGrid2.Columns[7].Width  := 59;
  RxDBGrid2.Columns[8].Width  := 49;
  RxDBGrid2.Columns[9].Width  := 70;
  RxDBGrid2.Columns[10].Width := 64;
  RxDBGrid2.Columns[11].Width := 55;
  RxDBGrid2.Columns[12].Width := 30;
end;

procedure TfContasPagar.Imprime_Cabecalho;
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
  texto1 := texto1 + 'Pagina.: ';
  texto1 := texto1 + IntToStr(pagina);
  Writeln(F,Texto1);

  texto1 := '';
  if DateEdit1.Text <> '  /  /    ' then
    texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
  for i := 1 to 60  - Length(Texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'CONTAS A PAGAR POR PERIODO                           Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Dt.Vencimento  Fornecedor                                  Documento      Saldo Atual   Data Local   Local Pagamento');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfContasPagar.Imprime_Detalhe;
var
 i : Integer;
 texto1, texto2 : string;
begin
  texto1 := '  ' + Query1Data.AsString + '   ' + Query1Fornecedor.AsString;
  for i := 1 to 57 - Length(Texto1) do
    texto1 := texto1 + ' ';
  texto2 := Query1Duplicata.AsString + '/' + Query1Parcela.AsString;
  for i := 1 to 11 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '   ';
  texto2 := FormatFloat('###,###,##0.00',Query1ValorRestante.AsFloat);
  for i := 1 to 14 - Length(Texto2) do
    texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + '   ';
  texto2 := Query1DtRecto.AsString;
  for i := 1 to 13 - Length(Texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + Query1lkNomeBanco.AsString;
  Writeln(F,texto1);
  linha := linha + 1;
  vQtdTitulosDia := vQtdTitulosDia + 1;
  vQtdTitulosMes := vQtdTitulosMes + 1;
  vVlrTotalDia   := vVlrTotalDia + Query1ValorRestante.AsFloat;
  vVlrTotalMes   := vVlrTotalMes + Query1ValorRestante.AsFloat;
  vQtdTitulos    := vQtdTitulos + 1;
  vVlrTotal      := vVlrTotal + Query1ValorRestante.AsFloat;
end;

procedure TfContasPagar.Imprime_Total_Dia;
var
 i : Integer;
 texto1, texto2 : String;
begin
  Writeln(F,'               ----------------------------------------------------------------------');
  texto1 := '               ......................TOTAL DO DIA.: ';
  texto2 := IntToStr(vQtdTitulosDia);
  for i := 1 to 5 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ' + 'TITULO(S) ';
  texto2 := FormatFloat('##,###,###,##0.00',vVlrTotalDia);
  for i := 1 to 17 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,texto1);

  Linha := Linha + 2;
  vQtdTitulosDia := 0;
  vVlrTotalDia   := 0;
end;

procedure TfContasPagar.Imprime_Total_Mes;
var
 i : Integer;
 texto1, texto2 : String;
begin
  texto1 := '               ......................TOTAL DO MES.: ';
  texto2 := IntToStr(vQtdTitulosMes);
  for i := 1 to 5 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ' + 'TITULO(S) ';
  texto2 := FormatFloat('##,###,###,##0.00',vVlrTotalMes);
  for i := 1 to 17 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,texto1);

  Linha := Linha + 1;
  vQtdTitulosMes := 0;
  vVlrTotalMes   := 0;
end;

procedure TfContasPagar.Imprime_Rodape;
var
 i : Integer;
 texto1, texto2 : String;
begin
  Writeln(F,'               ----------------------------------------------------------------------');
  texto1 := '               ......................TOTAL GERAL..: ';
  texto2 := IntToStr(vQtdTitulos);
  for i := 1 to 5 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ' + 'TITULO(S) ';
  texto2 := FormatFloat('##,###,###,##0.00',vVlrTotal);
  for i := 1 to 17 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,texto1);
  Linha := Linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfContasPagar.Imprimir;
var
  Texto : String;
  dia, mes, ano : word;
  dia2, mes2, ano2 : word;
begin
  vQtdTitulosDia := 0;
  vVlrTotalDia   := 0;
  vQtdTitulosMes := 0;
  vVlrTotalMes   := 0;
  vQtdTitulos    := 0;
  vVlrTotal      := 0;
  vDtVecto       := 0;
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  //Filtra_Calcula2;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Query1.First;
  while not Query1.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      if CheckBox2.Checked = True then
        begin
          if (vDtVecto > 1) and (vDtVecto <> Query1Data.AsDateTime) then
            begin
              Imprime_Total_Dia;
              DecodeDate(vDtVecto, Ano, Mes, Dia);
              DecodeDate(Query1Data.AsDateTime, Ano2, Mes2, Dia2);
              if (mes <> mes2) or ((mes = mes2) and (ano <> ano2)) then
                Imprime_Total_Mes;
              Writeln(F);
              linha := linha + 1;
            end;
        end;
      Imprime_Detalhe;
      vDtVecto := Query1Data.AsDateTime;
      Query1.Next;
    end;
  if CheckBox2.Checked = True then
    begin
      Imprime_Total_Dia;
      Imprime_Total_Mes;
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

procedure TfContasPagar.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tCPagar.MasterSource    := nil;
  DM1.tCPagar.MasterFields    := '';
  DM1.tCPagar.IndexName       := '';
  if Screen.FormCount < 3 then
    begin
      Dm1.tCPagar.Close;
      Dm1.tCPagarParc.Close;
      Dm1.tCPagarParcHist.Close;
      Dm1.tFornecedores.Close;
      DM1.tContas.Close;
      DM1.tJuros.Close;
      DM1.tMovimentos.Close;
      DM1.tNEntrada.Close;
      DM1.tHistorico.Close;
      DM1.tPlanoContas.Close;
      DM1.tCidade.Close;
      DM1.tUF.Close;
      DM1.tTipoCobranca.Close;
    end;
  Query1.Close;
  qTotal.Close;
  qAuxImp.Close;
  Action := Cafree;
end;

procedure TfContasPagar.RxDBLookupCombo1Enter(Sender: TObject);
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfContasPagar.FormShow(Sender: TObject);
begin
  Dm1.tCPagar.Open;
  Dm1.tCPagarParc.Open;
  Dm1.tCPagarParcHist.Open;
  Dm1.tFornecedores.Open;
  DM1.tContas.Open;
  DM1.tJuros.Open;
  DM1.tMovimentos.Open;
  DM1.tNEntrada.Open;
  DM1.tHistorico.Open;
  DM1.tPlanoContas.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;
  DM1.tContas.Open;
  DM1.tTipoCobranca.Open;

  //RadioGroup1Click(Sender);
  RxDBGrid2.DataSource := nil;
  CheckBox1.Checked := False;
  Monta_RxDbGrid;
end;

procedure TfContasPagar.SpeedButton1Click(Sender: TObject);
begin
  Filtra_Calcula2;
end;

procedure TfContasPagar.tCPagarParcCalcFields(DataSet: TDataSet);
begin
  //tCPagarParcPgtoParcial2.AsFloat := tCPagarParcVlrParcCPagar.AsFloat - tCPagarParcRestParcela.AsFloat;
end;

procedure TfContasPagar.RadioGroup1Click(Sender: TObject);
begin
  RxSpeedButton1.Enabled := False;
  {case RadioGroup1.ItemIndex of
    0 : begin
          RxDBFilter3.Active := False;
          RxDBFilter3.Filter.Clear;
          RxDBFilter3.Filter.Add('QuitParcCPagar <> True');
          RxDBFilter3.Active := True;
        end;
    1 : begin
          RxDBFilter3.Active := False;
          RxDBFilter3.Filter.Clear;
          RxDBFilter3.Filter.Add('QuitParcCPagar = True');
          RxDBFilter3.Active := True;
        end;
    2 : RxDBFilter3.Active := False;
  end;}
  //Filtra_Calcula2;
end;

procedure TfContasPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if key = vk_F5 then
    BitBtn1Click(Sender);
  if key = vk_F6 then
    BitBtn2Click(Sender);
  if key = vk_F7 then
    BitBtn3Click(Sender);
  if key = vk_F8 then
    BitBtn5Click(Sender);
end;

procedure TfContasPagar.Imprimir1Click(Sender: TObject);
begin
  //Filtra_Calcula2;
  case RadioGroup2.ItemIndex of
    0 : Imprimir;
    1 : begin
          {fRelCPagar := TfRelCPagar.Create(Self);
          fRelCPagar.QuickRep1.Print;
          fRelCPagar.QuickRep1.Free;}

          fRelCPagar2 := TfRelCPagar2.Create(Self);
          fRelCPagar2.vTotalRestanteDia   := 0;
          fRelCPagar2.vTotalRestanteMes   := 0;
          fRelCPagar2.vTotalRestanteGeral := 0;
          vQtdTitulosDia                  := 0;
          vQtdTitulosMes                  := 0;
          vQtdTitulos                     := 0;
          fRelCPagar2.RLReport1.Print;
          fRelCPagar2.RLReport1.Free;
        end;
  end;
end;

procedure TfContasPagar.Visualizar1Click(Sender: TObject);
begin
 //Filtra_Calcula2;
  {fRelCPagar := TfRelCPagar.Create(Self);
  fRelCPagar.QuickRep1.Preview;
  fRelCPagar.QuickRep1.Free;}
  fRelCPagar2 := TfRelCPagar2.Create(Self);
  fRelCPagar2.vTotalRestanteDia   := 0;
  fRelCPagar2.vTotalRestanteMes   := 0;
  fRelCPagar2.vTotalRestanteGeral := 0;
  vQtdTitulosDia                  := 0;
  vQtdTitulosMes                  := 0;
  vQtdTitulos                     := 0;
  fRelCPagar2.RLReport1.Preview;
  fRelCPagar2.RLReport1.Free;
end;

procedure TfContasPagar.CheckBox1Exit(Sender: TObject);
begin
  if CheckBox1.Checked then
    begin
      DateEdit1.Enabled := True;
      DateEdit2.Enabled := True;
      DateEdit1.Date    := Date;
      DateEdit2.Date    := Date;
    end
  else
  if not CheckBox1.Checked then
    begin
      DateEdit1.Enabled := False;
      DateEdit2.Enabled := False;
      DateEdit1.Clear;
      DateEdit2.Clear;
    end;
end;

procedure TfContasPagar.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarPag.AsBoolean then
    begin
      if DM1.tCPagarParcRestParcela.AsFloat > 0 then
        begin
          //Application.CreateForm(TfContasPagarPag, fContasPagarPag);
          fContasPagarPag := TfContasPagarPag.Create(self);
          fContasPagarPag.ShowModal;
          CurrencyEdit1.SetFocus;
          //ver
          //Filtra_Calcula2;
        end
      else
        begin
          ShowMessage('Parcela já quitada!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;
procedure TfContasPagar.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tCPagarParcQuitParcCPagar.AsBoolean then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if DM1.tCPagarParcclDiasAtraso.AsInteger > 0 then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end;
end;

procedure TfContasPagar.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarAltera.AsBoolean then
    begin
      if DM1.tCPagarParcRestParcela.AsFloat > 0 then
        begin
          fCPagarAltera := TfCPagarAltera.Create(self);
          fCPagarAltera.ShowModal;
          CurrencyEdit1.SetFocus;
          SpeedButton1Click(Sender);
        end
      else
        begin
          ShowMessage('Parcela já quitada!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar.BitBtn1Click(Sender: TObject);
begin
  if not DM1.tCPagarParcHist.IsEmpty then
    begin
      fConsCPagarHist := TfConsCPagarHist.Create(Self);
      fConsCPagarHist.ShowModal;
      CurrencyEdit1.SetFocus;
    end
  else
   begin
     ShowMessage('Não há histórico para exibir!');
     CurrencyEdit1.SetFocus;
   end;
end;

procedure TfContasPagar.BitBtn5Click(Sender: TObject);
begin
  if DM1.tUsuarioEstPgtoPagar.AsBoolean then
    begin
      fEstPagamentoPagar := TfEstPagamentoPagar.Create(Self);
      if MessageDlg('Deseja fazer estorno de Pgto?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          fEstPagamentoPagar.RxDBFilter1.Active := True;
          fEstPagamentoPagar.BitBtn2.Enabled    := False;
          fEstPagamentoPagar.BitBtn3.Enabled    := True;
          if DM1.tCPagarParcHist.RecordCount > 0 then
            begin
              fEstPagamentoPagar.ShowModal;
              CurrencyEdit1.SetFocus;
            end
          else
            ShowMessage('Não há pagamentos a estornar!');
        end
      else
        begin
          fEstPagamentoPagar.RxDBFilter2.Active := True;
          fEstPagamentoPagar.BitBtn3.Enabled    := False;
          fEstPagamentoPagar.BitBtn2.Enabled    := True;
          if DM1.tCPagarParcHist.RecordCount > 0 then
            begin
              fEstPagamentoPagar.ShowModal;
              CurrencyEdit1.SetFocus;
            end
          else
            ShowMessage('Não há devoluções a estornar!');
        end;
      fEstPagamentoPagar.RxDBFilter1.Active := False;
      fEstPagamentoPagar.RxDBFilter2.Active := False;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar.RxDBLookupCombo1Change(Sender: TObject);
begin
  {RxDBGrid2.DataSource := nil;
  if RxDBLookupCombo1.Text <> '' then
    begin
      if DM1.tCPagar.MasterFields <> 'CodForn' then
        begin
          DM1.tCPagar.IndexName       := 'iCodForn';
          DM1.tCPagar.MasterSource    := DM1.dsFornecedores;
          DM1.tCPagar.MasterFields    := 'CodForn';
        end;
      if DM1.tFornecedores.Locate('CodForn',RxDBLookupCombo1.Value,[loCaseInsensitive]) then
        begin
          Edit1.Text := DM1.tFornecedoresEndForn.AsString;
          Edit2.Text := DM1.tFornecedoresCidadeForn.AsString;
          Edit3.Text := DM1.tFornecedoresEstadoForn.AsString;
          Edit4.Text := DM1.tFornecedoresBairroForn.AsString;
          RxDBGrid3.DataSource := dsQuery;
        end
      else
        begin
          Edit1.Clear;
          Edit2.Clear;
          Edit3.Clear;
          Edit4.Clear;
          Memo1.Clear;
          RxDBGrid3.DataSource := nil;
        end;
      DM1.tCPagar.Refresh;
      DM1.tCPagarParc.Refresh;
      if DM1.tCPagar.RecordCount < 1 then
        begin
          RxDBGrid3.DataSource := nil;
          Filtra_Calcula2;
        end;
      if (DM1.tCPagar.RecordCount > 0) and (CurrencyEdit1.AsInteger < 1) and (CurrencyEdit2.AsInteger < 1) then
        Filtra_Calcula2;
    end;}
  RxSpeedButton1.Enabled := False;
end;

procedure TfContasPagar.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    begin
      RxDBGrid2.DataSource := nil;
      if RxDBLookupCombo1.Text <> '' then
        begin
          if DM1.tCPagar.MasterFields <> 'CodForn' then
            begin
              DM1.tCPagar.IndexName       := 'iCodForn';
              DM1.tCPagar.MasterSource    := DM1.dsFornecedores;
              DM1.tCPagar.MasterFields    := 'CodForn';
            end;
          if DM1.tFornecedores.Locate('CodForn',RxDBLookupCombo1.Value,[loCaseInsensitive]) then
            begin
              Edit1.Text := DM1.tFornecedoresEndForn.AsString;
              Edit2.Text := DM1.tFornecedoresCidadeForn.AsString;
              Edit3.Text := DM1.tFornecedoresEstadoForn.AsString;
              Edit4.Text := DM1.tFornecedoresBairroForn.AsString;
              RxDBGrid3.DataSource := dsQuery;
            end
          else
            begin
              Edit1.Clear;
              Edit2.Clear;
              Edit3.Clear;
              Edit4.Clear;
              Memo1.Clear;
              RxDBGrid3.DataSource := nil;
            end;
          DM1.tCPagar.Refresh;
          DM1.tCPagarParc.Refresh;
          if DM1.tCPagar.RecordCount < 1 then
            begin
              RxDBGrid3.DataSource := nil;
              Filtra_Calcula2;
            end;
          if (DM1.tCPagar.RecordCount > 0) and (CurrencyEdit1.AsInteger < 1) and (CurrencyEdit2.AsInteger < 1) then
            Filtra_Calcula2;
        end;
    end;

  if key = vk_F2 then
    begin
      if RxDBLookupCombo1.LookupDisplay = 'NomeForn' then
        begin
           RxDBLookupCombo1.CloseUp(True);
           RxDBLookupCombo1.LookupDisplay    := 'Fantasia';
           DM1.tFornecedores.IndexFieldNames := 'Fantasia';
           DM1.tFornecedores.Refresh;
           Label1.Caption := 'Consulta por Fantasia';
        end
      else
      if RxDBLookupCombo1.LookupDisplay = 'Fantasia' then
        begin
          RxDBLookupCombo1.CloseUp(True);
          RxDBLookupCombo1.LookupDisplay    := 'NomeForn';
          DM1.tFornecedores.IndexFieldNames := 'NomeForn';
          DM1.tFornecedores.Refresh;
          Label1.Caption := 'Consulta por Nome';
         end;
       if DM1.tFornecedoresCodForn.AsInteger > 0 then
         RxDBLookupCombo1.KeyValue := DM1.tFornecedoresCodForn.AsInteger;
       RxDBLookupCombo1.Refresh;
    end;
end;

procedure TfContasPagar.CurrencyEdit2Enter(Sender: TObject);
begin
  CurrencyEdit1.Clear;
end;

procedure TfContasPagar.CurrencyEdit1Enter(Sender: TObject);
begin
  CurrencyEdit2.Clear;
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('É obrigatório informar o Fornecedor!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfContasPagar.PopupMenu2Popup(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : PopupMenu2.Items.Items[1].Enabled := False;
    1 : PopupMenu2.Items.Items[1].Enabled := True;
  end;
end;

procedure TfContasPagar.RxDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.00',Query1ValorRestante.AsFloat)) = 0 then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if Query1DtRecto.AsDateTime > 1 then
    begin
      AFont.Color := clBlack;
      Background  := clYellow;
    end
  else
    begin
      AFont.Color := clBlack;
      Background  := clWhite;
    end;
end;

procedure TfContasPagar.BitBtn6Click(Sender: TObject);
begin
  if DM1.tCPagarParcRestParcela.AsFloat > 0 then
    begin
      fContasPagarDev := tfContasPagarDev.Create(Self);
      fContasPagarDev.ShowModal;
      CurrencyEdit1.SetFocus;
      //Filtra_Calcula2;
    end
  else
    ShowMessage('Parcela já quitada!');
end;

procedure TfContasPagar.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    begin
      Memo1.Clear;
      if CurrencyEdit1.Value > 0 then
        begin
          DM1.tCPagar.Refresh;
          DM1.tCPagarParc.Refresh;
          if DM1.tCPagar.MasterFields = 'CodForn' then
            begin
              DM1.tCPagar.MasterSource    := nil;
              DM1.tCPagar.MasterFields    := '';
            end;
          if DM1.tCPagar.Locate('NroDuplicata;CodForn;Serie',VarArrayOf([CurrencyEdit1.Value,RxDBLookupCombo1.KeyValue,Edit5.Text]),[loCaseInsensitive]) then
            begin
              RxDBGrid2.DataSource := DM1.dsCPagarParc;
              Monta_RxDbGrid;
              RxDBGrid3.DataSource := dsQuery;
              if DM1.tFornecedores.Locate('CodForn',DM1.tCPagarCodForn.AsString,[loCaseInsensitive]) then
                begin
                  Edit1.Text := DM1.tFornecedoresEndForn.AsString;
                  Edit2.Text := DM1.tFornecedoresCidadeForn.AsString;
                  Edit3.Text := DM1.tFornecedoresEstadoForn.AsString;
                  Edit4.Text := DM1.tFornecedoresBairroForn.AsString;
                  if DM1.tCPagarNumNotaEnt.AsInteger > 0 then
                    begin
                      //DM1.tNEntrada.IndexFieldNames := 'NumNEntr;CodForn';
                      DM1.tNEntrada.IndexFieldNames := 'NumSeq';
                      DM1.tNEntrada.SetKey;
                      //DM1.tNEntradaNumNEntr.AsInteger := DM1.tCPagarParcNumNotaEnt.AsInteger;
                      //DM1.tNEntradaCodForn.AsInteger  := DM1.tCPagarCodForn.AsInteger;
                      DM1.tNEntradaNumSeq.AsInteger  := DM1.tCPagarNumSeqNEntrada.AsInteger;
                      if DM1.tNEntrada.GotoKey then
                        Memo1.Text := DM1.tNEntradaObsPagamento.AsString
                      else
                        Memo1.Text := '';
                    end
                  else
                    Memo1.Text := DM1.tCPagarHistorico.AsString;
                end
              else
                begin
                  Edit1.Clear;
                  Edit2.Clear;
                  Edit3.Clear;
                  Edit4.Clear;
                  Memo1.Clear;
                end;
              if RxDBGrid2.DataSource = nil then
                RxDBGrid2.DataSource := DM1.dsCPagarParc;
              Monta_RxDbGrid;
              //Filtra_Calcula2;
            end
          else
            begin
              RxDBGrid2.DataSource := nil;
              if RxDBLookupCombo1.Text = '' then
                RxDBGrid3.DataSource := nil;
            end;
        end;
    end;
end;

procedure TfContasPagar.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    begin
      Memo1.Clear;
      if CurrencyEdit2.Value > 0 then
        begin
          DM1.tCPagar.Refresh;
          DM1.tCPagarParc.Refresh;
          if DM1.tCPagar.MasterFields = 'CodForn' then
            begin
              DM1.tCPagar.MasterSource    := nil;
              DM1.tCPagar.MasterFields    := '';
            end;
          if DM1.tCPagar.Locate('NumCPagar;CodForn;Serie',VarArrayOf([CurrencyEdit2.Value,RxDBLookupCombo1.KeyValue,Edit5.Text]),[loCaseInsensitive]) then
            begin
              RxDBGrid2.DataSource := DM1.dsCPagarParc;
              Monta_RxDbGrid;
              RxDBGrid3.DataSource := dsQuery;
              if DM1.tFornecedores.Locate('CodForn',DM1.tCPagarCodForn.AsString,[loCaseInsensitive]) then
                begin
                  Edit1.Text := DM1.tFornecedoresEndForn.AsString;
                  Edit2.Text := DM1.tFornecedoresCidadeForn.AsString;
                  Edit3.Text := DM1.tFornecedoresEstadoForn.AsString;
                  Edit4.Text := DM1.tFornecedoresBairroForn.AsString;
                  if DM1.tCPagarNumNotaEnt.AsInteger > 0 then
                    begin
                      //DM1.tNEntrada.IndexFieldNames := 'NumNEntr;CodForn';
                      DM1.tNEntrada.IndexFieldNames := 'NumSeq';
                      DM1.tNEntrada.SetKey;
                      //DM1.tNEntradaNumNEntr.AsInteger := DM1.tCPagarParcNumNotaEnt.AsInteger;
                      //DM1.tNEntradaCodForn.AsInteger  := DM1.tCPagarCodForn.AsInteger;
                      DM1.tNEntradaNumSeq.AsInteger := DM1.tCPagarNumSeqNEntrada.AsInteger; 
                      if DM1.tNEntrada.GotoKey then
                        Memo1.Text := DM1.tNEntradaObsPagamento.AsString
                      else
                        Memo1.Text := '';
                    end
                  else
                    Memo1.Text := DM1.tCPagarHistorico.AsString;
                end
              else
                begin
                  Edit1.Clear;
                  Edit2.Clear;
                  Edit3.Clear;
                  Edit4.Clear;
                  Memo1.Clear;
                end;
              if RxDBGrid2.DataSource = nil then
                RxDBGrid2.DataSource := DM1.dsCPagarParc;
              //Filtra_Calcula2;
              Monta_RxDbGrid;
            end
          else
            begin
              RxDBGrid2.DataSource := nil;
              if RxDBLookupCombo1.Text = '' then
                RxDBGrid3.DataSource := nil;
            end;
        end;
    end;
end;

procedure TfContasPagar.RxDBGrid3DblClick(Sender: TObject);
begin
  if (Query1.Active) and (Query1CodForn.AsInteger > 0) then
    begin
      RxDBLookupCombo1.KeyValue := Query1CodForn.AsInteger;
      CurrencyEdit1.AsInteger   := Query1Duplicata.AsInteger;
      Edit5.Text                := Query1Serie.AsString;
      if CurrencyEdit1.AsInteger > 1 then
        CurrencyEdit1.SetFocus
      else
        begin
          CurrencyEdit2.AsInteger := Query1NumCPagar.AsInteger;
          CurrencyEdit2.SetFocus;
        end;
    end;
end;

procedure TfContasPagar.DateEdit1Change(Sender: TObject);
begin
  RxSpeedButton1.Enabled := False;
end;

procedure TfContasPagar.DateEdit2Change(Sender: TObject);
begin
  RxSpeedButton1.Enabled := False;
end;

end.
