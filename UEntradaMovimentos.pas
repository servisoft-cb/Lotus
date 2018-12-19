unit UEntradaMovimentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup, ToolEdit, RXDBCtrl;

type
  TfEntradaMovimentos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn6: TBitBtn;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    tContas: TTable;
    dsContas: TDataSource;
    tContasCodConta: TIntegerField;
    tContasNomeConta: TStringField;
    tContasSaldoConta: TFloatField;
    tContasTipoConta: TStringField;
    tContasCodBanco: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita(Estado : Boolean);
  public
    { Public declarations }
  end;

var
  fEntradaMovimentos: TfEntradaMovimentos;

implementation

uses UDM1, UMovimentos,UPlanoContas, UAgendaTelef;

{$R *.DFM}

procedure TfEntradaMovimentos.Habilita(Estado : Boolean);
begin
  Panel3.Enabled           := not(Panel3.Enabled);
  BitBtn1.Enabled          := not(BitBtn1.Enabled);
  BitBtn4.Enabled          := not(BitBtn4.Enabled);
  BitBtn5.Enabled          := not(BitBtn5.Enabled);
  BitBtn6.Enabled          := not(BitBtn6.Enabled);
  DM1.tMovimentos.MasterSource.Enabled := not(DM1.tMovimentos.MasterSource.Enabled);
end;

procedure TfEntradaMovimentos.BitBtn4Click(Sender: TObject);
begin
  DM1.tMovimentos.Cancel;
  Close;
end;

procedure TfEntradaMovimentos.BitBtn5Click(Sender: TObject);
begin
  DM1.tMovimentos.Cancel;
  Habilita(False);
end;

procedure TfEntradaMovimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tContas.Close;
      DM1.tMovimentos.Close;
      DM1.tPlanoContas.Close;
    end;
  Action := Cafree;
end;

procedure TfEntradaMovimentos.BitBtn1Click(Sender: TObject);
begin
  Habilita(True);
  DM1.tMovimentos.Insert;
  DM1.tMovimentosDtMovimento.AsDateTime := Date();
  RxDBLookUpCombo1.SetFocus;
end;

procedure TfEntradaMovimentos.BitBtn6Click(Sender: TObject);
begin
  if RxDBLookUpCombo1.Text = '' then
    ShowMessage('Uma conta deve ser selecionada!')
  else
  if ((DBEdit2.Text <> '') and (DBEdit3.Text <> '')) or
     ((DBEdit2.Text = '') and (DBEdit3.Text = '')) then
    ShowMessage('Deve ser inserido somente Débito ou somente Crédito!')
  else
  if DBEdit4.Text = '' then
    ShowMessage('Deve ser inserido um Histórico!')
  else
    begin
      DM1.tContas.FindKey([DM1.tMovimentosCodConta.AsInteger]);
      DM1.tContas.Edit;
      DM1.tContasSaldoConta.AsFloat := DM1.tContasSaldoConta.AsFloat -
                                       DM1.tMovimentosVlrMovDebito.AsFloat +
                                       DM1.tMovimentosVlrMovCredito.AsFloat;
{      DataModule1.tPlanoContas.Edit;
      DataModule1.tPlanoContasSaldo.AsFloat := DataModule1.tPlanoContasSaldo.AsFloat -
                                               DataModule1.tMovimentosVlrMovDebito.AsFloat +
                                               DataModule1.tMovimentosVlrMovCredito.AsFloat;
      DataModule1.tPlanoContas.Post;}  // rotina p/atualizar o saldo do Plano de Contas
      DM1.tContas.Post;
      fMovimentos.Label7.Caption := FormatFloat('###,##0.00',fMovimentos.SaldoGeral);
      DM1.tMovimentos.Post;
      Habilita(False);
    end;
end;

procedure TfEntradaMovimentos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tMovimentos.State in [dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar Movimento antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfEntradaMovimentos.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de plano de contas!');
end;

procedure TfEntradaMovimentos.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfEntradaMovimentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfEntradaMovimentos.FormShow(Sender: TObject);
begin
  DM1.tContas.Open;
  DM1.tMovimentos.Open;
  DM1.tPlanoContas.Open;
end;

end.
