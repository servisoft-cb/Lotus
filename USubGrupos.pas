unit USubGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfSubGrupos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    tSubGrupoIns: TTable;
    tSubGrupoInsCodigo: TIntegerField;
    tSubGrupoInsNome: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
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
  fSubGrupos: TfSubGrupos;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfSubGrupos.Habilita;
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

procedure TfSubGrupos.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfSubGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tSubGrupo.Close;
  Action := Cafree;
end;

procedure TfSubGrupos.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsSubGrupo.AsBoolean then
    begin
      tSubGrupoIns.IndexFieldNames  := 'Codigo';
      DM1.tSubGrupo.IndexFieldNames := 'Codigo';
      tSubGrupoIns.Refresh;
      tSubGrupoIns.Last;
      DM1.tSubGrupo.Refresh;
      DM1.tSubGrupo.Insert;
      DM1.tSubGrupoCodigo.AsInteger :=  tSubGrupoInsCodigo.AsInteger + 1;
      DM1.tSubGrupo.Post;
      DM1.tSubGrupo.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfSubGrupos.BitBtn5Click(Sender: TObject);
begin
  DM1.tSubGrupo.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfSubGrupos.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tSubGrupo.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tSubGrupo.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfSubGrupos.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltSubGrupo.AsBoolean then
    begin
      DM1.tSubGrupo.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfSubGrupos.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcSubGrupo.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tSubGrupo.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfSubGrupos.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tSubGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfSubGrupos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tSubGrupo.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o subgrupo antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfSubGrupos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfSubGrupos.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tSubGrupo.Refresh;
  DM1.tSubGrupo.IndexFieldNames := 'Nome';
end;

procedure TfSubGrupos.FormShow(Sender: TObject);
begin
  Dm1.tSubGrupo.Open;
end;

end.
