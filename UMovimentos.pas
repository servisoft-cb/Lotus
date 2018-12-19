unit UMovimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, RXLookup, Grids, DBGrids,
  RXDBCtrl, ToolEdit, Mask, RXCtrls, Db, DBTables, MemTable, DBFilter;

type
  TfMovimentos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel5: TPanel;
    RxDBGrid2: TRxDBGrid;
    RxLabel1: TRxLabel;
    SpeedButton1: TSpeedButton;
    RxLabel2: TRxLabel;
    Panel7: TPanel;
    RxLabel3: TRxLabel;
    Panel8: TPanel;
    RxDBGrid3: TRxDBGrid;
    RxLabel4: TRxLabel;
    Panel9: TPanel;
    RxLabel5: TRxLabel;
    Label6: TLabel;
    Label7: TLabel;
    tCPagarParc: TTable;
    tCReceberParc: TTable;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tCPagarParcNumCPagar: TIntegerField;
    tCPagarParcParcCPagar: TIntegerField;
    tCPagarParcDtVencCPagar: TDateField;
    tCPagarParcVlrParcCPagar: TFloatField;
    tCPagarParcQuitParcCPagar: TBooleanField;
    tCPagarParcDtPagParcCPagar: TDateField;
    tCPagarParcJurosParcCPagar: TFloatField;
    tCPagarParcCodForn: TIntegerField;
    tCPagarParcNumNotaEnt: TIntegerField;
    tCPagarParcDesconto: TFloatField;
    tCPagarParcPgtoParcial: TFloatField;
    tCPagarParcRestParcela: TFloatField;
    tCPagarParcBanco: TStringField;
    tCPagarParcPlanoContas: TIntegerField;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumNota: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tContasIns: TTable;
    tContasInsCodConta: TIntegerField;
    tContasInsNomeConta: TStringField;
    tContasInsSaldoConta: TFloatField;
    tContasInsTipoConta: TStringField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tContasInsCodBanco: TStringField;
    tCReceberParcAgencia: TStringField;
    tCReceberParcCodConta: TIntegerField;
    tCReceberParcPgCartorio: TBooleanField;
    tCReceberParcDiasAtraso: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    qFluxo: TQuery;
    qFluxoData: TDateField;
    qFluxoPagar: TFloatField;
    qFluxoReceber: TFloatField;
    mFluxo: TMemoryTable;
    mFluxoData: TDateField;
    mFluxoPagar: TFloatField;
    mFluxoReceber: TFloatField;
    mFluxoSaldo: TFloatField;
    dsFluxo: TDataSource;
    qAtrasoPg: TQuery;
    qAtrasoPgPagar: TFloatField;
    dsAtrasoPg: TDataSource;
    qAtrasoRc: TQuery;
    FloatField2: TFloatField;
    dsAtrasoRc: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Bevel1: TBevel;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure MontaFluxo;
    function SaldoGeral : Real;
    { Public declarations }
  end;

var
  fMovimentos: TfMovimentos;

implementation

uses UDM1, UContas, UEntradaMovimentos, UPrevContas, UAgendaTelef;

{$R *.DFM}

procedure TfMovimentos.MontaFluxo;
var
  Saldo : Real;
begin
  mFluxo.EmptyTable;
  qFluxo.Params[0].AsDateTime    := Date;
  qAtrasoRC.Params[0].AsDateTime := Date;
  qAtrasoPG.Params[0].AsDateTime := Date;
  qFluxo.Active                  := False;
  qAtrasoRC.Active               := False;
  qAtrasoPG.Active               := False;
  qFluxo.Active                  := True;
  qAtrasoRC.Active               := True;
  qAtrasoPG.Active               := True;
  RxDBGrid3.Refresh;
  Saldo                          := SaldoGeral;
  qFluxo.First;
  while not qFluxo.EOf do
    begin
      if mFluxo.Locate('Data',qFluxoData.AsDateTime,[loCaseInsensitive]) then
        begin
          mFluxo.Edit;
          mFluxoPagar.AsFloat   := mFluxoPagar.AsFloat + qFluxoPagar.AsFloat;
          mFluxoReceber.AsFloat := mFluxoReceber.AsFloat + qFluxoReceber.AsFloat;
          mFluxoSaldo.AsFloat   := mFluxoSaldo.AsFloat + qFluxoReceber.AsFloat - qFluxoPagar.AsFloat;
          Saldo                 := mFluxoSaldo.AsFloat;
          mFluxo.Post;
        end
      else
        begin
          mFluxo.Insert;
          mFluxoData.AsDateTime := qFluxoData.AsDateTime;
          mFluxoPagar.AsFloat   := qFluxoPagar.AsFloat;
          mFluxoReceber.AsFloat := qFluxoReceber.AsFloat;
          Saldo                 := Saldo + qFluxoReceber.AsFloat - qFluxoPagar.AsFloat;
          mFluxoSaldo.AsFloat   := Saldo;
          mFluxo.Post;
        end;
      qFluxo.Next;
    end;
end;

Function TfMovimentos.SaldoGeral : Real;
var
  Saldo : Real;
begin
  Saldo := 0;
  tContasIns.First;
  While not tContasIns.EOF do
    begin
      Saldo := Saldo + tContasIns.FieldByName('SaldoConta').AsFloat;
      tContasIns.Next;
    end;
  SaldoGeral := Saldo;
end;

procedure TfMovimentos.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfMovimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tMovimentos.Close;
  DM1.tContas.Close;
  DM1.tCondPgto.Close;
  DM1.tCondPgtoItem.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  Action := Cafree;
end;

procedure TfMovimentos.FormShow(Sender: TObject);
begin
  DM1.tMovimentos.Open;
  DM1.tContas.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tMovimentos.Refresh;
  DM1.tMovimentos.Last;
  Label7.Caption := FormatFloat('###,##0.00',SaldoGeral);
  MontaFluxo;
  DM1.tContas.First;
end;

procedure TfMovimentos.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioContas.AsBoolean then
    begin
      Application.CreateForm(TfContas,fContas);
      fContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfMovimentos.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      DM1.tContas.FindKey([DM1.tMovimentosCodConta.AsInteger]);
      DM1.tContas.Edit;
      DM1.tContasSaldoConta.AsFloat := DM1.tContasSaldoConta.AsFloat +
                                       DM1.tMovimentosVlrMovDebito.AsFloat -
                                       DM1.tMovimentosVlrMovCredito.AsFloat;
      DM1.tMovimentos.Delete;
{      DataModule1.tPlanoContas.Edit;
      DataModule1.tPlanoContasSaldo.AsFloat := DataModule1.tPlanoContasSaldo.AsFloat -
                                               DataModule1.tMovimentosVlrMovDebito.AsFloat +
                                               DataModule1.tMovimentosVlrMovCredito.AsFloat;
      DataModule1.tPlanoContas.Post;}  // rotina p/atualizar o saldo do Plano de Contas
      DM1.tContas.Post;
      Label7.Caption := FormatFloat('###,##0.00',SaldoGeral);
      MontaFluxo;
    end;
end;

procedure TfMovimentos.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioEntrMov.AsBoolean then
    begin
      fEntradaMovimentos := TfEntradaMovimentos.Create(Self);
      fEntradaMovimentos.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfMovimentos.BitBtn3Click(Sender: TObject);
begin
  fPrevContas := TfPrevContas.Create(Self);
  fPrevContas.ShowModal;
end;

procedure TfMovimentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
