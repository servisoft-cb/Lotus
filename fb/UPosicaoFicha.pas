unit UPosicaoFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, RxLookup, ToolEdit,
  RXDBCtrl, Grids, DBGrids, SMDBGrid, RxDBComb, RzEdit, RzDBEdit, RzTabs,
  FMTBcd, DB, SqlExpr, Provider, DBClient, DBVGrids, DBFilter, DBTables;

type
  TfPosicaoFicha = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_PosicaoFicha;

  public
    { Public declarations }
    vTalaoMC : Integer;

  end;

var
  fPosicaoFicha: TfPosicaoFicha;

implementation

uses UDM1, DmdDatabase, UDMPosicao_Ficha;

{$R *.dfm}

procedure TfPosicaoFicha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMPosicao_Ficha.cdsPosicao_Ficha.State in [dsEdit,dsInsert] then
    DMPosicao_Ficha.cdsPosicao_Ficha.CancelUpdates;
    
  if DMPosicao_Ficha.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMPosicao_Ficha);

  Tag    := 0;

  Action := Cafree;
end;

procedure TfPosicaoFicha.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMPosicao_Ficha.cdsPosicao_Ficha.CancelUpdates;
  Close;
end;

procedure TfPosicaoFicha.BitBtn1Click(Sender: TObject);
begin
  if Trim(DMPosicao_Ficha.cdsPosicao_FichaNOMEPOSICAO.AsString) = '' then
  begin
    ShowMessage('Material não foi informado!');
    exit;
  end;

  Grava_PosicaoFicha;

  Close;
end;

procedure TfPosicaoFicha.Grava_PosicaoFicha;
var
  vVlrAux : Real;
begin
  try
    if DMPosicao_Ficha.cdsPosicao_Ficha.State in [dsEdit,dsInsert] then
      DMPosicao_Ficha.cdsPosicao_Ficha.Post;

    DMPosicao_Ficha.cdsPosicao_Ficha.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar, ' + E.Message + '!');
    end;
  end;
end;                               

end.
