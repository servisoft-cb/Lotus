unit UOperAtelier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, DB, DBTables;

type
  TfOperAtelier = class(TForm)
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
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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
  fOperAtelier: TfOperAtelier;

implementation

uses UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfOperAtelier.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
end;

procedure TfOperAtelier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tOperAtelier.Close;
  Action := Cafree;
end;

procedure TfOperAtelier.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tOperAtelier.IndexFieldNames := 'Nome';
end;

procedure TfOperAtelier.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsOperAtelier.AsBoolean then
    begin
      DM1.tOperAtelier.Refresh;
      DM1.tOperAtelier.Last;
      vCodAux := DM1.tOperAtelierCodigo.AsInteger;
      DM1.tOperAtelier.Insert;
      DM1.tOperAtelierCodigo.AsInteger := vCodAux + 1;
      DM1.tOperAtelier.Post;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer inserção!');
end;

procedure TfOperAtelier.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltOperAtelier.AsBoolean then
    begin
      DM1.tOperAtelier.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer alteração!');
end;

procedure TfOperAtelier.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcOperAtelier.AsBoolean then
    begin
      if not DM1.tOperAtelier.IsEmpty then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            DM1.tOperAtelier.Delete;
        end
      else
        ShowMessage('Não há registro p/ ser excluído!');
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer exclusão!');
end;

procedure TfOperAtelier.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tOperAtelier.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tOperAtelier.Cancel;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfOperAtelier.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOperAtelier.BitBtn5Click(Sender: TObject);
begin
  DM1.tOperAtelier.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfOperAtelier.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tOperAtelier.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a Operação de Atelier antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfOperAtelier.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfOperAtelier.FormShow(Sender: TObject);
begin
  Dm1.tOperAtelier.Open;
end;

end.
