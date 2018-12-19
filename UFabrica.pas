unit UFabrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, RxLookup, Mask, DB, DBTables;

type
  TfFabrica = class(TForm)
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
    Panel5: TPanel;
    Label2: TLabel;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
  fFabrica: TfFabrica;

implementation

uses UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfFabrica.Habilita;
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

procedure TfFabrica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tFabrica.Close;
  Action := Cafree;
end;

procedure TfFabrica.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Nome';
end;

procedure TfFabrica.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Codigo';
end;

procedure TfFabrica.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tFabrica.IndexFieldNames := 'Codigo';
end;

procedure TfFabrica.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsFabrica.AsBoolean then
    begin
      DM1.tFabrica.Refresh;
      DM1.tFabrica.Last;
      vCodAux := DM1.tFabricaCodigo.AsInteger;
      DM1.tFabrica.Insert;
      DM1.tFabricaCodigo.AsInteger := vCodAux + 1;
      DM1.tFabrica.Post;
      DM1.tFabrica.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer inserção!');
end;

procedure TfFabrica.BitBtn2Click(Sender: TObject);
begin
  if not DM1.tFabrica.IsEmpty then
    begin
      if DM1.tUsuarioAltFabrica.AsBoolean then
        begin
          DM1.tFabrica.Edit;
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

procedure TfFabrica.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tFabrica.Delete
  else
    DM1.tFabrica.Cancel;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfFabrica.BitBtn3Click(Sender: TObject);
begin
  if not DM1.tFabrica.IsEmpty then
    begin
      if DM1.tUsuarioExcFabrica.AsBoolean then
        begin
          if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
            DM1.tFabrica.Delete;
        end
      else
        ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer exclusão!');
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfFabrica.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfFabrica.BitBtn5Click(Sender: TObject);
begin
  DM1.tFabrica.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfFabrica.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tFabrica.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve confirmar ou cancelar este registro antes de fechar este formulário!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfFabrica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfFabrica.FormShow(Sender: TObject);
begin
  Dm1.tFabrica.Open;
end;

end.
