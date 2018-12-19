unit UGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfGrupos = class(TForm)
    tGrupoIns: TTable;
    tGrupoInsCodigo: TIntegerField;
    tGrupoInsNome: TStringField;
    tGrupoInsSeparaCor: TBooleanField;
    tGrupoInsSeparaTam: TBooleanField;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    DBCheckBox3: TDBCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrupos: TfGrupos;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfGrupos.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfGrupos.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tGrupo.Close;
  Action := Cafree;
end;

procedure TfGrupos.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsGrupos.AsBoolean then
    begin
      tGrupoIns.IndexFieldNames   := 'Codigo';
      DM1.tGrupo.IndexFieldNames := 'Codigo';
      tGrupoIns.Refresh;
      tGrupoIns.Last;
      DM1.tGrupo.Refresh;
      DM1.tGrupo.Insert;
      DM1.tGrupoCodigo.AsInteger :=  tGrupoInsCodigo.AsInteger + 1;
      DM1.tGrupo.Post;
      DM1.tGrupo.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfGrupos.BitBtn5Click(Sender: TObject);
begin
  DM1.tGrupo.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfGrupos.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tGrupo.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tGrupo.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfGrupos.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltGrupos.AsBoolean then
    begin
      DM1.tGrupo.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfGrupos.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcGrupos.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tGrupo.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfGrupos.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfGrupos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tGrupo.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o grupo antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfGrupos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
//  if (Shift = [ssCtrl]) and (Key = 76) then
//    DM1.Login;
end;

procedure TfGrupos.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrupo.Refresh;
  DM1.tGrupo.IndexFieldNames := 'Nome';
end;

procedure TfGrupos.FormShow(Sender: TObject);
begin
  DM1.tGrupo.Open;
end;

end.
