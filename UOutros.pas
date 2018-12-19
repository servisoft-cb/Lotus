unit UOutros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls;

type
  TfOutros = class(TForm)
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
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    BitBtn7: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
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
  fOutros: TfOutros;

implementation

uses UDM1, UDM2, URelacaoGeral, UAgendaTelef;

{$R *.DFM}

procedure TfOutros.Habilita;
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

procedure TfOutros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tOutros.Close;
      Dm1.tRelacaoGeral.Close;
    end;
  Action := Cafree;
end;

procedure TfOutros.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tOutros.IndexFieldNames := 'Nome';
end;

procedure TfOutros.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tOutros.IndexFieldNames := 'Codigo';
end;

procedure TfOutros.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsAgenda.AsBoolean then
    begin
      DM1.tOutros.Refresh;
      DM1.tOutros.Last;
      vCodAux := DM1.tOutrosCodigo.AsInteger;
      DM1.tOutros.Insert;
      DM1.tOutrosCodigo.AsInteger := vCodAux + 1;
      DM1.tOutros.Post;
      DM1.tOutros.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfOutros.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltAgenda.AsBoolean then
    begin
      if not DM1.tOutros.IsEmpty then
        begin
          DM1.tOutros.Edit;
          BitBtn2.Tag := 1;
          Habilita;
          DBEdit1.SetFocus;
        end
      else
        ShowMessage('Não há registro p/ ser alterado!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfOutros.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 1 then
    DM1.tOutros.Cancel
  else
    begin
      DM1.tOutros.Post;
      DM1.tOutros.Delete;
    end;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfOutros.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcAgenda.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tOutros.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfOutros.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOutros.BitBtn5Click(Sender: TObject);
begin
  DM1.tOutros.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfOutros.BitBtn7Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  Screen.Cursor := crHourGlass;
  Dm1.tRelacaoGeral.IndexFieldNames := 'Codigo';
  Dm1.tRelacaoGeral.First;
  while not Dm1.tRelacaoGeral.Eof do
    Dm1.tRelacaoGeral.Delete;

  Dm1.tRelacaoGeral.Refresh;
  Dm1.tRelacaoGeral.Last;
  vCodAux := DM1.tRelacaoGeralCodigo.AsInteger;

  Dm1.tOutros.First;
  while not Dm1.tOutros.Eof do
    begin
      vCodAux := vCodAux + 1;

      Dm1.tRelacaoGeral.Insert;
      Dm1.tRelacaoGeralCodigo.AsInteger  := vCodaux;
      Dm1.tRelacaoGeralNome.AsString     := Dm1.tOutrosNome.AsString;
      Dm1.tRelacaoGeralContato1.AsString := Dm1.tOutrosContato.AsString;
      Dm1.tRelacaoGeralContato2.AsString := Dm1.tOutrosContato2.AsString;
      Dm1.tRelacaoGeralContato3.AsString := Dm1.tOutrosContato3.AsString;
      Dm1.tRelacaoGeralTel1.AsString     := Dm1.tOutrosTelefone1.AsString;
      Dm1.tRelacaoGeralTel2.AsString     := Dm1.tOutrosTelefone2.AsString;
      Dm1.tRelacaoGeralFax.AsString      := Dm1.tOutrosFax.AsString;
      Dm1.tRelacaoGeral.Post;
      Dm1.tOutros.Next;
    end;
  Dm1.tFornecedores.First;
  while not Dm1.tFornecedores.Eof do
    begin
      vCodAux := vCodAux + 1;

      Dm1.tRelacaoGeral.Insert;
      Dm1.tRelacaoGeralCodigo.AsInteger  := vCodAux;
      Dm1.tRelacaoGeralNome.AsString     := Dm1.tFornecedoresNomeForn.AsString;
      Dm1.tRelacaoGeralContato1.AsString := Dm1.tFornecedoresContatoForn.AsString;
      Dm1.tRelacaoGeralTel1.AsString     := Dm1.tFornecedoresTel1Forn.AsString;
      Dm1.tRelacaoGeralTel2.AsString     := Dm1.tFornecedoresTel2Forn.AsString;
      Dm1.tRelacaoGeralFax.AsString      := Dm1.tFornecedoresFaxForn.AsString;
      Dm1.tRelacaoGeral.Post;
      Dm1.tFornecedores.Next;
    end;
  Dm1.tVendedor.First;
  while not Dm1.tVendedor.Eof do
    begin
      vCodAux := vCodAux +1;
      Dm1.tRelacaoGeral.Insert;
      Dm1.tRelacaoGeralCodigo.AsInteger  := vCodAux;
      Dm1.tRelacaoGeralNome.AsString     := Dm1.tVendedorNome.AsString;
      Dm1.tRelacaoGeralContato1.AsString := Dm1.tVendedorContato.AsString;
      Dm1.tRelacaoGeralTel1.AsString     := Dm1.tVendedorFone.AsString;
      Dm1.tRelacaoGeralFax.AsString      := Dm1.tVendedorFax.AsString;
      Dm1.tRelacaoGeral.Post;
      Dm1.tVendedor.Next;
    end;
  Dm1.tTransp.First;
  while not Dm1.tTransp.Eof do
    begin
      vCodAux := vCodAux + 1;
      Dm1.tRelacaoGeral.Insert;
      Dm1.tRelacaoGeralCodigo.AsInteger  := vCodAux + 1;
      Dm1.tRelacaoGeralNome.AsString     := Dm1.tTranspNome.AsString;
      Dm1.tRelacaoGeralContato1.AsString := Dm1.tTranspContato.AsString;
      Dm1.tRelacaoGeralTel1.AsString     := Dm1.tTranspFone.AsString;
      Dm1.tRelacaoGeralFax.AsString      := Dm1.tTranspFax.AsString;
      Dm1.tRelacaoGeral.Post;
      Dm1.tTransp.Next;
    end;
  Screen.Cursor := crDefault;
  Dm1.tRelacaoGeral.IndexFieldNames := 'Nome';
  Dm1.tRelacaoGeral.First;
  fRelacaoGeral := TfRelacaoGeral.Create(Self);
  fRelacaoGeral.QuickRep1.Preview;
  fRelacaoGeral.QuickRep1.Free;
end;

procedure TfOutros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfOutros.FormShow(Sender: TObject);
begin
  Dm1.tRelacaoGeral.Open;
  DM1.tOutros.Open;
end;

end.
