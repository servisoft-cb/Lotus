unit UCia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, DB, DBTables,
  ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl, RXCtrls, Variants;

type
  TfCia = class(TForm)
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
    RxDBGrid1: TRxDBGrid;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn7: TBitBtn;
    Edit1: TEdit;
    Label7: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    qProduto: TQuery;
    qProdutoCodigo: TIntegerField;
    qProdutoReferencia: TStringField;
    qProdutoNome: TStringField;
    qProdutoCodConstrucao: TIntegerField;
    dsqProduto: TDataSource;
    BitBtn8: TBitBtn;
    Label13: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    qProdutoDescMaterial: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure CurrencyEdit3Enter(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    vItemCia : Integer;
    procedure Habilita;
    procedure Limpa_Edit;
    procedure Monta_qProduto;
    procedure Excluir_Registro;
  public
    { Public declarations }
  end;

var
  fCia: TfCia;

implementation

uses UDM1, UProduto, UAgendaTelef, UDMCia, URelCiaCad;

{$R *.DFM}

procedure TfCia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tProduto.Close;
  qProduto.Close;
  if DMCia.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMCia);
  Action := Cafree;
end;

procedure TfCia.Limpa_Edit;
begin
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo3.ClearValue;
  CurrencyEdit1.Clear;
  Edit1.Clear;
  vItemCia := 0;
end;

procedure tfCia.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn8.Enabled      := not(BitBtn8.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
end;

procedure TfCia.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMCia.tCia.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfCia.FormShow(Sender: TObject);
begin
  if not Assigned(DMCia) then
    DMCia := TDMCia.Create(Self);
  DM1.tProduto.Open;
end;

procedure TfCia.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCia.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsCia.AsBoolean then
  begin
    vItemCia := 0;
    DMCia.tCia.IndexFieldNames := 'Codigo';
    DMCia.tCia.Refresh;
    DMCia.tCia.Last;
    vCodAux := DMCia.tCiaCodigo.AsInteger;

    DMCia.tCia.Insert;
    DMCia.tCiaCodigo.AsInteger      := vCodAux + 1;
    DMCia.tCiaDtCadastro.AsDateTime := Date;
    DMCia.tCia.Post;
    DMCia.tCia.Edit;

    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCia.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltCia.AsBoolean then
  begin
    vItemCia := 0;
    DMCia.tCia.Edit;
    BitBtn2.Tag := 1;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCia.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
  begin
    Excluir_Registro;
    Habilita;
    BitBtn1.SetFocus;
  end
  else
  if BitBtn2.Tag = 1 then
  begin
    DMCia.tCia.Cancel;
    Habilita;
    BitBtn1.SetFocus;
  end;
  Limpa_Edit;  
  BitBtn2.Tag := 0;
end;

procedure TfCia.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcCia.AsBoolean then
  begin
    if MessageDlg('Deseja excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
      Excluir_Registro;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCia.BitBtn5Click(Sender: TObject);
begin
  if Trim(DMCia.tCiaNome.AsString) = '' then
  begin
    ShowMessage('Nome não informado!');
    exit;
  end;
  DMCia.tCia.Post;
  Habilita;
  BitBtn2.Tag := 0;
  Limpa_Edit;
  BitBtn1.SetFocus;
end;

procedure TfCia.RxDBLookupCombo2Enter(Sender: TObject);
begin
  Monta_qProduto;
end;

procedure TfCia.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
  begin
    fProduto := TfProduto.Create(Self);
    fProduto.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCia.BitBtn7Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if RxDBLookupCombo2.Text = '' then
  begin
    ShowMessage('Referência não informada!');
    RxDBLookupCombo2.SetFocus;
    exit;
  end;

  vItemAux := 0;

  if vItemCia > 0 then
    if DMCia.tCiaItens.Locate('Codigo;Item',VarArrayOf([DMCia.tCiaCodigo.AsInteger,vItemCia]),[locaseinsensitive]) then
      DMCia.tCiaItens.Edit;
  if DMCia.tCiaItens.State in [dsBrowse] then
  begin
    DMCia.tCiaItens.Refresh;
    DMCia.tCiaItens.Last;
    if vItemCia > 0 then
      vItemAux := vItemCia
    else
      vItemAux := DMCia.tCiaItensItem.AsInteger + 1;
    DMCia.tCiaItens.Insert;
    DMCia.tCiaItensCodigo.AsInteger     := DMCia.tCiaCodigo.AsInteger;
    DMCia.tCiaItensItem.AsInteger       := vItemAux;
  end;
  DMCia.tCiaItensCodProduto.AsInteger := RxDBLookupCombo2.KeyValue;
  DMCia.tCiaItensPreco.AsFloat        := CurrencyEdit1.Value;
  DMCia.tCiaItensProcesso.AsString    := Edit1.Text;
  if RxDBLookupCombo3.Text <> '' then
    DMCia.tCiaItensCodConstrucao.AsInteger := RxDBLookupCombo3.KeyValue
  else
    DMCia.tCiaItensCodConstrucao.AsInteger := 0;
  DMCia.tCiaItens.Post;

  Limpa_Edit;
  RxDBLookupCombo3.SetFocus;
end;

procedure TfCia.SpeedButton2Click(Sender: TObject);
begin
  Limpa_Edit;
  RxDBLookupCombo3.SetFocus;
end;

procedure TfCia.SpeedButton4Click(Sender: TObject);
begin
  if DMCia.tCiaItens.IsEmpty then
    exit;

  if RxDBLookupCombo2.Text = '' then
  begin
    vItemCia                  := DMCia.tCiaItensItem.AsInteger;
    if DMCia.tCiaItensCodConstrucao.AsInteger > 0 then
      RxDBLookupCombo3.KeyValue := DMCia.tCiaItensCodConstrucao.AsInteger
    else
      RxDBLookupCombo3.ClearValue;
    Monta_qProduto;
    RxDBLookupCombo2.KeyValue := DMCia.tCiaItensCodProduto.AsInteger;
    CurrencyEdit1.Value       := DMCia.tCiaItensPreco.AsFloat;
    Edit1.Text                := DMCia.tCiaItensProcesso.AsString;
  end
  else
    ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
end;

procedure TfCia.SpeedButton3Click(Sender: TObject);
begin
  if DMCia.tCiaItens.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este item?',mtconfirmation,[mbok,mbno],0)=mrok then
    DMCia.tCiaItens.Delete;
end;

procedure TfCia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
end;

procedure TfCia.SpeedButton5Click(Sender: TObject);
begin
  fAgendaTelef := TfAgendaTelef.Create(Self);
  fAgendaTelef.ShowModal;
end;

procedure TfCia.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tConstrucao.IndexFieldNames := 'Nome';
end;

procedure TfCia.Monta_qProduto;
begin
  qProduto.Close;
  qProduto.SQL.Clear;
  qProduto.SQL.Add('SELECT Codigo, Referencia, Nome, CodConstrucao, DescMaterial ');
  qProduto.SQL.Add('FROM "dbProduto.DB" Dbproduto ');
  if RxDBLookupCombo3.Text <> '' then
  begin
    qProduto.SQL.Add('WHERE CodConstrucao = :CodConstrucao ');
    qProduto.ParamByName('CodConstrucao').AsInteger := RxDBLookupCombo3.KeyValue;
  end;
  qProduto.SQL.Add('ORDER BY Referencia, Codigo');
  qProduto.Open;
end;

procedure TfCia.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text <> '') and (qProdutoCodConstrucao.AsInteger > 0) then
    RxDBLookupCombo3.KeyValue := qProdutoCodConstrucao.AsInteger;
end;

procedure TfCia.Excluir_Registro;
begin
  DMCia.tCiaItens.First;
  while not DMCia.tCiaItens.Eof do
    DMCia.tCiaItens.Delete;
  DMCia.tCia.Delete;
end;

procedure TfCia.CurrencyEdit3Enter(Sender: TObject);
begin
  DMCia.tCia.IndexFieldNames := 'Codigo';
end;

procedure TfCia.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    RxDBLookupCombo1.ClearValue;
    DMCia.tCia.IndexFieldNames := 'Codigo';
    DMCia.tCia.FindKey([CurrencyEdit3.AsInteger]);
  end;
end;

procedure TfCia.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DMCia.tCia.IndexFieldNames := 'Nome';
end;

procedure TfCia.BitBtn8Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  vCodAux := DMCia.tCiaCodigo.AsInteger;
  DMCia.tCia.Filtered := False;
  DMCia.tCia.Filter   := 'Codigo = '''+IntToStr(vCodAux)+'''';
  DMCia.tCia.Filtered := True;

  fRelCiaCad := TfRelCiaCad.Create(Self);
  fRelCiaCad.RLReport1.Preview;
  fRelCiaCad.RLReport1.Free;
  
  DMCia.tCia.Filtered := False;
  DMCia.tCia.Locate('Codigo',vCodAux,[loCaseInsensitive]);
end;

end.
