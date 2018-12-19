unit UPrevPedidosNaoFat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, ShellApi;

type
  TfPrevPedidosNaoFat = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
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
    RadioGroup1: TRadioGroup;
    RxDBFilter2: TRxDBFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
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
  fPrevPedidosNaoFat: TfPrevPedidosNaoFat;
  linha, pagina : Integer;
  F: TextFile;
  TextoDet : string;
  vVlrNormal, vVlrNormalCom, vVlrSuspenso, vVlrSuspensoCom : Real;
  vQtdNormal, vQtdSuspenso : Integer;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevPedidosNaoFat.Imprimir;
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

  vVlrNormal      := 0;
  vVlrNormalCom   := 0;
  vVlrSuspenso    := 0;
  vVlrSuspensoCom := 0;
  vQtdNormal      := 0;
  vQtdSuspenso    := 0;

  DM1.tPedido.Refresh;
  DM1.tPedido.First;
  while not DM1.tPedido.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      DM1.tPedido.Next;
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

procedure TfPrevPedidosNaoFat.Imprime_Cabecalho;
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
  Texto1 := Texto1 + 'RELACAO DE PEDIDOS NAO FATURADOS                            Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  Texto1 := 'Vendedor: ' + RxDBLookupCombo1.Text;
  for i := 1 to 53 - length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                            Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,' Pedido    Periodo de Embarque   Cliente                                  Pares     Valor Total  % Comissao  Valor Comissao Suspenso');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevPedidosNaoFat.Imprime_Detalhe;
var
 i, vQtd : Integer;
 Texto1 : String;
 vComissao, vVlrPedido, vAux: Real;
begin
  Texto1   := DM1.tPedidoPedido.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := Texto1 + '  ' + DM1.tPedidoDtIniEmbarque.AsString + ' a ' + DM1.tPedidoDtFinEmbarque.AsString + ' ';
  Texto1 := DM1.tPedidolkNomeCliente.AsString;
  for i := 1 to 40 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  vQtd       := 0;
  vVlrPedido := 0;
  DM1.tPedidoItem.First;
  while not DM1.tPedidoItem.Eof do
    begin
      if DM1.tPedidoItemCancelado.AsBoolean <> True then
        begin
          vQtd       := vQtd + DM1.tPedidoItemQtdParesRest.AsInteger;
          vAux       := StrToFloat(FormatFloat('0.00',(DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat)));
          vVlrPedido := vVlrPedido + StrToFloat(FormatFloat('0.00',(vAux * DM1.tPedidoItemQtdParesRest.AsInteger)));
        end;
      DM1.tPedidoItem.Next;
    end;
  Texto1   := FormatFloat('####0',vQtd);
  for i := 1 to 05 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '  ';
  Texto1   := FormatFloat('###,###,##0.00',vVlrPedido);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '    ';
  Texto1   := FormatFloat('##0.00',DM1.tPedidoPercComissao.AsFloat);
  for i := 1 to 6 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '    ';
  vComissao := vVlrPedido * DM1.tPedidoPercComissao.AsFloat / 100;
  Texto1   := FormatFloat('###,###,##0.00',vComissao);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '    ';
  if DM1.tPedidoSuspenso.AsBoolean = False then
    begin
      TextoDet   := TextoDet + 'Nao';
      vVlrNormal := vVlrNormal + vVlrPedido;
      vVlrNormalCom := vVlrNormalCom + vComissao;
      vQtdNormal  := vQtdNormal + vQtd;
    end
  else
    begin
      TextoDet := TextoDet + 'Sim';
      vVlrSuspenso := vVlrSuspenso + vVlrPedido;
      vVlrSuspensoCom := vVlrSuspensoCom + vComissao;
      vQtdSuspenso  := vQtdSuspenso + vQtd;
    end;
  Writeln(F,TextoDet);
  Linha := Linha + 1;
end;

procedure TfPrevPedidosNaoFat.Imprime_Rodape;
var
  Texto1 : String;
  i : Integer;
  vAux : Real;
begin
// Imprime os totais normal
  Writeln(F,'                                 ---------------------------------------------------------------------------------------------------');
  TextoDet := '                                 Total do Vendedor: NORMAL.............:  ';
  Texto1   := FormatFloat('####0',vQtdNormal);
  for i := 1 to 5 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '  ';
  Texto1   := FormatFloat('###,###,##0.00',vVlrNormal);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '              ';
  Texto1   := FormatFloat('###,###,##0.00',vVlrNormalCom);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1;
  Writeln(F,TextoDet);
// Imprime os totais suspenso
  TextoDet := '                                                    SUSPENSO...........:  ';
  Texto1   := FormatFloat('####0',vQtdSuspenso);
  for i := 1 to 5 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '  ';
  Texto1   := FormatFloat('###,###,##0.00',vVlrSuspenso);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '              ';
  Texto1   := FormatFloat('###,###,##0.00',vVlrSuspensoCom);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1;
  Writeln(F,TextoDet);
// Imprime o total geral
  TextoDet := '                                                    T O T A L..........:  ';
  vAux := vQtdNormal + vQtdSuspenso;
  Texto1   := FormatFloat('####0',vAux);
  for i := 1 to 5 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '  ';
  vAux := vVlrNormal + vVlrSuspenso;
  Texto1   := FormatFloat('###,###,##0.00',vAux);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '              ';
  vAux := vVlrNormalCom + vVlrSuspensoCom;
  Texto1   := FormatFloat('###,###,##0.00',vAux);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1;
  Writeln(F,TextoDet);

  linha := linha + 4;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  Write(F,#18);
end;

procedure TfPrevPedidosNaoFat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter2.Active := False;
  Dm1.tPedido.Close;
  Dm1.tPedidoItem.Close;
  DM1.tVendedor.Close;
  Action := Cafree;
end;

procedure TfPrevPedidosNaoFat.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') or (RxDBLookupCombo1.Text = '') then
    begin
      ShowMessage('Há campos em branco!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final!')
  else
    begin
    // Aumenta o tamanho do form para aperecer o progressbar e o cursor, fica uma ampulheta

      Screen.Cursor := crHourglass;
      Panel1.Height := 171;
      fPrevPedidosNaoFat.Height := 200;
      fPrevPedidosNaoFat.Refresh;

   // Filtra as notas conforme a situação escolhida
      RxDBFilter2.Active := False;
      RxDBFilter2.Filter.Clear;
      case RadioGroup1.ItemIndex of
        0 : RXDBFilter2.Filter.Add('Situacao = 1');
        1 : RXDBFilter2.Filter.Add('Situacao = 2');
        2 : RXDBFilter2.Filter.Add('');
      end;
      RxDBFilter2.Active := True;
      DM1.tPedido.Filtered := False;
      DM1.tPedido.Filter   := 'DtIniEmbarque >= ''' + DateEdit1.Text + ''' and DtIniEmbarque <= ''' + DateEdit2.Text + ''' and CodVendedor = ''' + RxDBLookupCombo1.Value + '''';
      DM1.tPedido.Filtered := True;

      ProgressBar1.Position := 0;
      ProgressBar1.Max := DM1.tPedido.RecordCount;
    // Chama a procedure da impressão
      if DM1.tPedido.RecordCount > 0 then
        Imprimir;
      DM1.tPedido.Filtered := False;
    // Diminui o tamanho do Form e o cursor volta ao normal
      Screen.Cursor := crDefault;
      ProgressBar1.Position := 0;
      Panel1.Height := 144;
      fPrevPedidosNaoFat.Height := 172;
      fPrevPedidosNaoFat.Refresh;

      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevPedidosNaoFat.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPedidosNaoFat.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevPedidosNaoFat.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevPedidosNaoFat.FormShow(Sender: TObject);
begin
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  DM1.tVendedor.Open;
end;

end.
