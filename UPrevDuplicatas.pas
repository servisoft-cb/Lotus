unit UPrevDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, ToolEdit, CurrEdit, DBFilter,
  Grids, DBGrids, Db, DBTables, ValorPor, RXDBCtrl, ShellApi;

type
  TfPrevDuplicatas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    tCReceberParcHistIns: TTable;
    tCReceberParcHistInsNumCReceber: TIntegerField;
    tCReceberParcHistInsParcCReceber: TIntegerField;
    tCReceberParcHistInsItem: TIntegerField;
    tCReceberParcHistInsCodHistorico: TIntegerField;
    tCReceberParcHistInsDtHistorico: TDateField;
    tCReceberParcHistInsHistorico: TStringField;
    ValorPorExtenso1: TValorPorExtenso;
    RadioGroup2: TRadioGroup;
    qsDuplicatas: TDataSource;
    GroupBox1: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    qDuplicatas: TQuery;
    qDuplicatasNumNota: TIntegerField;
    qDuplicatasParcCReceber: TIntegerField;
    qDuplicatasDtGerado: TDateField;
    qDuplicatasDtVencCReceber: TDateField;
    qDuplicatasNome: TStringField;
    qDuplicatasVlrParcCReceber: TFloatField;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
    procedure Imprime_Dup;
    procedure Imprime_Dup2;
    procedure Grava_Historico;
  public
    { Public declarations }
  end;

var
  fPrevDuplicatas: TfPrevDuplicatas;
  Linha, Pagina : Integer;
  vNumNota : Integer;
  F: TextFile;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevDuplicatas.Grava_Historico;
begin
  tCReceberParcHistIns.Refresh;
  tCReceberParcHistIns.Last;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := tCReceberParcHistInsItem.AsInteger + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := 0;
  DM1.tCReceberParcHistHistorico.AsString      := 'DUPLICATA EMITIDA';
  DM1.tCReceberParcHist.Post;
end;

procedure TfPrevDuplicatas.Imprime_Dup;
var
 i : Integer;
 texto1, texto2 : String;

begin
  Writeln(F,' ----------------------------------------------------------------------------------------------------------------------------------');
  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 60 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := '| ' + texto1 + ' | ';
  texto2 := DM1.tEmpresaEndereco.AsString;
  for i := 1 to 60 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      |';
  writeln(F,texto1);

  texto2 := '| CNPJ: ' + DM1.tEmpresaCgc.AsString;
  for i := 1 to 63 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2 + '| ';
  texto2 := DM1.tEmpresaCidade.AsString;
  for i := 1 to 35 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '-     ';
  texto2 := DM1.tEmpresaEstado.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                       |';
  writeln(F,texto1);

  texto2 := '| Inscricao Estadual: ' + DM1.tEmpresaInscr.AsString;
  for i := 1 to 63 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2 + '| CEP: ';
  texto2 := DM1.tEmpresaCep.AsString;
  for i := 1 to 9 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   Fone: ';
  texto2 := DM1.tEmpresaTel.AsString;
  for i := 1 to 16 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + 'Fax: ';
  texto2 := DM1.tEmpresaFax.AsString;
  for i := 1 to 22 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '|';
  writeln(F,texto1);

  writeln(F,'|----------------------------------------------------------------------------------------------------------------------------------');
  writeln(F,'|              F A T U R A           ||   D U P L I C A T A             ||      DATA      |  --------------------------------------');
  writeln(F,'|------------------------------------||---------------------------------||                | |              PARA USO DA             |');
  writeln(F,'|      VALOR      |   NUMERO         ||      VALOR     |     NUMERO     ||   VENCIMENTO   | |        INSTITUICAO FINANCEIRA        |');
  writeln(F,'|-----------------|------------------||----------------|----------------||                | |                                      |');

  texto2 := FormatFloat('###,###,##0.00',DM1.tCReceberVlrTotal.AsFloat);
  for i := 1 to 14 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := '| ' + texto2 + '  |  ';
  texto2 := DM1.tCReceberParcNumNota.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '        || ';
  texto2 := FormatFloat('###,###,##0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat);
  for i := 1 to 14 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' | ';
  texto2 := DM1.tCReceberParcNumNota.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' / ';
  texto2 := DM1.tCReceberParcParcCReceber.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ||   ';
  texto2 := DM1.tCReceberParcDtVencCReceber.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   | |                                      |';
  writeln(F,texto1);

  writeln(F,' -----------------------------------------------------------------------------------------  |                                      |');
  writeln(F,'| DESCONTO DE:                                      ATE:                                  | |                                      |');
  writeln(F,'| CONDICOES ESPECIAIS:                                                                    | |                                      |');
  writeln(F,' -----------------------------------------------------------------------------------------   --------------------------------------');

  texto1 := '|                  || Nome do Sacado: ';
  texto2 := DM1.tCReceberParclkNomeCliente.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                                        -  ';
  texto2 := DM1.tCReceberCodCli.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 +  '    |';
  writeln(F,texto1);

  texto1 := '|                  || Endereco......: ';
  texto2 := DM1.tCReceberParclkEndereco.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      ';
  texto2 := DM1.tCReceberParclkBairro.AsString;
  for i := 1 to 25 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                      |';
  writeln(F,texto1);

  texto1 := '|           |      || Municipio.....: ';
  texto2 := DM1.tCReceberParclkCidade.AsString;
  for i := 1 to 26 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                    Estado: ';
  texto2 := DM1.tCReceberParclkEstado.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '             CEP: ';
  texto2 := DM1.tCReceberParclkCep.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '         |';
  writeln(F,texto1);

  texto1 := '|           |      || Praca de Pagto: ';
  texto2 := DM1.tCReceberParclkEndPgto.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      ';
  texto2 := DM1.tCReceberParclkCidPgto.AsString;
  for i := 1 to 26 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' - ';
  texto2 := DM1.tCReceberParclkUfPgto.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' - ';
  texto2 := DM1.tCReceberParclkCepPgto.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   |';
  writeln(F,texto1);

  texto1 := '|           |      || Inscr. C.N.P.J: ';
  texto2 := DM1.tCReceberParclkCgcCpf.AsString;
  for i := 1 to 18 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                            Inscr.Estadual: ';
  texto2 := DM1.tCReceberParclkInscrEst.AsString;
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                 |';
  writeln(F,texto1);

  writeln(F,'|           |      | --------------------------------------------------------------------------------------------------------------|');

  texto1 := '|           |      ||   VALOR  |';
  ValorPorExtenso1.Valor := DM1.tCReceberParcVlrParcCReceber.AsFloat;
  texto2 := ValorPorExtenso1.Texto;
  for i := 1 to 250 - Length(texto2) do
    texto2 := texto2 + '*';
  texto1 := texto1 + Copy(Texto2,1,90) + '         |';
  writeln(F,texto1);

  texto1 := '|           |      ||    POR   | ' + Copy(Texto2,91,90) + '        |';
  writeln(F,texto1);

  texto1 := '|           |      ||  EXTENSO | ' + Copy(Texto2,181,70) + '                            |';
  writeln(F,texto1);

  writeln(F,'|           |      | --------------------------------------------------------------------------------------------------------------');
  writeln(F,'|           |      || Reconheco(emos) a exatidao desta DUPLICATA DE VENDA MERCANTIL, na importancia acima, que pagarei(emos) a     |');

  texto1 := '|           |      || ';
  texto2 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 60 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '., na praca e vencimento acima indicados         |';
  writeln(F,texto1);

  writeln(F,'|           |      ||                                                                                                              |');

  texto1 := '|           |      ||           ';
  texto2 := DM1.tCReceberParcDtGerado.AsString;
  for i := 1 to 10 - length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                               ________________________________________________          |';
  writeln(F,texto1);
  //writeln(F,'|           |      ||   ___________/___________/___________              ________________________________________________          |');
  writeln(F,'|                  ||         Data do aceite                                           Assinatura do Sacado                        |');
  writeln(F,' ------------------  --------------------------------------------------------------------------------------------------------------');
  writeln(F);
  writeln(F);
  writeln(F);
end;

procedure TfPrevDuplicatas.Imprime_Dup2;
var
 i : Integer;
 texto1, texto2 : String;
begin
  for i := 1 to 7 do  // era 8, diminui pq aumentei uma linha no fim - 26/09/03 - Jack.
    Writeln(F);
  texto1 := ' ';
  for i := 1 to 90 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + DateToStr(Date);
  Writeln(F,Texto1);
  for i := 1 to 4 do
    Writeln(F);
  texto2 := FormatFloat('###,###,##0.00',DM1.tCReceberVlrTotal.AsFloat);
  for i := 1 to 25 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := ' ' + texto2;
  texto2 := DM1.tCReceberParcNumNota.AsString;
  for i := 1 to 12 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '     ';
  texto2 := FormatFloat('###,###,##0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat);
  for i := 1 to 24 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  texto2 := DM1.tCReceberParcNumNota.AsString;
  for i := 1 to 12 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '/';
  texto2 := DM1.tCReceberParcParcCReceber.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '     ';
  texto2 := DM1.tCReceberParcDtVencCReceber.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;
  writeln(F,texto1);
  for i := 1 to 6 do
    Writeln(F);
  Texto1 := ' ';
  for i := 1 to 42 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + DM1.tCReceberParclkNomeCliente.AsString + ' - ' + DM1.tCReceberCodCli.AsString;
  Writeln(F,texto1);
  Texto1 := ' ';
  for i := 1 to 42 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + DM1.tCReceberParclkEndereco.AsString + ', ' + dm1.tCReceberParclkNumEnd.AsString + ' - ' + dm1.tCReceberParclkComplEndereco.AsString;
  Writeln(F,Texto1);
  Texto1 := ' ';
  for i := 1 to 42 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto2 := DM1.tCReceberParclkCidade.AsString;
  for i := 1 to 53 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := DM1.tCReceberParclkEstado.AsString;
  for i := 1 to 26 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + DM1.tCReceberParclkCep.AsString;
  Writeln(F,Texto1);
  Writeln(F);
  Texto1 := ' ';
  for i := 1 to 42 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto2 := DM1.tCReceberParclkEndPgto.AsString;
  for i := 1 to 40 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' - ';
  Texto2 := DM1.tCReceberParclkCidPgto.AsString;
  for i := 1 to 26 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' - ';
  Texto2 := DM1.tCReceberParclkUfPgto.AsString;
  for i := 1 to 2 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' - ';
  Texto2 := DM1.tCReceberParclkCepPgto.AsString;
  for i := 1 to 10 - Length(texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Writeln(F,Texto1);
  Writeln(F);
  Texto1 := ' ';
  for i := 1 to 42 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto2 := DM1.tCReceberParclkCgcCpf.AsString;
  for i := 1 to 66 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + DM1.tCReceberParclkInscrEst.AsString;
  Writeln(F,Texto1);
  for i := 1 to 2 do
    Writeln(F);
  ValorPorExtenso1.Valor := DM1.tCReceberParcVlrParcCReceber.AsFloat;
  Texto2 := ValorPorExtenso1.Texto;
  for i := 1 to 285 - Length(Texto2) do
    Texto2 := Texto2 + '*';
  Texto1 := ' ';
  for i := 1 to 41 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + Copy(Texto2,1,95);
  writeln(F,Texto1);
  Texto1 := ' ';
  for i := 1 to 41 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + Copy(Texto2,96,95);
  Writeln(F,Texto1);
  Texto1 := ' ';
  for i := 1 to 41 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + Copy(Texto2,191,95);
  Writeln(F,Texto1);
  for i := 1 to 14 do // era 13, aumentei pq tirei uma linha no início - 26/09/03 - Jack.
    Writeln(F);
end;

procedure TfPrevDuplicatas.Imprimir;
var
  Texto : String;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  DM1.tCReceber.First;
  while not DM1.tCReceber.Eof do
    begin
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
        begin
          case RadioGroup2.ItemIndex of
            0 : Imprime_Dup2;
            1 : Imprime_Dup;
          end;
          Grava_Historico;
          DM1.tCReceberParc.Edit;
          DM1.tCReceberParcDuplicataImp.AsBoolean := True;
          DM1.tCReceberParc.Post;
          DM1.tCReceberParc.Next;
        end;
      DM1.tCReceber.Edit;
      DM1.tCReceberDuplicataImp.AsBoolean := True;
      DM1.tCReceber.Post;
    end;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfPrevDuplicatas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tCReceber.Close;
      DM1.tCReceberParc.Close;
      DM1.tCReceberParcHist.Close;
      DM1.tCliente.Close;
      DM1.tCidade.Close;
      DM1.tUF.Close;
      DM1.tVendedor.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevDuplicatas.BitBtn1Click(Sender: TObject);
var
  Texto : String;
begin
  if RadioGroup1.ItemIndex = 0 then
    begin
      DM1.tCReceber.Filtered := False;
      DM1.tCReceber.Filter   := 'DuplicataImp <> True and Cancelado <> True';
      DM1.tCReceber.Filtered := True;
      if DM1.tCReceber.RecordCount > 0 then
        Imprimir;
      DM1.tCReceber.Filtered := False;
    end
  else
  if RadioGroup1.ItemIndex = 1 then
    begin
      if Edit1.Text = '' then
      begin
        ShowMessage('Série da nota fiscal deve ser preenchida!');
        Edit1.SetFocus;
        Exit;
      end;
      if CurrencyEdit2.Value > CurrencyEdit3.Value then
        begin
          ShowMessage('Parcela inicial maior que final');
          CurrencyEdit2.SetFocus;
        end
      else
      if (CurrencyEdit1.Value = 0) or (CurrencyEdit3.Value = 0) then
        begin
          ShowMessage('Nº da nota ou o nº da parcela final não podem ser zeros!');
          CurrencyEdit1.SetFocus;
        end
      else
        begin
          if DM1.tCReceber.Locate('NumNota',CurrencyEdit1.AsInteger,[loCaseInsensitive]) then
            begin
              fEscImpressora := TfEscImpressora.Create(Self);
              fEscImpressora.ShowModal;
              AssignFile(F,DM1.tImpressoraEndereco.AsString);
              ReWrite(F);
              DM1.tCReceberParc.First;
              while not DM1.tCReceberParc.Eof do
                begin
                  if (DM1.tCReceberParcParcCReceber.AsInteger >= CurrencyEdit2.AsInteger) and (DM1.tCReceberParcParcCReceber.AsInteger <= CurrencyEdit3.AsInteger) then
                    begin
                      Case RadioGroup2.ItemIndex of
                        0 : Imprime_Dup2;
                        1 : Imprime_Dup;
                      end;
                      DM1.tCReceberParc.Edit;
                      DM1.tCReceberParcDuplicataImp.AsBoolean := True;
                      DM1.tCReceberParc.Post;
                    end;
                  DM1.tCReceberParc.Next;
                end;
              CloseFile(F);
              Grava_Historico;
              DM1.tCReceber.Edit;
              DM1.tCReceberDuplicataImp.AsBoolean := True;
              DM1.tCReceber.Post;
              if DM1.tImpressoraVisualizar.AsBoolean then
                begin
                  Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
                  //WinExec(PChar(Texto),SW_MAXIMIZE);
                  ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
                end;
            end;
          BitBtn2.Click;
        end;
    end;
  qDuplicatas.Close;
  qDuplicatas.Open;
  BitBtn4.SetFocus;
end;

procedure TfPrevDuplicatas.BitBtn2Click(Sender: TObject);
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  RadioGroup2.ItemIndex := 0;
  RadioGroup1.SetFocus;
end;

procedure TfPrevDuplicatas.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevDuplicatas.RadioGroup1Click(Sender: TObject);
begin
  Panel3.Enabled := not(Panel3.Enabled);
end;

procedure TfPrevDuplicatas.BitBtn1Enter(Sender: TObject);
begin
 if CurrencyEdit3.Value = 0 then
   CurrencyEdit3.Value := 99999;
end;

procedure TfPrevDuplicatas.FormCreate(Sender: TObject);
begin
  qDuplicatas.Close;
  qDuplicatas.Open;
end;

procedure TfPrevDuplicatas.FormShow(Sender: TObject);
begin
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCliente.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;
  DM1.tVendedor.Open;
end;

end.
