unit UArmazenamento_RefC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  SMDBGrid, DB, CurrEdit, DBCtrls, RxLookup, DBFilter, DBClient, FMTBcd,
  Provider, SqlExpr, UDMArmazenamento_Ref;

type
  TfArmazenamento_RefC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    Label5: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    fDMArmazenamento_Ref: TDMArmazenamento_Ref;

  public
    { Public declarations }
    procedure Monta_Armazenamento_Ref(Tipo : String ; ID : Integer); //P=Com Parametros   N=Sem Parametros
    procedure Inserir_Armazenamento_Ref;

  end;

var
  fArmazenamento_RefC: TfArmazenamento_RefC;

implementation

uses DateUtils, UDM1, UArmazenamento_Ref, uIntegracao, rsDBUtils;

{$R *.dfm}

procedure TfArmazenamento_RefC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMArmazenamento_Ref);
  {if fDMArmazenamento_Ref.Owner.ClassName = Self.ClassName then
    FreeAndNil(fDMArmazenamento_Ref);}
  Action := Cafree;
end;

procedure TfArmazenamento_RefC.BitBtn3Click(Sender: TObject);
begin
  Monta_Armazenamento_Ref('P',0);
end;

procedure TfArmazenamento_RefC.Monta_Armazenamento_Ref(Tipo : String ; ID : Integer); //P=Com Parametros   N=Sem Parametros
begin
   fDMArmazenamento_Ref.cdsArmazenamento_Ref.Close;

  if ID > 0 then
  begin
    fDMArmazenamento_Ref.sdsArmazenamento_Ref.CommandText := ctArmazenamento_Ref
                                            + ' WHERE ID = ' + IntToStr(ID);
  end
  else
  if Tipo = 'P' then
  begin
    fDMArmazenamento_Ref.sdsArmazenamento_Ref.CommandText := ctArmazenamento_Ref
                                            + ' WHERE 0=0 ';
    if Trim(Edit1.Text) <> '' then
      fDMArmazenamento_Ref.sdsArmazenamento_Ref.CommandText := fDMArmazenamento_Ref.sdsArmazenamento_Ref.CommandText
                                              + ' AND REFERENCIA  LIKE ' + QuotedStr('%'+Edit1.Text+'%') + ')'
  end
  else
    fDMArmazenamento_Ref.sdsArmazenamento_Ref.CommandText := ctArmazenamento_Ref
                                            + ' WHERE ID = 0';

  fDMArmazenamento_Ref.cdsArmazenamento_Ref.Open;
end;

procedure TfArmazenamento_RefC.BitBtn2Click(Sender: TObject);
begin
  if fDMArmazenamento_Ref.cdsArmazenamento_Ref.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMArmazenamento_Ref.cdsArmazenamento_Ref.Delete;
  fDMArmazenamento_Ref.cdsArmazenamento_Ref.ApplyUpdates(0);
end;

procedure TfArmazenamento_RefC.BitBtn1Click(Sender: TObject);
begin
  if not fDMArmazenamento_Ref.cdsArmazenamento_Ref.Active then
    Monta_Armazenamento_Ref('N',0);

  Inserir_Armazenamento_Ref;

  fArmazenamento_Ref := TfArmazenamento_Ref.Create(Self);
  fArmazenamento_Ref.fDMArmazenamento_Ref := fDMArmazenamento_Ref;
  fArmazenamento_Ref.Tag := 0;
  fArmazenamento_Ref.ShowModal;
end;

procedure TfArmazenamento_RefC.FormShow(Sender: TObject);
begin
  fDMArmazenamento_Ref := TDMArmazenamento_Ref.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMArmazenamento_Ref);
  {if not Assigned(fDMArmazenamento_Ref) then
    fDMArmazenamento_Ref := TfDMArmazenamento_Ref.Create(Self);}

  BitBtn1.Enabled := DM1.tUsuarioInsArmazenamentoRef.AsBoolean;
  BitBtn2.Enabled := DM1.tUsuarioExcArmazenamentoRef.AsBoolean;
end;

procedure TfArmazenamento_RefC.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMArmazenamento_Ref.cdsArmazenamento_Ref.IsEmpty then
    exit;
  if not DM1.tUsuarioAltArmazenamentoRef.AsBoolean then
  begin                           
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer a alteração!');
    exit;
  end;
    
  fDMArmazenamento_Ref.cdsArmazenamento_Ref.Edit;
  fArmazenamento_Ref := TfArmazenamento_Ref.Create(Self);
  fArmazenamento_Ref.fDMArmazenamento_Ref := fDMArmazenamento_Ref;
  fArmazenamento_Ref.Tag := 0;
  fArmazenamento_Ref.ShowModal;
end;

procedure TfArmazenamento_RefC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfArmazenamento_RefC.Inserir_Armazenamento_Ref;
var
  vNumAux : Integer;
begin
  vNumAux := ProximaSequencia('Armazenamento_Ref',0);

  fDMArmazenamento_Ref.cdsArmazenamento_Ref.Insert;
  fDMArmazenamento_Ref.cdsArmazenamento_RefID.AsInteger := vNumAux;
end;

end.
