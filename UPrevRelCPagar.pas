unit UPrevRelCPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Menus, RXCtrls, Printers,
  Db, DBTables, Grids, DBGrids, ShellApi;

type
  TfPrevRelCPagar = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    StaticText1: TStaticText;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    Query1: TQuery;
    Query1Duplicata: TIntegerField;
    Query1Nota: TIntegerField;
    Query1Parcela: TIntegerField;
    Query1Data: TDateField;
    Query1CodConta: TIntegerField;
    Query1DtPgto: TDateField;
    Query1lkNomeBanco: TStringField;
    Query1CodForn: TIntegerField;
    Query1lkFornecedor: TStringField;
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
    tCPagarParc2CodTipoCobranca: TIntegerField;
    tCPagarParc2JurosPagos: TFloatField;
    Query1NumNotaEnt: TIntegerField;
    Query1NumCPagar: TIntegerField;
    Query1ValorParc: TFloatField;
    Query1JurosPagos: TFloatField;
    Query1ValorRestante: TFloatField;
    Bevel2: TBevel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Query1lkFantasia: TStringField;
    Query1ValorPago: TFloatField;
    RadioGroup2: TRadioGroup;
    tCPagarParc2DtRecto: TDateField;
    Query1DtRecto: TDateField;
    Query1NomeBancoForn: TStringField;
    Query1AgenciaForn: TStringField;
    Query1NumContaForn: TStringField;
    Label2: TLabel;
    Query1NomeTipoCobranca: TStringField;
    Query1lkTipoConta: TStringField;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Filtra_Calcula2;
    procedure Muda_DataSet;
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
  fPrevRelCPagar: TfPrevRelCPagar;
  vQtdTitulosDia, vQtdTitulosMes, vQtdTitulos : Integer;
  vVlrTotalDia, vVlrTotalMes, vVlrTotal : Real;
  vDtVecto : TDateTime;
  F: TextFile;
  linha, pagina : Integer;

implementation

uses URelCPagar, UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevRelCPagar.Filtra_Calcula2;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT A.NroDuplicata AS Duplicata, A.NumNotaEnt AS Nota, A.ParcCPagar AS Parcela, A.DtVencCPagar AS Data, A.VlrParcCPagar AS ValorParc, A.JurosParcCPagar AS JurosPagos, A.RestParcela AS ValorRestante,');
  Query1.SQL.Add('A.CodConta AS CodConta, A.DtPagParcCPagar AS DtPgto, A.CodForn, A.NumNotaEnt, A.NumCPagar, A.PgtoParcial As ValorPago, A.DtRecto As DtRecto,B.Fantasia, A.NomeBancoForn, A.AgenciaForn, A.NumContaForn, C.Nome NomeTipoCobranca');
  Query1.SQL.Add('FROM dbCPagarParc A');
  Query1.SQL.Add('LEFT JOIN  "dbFornecedores" B ');
  Query1.SQL.Add('ON B.CodForn = A.CodForn ');
  Query1.SQL.Add('LEFT JOIN "dbTipoCobranca" C ');
  Query1.SQL.Add('ON C.Codigo = A.CodTipoCobranca ');
  if RadioGroup1.ItemIndex = 0 then
    Query1.SQL.Add('WHERE (A.RestParcela > 0) AND (A.DtVencCPagar <= :Data1)')
  else
  if RadioGroup1.ItemIndex = 1 then
    begin
      Query1.SQL.Add('WHERE (A.RestParcela > 0)');
      if DateEdit1.Date > 0 then
        Query1.SQL.Add(' AND (A.DtVencCPagar >= :Data1)');
      if DateEdit2.Date > 0 then
        Query1.SQL.Add(' AND (A.DtVencCPagar <= :Data2)');
    end
  else
  if RadioGroup1.ItemIndex = 2 then
    begin
      Query1.SQL.Add('WHERE (A.PgtoParcial > 0)');
      if DateEdit1.Date > 0 then
        Query1.SQL.Add(' AND (A.DtPagParcCPagar >= :Data1)');
      if DateEdit2.Date > 0 then
        Query1.SQL.Add(' AND (A.DtPagParcCPagar <= :Data2)');
    end
  else
    begin
      if DateEdit1.Date > 0 then
        Query1.SQL.Add(' WHERE (A.DtVencCPagar >= :Data1)');
      if (DateEdit2.Date > 0) and (DateEdit1.Date > 0) then
        Query1.SQL.Add(' AND (A.DtVencCPagar <= :Data2)')
      else
      if DateEdit2.Date > 0 then
        Query1.SQL.Add(' WHERE (A.DtVencCPagar <= :Data2)');
    end;
  if DateEdit1.Date > 0 then
    Query1.ParamByName('Data1').AsDate := DateEdit1.Date;
  if DateEdit2.Date > 0 then
    Query1.ParamByName('Data2').AsDate := DateEdit2.Date;
  if RadioGroup1.ItemIndex = 2 then
    Query1.SQL.Add('ORDER BY A.DtPagParcCPagar, B.Fantasia')
  else
    Query1.SQL.Add('ORDER BY A.DtVencCPagar, B.Fantasia');
  Query1.Active := True;
end;

procedure TfPrevRelCPagar.Muda_DataSet;
begin
  fRelCPagar.QuickRep1.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText3.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText5.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText5.DataField := 'lkFornecedor';
  fRelCPagar.QRDBText4.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText2.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText6.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText7.DataSet   := fPrevRelCPagar.Query1;
  fRelCPagar.QRDBText9.DataSet   := fPrevRelCPagar.Query1;
end;

procedure TfPrevRelCPagar.Imprime_Cabecalho;
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
  if RadioGroup1.ItemIndex = 0 then
    texto1 := 'Dt.Referencia: ' + DateEdit1.Text
  else
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

procedure TfPrevRelCPagar.Imprime_Detalhe;
var
 i : Integer;
 texto1, texto2 : string;
begin
  texto1 := '  ' + Query1Data.AsString + '   ' + Query1lkFornecedor.AsString;
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
  vQtdTitulos    := vQtdTitulos + 1;
  if Query1lkTipoConta.AsString <> 'I' then
    begin
      vVlrTotalDia := vVlrTotalDia + Query1ValorRestante.AsFloat;
      vVlrTotalMes := vVlrTotalMes + Query1ValorRestante.AsFloat;
      vVlrTotal    := vVlrTotal + Query1ValorRestante.AsFloat;
    end;
end;

procedure TfPrevRelCPagar.Imprime_Total_Dia;
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

procedure TfPrevRelCPagar.Imprime_Total_Mes;
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

procedure TfPrevRelCPagar.Imprime_Rodape;
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

procedure TfPrevRelCPagar.Imprimir;
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
      if CheckBox1.Checked = True then
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
  if CheckBox1.Checked = True then
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

procedure TfPrevRelCPagar.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    begin
      StaticText1.Caption := 'Data Referência:';
      StaticText2.Visible := False;
      DateEdit2.Visible   := False;
    end
  else
    begin
      StaticText1.Caption := 'Data Inicial:';
      StaticText2.Visible := True;
      DateEdit2.Visible   := True;
    end;
end;

procedure TfPrevRelCPagar.Imprimir1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) and (DateEdit1.Date < 1) then
    ShowMessage('Falta informar a data de referência!')
  else
    begin
      Filtra_Calcula2;
      case RadioGroup2.ItemIndex of
        0 : Imprimir;
        1 : begin
              Application.CreateForm(TfRelCPagar, fRelCPagar);
              Muda_DataSet;
              fRelCPagar.QuickRep1.Print;
              fRelCPagar.QuickRep1.Free;
            end;
      end;
    end;
end;

procedure TfPrevRelCPagar.Visualizar1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) and (DateEdit1.Date < 1) then
    ShowMessage('Falta informar a data de referência!')
  else
  if (DateEdit1.Date > 1) or (DateEdit2.Date > 1) then
    begin
      Filtra_Calcula2;
      Application.CreateForm(TfRelCPagar, fRelCPagar);
      Muda_DataSet;
      fRelCPagar.QuickRep1.Preview;
      fRelCPagar.QuickRep1.Free;
    end
  else
    ShowMessage('É obrigatório informar uma data!');
end;

procedure TfPrevRelCPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tFornecedores.Open;
      DM1.tContas.Open;
    end;
  Action := caFree;
end;

procedure TfPrevRelCPagar.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelCPagar.PopupMenu2Popup(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0 : PopupMenu2.Items.Items[1].Enabled := False;
    1 : PopupMenu2.Items.Items[1].Enabled := True;
  end;
end;

procedure TfPrevRelCPagar.FormShow(Sender: TObject);
begin
  DM1.tFornecedores.Open;
  DM1.tContas.Open;
end;

end.
