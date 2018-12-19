unit UNotaFiscalItensObsComplementar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Buttons, StdCtrls, RxLookup, RXCtrls, ExtCtrls, Mask, DBCtrls,
  Grids, DBGrids, RXDBCtrl, DB, DBTables;

type
  TfNotaFiscalItensObsComplementar = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    BitBtn9: TBitBtn;
    SpeedButton10: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalItensObsComplementar: TfNotaFiscalItensObsComplementar;

implementation

uses UDM1, UObsAux;

{$R *.dfm}

procedure TfNotaFiscalItensObsComplementar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tNotaFiscalTBObs.State in [dsEdit, dsInsert] then
    DM1.tNotaFiscalTBObs.Cancel;
  Action := Cafree;
end;

procedure TfNotaFiscalItensObsComplementar.BitBtn1Click(Sender: TObject);
begin
  if DM1.tNotaFiscalItens.State in [dsEdit] then
    DM1.tNotaFiscalItens.Post;
  Close;
end;

procedure TfNotaFiscalItensObsComplementar.FormShow(Sender: TObject);
begin
  if DM1.tNotaFiscal.State in [dsInsert,dsEdit] then
    begin
      DM1.tNotaFiscalItens.Edit;
      BitBtn1.Enabled  := True;
      BitBtn9.Enabled  := True;
      DBEdit1.ReadOnly := False;
      DBEdit2.ReadOnly := False;
    end;
end;

procedure TfNotaFiscalItensObsComplementar.BitBtn2Click(Sender: TObject);
begin
  if DM1.tNotaFiscalItens.State in [dsEdit] then
    DM1.tNotaFiscalItens.Cancel;
  Close;
end;

procedure TfNotaFiscalItensObsComplementar.BitBtn9Click(Sender: TObject);
begin
  if RxDBLookupCombo5.Text <> '' then
    begin
      if DM1.tNotaFiscalItensObsComplementar.AsString <> '' then
        DM1.tNotaFiscalItensObsComplementar.AsString := DM1.tNotaFiscalItensObsComplementar.AsString + ', ' + DM1.tObsAuxDescricao.AsString
      else
        DM1.tNotaFiscalItensObsComplementar.AsString := DM1.tNotaFiscalItensObsComplementar.AsString + DM1.tObsAuxDescricao.AsString;
      RxDBLookupCombo5.ClearValue;
      RxDBLookupCombo5.SetFocus;
    end
  else
    begin
      ShowMessage('É preciso ter uma obs. escolhida para executar esta função!');
      RxDBLookupCombo5.SetFocus;
    end;
end;

procedure TfNotaFiscalItensObsComplementar.SpeedButton10Click(
  Sender: TObject);
begin
  if DM1.tUsuarioObsAux.AsBoolean then
    begin
      fObsAux := TfObsAux.Create(Self);
      fObsAux.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfNotaFiscalItensObsComplementar.RxDBLookupCombo5Enter(
  Sender: TObject);
begin
  DM1.tObsAux.IndexFieldNames := 'Nome';
end;

end.
