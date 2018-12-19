unit UArmazenamento_Ref;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, RxLookup, ToolEdit,
  RXDBCtrl, Grids, DBGrids, SMDBGrid, RxDBComb, RzEdit, RzDBEdit, RzTabs,
  FMTBcd, DB, SqlExpr, Provider, DBClient, DBVGrids, DBFilter, DBTables, UDMArmazenamento_Ref;

type
  TfArmazenamento_Ref = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_Armazenamento_Ref;

  public
    { Public declarations }
    fDMArmazenamento_Ref: TDMArmazenamento_Ref;
    vTalaoMC : Integer;

  end;

var
  fArmazenamento_Ref: TfArmazenamento_Ref;

implementation

uses UDM1, DmdDatabase;

{$R *.dfm}

procedure TfArmazenamento_Ref.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMArmazenamento_Ref.cdsArmazenamento_Ref.State in [dsEdit,dsInsert] then
    fDMArmazenamento_Ref.cdsArmazenamento_Ref.CancelUpdates;
    
  if fDMArmazenamento_Ref.Owner.ClassName  = Self.ClassName then
    FreeAndNil(fDMArmazenamento_Ref);

  Tag    := 0;

  Action := Cafree;
end;

procedure TfArmazenamento_Ref.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMArmazenamento_Ref.cdsArmazenamento_Ref.CancelUpdates;
  Close;
end;

procedure TfArmazenamento_Ref.BitBtn1Click(Sender: TObject);
begin
  if Trim(fDMArmazenamento_Ref.cdsArmazenamento_RefREFERENCIA.AsString) = '' then
  begin
    ShowMessage('Referência não informada!');
    exit;
  end;

  Grava_Armazenamento_Ref;

  Close;
end;

procedure TfArmazenamento_Ref.Grava_Armazenamento_Ref;
var
  vVlrAux : Real;
begin
  try
    if fDMArmazenamento_Ref.cdsArmazenamento_Ref.State in [dsEdit,dsInsert] then
      fDMArmazenamento_Ref.cdsArmazenamento_Ref.Post;

    fDMArmazenamento_Ref.cdsArmazenamento_Ref.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar, ' + E.Message + '!');
    end;
  end;
end;                               

end.
