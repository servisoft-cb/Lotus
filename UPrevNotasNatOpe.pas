unit UPrevNotasNatOpe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, ShellApi;

type
  TfPrevNotasNatOpe = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBFilter1: TRxDBFilter;
    ProgressBar1: TProgressBar;
    Bevel1: TBevel;
    Label2: TLabel;
    tAuxNotasNatOpe: TTable;
    dsAuxNotasNatOpe: TDataSource;
    tAuxNotasNatOpeCodNatOper: TIntegerField;
    tAuxNotasNatOpeDtEmissao: TDateField;
    tAuxNotasNatOpeNota: TIntegerField;
    tAuxNotasNatOpeCodCliente: TIntegerField;
    tAuxNotasNatOpeVTotal: TFloatField;
    tAuxNotasNatOpeVMercadoria: TFloatField;
    tAuxNotasNatOpeVBase: TFloatField;
    tAuxNotasNatOpeVIcms: TFloatField;
    tAuxNotasNatOpeVIsentas: TFloatField;
    tAuxNotasNatOpeVOutras: TFloatField;
    tAuxNotasNatOpeRes: TTable;
    dsAuxNotasNatOpeRes: TDataSource;
    tAuxNotasNatOpeResCodNatOper: TIntegerField;
    tAuxNotasNatOpeResVTotal: TFloatField;
    tAuxNotasNatOpeResVMercadoria: TFloatField;
    tAuxNotasNatOpeResVBase: TFloatField;
    tAuxNotasNatOpeResVIcms: TFloatField;
    tAuxNotasNatOpeResVIsentas: TFloatField;
    tAuxNotasNatOpeResVOutras: TFloatField;
    tClientes: TTable;
    tClientesCodigo: TIntegerField;
    tClientesNome: TStringField;
    tClientesEndereco: TStringField;
    tClientesBairro: TStringField;
    tClientesCidade: TStringField;
    tClientesUf: TStringField;
    tClientesTelefone: TStringField;
    tClientesTelefone2: TStringField;
    tClientesFax: TStringField;
    tClientesPessoa: TStringField;
    tClientesCgcCpf: TStringField;
    tClientesInscrEst: TStringField;
    tClientesContato: TStringField;
    tClientesObs: TMemoField;
    tClientesAprovCredito: TStringField;
    tClientesTipoAprov: TStringField;
    tClientesEndEntrega: TStringField;
    tClientesBairroEntrega: TStringField;
    tClientesCidEntrega: TStringField;
    tClientesUfEntrega: TStringField;
    tClientesCgcCpfEntrega: TStringField;
    tClientesInscEntrega: TStringField;
    tClientesEndPgto: TStringField;
    tClientesBairroPgto: TStringField;
    tClientesCidPgto: TStringField;
    tClientesUfPgto: TStringField;
    tClientesFantasia: TStringField;
    tClientesDtCadastro: TDateField;
    tClientesCodVendedor: TIntegerField;
    tAuxNotasNatOpelkUf: TStringField;
    tAuxNotasNatOpelkNomeCliente: TStringField;
    tClientesObsCtas: TMemoField;
    tClientesCep: TStringField;
    tClientesCepEntrega: TStringField;
    tClientesCepPgto: TStringField;
    tClientesLojas: TIntegerField;
    tClientesSelecionado: TBooleanField;
    tClientesCaixaPostal: TStringField;
    tClientesRg: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_TotalNatOper;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fPrevNotasNatOpe: TfPrevNotasNatOpe;
  linha, pagina, vCodNatOper : Integer;
  F: TextFile;
  vTotal, vMercadoria, vBase, vIcms, vOutras : Real;
  TextoDet : String;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevNotasNatOpe.Imprimir;
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
  vCodNatOper := 0;
  tAuxNotasNatOpe.Refresh;
  tAuxNotasNatOpe.First;
  while not tAuxNotasNatOpe.EOF do
    begin
      if (vCodNatOper > 0) and (vCodNatOper <> tAuxNotasNatOpeCodNatOper.AsInteger) then
        Imprime_TotalNatOper;
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      vCodNatOper := tAuxNotasNatOpeCodNatOper.AsInteger;
      tAuxNotasNatOpe.Next;
    end;
  Imprime_TotalNatOper;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfPrevNotasNatOpe.Imprime_Cabecalho;
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
  Texto1 := Copy(DM1.tEmpresaEmpresa.AsString,1,50);
  For i := 1 to 53 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'RELACAO DE NOTAS EMITIDAS                                   Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  Texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                                                                                 Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Nat. UF Codigo Cliente               Nota Dt.Emissao      Vlr.Total Vlr.Mercadoria      Base ICMS     Vlr.ICMS    Insetas     Outras');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevNotasNatOpe.Imprime_Detalhe;
var
 i : Integer;
 Texto1  : String;
begin
  Texto1 := '';
  Texto1 := tAuxNotasNatOpeCodNatOper.AsString;
  TextoDet := Texto1 + '  ';
  Texto1   := tAuxNotasNatOpelkUf.AsString;
  for i := 1 to 2 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := tAuxNotasNatOpeCodCliente.AsString;
  for i := 1 to 6 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := copy(tAuxNotasNatOpelkNomeCliente.AsString,1,18);
  for i := 1 to 18 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := tAuxNotasNatOpeNota.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  TextoDet := TextoDet + tAuxNotasNatOpeDtEmissao.AsString + ' ';
  Texto1   := FormatFloat('###,###,##0.00',tAuxNotasNatOpeVTotal.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,###,##0.00',tAuxNotasNatOpeVMercadoria.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,###,##0.00',tAuxNotasNatOpeVBase.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('#,###,##0.00',tAuxNotasNatOpeVIcms.AsFloat);
  for i := 1 to 12 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('#,###,##0.00',tAuxNotasNatOpeVIsentas.AsFloat);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,##0.00',tAuxNotasNatOpeVOutras.AsFloat);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Writeln(F,TextoDet);
  Linha := Linha + 1;
  vTotal      := vTotal + tAuxNotasNatOpeVTotal.AsFloat;
  vMercadoria := vMercadoria + tAuxNotasNatOpeVMercadoria.AsFloat;
  vBase       := vBase + tAuxNotasNatOpeVBase.AsFloat;
  vIcms       := vIcms + tAuxNotasNatOpeVIcms.AsFloat;
  vOutras     := vOutras + tAuxNotasNatOpeVOutras.AsFloat;
end;

procedure TfPrevNotasNatOpe.Imprime_TotalNatOper;
var
 i : Integer;
 Texto1 : String;
begin
  Writeln(F,'                              ------------------------------------------------------------------------------------------------------');
  TextoDet := '                              Total da Natureza ';
  Texto1 := IntToStr(vCodNatOper);
  for i := 1 to 4 - Length(Texto1) do
    Texto1 := Texto1 + '.';
  TextoDet := TextoDet + Texto1 + ':';  

  Texto1   := FormatFloat('###,###,##0.00',vTotal);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,###,##0.00',vMercadoria);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,###,##0.00',vBase);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('#,###,##0.00',vIcms);
  for i := 1 to 12 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := '0,00';
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,##0.00',vOutras);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Writeln(F,TextoDet);
  Writeln(F);
  Linha := Linha + 3;
// grava o arquivo com o resumo da natureza de operacao;
  tAuxNotasNatOpeRes.Insert;
  tAuxNotasNatOpeResCodNatOper.AsInteger := vCodNatOper;
  tAuxNotasNatOpeResVTotal.AsFloat       := vTotal;
  tAuxNotasNatOpeResVMercadoria.AsFloat  := vMercadoria;
  tAuxNotasNatOpeResVBase.AsFloat        := vBase;
  tAuxNotasNatOpeResVIcms.AsFloat        := vIcms;
  tAuxNotasNatOpeResVIsentas.AsFloat     := 0;
  tAuxNotasNatOpeResVOutras.AsFloat      := vOutras;
  tAuxNotasNatOpeRes.Post;
  vTotal      := 0;
  vMercadoria := 0;
  vBase       := 0;
  vICMS       := 0;
  vOutras     := 0;
end;

procedure TfPrevNotasNatOpe.Imprime_Rodape;
var
 i : Integer;
 Texto1 : String;
begin
  Imprime_Cabecalho;
  Writeln(F,'RESUMO DE NOTAS FISCAIS POR NATUREZA DE OPERACAO');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Nat.      Vlr.Total Vlr.Mercadoria      Base ICMS     Vlr.ICMS    Insetas     Outras');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := Linha + 4;
  TextoDet := '';
  tAuxNotasNatOpeRes.Refresh;
  tAuxNotasNatOpeRes.First;
  while not tAuxNotasNatOpeRes.EOF do
    begin
      TextoDet := tAuxNotasNatOpeResCodNatOper.AsString;
      Texto1   := FormatFloat('###,###,##0.00',tAuxNotasNatOpeResVTotal.AsFloat);
      for i := 1 to 14 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Texto1   := FormatFloat('###,###,##0.00',tAuxNotasNatOpeResVMercadoria.AsFloat);
      for i := 1 to 14 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Texto1   := FormatFloat('###,###,##0.00',tAuxNotasNatOpeResVBase.AsFloat);
      for i := 1 to 14 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Texto1   := FormatFloat('#,###,##0.00',tAuxNotasNatOpeResVIcms.AsFloat);
      for i := 1 to 12 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Texto1   := '0,00';
      for i := 1 to 10 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Texto1   := FormatFloat('###,##0.00',tAuxNotasNatOpeResVOutras.AsFloat);
      for i := 1 to 10 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Writeln(F,TextoDet);
      Linha := Linha + 1;
      tAuxNotasNatOpeRes.Next;
    end;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then  
    Write(F,#18);
end;

procedure TfPrevNotasNatOpe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tNotaFiscal.Close;
      Dm1.tNotaFiscalItens.Close;
      Dm1.tNatOperacao.Close;
      DM1.tUF.Close;
      DM1.tCidade.Close;
      DM1.tCliente.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevNotasNatOpe.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    begin
      ShowMessage('Há campos em branco!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final!')
  else
    begin
      tAuxNotasNatOpeRes.First;
      while not tAuxNotasNatOpeRes.Eof do
        tAuxNotasNatOpeRes.Delete;
      tAuxNotasNatOpe.First;
      while not tAuxNotasNatOpe.Eof do
        tAuxNotasNatOpe.Delete;
    // Aumenta o tamanho do form para aperecer o progressbar e o cursor fica uma ampulheta
      vTotal      := 0;
      vMercadoria := 0;
      vBase       := 0;
      vICMS       := 0;
      vOutras     := 0;
      Screen.Cursor := crHourglass;
      Panel1.Height := 101;
      fPrevNotasNatOpe.Height := 130;
      fPrevNotasNatOpe.Refresh;
    // Posiciona as notas pela data de emissão
      DM1.tNotaFiscal.IndexFieldNames := 'DtEmissao';
      DM1.tNotaFiscal.SetRangeStart;
      DM1.tNotaFiscalDtEmissao.AsDateTime := DateEdit1.Date;
      DM1.tNotaFiscal.SetRangeEnd;
      DM1.tNotaFiscalDtEmissao.AsDateTime := DateEdit2.Date;
      DM1.tNotaFiscal.ApplyRange;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := DM1.tNotaFiscal.RecordCount;
    // Grava o auxiliar
      DM1.tNotaFiscal.Refresh;
      DM1.tNotaFiscal.First;
      while not DM1.tNotaFiscal.Eof do
        begin
          vCodNatOper := 0;
          DM1.tNatOperacao.IndexFieldNames := 'Codigo';
          DM1.tNatOperacao.SetKey;
          DM1.tNatOperacaoCodigo.AsInteger := DM1.tNotaFiscalCodNatOper.AsInteger;
          if DM1.tNatOperacao.GotoKey then
            vCodNatOper := DM1.tNatOperacaoCodNatOper.AsInteger;
          tAuxNotasNatOpe.Insert;
          tAuxNotasNatOpeCodNatOper.AsInteger := vCodNatOper;
          tAuxNotasNatOpeDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
          tAuxNotasNatOpeNota.AsInteger       := DM1.tNotaFiscalNumNota.AsInteger;
          tAuxNotasNatOpeCodCliente.AsInteger := DM1.tNotaFiscalCodCli.AsInteger;
          tAuxNotasNatOpeVTotal.AsFloat       := DM1.tNotaFiscalVlrTotalNota.AsFloat;
          tAuxNotasNatOpeVMercadoria.AsFloat  := DM1.tNotaFiscalVlrTotalItens.AsFloat;
          tAuxNotasNatOpeVBase.AsFloat        := DM1.tNotaFiscalBaseIcms.AsFloat;
          tAuxNotasNatOpeVIcms.AsFloat        := DM1.tNotaFiscalVlrIcms.AsFloat;
          tAuxNotasNatOpeVIsentas.AsFloat     := 0;
          if DM1.tNotaFiscalVlrTotalItens.AsFloat > 0 then
            tAuxNotasNatOpevOutras.AsFloat      := DM1.tNotaFiscalVlrTotalItens.AsFloat - DM1.tNotaFiscalBaseIcms.AsFloat
          else
            tAuxNotasNatOpevOutras.AsFloat      := 0;
          tAuxNotasNatOpe.Post;
          ProgressBar1.Position := ProgressBar1.Position + 1;
          DM1.tNotaFiscal.Next;
        end;
      tAuxNotasNatOPe.Refresh;
      tAuxNotasNatOPe.First;
      if tAuxNotasNatOPe.RecordCount > 0 then
        Imprimir;
    // Cancela o SetRangeStart, e a tabela volta ao normal
      DM1.tNotaFiscal.CancelRange;
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
    // Diminuiu o tamanho do Form e o cursor volta ao normal
      Screen.Cursor := crDefault;
      ProgressBar1.Position := 0;
      Panel1.Height := 72;
      fPrevNotasNatOpe.Height := 100;
      fPrevNotasNatOpe.Refresh;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevNotasNatOpe.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevNotasNatOpe.FormShow(Sender: TObject);
begin
  Dm1.tNotaFiscal.Open;
  Dm1.tNotaFiscalItens.Open;
  Dm1.tNatOperacao.Open;
  DM1.tUF.Open;
  DM1.tCidade.Open;
  DM1.tCliente.Open;
end;

end.
