unit UPrevContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Menus, RXCtrls, Printers,
  Db, DBTables, RxLookup;

type
  TfPrevContas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    tMovimentosIns: TTable;
    tMovimentosInsCodConta: TIntegerField;
    tMovimentosInsNumMovimento: TAutoIncField;
    tMovimentosInsNumCReceber: TIntegerField;
    tMovimentosInsNumCPagar: TIntegerField;
    tMovimentosInsNumPedVenda: TIntegerField;
    tMovimentosInsDtMovimento: TDateField;
    tMovimentosInsVlrMovDebito: TFloatField;
    tMovimentosInsVlrMovCredito: TFloatField;
    tMovimentosInsHistorico: TStringField;
    tMovimentosInsNumChequePag: TIntegerField;
    tMovimentosInsPlanoContas: TIntegerField;
    tMovimentosInsNumNota: TIntegerField;
    tMovimentosInsCodCli: TIntegerField;
    tMovimentosInsCodForn: TIntegerField;
    tMovimentosInsNumNotaEnt: TIntegerField;
    tMovimentosInsSaldoCliente: TFloatField;
    tMovimentosInsSaldoFornecedor: TFloatField;
    tMovimentosInsSaldoPlanoContas: TFloatField;
    tMovimentosInsSaldoConta: TFloatField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Calcula_Saldos;
  public
    { Public declarations }
  end;

var
  fPrevContas: TfPrevContas;
  vSaldoInicial, vSaldoFinal : Real;

implementation

uses UDM1, URelContas;

{$R *.DFM}

procedure TfPrevContas.Calcula_Saldos;
begin
  vSaldoInicial := 0;
  vSaldoFinal   := 0;
  vSaldoInicial := DM1.tContasSaldoConta.AsFloat;
  tMovimentosIns.Filtered := False;
  tMovimentosIns.Filter   := 'DtMovimento >= '''+DateToStr(DateTimePicker1.Date)+''' and CodConta = '''+DM1.tContasCodConta.AsString+'''';
  tMovimentosIns.Filtered := True;
  tMovimentosIns.First;
  while not tMovimentosIns.Eof do
    begin
      vSaldoInicial := vSaldoInicial - tMovimentosInsVlrMovCredito.AsFloat
                                     + tMovimentosInsVlrMovDebito.AsFloat;
      tMovimentosIns.Next;
    end;
  tMovimentosIns.Filtered := False;
  vSaldoFinal             := vSaldoInicial;
  tMovimentosIns.Filtered := False;
  tMovimentosIns.Filter   := 'DtMovimento >= '''+DateToStr(DateTimePicker1.Date)+''' and DtMovimento <= '''+DateToStr(DateTimePicker2.Date)+''' and CodConta = '''+DM1.tContasCodConta.AsString+'''';
  tMovimentosIns.Filtered := True;
  tMovimentosIns.First;
  while not tMovimentosIns.Eof do
    begin
      vSaldoFinal := vSaldoFinal + tMovimentosInsVlrMovCredito.AsFloat
                                 - tMovimentosInsVlrMovDebito.AsFloat;
      tMovimentosIns.Next;
    end;
end;

procedure TfPrevContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tMovimentosIns.Filtered := False;
  if Screen.FormCount < 3 then
    DM1.tContas.Close;
  Action := CaFree;
end;

procedure TfPrevContas.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevContas.FormShow(Sender: TObject);
begin
  DM1.tContas.Open;
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
end;

procedure TfPrevContas.Imprimir1Click(Sender: TObject);
begin
  if DateTimePicker1.Date > DateTimePicker2.Date then
    ShowMessage('Data final não pode ser menor que inicial!')
  else
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Deve-se escolher uma conta!')
  else
    begin
      Calcula_Saldos;
      fRelContas := TfRelContas.Create(Self);
      fRelContas.QuickRep1.Print;
      fRelContas.QuickRep1.Free;
      tMovimentosIns.Filtered := False;
    end;
end;

procedure TfPrevContas.Visualizar1Click(Sender: TObject);
begin
  if DateTimePicker1.Date > DateTimePicker2.Date then
    ShowMessage('Data final não pode ser menor que inicial!')
  else
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Deve-se escolher uma conta!')
  else
    begin
      Calcula_Saldos;
      fRelContas := TfRelContas.Create(Self);
      fRelContas.QuickRep1.Preview;
      fRelContas.QuickRep1.Free;
      tMovimentosIns.Filtered := False;
    end;
end;

end.
