unit URegioes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, RXLookup, Buttons, ExtCtrls, Db, DBTables;

type
  TfRegioes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel4: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    tRegioes: TTable;
    dsRegioes: TDataSource;
    tRegioesCodigo: TIntegerField;
    tRegioesNome: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Habilita;

  public
    { Public declarations }
  end;

var
  fRegioes: TfRegioes;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfRegioes.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel3.Enabled       := not(Panel3.Enabled);
end;

procedure TfRegioes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tRegioes.Close;
  Action := Cafree;
end;

procedure TfRegioes.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tRegioes.IndexFieldNames := 'Nome';
end;

procedure TfRegioes.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tRegioes.IndexFieldNames := 'Codigo';
end;

procedure TfRegioes.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tRegioes.IndexFieldNames := 'Codigo';
end;

procedure TfRegioes.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsRegioesVendas.AsBoolean then
    begin
      tRegioes.Refresh;
      tRegioes.Last;
      DM1.tRegioes.Insert;
      DM1.tRegioesCodigo.AsInteger := tRegioesCodigo.AsInteger + 1;
      DM1.tRegioes.Post;
      DM1.tRegioes.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfRegioes.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltRegioesVendas.AsBoolean then
    begin
      DM1.tRegioes.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfRegioes.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcRegioesVendas.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tRegioes.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfRegioes.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tRegioes.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tRegioes.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfRegioes.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfRegioes.BitBtn6Click(Sender: TObject);
begin
  DM1.tRegioes.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfRegioes.FormShow(Sender: TObject);
begin
  DM1.tRegioes.Open;
  DM1.tRegioes.Refresh;
  DM1.tRegioes.Last;
end;

procedure TfRegioes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tRegioes.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta região antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfRegioes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
