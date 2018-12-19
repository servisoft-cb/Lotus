unit UFichaConsumoMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, RxLookup, ToolEdit, RXDBCtrl,
  RXCtrls, CurrEdit, Grids, DBGrids, Db, DBTables, MemTable, Variants;

type
  TfFichaConsumoMat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Panel5: TPanel;
    Label6: TLabel;
    DBText1: TDBText;
    BitBtn14: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn6: TBitBtn;
    RxSpeedButton2: TRxSpeedButton;
    DBEdit1: TDBEdit;
    StaticText1: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Limpa_Edit;
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fFichaConsumoMat: TfFichaConsumoMat;
implementation

uses UDM1, UMaterial,UCliente, UTipoMaterial, UFichaConsumoMatItens, URelFichaConsumoMat, UConsFichaConsumo;

{$R *.DFM}

procedure TfFichaConsumoMat.Limpa_Edit;
begin
  DBEdit6.Clear;
  DBEdit1.Clear;
  DBEdit2.Clear;
  DBEdit3.Clear;
  DBEdit4.Clear;
  DBDateEdit1.Clear;
  DBEdit6.SetFocus;
end;

procedure TfFichaConsumoMat.Habilita;
begin
  DBNavigator1.Enabled     := not(DBNavigator1.Enabled);
  BitBtn1.Enabled          := not(BitBtn1.Enabled);
  BitBtn3.Enabled          := not(BitBtn3.Enabled);
  BitBtn4.Enabled          := not(BitBtn4.Enabled);
  BitBtn5.Enabled          := not(BitBtn5.Enabled);
  BitBtn6.Enabled          := not(BitBtn6.Enabled);
  BitBtn8.Enabled          := not(BitBtn8.Enabled);
  Panel3.Enabled           := not(Panel3.Enabled);
  RxSpeedButton2.Enabled   := not(RxSpeedButton2.Enabled);
end;

procedure TfFichaConsumoMat.FormShow(Sender: TObject);
begin
  DM1.tFichaConsumo.Open;
  DM1.tFichaConsumoMat.Open;
  DM1.tTipoMaterial.Open;
  DM1.tFichaConsumo.Refresh;
  DM1.tFichaConsumo.Last;
end;

procedure TfFichaConsumoMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tFichaConsumo.Close;
  DM1.tFichaConsumoMat.Close;
  DM1.tTipoMaterial.Close;
  Action := caFree;
end;

procedure TfFichaConsumoMat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tFichaConsumo.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve cancelar ou confirmar para fechar!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfFichaConsumoMat.BitBtn1Click(Sender: TObject);
var
  vNumMov : Integer;
begin
  if DM1.tUsuarioInsFichaConsumo.AsBoolean then
    begin
      BitBtn6.Tag := 1;
      BitBtn8.Tag := 0;
      DM1.tFichaConsumo.IndexFieldNames := 'NumMov';
      DM1.tFichaConsumo.Refresh;
      Dm1.tFichaConsumo.Last;
      vNumMov                           := DM1.tFichaConsumoNumMov.AsInteger;
      DM1.tFichaConsumo.Insert;
      Dm1.tFichaConsumoNumMov.AsInteger := vNumMov + 1;
      Dm1.tFichaConsumo.Post;
      Dm1.tFichaConsumo.Edit;
      Habilita;
      Limpa_Edit;
      DM1.tFichaConsumoDtMov.AsDateTime  := Date;
      DBEdit6.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfFichaConsumoMat.BitBtn8Click(Sender: TObject);
begin
  if DM1.tFichaConsumoNumMov.AsInteger < 1 then
    exit;
  if DM1.tUsuarioAltFichaConsumo.AsBoolean then
    begin
      DM1.tFichaConsumo.IndexFieldNames := 'NumMov';
      DM1.tFichaConsumo.Edit;
      BitBtn8.Tag := 1;
      BitBtn6.Tag := 0;
      Habilita;
      DBEdit6.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfFichaConsumoMat.BitBtn5Click(Sender: TObject);
begin
  if BitBtn8.Tag = 0 then
    begin
      DM1.tFichaConsumoMat.First;
      while not DM1.tFichaConsumoMat.Eof do
         DM1.tFichaConsumoMat.Delete;
      DM1.tFichaConsumo.Delete;
    end
  else
  if BitBtn8.Tag = 1 then
    begin
      DM1.tFichaConsumoMat.Cancel;
      DM1.tFichaConsumo.Cancel;
    end;
  Habilita;
  BitBtn8.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfFichaConsumoMat.BitBtn3Click(Sender: TObject);
begin
  if DM1.tFichaConsumoNumMov.AsInteger < 1 then
    exit;
  BitBtn8.Tag := 0;
  if DM1.tUsuarioExcFichaConsumo.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta Ficha?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
        begin
          DM1.tFichaConsumoMat.First;
          while not DM1.tFichaConsumoMat.Eof do
            DM1.tFichaConsumoMat.Delete;
          DM1.tFichaConsumo.Delete;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfFichaConsumoMat.BitBtn4Click(Sender: TObject);
begin
  Close;
end;


procedure TfFichaConsumoMat.BitBtn6Click(Sender: TObject);
begin
  if DM1.tFichaConsumoReferencia.AsString = '' then
    ShowMessage('É obrigatório informar a referência!')
  else
  begin
    DM1.tFichaConsumo.Post;
    DM1.tFichaConsumo.Refresh;
    Habilita;
    BitBtn8.Tag := 0;
    BitBtn1.SetFocus;
  end
end;

procedure TfFichaConsumoMat.BitBtn14Click(Sender: TObject);
begin
  fFichaConsumoMatItens := TfFichaConsumoMatItens.Create(Self);
  BitBtn14.Tag := 0;
  fFichaConsumoMatItens.ShowModal;
end;

procedure TfFichaConsumoMat.BitBtn16Click(Sender: TObject);
begin
  if DM1.tFichaConsumoMat.IsEmpty then
    ShowMessage('Não há registro para ser alterado!')
  else
  begin
    BitBtn14.Tag := 1;
    fFichaConsumoMatItens                           := TfFichaConsumoMatItens.Create(Self);
    fFichaConsumoMatItens.vItem                     := DM1.tFichaConsumoMatItem.AsInteger;
    fFichaConsumoMatItens.CurrencyEdit9.Value       := DM1.tFichaConsumoMatOpcao.AsInteger;
    fFichaConsumoMatItens.RxDBLookupCombo2.KeyValue := DM1.tFichaConsumoMatCodTipoMaterial.AsInteger;
    fFichaConsumoMatItens.Edit2.Text                := DM1.tFichaConsumoMatNomeMaterial.AsString;
    fFichaConsumoMatItens.Edit3.Text                := DM1.tFichaConsumoMatUnidade.AsString;
    fFichaConsumoMatItens.CurrencyEdit8.Value       := DM1.tFichaConsumoMatConsumo.AsFloat;
    fFichaConsumoMatItens.CurrencyEdit9.Enabled     := False;
    fFichaConsumoMatItens.ShowModal;
  end;
end;

procedure TfFichaConsumoMat.BitBtn9Click(Sender: TObject);
begin
  if not DM1.tFichaConsumoMat.IsEmpty then
  begin
    if MessageDlg('Deseja realmente excluir este item?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
      Dm1.tFichaConsumoMat.Delete
  end
  else
    ShowMessage('Não há itens para apagar na ficha!');
end;

procedure TfFichaConsumoMat.RxSpeedButton2Click(Sender: TObject);
var
  vNum : Integer;
begin
  vNum := DM1.tFichaConsumoNumMov.AsInteger;
  DM1.tFichaConsumo.Filtered := False;
  DM1.tFichaConsumo.Filter   := 'NumMov = '''+IntToStr(vNum)+'''';
  DM1.tFichaConsumo.Filtered := True;

  fRelFichaConsumoMat := TfRelFichaConsumoMat.Create(Self);
  fRelFichaConsumoMat.RLReport1.Preview;
  fRelFichaConsumoMat.RLReport1.Free;
  FreeAndNil(fRelFichaConsumoMat);

  DM1.tFichaConsumo.Filtered := False;
  DM1.tFichaConsumo.FindKey([vNum]);
end;


procedure TfFichaConsumoMat.DBDateEdit1Exit(Sender: TObject);
begin
  if DM1.tFichaConsumoDtMov.AsString = '' then
  begin
    ShowMessage('Data de movimento não pode estar em branco!');
    DBDateEdit1.SetFocus;
    DBDateEdit1.Date := Date;
  end;
end;

procedure TfFichaConsumoMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
  begin
    fConsFichaConsumo := TfConsFichaConsumo.Create(Self);
    fConsFichaConsumo.ShowModal;
  end;
end;

end.
