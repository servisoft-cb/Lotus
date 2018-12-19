unit UContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup;

type
  TfContas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    DBText1: TDBText;
    Panel5: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    tContas: TTable;
    tContasCodConta: TIntegerField;
    tContasNomeConta: TStringField;
    tContasSaldoConta: TFloatField;
    tContasTipoConta: TStringField;
    BitBtn6: TBitBtn;
    tContasIns: TTable;
    tContasInsCodConta: TIntegerField;
    tContasInsNomeConta: TStringField;
    tContasInsSaldoConta: TFloatField;
    tContasInsTipoConta: TStringField;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    tContasInsCodBanco: TStringField;
    tContasCodBanco: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Habilita(Estado : Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn6Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContas : TfContas;
  Saldo   : Real;

implementation

uses UDM1, UMovimentos, UAgendaTelef;

{$R *.DFM}

procedure TfContas.Habilita(Estado : Boolean);
begin
  Panel3.Enabled           := Estado;
  BitBtn1.Enabled          := not Estado;
  BitBtn2.Enabled          := not Estado;
  BitBtn3.Enabled          := not Estado;
  BitBtn4.Enabled          := not Estado;
  BitBtn5.Enabled          := Estado;
  BitBtn6.Enabled          := Estado;
  DBNavigator1.Enabled     := not Estado;
  RxDbLookUpCombo1.Enabled := not Estado;
end;

procedure TfContas.BitBtn4Click(Sender: TObject);
begin
  DM1.tContas.Cancel;
  Close;
end;

procedure TfContas.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tContas.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tContas.Cancel;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tContas.Close;
      DM1.tMovimentos.Close;
    end;
  Action := Cafree;
end;

procedure TfContas.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsContas.AsBoolean then
    begin
      tContasIns.IndexFieldNames    := 'CodConta';
      tContasIns.Refresh;
      tContasIns.Last;
      DM1.tContas.IndexFieldNames   := 'CodConta';
      DM1.tContas.Insert;
      DM1.tContasCodConta.AsInteger := tContasInsCodConta.AsInteger + 1;
      DM1.tContasTipoConta.AsString := 'B';
      DM1.tContas.Post;
      DM1.tContas.Edit;
      Habilita(True);
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfContas.BitBtn6Click(Sender: TObject);
Function ExisteCaixa : Boolean;
var Achou : Boolean;
begin
  tContas.First;
  Achou := False;
  while (not tContas.EOF) and (not Achou) do
    begin
      if (tContasTipoConta.AsString = 'C') and (tContasCodConta.AsInteger <> DM1.tContasCodConta.AsInteger) then
        Achou := True;
      tContas.Next;
    end;
  if Achou then
    ExisteCaixa := True
  else
    ExisteCaixa := False;
 end;
begin
  if DBEdit1.Text <> '' then
    begin
      if (DbRadioGroup1.Value = 'C') and (ExisteCaixa) then
        begin
          ShowMessage('Já existe uma conta do tipo caixa! Esta conta será apagada!');
          DM1.tContas.Delete;
          Habilita(False);
        end
      else
        begin
          if DM1.tContas.State in [dsEdit,dsInsert] then
            begin
              DM1.tContas.Post;
              Habilita(False);
              BitBtn2.Tag := 0;
              BitBtn1.SetFocus;
              fMovimentos := TfMovimentos.Create(Self);
              fMovimentos.Label7.Caption := FormatFloat('###,##0.00',fMovimentos.SaldoGeral);
              fMovimentos.MontaFluxo;
            end;
        end;
    end
  else
    begin
      DBEdit1.SetFocus;
      ShowMessage('Deve haver o nome da conta!');
    end;
end;

procedure TfContas.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcContas.AsBoolean then
    begin
      if MessageDlg(' Esta operação apagará todos os movimentos desta conta. Deseja realmente excluir a conta?',mtconfirmation,
                [mbok,mbno],0) = mrOK then
        begin
          DM1.tMovimentos.First;
          while not DM1.tMovimentos.EOF do
            DM1.tMovimentos.Delete;
          DM1.tContas.delete;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfContas.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltContas.AsBoolean then
    begin
      DM1.tContas.IndexFieldNames := 'CodConta';
      DM1.tContas.Edit;
      Habilita(True);
      BitBtn2.Tag := 1;
      Saldo := DM1.tContasSaldoConta.AsFloat;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfContas.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  Habilita(False);
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfContas.DBLookupComboBox1DropDown(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfContas.FormShow(Sender: TObject);
begin
  DM1.tContas.Open;
  DM1.tMovimentos.Open;
  DM1.tContas.Refresh;
  DM1.tContas.Last;
  Habilita(False);
end;

procedure TfContas.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfContas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if DM1.tContas.State in [dsInsert,dsEdit] then
    begin
     ShowMessage('Você deve Cancelar ou Confirmar antes de fechar esta janela!');
     CanClose := False;
    end
 else
    CanClose := True;
end;

procedure TfContas.BitBtn6Enter(Sender: TObject);
begin
  if DM1.tContas.State in [dsInsert] then
    begin
      tContasIns.IndexFieldNames := 'NomeConta';
      tContasIns.Refresh;
      tContasIns.SetKey;
      tContasIns.FieldByName('NomeConta').AsString := DBEdit1.Text;
      if tContasIns.GotoKey then
        begin
          ShowMessage('Conta já cadastrada!');
          DM1.tContas.Cancel;
          DM1.tContas.Insert;
          DBEdit1.SetFocus;
        end;
    end;
end;

procedure TfContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
