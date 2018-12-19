unit uConfirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Mask,
  StdCtrls, Buttons, DBCtrls, ToolEdit, RXDBCtrl, db, RxLookup, RxDBComb;

type
  TfConfirmacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    DBText1: TDBText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    StaticText1: TStaticText;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fConfirmacao: TfConfirmacao;

implementation

uses UDM1, UConsConfirmacao;

{$R *.dfm}

procedure TfConfirmacao.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsConfirmacaoMod.AsBoolean then
    begin
      BitBtn2.Tag := 0;
      dm1.tConfirmacao.Insert;
      Habilita;
      RxDBLookupCombo1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfConfirmacao.Habilita;
begin
  Panel3.Enabled       := not(Panel3.Enabled);
  dbNavigator1.Enabled := not(dbNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
end;

procedure TfConfirmacao.BitBtn4Click(Sender: TObject);
begin
  if DM1.tConfirmacaoCliente.AsInteger < 1 then
    ShowMessage('É obrigatório informar o cliente!')
  else
    begin
      dm1.tConfirmacao.Post;
      Habilita;
    end;
end;

procedure TfConfirmacao.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltConfirmacaoMod.AsBoolean then
    begin
      BitBtn2.Tag := 1;
      dm1.tConfirmacao.Edit;
      Habilita;
      RxDBLookupCombo1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfConfirmacao.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcConfirmacaoMod.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
        dm1.tConfirmacao.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfConfirmacao.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    dm1.tConfirmacao.Delete
  else
    dm1.tConfirmacao.Cancel;
  Habilita;
end;

procedure TfConfirmacao.FormCreate(Sender: TObject);
begin
  dm1.tConfirmacao.Open;
  dm1.tCliente.Open;
end;

procedure TfConfirmacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm1.tConfirmacao.Close;
  dm1.tCliente.Close;
  Action := Cafree;
end;

procedure TfConfirmacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tConfirmacao.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Você deve cancelar ou confirmar!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfConfirmacao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  dm1.tCliente.IndexFieldNames := 'NOME';
end;

procedure TfConfirmacao.RxDBLookupCombo3Change(Sender: TObject);
begin
  dm1.tCor.IndexFieldNames := 'NOME';
end;

procedure TfConfirmacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (DM1.tConfirmacao.State in [dsBrowse]) then
    begin
      fConsConfirmacao := TfConsConfirmacao.Create(Self);
      fConsConfirmacao.ShowModal;
    end;
end;

end.
