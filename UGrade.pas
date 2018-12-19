unit UGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, Grids, DBGrids,
  DBVGrids, RxLookup, ComCtrls, Variants;

type
  TfGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    tGradeIns: TTable;
    tGradeInsCodigo: TIntegerField;
    tGradeInsNome: TStringField;
    tGradeItemIns: TTable;
    tGradeItemInsCodGrade: TIntegerField;
    tGradeItemInsPosicao: TIntegerField;
    tGradeItemInsTamanho: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    tGradeInsCodLetra: TStringField;
    tGradeInsLargura: TStringField;
    GroupBox1: TGroupBox;
    VDBGrid1: TVDBGrid;
    DBRadioGroup1: TDBRadioGroup;
    Label6: TLabel;
    DBText2: TDBText;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrade: TfGrade;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfGrade.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfGrade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
    end;
  Action := Cafree;
end;

procedure TfGrade.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsGrade.AsBoolean then
    begin
      tGradeIns.IndexFieldNames  := 'Codigo';
      DM1.tGrade.IndexFieldNames := 'Codigo';
      tGradeIns.Refresh;
      tGradeIns.Last;
      DM1.tGrade.Refresh;
      DM1.tGrade.Insert;
      DM1.tGradeCodigo.AsInteger := tGradeInsCodigo.AsInteger + 1;
      DM1.tGradeTipoDig.AsString := 'P';
      DM1.tGrade.Post;
      DM1.tGrade.Edit;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfGrade.BitBtn5Click(Sender: TObject);
var
 vGravar : String[1];
begin
  vGravar := 'S';
  if ((DM1.tGradeCodLetra.AsString <> '') or (DM1.tGradeCodLetra.AsString <> '')) and (BitBtn2.Tag = 0) then
    begin
      if tGradeIns.Locate('CodLetra;Largura',VarArrayOf([DM1.tGradeCodLetra.AsString,DM1.tGradeLargura.AsString]),[locaseinsensitive]) then
        begin
          vGravar := 'N';
          ShowMessage('Cod.Letra e largura ja cadastrada');
          DBEdit2.SetFocus;
        end;
    end;
  if vGravar = 'S' then
    begin
      DM1.tGradeQtdParTotal.AsInteger := 0;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          DM1.tGradeQtdParTotal.AsInteger := DM1.tGradeQtdParTotal.AsInteger + DM1.tGradeItemQtdPar.AsInteger;
          DM1.tGradeItem.Next;
        end;
      DM1.tGrade.Post;
      DM1.tGrade.Refresh;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
    end;
end;

procedure TfGrade.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        DM1.tGradeItem.Delete;
      DM1.tGrade.Delete;
    end
  else
  if BitBtn2.Tag = 1 then
    DM1.tGrade.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfGrade.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltGrade.AsBoolean then
    begin
      DM1.tGrade.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfGrade.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcGrade.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tGradeItem.First;
          while not DM1.tGradeItem.Eof do
            DM1.tGradeItem.Delete;
          DM1.tGrade.Delete;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfGrade.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfGrade.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tGrade.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a grade antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
//  if (Shift = [ssCtrl]) and (Key = 76) then
//    DM1.Login;
end;

procedure TfGrade.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tGrade.Refresh;
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfGrade.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfGrade.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfGrade.VDBGrid1Enter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfGrade.FormShow(Sender: TObject);
begin
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
end;

end.
