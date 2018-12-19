unit ULojas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, Db, DBTables;

type
  TfLojas = class(TForm)
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
    tLojas2: TTable;
    dsLojas: TDataSource;
    tLojas2Codigo: TIntegerField;
    tLojas2Nome: TStringField;
    Panel5: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
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
  fLojas: TfLojas;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfLojas.Habilita;
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

procedure TfLojas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tLojas.Close;
  Action := Cafree;
end;

procedure TfLojas.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tLojas.IndexFieldNames := 'Nome';
end;

procedure TfLojas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tLojas.IndexFieldNames := 'Codigo';
end;

procedure TfLojas.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioLojas.AsBoolean then
    begin
      tLojas2.Refresh;
      tLojas2.Last;
      DM1.tLojas.Insert;
      DM1.tLojasCodigo.AsInteger := tLojas2Codigo.AsInteger + 1;
      DM1.tLojas.Post;
      DM1.tLojas.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfLojas.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltLojas.AsBoolean then
    begin
      DM1.tLojas.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfLojas.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcLojas.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tLojas.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfLojas.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tLojas.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tLojas.Cancel;
  BitBtn2.Tag := 0;  
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfLojas.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfLojas.BitBtn6Click(Sender: TObject);
begin
  DM1.tLojas.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfLojas.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tRegioes.IndexFieldNames := 'Codigo';
end;

procedure TfLojas.FormShow(Sender: TObject);
begin
  Dm1.tLojas.Open;
  DM1.tLojas.Refresh;
  DM1.tLojas.Last;
end;

procedure TfLojas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tLojas.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta loja antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfLojas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
