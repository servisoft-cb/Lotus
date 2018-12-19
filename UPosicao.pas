unit UPosicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, DB, DBTables,
  RxDBComb;

type
  TfPosicao = class(TForm)
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
    DBRadioGroup1: TDBRadioGroup;
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
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
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
  fPosicao: TfPosicao;

implementation

uses UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfPosicao.Habilita;
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

procedure TfPosicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tPosicao.Close;
  Action := Cafree;
end;

procedure TfPosicao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfPosicao.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsPosicao.AsBoolean then
    begin
      DM1.tPosicao.IndexFieldNames := 'Codigo';
      DM1.tPosicao.Refresh;
      DM1.tPosicao.Last;
      vCodAux := DM1.tPosicaoCodigo.AsInteger;
      DM1.tPosicao.Insert;
      DM1.tPosicaoCodigo.AsInteger := vCodAux + 1;
      DM1.tPosicaoTipo.Asstring    := 'O';
      DM1.tPosicao.Post;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer inserção!');
end;

procedure TfPosicao.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPosicao.AsBoolean then
    begin
      DM1.tPosicao.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer alteração!');
end;

procedure TfPosicao.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPosicao.AsBoolean then
    begin
      if not DM1.tPosicao.IsEmpty then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            DM1.tPosicao.Delete;
        end
      else
        ShowMessage('Não há registro p/ ser excluído!');
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer exclusão!');
end;

procedure TfPosicao.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tPosicao.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tPosicao.Cancel;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfPosicao.BitBtn5Click(Sender: TObject);
begin
  if DM1.tPosicaoNome.AsString = '' then
    begin
      ShowMessage('Falta informar o nome!');
      exit;
    end;
  DM1.tPosicao.Post;
  DM1.tPosicao.Refresh;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfPosicao.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPosicao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tPosicao.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a Posição antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPosicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfPosicao.FormShow(Sender: TObject);
begin
  Dm1.tPosicao.Open;
end;

end.
