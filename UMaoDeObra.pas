unit UMaoDeObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup;

type
  TfMaoDeObra = class(TForm)
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
    Label7: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fMaoDeObra: TfMaoDeObra;

implementation

uses UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfMaoDeObra.Habilita;
begin
  Panel3.Enabled       := not Panel3.Enabled;
  Panel5.Enabled       := not Panel5.Enabled;
  BitBtn1.Enabled      := not BitBtn1.Enabled;
  BitBtn2.Enabled      := not BitBtn2.Enabled;
  BitBtn3.Enabled      := not BitBtn3.Enabled;
  BitBtn4.Enabled      := not BitBtn4.Enabled;
  BitBtn5.Enabled      := not BitBtn5.Enabled;
  BitBtn6.Enabled      := not BitBtn6.Enabled;
  DBNavigator1.Enabled := not DBNavigator1.Enabled;
end;

procedure TfMaoDeObra.BitBtn4Click(Sender: TObject);
begin
  DM1.tMaoDeObra.Cancel;
  Close;
end;

procedure TfMaoDeObra.BitBtn5Click(Sender: TObject);
begin
  DM1.tMaoDeObra.Cancel;
  Habilita;
end;

procedure TfMaoDeObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tMaoDeObra.Close;
  Action := Cafree;
end;

procedure TfMaoDeObra.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsMaoDeObra.AsBoolean then
    begin
      DM1.tMaoDeObra.IndexFieldNames := 'Codigo';
      DM1.tMaoDeObra.Refresh;
      DM1.tMaoDeObra.Last;
      vCodAux := DM1.tMaoDeObraCodigo.AsInteger;

      DM1.tMaoDeObra.Insert;
      DM1.tMaoDeObraCodigo.AsInteger :=  vCodAux + 1;
      DM1.tMaoDeObra.Post;
      DM1.tMaoDeObra.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfMaoDeObra.BitBtn6Click(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      DM1.tMaoDeObra.Post;
      Habilita;
      BitBtn1.SetFocus;
    end
  else
    DBEdit1.SetFocus;
end;

procedure TfMaoDeObra.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcMaoDeObra.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir a Mão de Obra?',mtconfirmation,
                [mbok,mbno],0) = mrok then
        DM1.tMaoDeObra.delete
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfMaoDeObra.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltMaoDeObra.AsBoolean then
    begin
      DM1.tMaoDeObra.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfMaoDeObra.FormShow(Sender: TObject);
begin
  DM1.tMaoDeObra.Open;
  DM1.tMaoDeObra.Last;
end;

procedure TfMaoDeObra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tMaoDeObra.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta Mão de Obra antes de fechar esta janela');
      CanClose := False;
    end
  else
    begin
      CanClose              := True;
    end;
end;

procedure TfMaoDeObra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Shift = [ssCtrl]) and (Key = 76) then
    DM1.Login;
end;

procedure TfMaoDeObra.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tMaoDeObra.Refresh;
  DM1.tMaoDeObra.IndexFieldNames := 'Descricao';
end;

end.
