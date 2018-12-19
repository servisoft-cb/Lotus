unit UPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup;

type
  TfPlanoContas = class(TForm)
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
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label7: TLabel;
    tPlanoContasIns: TTable;
    tPlanoContasInsCodigo: TIntegerField;
    tPlanoContasInsDescricao: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure Habilita(Estado : Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlanoContas: TfPlanoContas;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfPlanoContas.Habilita(Estado : Boolean);
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

procedure TfPlanoContas.BitBtn4Click(Sender: TObject);
begin
  DM1.tPlanoContas.Cancel;
  Close;
end;

procedure TfPlanoContas.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tPlanoContas.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tPlanoContas.Cancel;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfPlanoContas.FormClose(Sender: TObject; var Action: TCloseAction);
{var
  i : Integer;}
begin
  if Screen.FormCount < 3 then
    DM1.tPlanoContas.Close;
{  for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] is TfNotaFiscal) and (fNotaFiscal.Showing) then
        DataModule1.tNotaFiscalCodNatOper.AsString := DataModule1.tNatOperacaoCodNatOper.AsString;
    end;}
  Action := Cafree;
end;

procedure TfPlanoContas.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsPlanoCtas.AsBoolean then
    begin
      DM1.tPlanoContas.IndexFieldNames := 'Codigo';
      DM1.tPlanoContas.Last;
      tPlanoContasIns.Refresh;
      tPlanoContasIns.Last;
      DM1.tPlanoContas.Refresh;
      tPlanoContasIns.Refresh;
      DM1.tPlanoContas.Insert;
      DM1.tPlanoContasCodigo.AsInteger := tPlanoContasInsCodigo.AsInteger + 1;
      DM1.tPlanoContas.Post;
      DM1.tPlanoContas.Edit;
      Habilita(True);
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPlanoContas.BitBtn6Click(Sender: TObject);
begin
  DM1.tPlanoContas.Post;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfPlanoContas.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPlanoCtas.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta conta?',mtconfirmation,
                [mbok,mbno],0)=mrok then
        DM1.tPlanoContas.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfPlanoContas.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPlanoCtas.AsBoolean then
    begin
      DM1.tPlanoContas.IndexFieldNames := 'Codigo';
      DM1.tPlanoContas.Edit;
      BitBtn2.Tag := 1;
      Habilita(True);
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPlanoContas.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  Habilita(False);
end;

procedure TfPlanoContas.FormShow(Sender: TObject);
begin
  DM1.tPlanoContas.Open;
  DM1.tPlanoContas.Last;
  Habilita(False);
end;

procedure TfPlanoContas.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfPlanoContas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Codigo';
end;

procedure TfPlanoContas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tPlanoContas.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta operação!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPlanoContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
