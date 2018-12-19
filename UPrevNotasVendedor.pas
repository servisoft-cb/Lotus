unit UPrevNotasVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, Menus, RXCtrls, ShellApi;

type
  TfPrevNotasVendedor = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;               
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;                                
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBFilter1: TRxDBFilter;
    ProgressBar1: TProgressBar;
    Bevel1: TBevel;
    Label2: TLabel;
    Query1: TQuery;
    Query1NumPedido: TIntegerField;
    Query1lkPedidoCliente: TIntegerField;
    Query1NumNota: TIntegerField;
    Query1lkCencelada: TBooleanField;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    MSDOS1: TMenuItem;
    Windows1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure MSDOS1Click(Sender: TObject);
    procedure Windows1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fPrevNotasVendedor: TfPrevNotasVendedor;
  linha, pagina : Integer;
  F: TextFile;
  vQtdTotal, vTotalBase, vTotalComissao, vTotalNota : Real;
  TextoDet : string;
  
implementation

uses UDM1, UEscImpressora, URelNotasVendedor;

{$R *.DFM}

procedure TfPrevNotasVendedor.Imprimir;
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

  DM1.tNotaFiscal.Refresh;
  DM1.tNotaFiscal.First;
  while not DM1.tNotaFiscal.EOF do
    begin
      Query1.Filtered := False;
      Query1.Filter   := 'NumNota = '''+DM1.tNotaFiscalNumNota.AsString+'''';
      Query1.Filtered := True;
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      Query1.Filtered := False;
      DM1.tNotaFiscal.Next;
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

procedure TfPrevNotasVendedor.Imprime_Cabecalho;
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
  Texto1 := Texto1 + 'RELACAO DE NOTAS EMITIDAS POR VENDEDOR                      Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  Texto1 := 'Vendedor: ' + RxDBLookupCombo1.Text;
  for i := 1 to 53 - length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                            Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'  Emissao  Cliente                              Pedido  N.Nota      Vlr.Total   Pares %Comis.    Base Com.  V.Comissao   Vcto.Tit.');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevNotasVendedor.Imprime_Detalhe;
var
 i, vQtd : Integer;
 Texto1 : String;
 vComissao : Real;
begin
  TextoDet := DM1.tNotaFiscalDtEmissao.AsString + ' ';
  Texto1   := copy(DM1.tNotaFiscallkNomeCli.AsString,1,27);
  for i := 1 to 27 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  texto1 := DM1.tNotaFiscalPedidoCliente.AsString;
  for i := 1 to 15 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1   := DM1.tNotaFiscalNumNota.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
  for i := 1 to 14 - Length(texto1) do
    texto1 := ' ' + texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  vQtd := 0;
  DM1.tNotaFiscalItens.Refresh;
  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.Eof do
    begin
      vQtd := vQtd + DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tNotaFiscalItens.Next;
    end;
  Texto1   := FormatFloat('###,###',vQtd);
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet   := TextoDet + Texto1 + ' ';
  vQtdTotal  := vQtdTotal + vQtd;
  vTotalNota := vTotalNota + DM1.tNotaFiscalVlrTotalNota.AsFloat;
// Monta os valores quando a nota for a vista
//  vComissao := 0;
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    begin
      Texto1   := FormatFloat('#0.00',DM1.tNotaFiscalPercComissao.AsFloat);
      for i := 1 to 5 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      Texto1 := FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
      for i := 1 to 14 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + '  ';
      vComissao := DM1.tNotaFiscalVlrTotalNota.AsFloat * DM1.tNotaFiscalPercComissao.AsFloat / 100;
      Texto1 := FormatFloat('###,##0.00',vComissao);
      for i := 1 to 10 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoDet := TextoDet + Texto1 + ' ';
      TextoDet := TextoDet + DM1.tNotaFiscalDtEmissao.AsString;
      Writeln(F,TextoDet);
      Linha := Linha + 1;
      vTotalBase     := vTotalBase + DM1.tNotaFiscalVlrTotalNota.AsFloat;
      vTotalComissao := vTotalComissao + vComissao;
    end;
// Monta os valores quando a nota for a prazo
  if DM1.tNotaFiscalCondPgto.AsString = 'P' then
    begin
      DM1.tNotaFiscalParc.First;
      while not DM1.tNotaFiscalParc.Eof do
        begin
          Texto1   := FormatFloat('#0.00',DM1.tNotaFiscalPercComissao.AsFloat);
          for i := 1 to 5 - Length(Texto1) do
            Texto1 := ' ' + Texto1;
          TextoDet := TextoDet + Texto1 + ' ';
          Texto1 := FormatFloat('###,###,##0.00',DM1.tNotaFiscalParcVlrVenc.AsFloat);
          for i := 1 to 14 - Length(Texto1) do
            Texto1 := ' ' + Texto1;
          TextoDet := TextoDet + Texto1 + '  ';
          vComissao := DM1.tNotaFiscalParcVlrVenc.AsFloat * DM1.tNotaFiscalPercComissao.AsFloat / 100;
          Texto1 := FormatFloat('###,##0.00',vComissao);
          for i := 1 to 10 - Length(Texto1) do
            Texto1 := ' ' + Texto1;
          TextoDet := TextoDet + Texto1 + ' ';
          TextoDet := TextoDet + DM1.tNotaFiscalParcDtVenc.AsString;
          Writeln(F,TextoDet);
          vTotalBase     := vTotalBase + DM1.tNotaFiscalParcVlrVenc.AsFloat;
          vTotalComissao := vTotalComissao + vComissao;
          Linha := Linha + 1;
          TextoDet := '';
          DM1.tNotaFiscalParc.Next;
          for i := 1 to 86 - length(TextoDet) do
            TextoDet := TextoDet + ' ';
        end;
    end;
  TextoDet := '';
end;

procedure TfPrevNotasVendedor.Imprime_Rodape;
var
  Texto1 : String;
  i : Integer;
begin
  Writeln(F,'                                       ---------------------------------------------------------------------------------------------');
  TextoDet := '                                       Total do Vendedor:    ';
  Texto1   := FormatFloat('###,###,##0.00',vTotalNota);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';

  Texto1   := FormatFloat('####,###',vQtdTotal);
  for i := 1 to 8 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '          ';

  Texto1 := FormatFloat('####,###,##0.00',vTotalBase);
  for i := 1 to 15 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('####,###,##0.00',vTotalComissao);
  for i := 1 to 11 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1;
  Writeln(F,TextoDet);
  linha := linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then  
    Write(F,#18);
end;

procedure TfPrevNotasVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tNotaFiscal.Close;
      DM1.tNotaFiscalItens.Close;
      DM1.tNotaFiscalParc.Close;
      DM1.tCliente.Close;
      DM1.tVendedor.Close;
      DM1.tPedido.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevNotasVendedor.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevNotasVendedor.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevNotasVendedor.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevNotasVendedor.MSDOS1Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') or (RxDBLookupCombo1.Text = '') then
    begin
      ShowMessage('Há campos em branco!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final')
  else
    begin
    // Aumenta o tamanho do form para aperecer o progressbar e o cursor, fica uma ampulheta
      vQtdTotal      := 0;
      vTotalBase     := 0;
      vTotalComissao := 0;
      vTotalNota     := 0;
      Screen.Cursor  := crHourglass;

    // Posiciona as notas pela data de emissão e vendedor
      DM1.tNotaFiscal.IndexFieldNames := 'CodVendedor;DtEmissao';
      DM1.tNotaFiscal.SetRangeStart;
      DM1.tNotaFiscalCodVendedor.AsInteger := DM1.tVendedorCodigo.AsInteger;
      DM1.tNotaFiscalDtEmissao.AsDateTime  := DateEdit1.Date;
      DM1.tNotaFiscal.SetRangeEnd;
      DM1.tNotaFiscalCodVendedor.AsInteger := DM1.tVendedorCodigo.AsInteger;
      DM1.tNotaFiscalDtEmissao.AsDateTime  := DateEdit2.Date;
      DM1.tNotaFiscal.ApplyRange;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := DM1.tNotaFiscal.RecordCount;
    // Chama a procedure da impressão
      if DM1.tNotaFiscal.RecordCount > 0 then
        Imprimir;
    // Cancela o SetRangeStart, e a tabela volta ao normal
      DM1.tNotaFiscal.CancelRange;
      DM1.tPedido.IndexFieldNames     := 'Pedido';
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
    // Diminuiu o tamanho do Form e o cursor volta ao normal
      Screen.Cursor := crDefault;
      ProgressBar1.Position := 0;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevNotasVendedor.Windows1Click(Sender: TObject);
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
    // Aumenta o tamanho do form para aperecer o progressbar e o cursor, fica uma ampulheta
      vQtdTotal      := 0;
      vTotalBase     := 0;
      vTotalComissao := 0;
      Screen.Cursor := crHourglass;
      Panel1.Height := 133;
      fPrevNotasVendedor.Height := 162;
      fPrevNotasVendedor.Refresh;

    // Posiciona as notas pela data de emissão e vendedor
      DM1.tNotaFiscal.IndexFieldNames := 'CodVendedor;DtEmissao';
{      DM1.tNotaFiscal.SetRangeStart;
      DM1.tNotaFiscalCodVendedor.AsInteger := DM1.tVendedorCodigo.AsInteger;
      DM1.tNotaFiscalDtEmissao.AsDateTime  := DateEdit1.Date;
      DM1.tNotaFiscal.SetRangeEnd;
      DM1.tNotaFiscalCodVendedor.AsInteger := DM1.tVendedorCodigo.AsInteger;
      DM1.tNotaFiscalDtEmissao.AsDateTime  := DateEdit2.Date;
      DM1.tNotaFiscal.ApplyRange;}
      Dm1.tNotaFiscal.Filtered := False;
      if RxDBLookupCombo1.Text <> '' then
        Dm1.tNotaFiscal.Filter := 'DtEmissao >= ''' + DateEdit1.Text + ''' and DtEmissao <= ''' + DateEdit2.Text + ''' and CodVendedor = ''' + IntToStr(RxDBLookupCombo1.KeyValue) + ''''
      else
        Dm1.tNotaFiscal.Filter := 'DtEmissao >= ''' + DateEdit1.Text + ''' and DtEmissao <= ''' + DateEdit2.Text + '''';
      Dm1.tNotaFiscal.Filtered := True;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := DM1.tNotaFiscal.RecordCount;
    // Chama a procedure da impressão
      if DM1.tNotaFiscal.RecordCount > 0 then
        begin
          fRelNotasVendedor := TfRelNotasVendedor.Create(Self);
          fRelNotasVendedor.RLReport1.Preview;
          fRelNotasVendedor.RLReport1.Free;
        end;
    // Cancela o SetRangeStart, e a tabela volta ao normal
//      DM1.tNotaFiscal.CancelRange;
      Dm1.tNotaFiscal.Filtered := False;
      DM1.tPedido.IndexFieldNames     := 'Pedido';
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
    // Diminuiu o tamanho do Form e o cursor volta ao normal
      Screen.Cursor := crDefault;
      ProgressBar1.Position := 0;
      Panel1.Height := 103;
      fPrevNotasVendedor.Height := 131;
      fPrevNotasVendedor.Refresh;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevNotasVendedor.FormShow(Sender: TObject);
begin
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalItens.Open;
  DM1.tNotaFiscalParc.Open;
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  DM1.tPedido.Open;
end;

end.
