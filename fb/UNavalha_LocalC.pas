unit UNavalha_LocalC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask,
  ToolEdit, Grids, DBGrids, SMDBGrid, DB, CurrEdit, DBCtrls, RxLookup, DBFilter, DBClient, FMTBcd, Provider, SqlExpr,
  UDMNavalha_Local;

type
  TfNavalha_LocalC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    Label5: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDMNavalha_Local: TDMNavalha_Local;
  public
    { Public declarations }
    procedure Monta_Navalha_Local(Tipo: String; ID: Integer); //P=Com Parametros   N=Sem Parametros
    procedure Inserir_Navalha_Local;       
  end;

var
  fNavalha_LocalC: TfNavalha_LocalC;

implementation

uses DateUtils, UDM1, uIntegracao, rsDBUtils, URelNavalhaLocal, UNavalha_Local;

{$R *.dfm}

procedure TfNavalha_LocalC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMNavalha_Local);
  {if fDMNavalha_Local.Owner.ClassName = Self.ClassName then
    FreeAndNil(fDMNavalha_Local);}
  Action := Cafree;
end;

procedure TfNavalha_LocalC.BitBtn3Click(Sender: TObject);
begin
  Monta_Navalha_Local('P',0);
end;

procedure TfNavalha_LocalC.Monta_Navalha_Local(Tipo: String; ID: Integer); //P=Com Parametros   N=Sem Parametros
begin
   fDMNavalha_Local.cdsNavalha_Local.Close;

  if ID > 0 then
  begin
    fDMNavalha_Local.sdsNavalha_Local.CommandText := ctNavalha_Local + ' WHERE ID = ' + IntToStr(ID);
  end
  else
  if Tipo = 'P' then
  begin
    fDMNavalha_Local.sdsNavalha_Local.CommandText := ctNavalha_Local +
                                                     ' WHERE 0=0 ';
    if Trim(Edit1.Text) <> '' then
      fDMNavalha_Local.sdsNavalha_Local.CommandText := fDMNavalha_Local.sdsNavalha_Local.CommandText +
                                                       ' AND NAVALHA LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')'
  end
  else
    fDMNavalha_Local.sdsNavalha_Local.CommandText := ctNavalha_Local +
                                                     ' WHERE ID = 0';

  fDMNavalha_Local.cdsNavalha_Local.Open;
end;

procedure TfNavalha_LocalC.BitBtn2Click(Sender: TObject);
begin
  if fDMNavalha_Local.cdsNavalha_Local.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMNavalha_Local.cdsNavalha_Local.Delete;
  fDMNavalha_Local.cdsNavalha_Local.ApplyUpdates(0);
end;

procedure TfNavalha_LocalC.BitBtn1Click(Sender: TObject);
begin
  if not fDMNavalha_Local.cdsNavalha_Local.Active then
    Monta_Navalha_Local('N',0);

  Inserir_Navalha_Local;

  fNavalha_Local := TfNavalha_Local.Create(Self);
  fNavalha_Local.fDMNavalha_Local := fDMNavalha_Local;
  fNavalha_Local.Tag := 0;
  fNavalha_Local.ShowModal;
end;

procedure TfNavalha_LocalC.FormShow(Sender: TObject);
begin
  fDMNavalha_Local := TDMNavalha_Local.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMNavalha_Local);
  {if not Assigned(fDMNavalha_Local) then
    fDMNavalha_Local := TfDMNavalha_Local.Create(Self);}

  BitBtn1.Enabled := DM1.tUsuarioInsArmazenamentoRef.AsBoolean;
  BitBtn2.Enabled := DM1.tUsuarioExcArmazenamentoRef.AsBoolean;
end;

procedure TfNavalha_LocalC.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMNavalha_Local.cdsNavalha_Local.IsEmpty then
    exit;
  if not DM1.tUsuarioAltArmazenamentoRef.AsBoolean then
  begin                           
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer a alteração!');
    exit;
  end;
    
  fDMNavalha_Local.cdsNavalha_Local.Edit;
  fNavalha_Local := TfNavalha_Local.Create(Self);
  fNavalha_Local.fDMNavalha_Local := fDMNavalha_Local;
  fNavalha_Local.Tag := 0;
  fNavalha_Local.ShowModal;
end;

procedure TfNavalha_LocalC.Inserir_Navalha_Local;
var
  vNumAux: Integer;
begin
  vNumAux := ProximaSequencia('NAVALHA_LOCAL',0);

  fDMNavalha_Local.cdsNavalha_Local.Insert;
  fDMNavalha_Local.cdsNavalha_LocalID.AsInteger := vNumAux;
end;

procedure TfNavalha_LocalC.BitBtn4Click(Sender: TObject);
begin
  if not fDMNavalha_Local.cdsNavalha_Local.Active then
  begin
    ShowMessage('Não existe registros para imprimir!');
    exit;
  end;
  fRelNavalhaLocal := TfRelNavalhaLocal.Create(Self);
  fRelNavalhaLocal.fDMNavalha_Local := fDMNavalha_Local;
  fRelNavalhaLocal.RLReport1.Preview;
  fRelNavalhaLocal.RLReport1.Free;
end;

procedure TfNavalha_LocalC.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMNavalha_Local.cdsNavalha_Local.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
