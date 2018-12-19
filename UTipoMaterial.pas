unit UTipoMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  DBFilter;

type
  TfTipoMaterial = class(TForm)
    tTipoMaterialIns: TTable;
    tTipoMaterialInsCodigo: TIntegerField;
    tTipoMaterialInsNome: TStringField;
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
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
    vTipoMat : String;
  end;

var
  fTipoMaterial: TfTipoMaterial;

implementation

uses UDM1 ;

{$R *.DFM}

procedure TfTipoMaterial.Habilita;
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

procedure TfTipoMaterial.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfTipoMaterial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tTipoMaterial.Filtered := False;
  if Screen.FormCount < 3 then
    DM1.tTipoMaterial.Close;
  Action := Cafree;
end;

procedure TfTipoMaterial.BitBtn1Click(Sender: TObject);
begin
  if ((vTipoMat = 'F') and not(DM1.tUsuarioInsTipoMaterial.AsBoolean)) or
     ((vTipoMat = 'P') and not(DM1.tUsuarioInsTipoMaterialProd.AsBoolean)) then
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!')
  else
    begin
      tTipoMaterialIns.IndexFieldNames   := 'Codigo';
      DM1.tTipoMaterial.IndexFieldNames  := 'Codigo';
      tTipoMaterialIns.Refresh;
      tTipoMaterialIns.Last;
      DM1.tTipoMaterial.Refresh;
      DM1.tTipoMaterial.Insert;
      DM1.tTipoMaterialCodigo.AsInteger :=  tTipoMaterialInsCodigo.AsInteger + 1;
      DM1.tTipoMaterialTipo.AsString := vTipoMat;
      DM1.tTipoMaterial.Post;
      DM1.tTipoMaterial.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
end;

procedure TfTipoMaterial.BitBtn5Click(Sender: TObject);
begin
  DM1.tTipoMaterial.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTipoMaterial.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tTipoMaterial.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tTipoMaterial.Cancel;
  Habilita;
end;

procedure TfTipoMaterial.BitBtn2Click(Sender: TObject);
begin
  if ((vTipoMat = 'F') and not(DM1.tUsuarioAltTipoMaterial.AsBoolean)) or
     ((vTipoMat = 'P') and not(DM1.tUsuarioAltTipoMaterialProd.AsBoolean)) then
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!')
  else
    begin
      DM1.tTipoMaterial.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
end;

procedure TfTipoMaterial.BitBtn3Click(Sender: TObject);
begin
  if ((vTipoMat = 'F') and not(DM1.tUsuarioInsTipoMaterial.AsBoolean)) or
     ((vTipoMat = 'P') and not(DM1.tUsuarioInsTipoMaterialProd.AsBoolean)) then
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!')
  else
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
         DM1.tTipoMaterial.Delete;
    end;
end;

procedure TfTipoMaterial.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tTipoMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfTipoMaterial.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tTipoMaterial.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o Tipo de Material antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfTipoMaterial.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if tTipoMaterialIns.Locate('Nome',DM1.tTipoMaterialNome.AsString,[loCaseInsensitive]) then
        begin
          if tTipoMaterialInsCodigo.AsInteger <> DM1.tTipoMaterialCodigo.AsInteger then
            begin
              ShowMessage('Tipo de Material já cadastrado!');
              DM1.tTipoMaterialNome.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfTipoMaterial.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tTipoMaterial.Refresh;
  DM1.tTipoMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfTipoMaterial.FormShow(Sender: TObject);
begin
  DM1.tTipoMaterial.Open;
  DM1.tTipoMaterial.Filtered := False;
  DM1.tTipoMaterial.Filter   := 'Tipo = '''+ vTipoMat + '''';
  DM1.tTipoMaterial.Filtered := True;
  if vTipoMat = 'F' then
    Caption := 'Tipo de Material (Consumo)'
  else
    Caption := 'Tipo de Material (Ficha Técnica)';
end;

end.
