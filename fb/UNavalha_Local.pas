unit UNavalha_Local;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, RxLookup, ToolEdit,
  RXDBCtrl, Grids, DBGrids, SMDBGrid, RxDBComb, RzEdit, RzDBEdit, RzTabs,
  FMTBcd, DB, SqlExpr, Provider, DBClient, DBVGrids, DBFilter, DBTables, UDMNavalha_Local;

type
  TfNavalha_Local = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_Navalha_Local;

  public
    { Public declarations }
    fDMNavalha_Local: TDMNavalha_Local;
    vTalaoMC : Integer;

  end;

var
  fNavalha_Local: TfNavalha_Local;

implementation

uses UDM1, DmdDatabase;

{$R *.dfm}

procedure TfNavalha_Local.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMNavalha_Local.cdsNavalha_Local.State in [dsEdit,dsInsert] then
    fDMNavalha_Local.cdsNavalha_Local.CancelUpdates;
    
  if fDMNavalha_Local.Owner.ClassName  = Self.ClassName then
    FreeAndNil(fDMNavalha_Local);

  Tag    := 0;

  Action := Cafree;
end;

procedure TfNavalha_Local.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMNavalha_Local.cdsNavalha_Local.CancelUpdates;
  Close;
end;

procedure TfNavalha_Local.BitBtn1Click(Sender: TObject);
begin
  if Trim(fDMNavalha_Local.cdsNavalha_LocalNAVALHA.AsString) = '' then
  begin
    ShowMessage('Navalha não informada!');
    exit;
  end;

  Grava_Navalha_Local;

  Close;
end;

procedure TfNavalha_Local.Grava_Navalha_Local;
var
  vVlrAux : Real;
begin
  try
    if fDMNavalha_Local.cdsNavalha_Local.State in [dsEdit,dsInsert] then
      fDMNavalha_Local.cdsNavalha_Local.Post;

    fDMNavalha_Local.cdsNavalha_Local.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar, ' + E.Message + '!');
    end;
  end;
end;                               

end.
