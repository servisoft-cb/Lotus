unit UPrevExtComissaoModPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids;

type
  TfPrevExtComissaoModPed = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Bevel1: TBevel;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    qComissao: TQuery;
    qsComissao: TDataSource;
    qComissaoDtEmissao: TDateField;
    qComissaoPedido: TIntegerField;
    qComissaoItem: TIntegerField;
    qComissaoQtdParesRest: TFloatField;
    qComissaoPreco: TFloatField;
    qComissaoReferencia: TIntegerField;
    qComissaoCodModelista: TIntegerField;
    qComissaoComissaoMod: TFloatField;
    qComissaolkNomeModelista: TStringField;
    qComissaoVlrDesconto: TFloatField;
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
  fPrevExtComissaoModPed: TfPrevExtComissaoModPed;
  linha, pagina : Integer;
  F: TextFile;
  vBaseTotal,vTotalComissao : Real;
  TextoDet : string;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevExtComissaoModPed.Imprimir;
var
  Texto : String;
  vCodModelista : Integer;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);

  vCodModelista := 0;  
  qComissao.First;
  while not qComissao.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho
      else
      if (vCodModelista > 0) and (vCodModelista <> qComissaoCodModelista.AsInteger) then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      qComissao.Next;
      vCodModelista := qComissaoCodModelista.AsInteger;
    end;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      WinExec(PChar(Texto),SW_MAXIMIZE);
    end;
end;

procedure TfPrevExtComissaoModPed.Imprime_Cabecalho;
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

  Writeln(F,'                      RELACAO DE COMISSOES POR MODELISTA (PEDIDOS)');
  DM1.tEmpresa.First;
  Texto1 := Copy(DM1.tEmpresaEmpresa.AsString,1,50);
  For i := 1 to 61 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);
  Texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
  For i := 1 to 61 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'--------------------------------------------------------------------------------');
  Texto1 := 'Modelista.:' + qComissaolkNomeModelista.AsString;
  Writeln(F,Texto1);
  Writeln(F,'--------------------------------------------------------------------------------');
  Writeln(F,'Dt.Pedido   No.Pedido  Item  Referencia     Valor Base   %Comis.     Vlr. Comis.');
  Writeln(F,'--------------------------------------------------------------------------------');

  linha := 8;
end;

procedure TfPrevExtComissaoModPed.Imprime_Detalhe;
var
 i : Integer;
 Texto1 : String;
 vComissao, vAux: Real;
begin
  TextoDet := qComissaoDtEmissao.AsString + '  ';
  Texto1 := qComissaoPedido.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '     ';
  Texto1 := qComissaoItem.AsString;
  for i := 1 to 3 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '    ';
  Texto1 := qComissaoReferencia.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '  ';
  vAux   := StrToFloat(FormatFloat('0.00',(qComissaoPreco.AsFloat - qComissaoVlrDesconto.AsFloat)));
  vAux   := StrToFloat(FormatFloat('0.00',(qComissaoQtdParesRest.AsFloat * vAux)));
  vBaseTotal := vBaseTotal + vAux;
  Texto1 := FormatFloat('###,###,##0.00',(vAux));
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '   ';
  Texto1 := FormatFloat('##0.00',(qComissaoComissaoMod.AsFloat));
  for i := 1 to 6 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet  := TextoDet + Texto1 + '  ';
  vComissao := StrToFloat(FormatFloat('###,###,##0.00',(vAux * qComissaoComissaoMod.AsFloat / 100)));
  Texto1    := FormatFloat('###,###,##0.00',(vComissao));
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1;
  vTotalComissao := vTotalComissao + vComissao;
  Writeln(F,TextoDet);
  Linha := Linha + 1;
end;

procedure TfPrevExtComissaoModPed.Imprime_Rodape;
var
  Texto1 : String;
  i : Integer;
begin
  if linha > 58 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
      Linha := 0;
    end;
  Writeln(F,'                        -------------------------------------------------------');
  TextoDet := '                        Total Geral=> ';
  Texto1   := FormatFloat('#,###,###,##0.00',vBaseTotal);
  for i := 1 to 18 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + '     ';
  Texto1   := FormatFloat('#,###,###,##0.00',vTotalComissao);
  for i := 1 to 18 - Length(Texto1) do
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

procedure TfPrevExtComissaoModPed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tModelista.Close;
      DM1.tCliente.Close;
      DM1.tProduto.Close;
      DM1.tExtComissaoMod.Close;
      DM1.tPedido.Close;
      DM1.tPedidoItem.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevExtComissaoModPed.BitBtn6Click(Sender: TObject);
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
      Screen.Cursor  := crHourglass;
      vBaseTotal     := 0;
      vTotalComissao := 0;
      qComissao.Filtered := False;
      qComissao.Active := False;
      qComissao.Params[0].AsDateTime := DateEdit1.Date;
      qComissao.Params[1].AsDateTime := DateEdit2.Date;
      qComissao.Active := True;
      if RxDBLookupCombo1.Text <> '' then
        begin
          qComissao.Filter   := 'CodModelista = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
          qComissao.Filtered := True;
        end;
      if qComissao.RecordCount > 0 then
        Imprimir;
      Screen.Cursor := crDefault;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevExtComissaoModPed.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevExtComissaoModPed.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfPrevExtComissaoModPed.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Codigo';
end;

procedure TfPrevExtComissaoModPed.FormShow(Sender: TObject);
begin
  DM1.tModelista.Open;
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tExtComissaoMod.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
end;

end.
