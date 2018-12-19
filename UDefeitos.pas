unit UDefeitos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, DB, DBTables;

type
  TfDefeitos = class(TForm)
    Panel1: TPanel;
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
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fDefeitos: TfDefeitos;

implementation

uses UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfDefeitos.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
end;

procedure TfDefeitos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tDefeitos.Close;
  Action := Cafree;
end;

procedure TfDefeitos.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tDefeitos.IndexFieldNames := 'Nome';
end;

procedure TfDefeitos.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tDefeitos.IndexFieldNames := 'Codigo';
end;

procedure TfDefeitos.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tDefeitos.IndexFieldNames := 'Codigo';
end;

procedure TfDefeitos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tDefeitos.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve confirmar ou cancelar este registro antes de fechar este formulário!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfDefeitos.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsDefeitos.AsBoolean then
    begin
      DM1.tDefeitos.Refresh;
      DM1.tDefeitos.Last;
      vCodAux := DM1.tDefeitosCodigo.AsInteger;

      DM1.tDefeitos.Insert;
      DM1.tDefeitosCodigo.AsInteger := vCodAux + 1;
      DM1.tDefeitos.Post;
      DM1.tDefeitos.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer inserção!');
end;

procedure TfDefeitos.BitBtn2Click(Sender: TObject);
begin
  if not DM1.tDefeitos.IsEmpty then
    begin
      if DM1.tUsuarioAltDefeitos.AsBoolean then
        begin
          DM1.tDefeitos.Edit;
          BitBtn2.Tag := 1;
          Habilita;
          DBEdit1.SetFocus;
        end
      else
        ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer alteração!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfDefeitos.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tDefeitos.Delete
  else
    DM1.tDefeitos.Cancel;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfDefeitos.BitBtn3Click(Sender: TObject);
begin
  if not DM1.tDefeitos.IsEmpty then
    begin
      if DM1.tUsuarioExcDefeitos.AsBoolean then
        begin
          if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
            DM1.tDefeitos.Delete;
        end
      else
        ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer exclusão!');
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfDefeitos.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfDefeitos.BitBtn5Click(Sender: TObject);
begin
  DM1.tDefeitos.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfDefeitos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfDefeitos.FormShow(Sender: TObject);
begin
  Dm1.tDefeitos.Open;
end;

end.
