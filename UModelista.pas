unit UModelista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Db, DBTables, RXLookup, Mask;

type
  TfModelista = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    DBNavigator1: TDBNavigator;
    tModelista: TTable;
    tModelistaCodigo: TIntegerField;
    tModelistaDescricao: TStringField;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    tModelistaComissao: TFloatField;
    Label4: TLabel;
    DBText1: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
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
  fModelista: TfModelista;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfModelista.Habilita;
begin
  DBNavigator1.Enabled     := not(DBNavigator1.Enabled);
  BitBtn1.Enabled          := not(BitBtn1.Enabled);
  BitBtn2.Enabled          := not(BitBtn2.Enabled);
  BitBtn3.Enabled          := not(BitBtn3.Enabled);
  BitBtn4.Enabled          := not(BitBtn4.Enabled);
  BitBtn5.Enabled          := not(BitBtn5.Enabled);
  BitBtn6.Enabled          := not(BitBtn6.Enabled);
  DBEdit1.Enabled          := not(DBEdit1.Enabled);
  DBEdit2.Enabled          := not(DBEdit2.Enabled);
  RxDBLookupCombo1.Enabled := not(RxDBLookupCombo1.Enabled);
end;

procedure TfModelista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    Dm1.tModelista.Close;
  Action := Cafree;
end;

procedure TfModelista.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfModelista.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfModelista.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsModelista.AsBoolean then
    begin
      tModelista.IndexFieldNames     := 'Codigo';
      DM1.tModelista.IndexFieldNames := 'Codigo';
      tModelista.Refresh;
      tModelista.Last;
      DM1.tModelista.Insert;
      DM1.tModelistaCodigo.AsInteger := tModelistaCodigo.AsInteger + 1;
      DM1.tModelista.Post;
      DM1.tModelista.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfModelista.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltModelista.AsBoolean then
    begin
      DM1.tModelista.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfModelista.BitBtn3Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tModelista.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tModelista.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfModelista.BitBtn4Click(Sender: TObject);
begin
  if DM1.tUsuarioExcModelista.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        DM1.tModelista.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfModelista.BitBtn6Click(Sender: TObject);
begin
  DM1.tModelista.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfModelista.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tModelista.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar este Modelista antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfModelista.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;

end;

procedure TfModelista.FormShow(Sender: TObject);
begin
  Dm1.tModelista.Open;
end;

end.
