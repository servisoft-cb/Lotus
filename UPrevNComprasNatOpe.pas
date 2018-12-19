unit UPrevNComprasNatOpe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, ShellApi;

type
  TfPrevNComprasNatOpe = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    ProgressBar1: TProgressBar;
    Bevel1: TBevel;
    Label2: TLabel;
    tAuxNComprasNatOpe: TTable;
    dsAuxNComprasNatOpe: TDataSource;
    tAuxNotasNatOpeRes: TTable;
    dsAuxNotasNatOpeRes: TDataSource;
    tAuxNotasNatOpeResCodNatOper: TIntegerField;
    tAuxNotasNatOpeResVTotal: TFloatField;
    tAuxNotasNatOpeResVMercadoria: TFloatField;
    tAuxNotasNatOpeResVBase: TFloatField;
    tAuxNotasNatOpeResVIcms: TFloatField;
    tAuxNotasNatOpeResVIsentas: TFloatField;
    tAuxNotasNatOpeResVOutras: TFloatField;
    tFornecedores: TTable;
    tFornecedoresCodForn: TIntegerField;
    tFornecedoresNomeForn: TStringField;
    tFornecedoresEndForn: TStringField;
    tFornecedoresBairroForn: TStringField;
    tFornecedoresCidadeForn: TStringField;
    tFornecedoresCEPForn: TStringField;
    tFornecedoresEstadoForn: TStringField;
    tFornecedoresTel1Forn: TStringField;
    tFornecedoresTel2Forn: TStringField;
    tFornecedoresFaxForn: TStringField;
    tFornecedoresCGC: TStringField;
    tFornecedoresInsc: TStringField;
    tFornecedoresContatoForn: TStringField;
    tFornecedoresDataCadastroForn: TDateField;
    tFornecedoresObsForn: TMemoField;
    tFornecedoresRamal: TStringField;
    tFornecedoresEmail: TStringField;
    tFornecedoresHomePage: TStringField;
    tFornecedoresCodCondPgto: TIntegerField;
    tFornecedoresFantasia: TStringField;
    tFornecedoresFornecedorOutros: TStringField;
    tAuxNComprasNatOpeCodNatOper: TIntegerField;
    tAuxNComprasNatOpeDtEmissao: TDateField;
    tAuxNComprasNatOpeNota: TIntegerField;
    tAuxNComprasNatOpeCodFornecedor: TIntegerField;
    tAuxNComprasNatOpeItem: TIntegerField;
    tAuxNComprasNatOpeVTotal: TFloatField;
    tAuxNComprasNatOpeVMercadoria: TFloatField;
    tAuxNComprasNatOpeVBase: TFloatField;
    tAuxNComprasNatOpeVIcms: TFloatField;
    tAuxNComprasNatOpeVIsentas: TFloatField;
    tAuxNComprasNatOpeVOutras: TFloatField;
    tAuxNComprasNatOpelkUf: TStringField;
    tAuxNComprasNatOpelkNomeFornecedor: TStringField;
    Query1: TQuery;
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
    procedure Grava_Aux;
  public
    { Public declarations }
  end;

var
  fPrevNComprasNatOpe: TfPrevNComprasNatOpe;
  linha, pagina, vCodNatOper, vItem : Integer;
  F: TextFile;
  vTotal, vMercadoria, vBase, vIcms, vOutras : Real;
  TextoDet : String;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevNComprasNatOpe.Grava_Aux;
begin
  tAuxNComprasNatOpe.Insert;
  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
  DM1.tNatOperacao.SetKey;
  DM1.tNatOperacaoCodigo.AsInteger := vCodNatOper;
  if DM1.tNatOperacao.GotoKey then
    vCodNatOper := DM1.tNatOperacaoCodNatOper.AsInteger;
  tAuxNComprasNatOpeCodNatOper.AsInteger    := vCodNatOper;
  tAuxNComprasNatOpeDtEmissao.AsDateTime    := DM1.tNEntradaDtEntrada.AsDateTime;
  tAuxNComprasNatOpeNota.AsInteger          := DM1.tNEntradaNumNEntr.AsInteger;
  tAuxNComprasNatOpeCodFornecedor.AsInteger := DM1.tNEntradaCodForn.AsInteger;
  tAuxNComprasNatOpeItem.AsInteger          := vItem;
  if vMercadoria > 0 then
    begin
      tAuxNComprasNatOpeVTotal.AsFloat       := DM1.tNEntradaVlrTotalNEntr.AsFloat - vTotal;
      tAuxNComprasNatOpeVMercadoria.AsFloat  := vMercadoria;
      tAuxNComprasNatOpevOutras.AsFloat      := DM1.tNEntradaVlrTotalNEntr.AsFloat - vTotal - DM1.tNEntradaBaseIcms.AsFloat;
      tAuxNComprasNatOpeVBase.AsFloat        := DM1.tNEntradaBaseIcms.AsFloat;
      tAuxNComprasNatOpeVIcms.AsFloat        := DM1.tNEntradaVlrIcms.AsFloat;
    end
  else
  if vTotal > 0 then
    begin
      tAuxNComprasNatOpeVTotal.AsFloat       := vTotal;
      tAuxNComprasNatOpeVMercadoria.AsFloat  := 0;
      tAuxNComprasNatOpevOutras.AsFloat      := vTotal;
      tAuxNComprasNatOpeVBase.AsFloat        := 0;
      tAuxNComprasNatOpeVIcms.AsFloat        := 0;
    end
  else
    begin
      tAuxNComprasNatOpeVTotal.AsFloat       := DM1.tNEntradaVlrTotalNEntr.AsFloat;
      tAuxNComprasNatOpeVMercadoria.AsFloat  := 0;
      tAuxNComprasNatOpevOutras.AsFloat      := DM1.tNEntradaVlrTotalNEntr.AsFloat - DM1.tNEntradaBaseIcms.AsFloat;
      tAuxNComprasNatOpeVBase.AsFloat        := DM1.tNEntradaBaseIcms.AsFloat;
      tAuxNComprasNatOpeVIcms.AsFloat        := DM1.tNEntradaVlrIcms.AsFloat;
    end;
  tAuxNComprasNatOpeVIsentas.AsFloat := 0;
  tAuxNComprasNatOpe.Post;
end;

procedure TfPrevNComprasNatOpe.Imprimir;
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
  tAuxNComprasNatOpe.Refresh;
  tAuxNComprasNatOpe.First;
  while not tAuxNComprasNatOpe.EOF do
    begin
      if (vCodNatOper > 0) and (vCodNatOper <> tAuxNComprasNatOpeCodNatOper.AsInteger) then
        Imprime_TotalNatOper;
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      vCodNatOper := tAuxNComprasNatOpeCodNatOper.AsInteger;
      tAuxNComprasNatOpe.Next;
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

procedure TfPrevNComprasNatOpe.Imprime_Cabecalho;
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
  Texto1 := Texto1 + 'RELACAO DE NOTAS DE COMPRAS                                 Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  Texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                                                                                 Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Nat. UF Codigo Fornecedor            Nota Dt.Emissao      Vlr.Total Vlr.Mercadoria      Base ICMS     Vlr.ICMS    Insetas     Outras');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevNComprasNatOpe.Imprime_Detalhe;
var
 i : Integer;
 Texto1  : String;
begin
  Texto1 := '';
  Texto1 := tAuxNComprasNatOpeCodNatOper.AsString;
  TextoDet := Texto1 + '  ';
  Texto1   := tAuxNComprasNatOpelkUf.AsString;
  for i := 1 to 2 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := tAuxNComprasNatOpeCodFornecedor.AsString;
  for i := 1 to 6 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := copy(tAuxNComprasNatOpelkNomeFornecedor.AsString,1,18);
  for i := 1 to 18 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := tAuxNComprasNatOpeNota.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  TextoDet := TextoDet + tAuxNComprasNatOpeDtEmissao.AsString + ' ';
  Texto1   := FormatFloat('###,###,##0.00',tAuxNComprasNatOpeVTotal.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,###,##0.00',tAuxNComprasNatOpeVMercadoria.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,###,##0.00',tAuxNComprasNatOpeVBase.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('#,###,##0.00',tAuxNComprasNatOpeVIcms.AsFloat);
  for i := 1 to 12 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('#,###,##0.00',tAuxNComprasNatOpeVIsentas.AsFloat);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := FormatFloat('###,##0.00',tAuxNComprasNatOpeVOutras.AsFloat);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Writeln(F,TextoDet);
  Linha := Linha + 1;
  vTotal      := vTotal + tAuxNComprasNatOpeVTotal.AsFloat;
  vMercadoria := vMercadoria + tAuxNComprasNatOpeVMercadoria.AsFloat;
  vBase       := vBase + tAuxNComprasNatOpeVBase.AsFloat;
  vIcms       := vIcms + tAuxNComprasNatOpeVIcms.AsFloat;
  vOutras     := vOutras + tAuxNComprasNatOpeVOutras.AsFloat;
end;

procedure TfPrevNComprasNatOpe.Imprime_TotalNatOper;
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

procedure TfPrevNComprasNatOpe.Imprime_Rodape;
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

procedure TfPrevNComprasNatOpe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tNatOperacao.Close;
      DM1.tNEntrada.Close;
      DM1.tNEntradaItens.Close;
      DM1.tFornecedores.Close;
      DM1.tNEntradaItensMobra.Close;
      DM1.tCidade.Close;
      DM1.tUF.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevNComprasNatOpe.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    begin
      ShowMessage('Há campos em branco!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final')
  else
    begin
      tAuxNotasNatOpeRes.First;
      while not tAuxNotasNatOpeRes.Eof do
        tAuxNotasNatOpeRes.Delete;
      tAuxNComprasNatOpe.First;
      while not tAuxNComprasNatOpe.Eof do
        tAuxNComprasNatOpe.Delete;
    // Aumenta o tamanho do form para aperecer o progressbar e o cursor fica uma ampulheta
      vTotal      := 0;
      vMercadoria := 0;
      vBase       := 0;
      vICMS       := 0;
      vOutras     := 0;
      Screen.Cursor := crHourglass;
      fPrevNComprasNatOpe.Refresh;
    // Posiciona as notas pela data de emissão
      DM1.tNEntrada.IndexFieldNames := 'DtEntrada';
      DM1.tNEntrada.SetRangeStart;
      DM1.tNEntradaDtEntrada.AsDateTime := DateEdit1.Date;
      DM1.tNEntrada.SetRangeEnd;
      DM1.tNEntradaDtEntrada.AsDateTime := DateEdit2.Date;
      DM1.tNEntrada.ApplyRange;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := DM1.tNEntrada.RecordCount;
    // Grava o auxiliar
      DM1.tNEntrada.Refresh;
      DM1.tNEntrada.First;
      while not DM1.tNEntrada.Eof do
        begin
          vTotal := 0;
          DM1.tNEntradaItensMobra.First;
          while not DM1.tNEntradaItensMobra.Eof do
            begin
              vTotal := vTotal + DM1.tNEntradaItensMobraVlrTotal.AsFloat;
              DM1.tNEntradaItensMobra.Next;
            end;
          vMercadoria := 0;
          DM1.tNEntradaItens.First;
          while not DM1.tNEntradaItens.Eof do
            begin
              vMercadoria := vMercadoria + DM1.tNEntradaItensVlrTotalItens.AsFloat;
              DM1.tNEntradaItens.Next;
            end;
          vItem   := 1;
          vCodNatOper := DM1.tNEntradaCodNatOper.AsInteger;
          if vMercadoria > 0 then
            Grava_Aux;
          if vTotal > 0 then
            begin
              vItem       := 2;
              vCodNatOper := DM1.tNEntradaCodNatOper2.AsInteger;
              vMercadoria := 0;
              Grava_Aux;
            end;
          if (vMercadoria = 0) and (vTotal = 0) then
            Grava_Aux;
          ProgressBar1.Position := ProgressBar1.Position + 1;
          DM1.tNEntrada.Next;
        end;
      vTotal      := 0;
      vMercadoria := 0;
      tAuxNComprasNatOPe.Refresh;
      tAuxNComprasNatOPe.First;
      if tAuxNComprasNatOPe.RecordCount > 0 then
        Imprimir;
    // Cancela o SetRangeStart, e a tabela volta ao normal
      DM1.tNEntrada.CancelRange;
      DM1.tNEntrada.IndexFieldNames := 'NumSeq';
      Screen.Cursor := crDefault;
      ProgressBar1.Position := 0;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevNComprasNatOpe.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevNComprasNatOpe.FormShow(Sender: TObject);
begin
  DM1.tNatOperacao.Open;
  DM1.tNEntrada.Open;
  DM1.tNEntradaItens.Open;
  DM1.tFornecedores.Open;
  DM1.tNEntradaItensMobra.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;
end;

end.
